(function ($, ko) {

    function generateSlug(str) {
        return str.toLowerCase().replace(/[^\w ]+/g, '').replace(/ +/g, '-');
    }

    function Node(data) {
        var self = this;

        this.Id = ko.observable(data.Id);
        this.Name = ko.observable(data.Name).extend({ required: { message: 'Name is required'} });
        this.Description = ko.observable(data.Description).extend({ required: { message: 'Description is required'} });
        this.ParentId = ko.observable(data.ParentId);

        this.Children = ko.observableArray($.map(data.Children || [], function (item) { return new Node(item); }) || []);

        this.Uri = ko.computed(function () {
            return generateSlug(ko.utils.unwrapObservable(self.Name));
        });

        this.Anchor = ko.computed(function () {
            return '#' + ko.utils.unwrapObservable(self.Uri);
        });
    }

    function NodeListViewModel(data) {
        var self = this;

        this.nodes = ko.observableArray($.map(data, function (item) { return new Node(item); }));

        this.modalNode = ko.observable();
        this.parentNode = ko.observable();
        this.selectedNode = this.nodes().length > 0 ? ko.observable(this.nodes()[0]) : ko.observable();

        this.editNode = function (node) {
            self.modalNode(node);
        };

        this.addNode = function () {
            var newNode = new Node({ Id: -1, Name: '', Description: '', ParentId: -1 });
            self.modalNode(newNode);
        };

        this.addChild = function (parent) {
            self.parentNode(parent);
            self.modalNode(new Node({ Id: -1, Name: '', Description: '', ParentId: ko.utils.unwrapObservable(parent.Id) }));
        };

        this.selectNode = function (node) {
            self.selectedNode(node);
        };

        this.saveNode = function () {
            var savedNode = self.modalNode();

            $.post($('#node-list').data('save-url'), ko.utils.unwrapObservable(savedNode), function (id) {
                if (savedNode.Id() === -1) {
                    var newNode = new Node({
                        Id: savedNode.Id(),
                        Name: savedNode.Name(),
                        Description: savedNode.Description(),
                        ParentId: savedNode.ParentId()
                    });
                    newNode.Id(id);
                    if (self.parentNode())
                        self.parentNode().Children.push(newNode);
                    else
                        self.nodes.push(newNode);

                    self.parentNode(undefined);
                }
                self.modalNode(undefined);
            });
        };

        this.updateParent = function (evt, ui, drop) {
            var dragdata = $(ui.draggable.context).data('ko.draggable.data');
            var dropdata = $(drop).data('ko.draggable.data');

            var parentArray = dragdata.$parent.nodes || dragdata.$parent.Children;

            var draggedId = ko.utils.unwrapObservable(dragdata.$data.Id);
            var droppedId = ko.utils.unwrapObservable(dropdata.$data.Id);
            var droppedParentId = ko.utils.unwrapObservable(dropdata.$data.ParentId);

            if (draggedId === droppedParentId || this.isChildOf(droppedId, ko.utils.unwrapObservable(dragdata.$data.Children)))
                return;

            dragdata.$data.ParentId(ko.utils.unwrapObservable(dropdata.$data.Id));
            $.post($('#node-list').data('save-url'), ko.toJS(dragdata.$data), function (id) {
                parentArray.remove(dragdata.$data);
                dropdata.$data.Children.push(dragdata.$data);
            });
        };

        this.isChildOf = function (nodeId, array) {
            var found = false;
            for (var i = 0; i < array.length; i++) {
                found = ko.utils.unwrapObservable(array[i].Id) === nodeId;
                if (found)
                    break;

                found = self.isChildOf(nodeId, ko.utils.unwrapObservable(array[i].Children));
                if (found)
                    break;
            }
            return found;
        };
    }

    var PageViewModel = {
        NodeListViewModel: new NodeListViewModel(nodes)
    };

    // Activates knockout.js
    ko.applyBindings(PageViewModel.NodeListViewModel);

    $("#node-list").delegate(".remove", "click", function (event) {
        event.preventDefault();

        //retrieve the context
        var context = ko.contextFor(this),
        parentArray = context.$parent.nodes || context.$parent.Children;

        //remove the data (context.$data) from the appropriate array on its parent (context.$parent)
        var nodeId = ko.utils.unwrapObservable(context.$data.Id);
        $.post($('#node-list').data('delete-url') + '/' + nodeId, function () {
            parentArray.remove(context.$data);
        });
    });

} (jQuery, ko));