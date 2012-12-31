(function ($, ko) {

    function Node(data, parent) {
        var self = this;

        this.id = ko.observable(ko.utils.unwrapObservable(data.id));
        this.name = ko.observable(ko.utils.unwrapObservable(data.name)).extend({ required: { message: 'Name is required'} });
        this.description = ko.observable(ko.utils.unwrapObservable(data.description)).extend({ required: { message: 'Description is required'} });
        this.parentId = ko.observable(ko.utils.unwrapObservable(data.parentId));
        this.children = ko.observableArray($.map(data.children || [], function (item) { return new Node(item, self); }) || []);
        this.parent = ko.observable(parent);
    }

    Node.prototype.getJS = function () {
        return {
            Id: ko.utils.unwrapObservable(this.id),
            Name: ko.utils.unwrapObservable(this.name),
            Description: ko.utils.unwrapObservable(this.description),
            ParentId: ko.utils.unwrapObservable(this.parentId)
        };
    }

    function NodeListViewModel(data) {
        var self = this;

        this.nodes = ko.observableArray($.map(data, function (item) { return new Node(item, null); }));

        this.modalNode = ko.observable();
        this.selectedNode = this.nodes().length > 0 ? ko.observable(this.nodes()[0]) : ko.observable();

        this.editNode = function () {
            self.modalNode(self.selectedNode());
        };

        this.addNode = function () {
            var newNode = new Node({ id: null, name: '', description: '', parentId: null }, null);
            self.modalNode(newNode);
        };

        this.addChild = function (parent) {
            self.modalNode(new Node({ id: null, name: '', description: '', parentId: ko.utils.unwrapObservable(parent.id) }, parent));
        };

        this.selectNode = function (node) {
            self.selectedNode(node);
        };

        this.saveNode = function () {
            var savedNode = self.modalNode();

            $.post($('#node-list').data('save-url'), savedNode.getJS(), function (id) {
                if (savedNode.id() === null) {
                    var newNode = new Node(savedNode, savedNode.parent());
                    newNode.id(id);
                    if (newNode.parent()) {
                        newNode.parent().children.push(newNode);
                    } else {
                        self.nodes.push(newNode);
                    }

                    self.selectedNode(newNode);
                }
                self.modalNode(undefined);
            });
        };

        this.deleteNode = function () {
            var nodeId = ko.utils.unwrapObservable(self.selectedNode().id);
            $.post($('#node-list').data('delete-url') + '/' + nodeId, function () {
                if (self.selectedNode().parent()) {
                    self.selectedNode().parent().children.remove(self.selectedNode());
                    self.selectedNode(self.selectedNode().parent());
                } else {
                    self.nodes.remove(self.selectedNode());
                    self.selectedNode(self.nodes().length > 0 ? self.nodes()[0] : undefined);
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