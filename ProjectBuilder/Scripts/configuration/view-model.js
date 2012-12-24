(function ($, ko) {

    function Node(data) {
        this.Id = ko.observable(data.Id);
        this.Name = ko.observable(data.Name);
        this.Description = ko.observable(data.Description);
    }

    function NodeListViewModel(data) {
        var self = this;

        this.nodes = ko.observableArray($.map(data, function (item) { return new Node(item) }));

        this.modalNode = ko.observable();
        this.editNode = function (node) {
            this.modalNode(node);
        };

        this.addNode = function () {
            var newNode = new Node({ Id: -1, Name: '', Description: '' });
            this.modalNode(newNode);
        };

        this.saveNode = function () {
            var savedNode = self.modalNode();

            if (savedNode.Id() === -1) {
                var node = new Node({ Id: savedNode.Id(), Name: savedNode.Name(), Description: savedNode.Description() });
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

        this.editNode = function (node) {
            self.modalNode(node);
        };

        this.deleteNode = function (node, event) {
            var $this = $(event.target);
            var anchor = $this.closest('a');

            $.ajax({
                url: $(anchor).attr('href') + '/' + node.Id(),
                type: 'POST',
                contentType: 'application/json',
                success: function () {
                    self.nodes.destroy(node);
                }
            });
        };
    }

    var PageViewModel = {
        NodeListViewModel: new NodeListViewModel(nodes)
    };

    // Activates knockout.js
    ko.applyBindings(PageViewModel.NodeListViewModel);

} (jQuery, ko));