(function ($, ko) {

    function Node(data) {
        this.Id = ko.observable(data.Id);
        this.Name = ko.observable(data.Name);
        this.Description = ko.observable(data.Description);
        this.ParentId = ko.observable(data.ParentId);

        this.Children = ko.observableArray($.map(data.Children, function (item) { return new Node(item); }) || []);
    }

    function NodeListViewModel(data) {
        var self = this;

        this.nodes = ko.observableArray($.map(data, function (item) { return new Node(item); }));

        this.modalNode = ko.observable();
        this.editNode = function (node) {
            self.modalNode(node);
        };

        this.addNode = function () {
            var newNode = new Node({ Id: -1, Name: '', Description: '', ParentId: null });
            self.modalNode(newNode);
        };

        this.saveNode = function () {
            var savedNode = self.modalNode();

            $.post($('#node-form').data('save-url'), ko.utils.unwrapObservable(savedNode), function (id) {
                if (savedNode.Id() === -1) {
                    var newNode = new Node({ 
                                            Id: savedNode.Id(),
                                            Name: savedNode.Name(),
                                            Description: savedNode.Description(),
                                            ParentId: savedNode.ParentId() 
                                        });
                    newNode.Id(id);
                    self.nodes.push(newNode);
                }
                self.modalNode(undefined);
            });
        };
    }

    var PageViewModel = {
        NodeListViewModel: new NodeListViewModel(nodes)
    };

    // Activates knockout.js
    ko.applyBindings(PageViewModel.NodeListViewModel);

    $("#node-list").delegate(".remove", "click", function () {
        //retrieve the context
        var context = ko.contextFor(this),
        parentArray = context.$parent.nodes || context.$parent.Children;

        //remove the data (context.$data) from the appropriate array on its parent (context.$parent)
        $.post($('#node-list').data('delete-url') + '/' + context.$data.Id, function () {
            parentArray.remove(context.$data);
        });

        return false;
    });

} (jQuery, ko));