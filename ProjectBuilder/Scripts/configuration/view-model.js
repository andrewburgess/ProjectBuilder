function Node(data) {
    this.Id = ko.observable(data.Id);
    this.Name = ko.observable(data.Name);
    this.Description = ko.observable(data.Description); 
}

function NodeListViewModel(data) {
    var self = this;

    this.nodes = ko.observableArray($.map(data, function(item) {return new Node(item)}));
}

var PageViewModel = {
    NodeListViewModel: new NodeListViewModel(nodes)
};

// Activates knockout.js
ko.applyBindings(PageViewModel.NodeListViewModel);