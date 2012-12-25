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

            if (savedNode.Id() === -1) {
                var node = new Node({ Id: savedNode.Id(), Name: savedNode.Name(), Description: savedNode.Description(), ParentId: savedNode.ParentId() });
                self.nodes.push(node);

                $.ajax({
                    url: $('#node-form').data('add-url'),
                    data: ko.toJSON(node),
                    type: 'POST',
                    contentType: 'application/json',
                    success: function (data) {
                        node.Id(data);
                    }
                });
            } else {
                $.ajax({
                    url: $('#node-form').data('edit-url') + '/' + savedNode.Id(),
                    data: ko.toJSON(savedNode),
                    type: 'POST',
                    contentType: 'application/json'
                });
            }

            self.modalNode(undefined);
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