(function ($, ko) {

    ko.bindingHandlers.modal = {
        init: function (element, valueAccessor, bindingsAccessor, viewModel, bindingContext) {
            var $element = $(element);
            $element.addClass('hide modal');

            var bindings = bindingsAccessor();
            if (bindings.modalOptions) {
                if (bindings.modalOptions.beforeClose) {
                    $element.on('hide', function () {
                        return bindings.modalOptions.beforeClose();
                    });
                }
            }

            return ko.bindingHandlers['with'].init.apply(this, arguments);
        },
        update: function (element, valueAccessor, bindingsAccessor, viewModel, bindingContext) {
            var value = ko.utils.unwrapObservable(valueAccessor());
            var returnValue = ko.bindingHandlers['with'].update.apply(this, arguments);

            var $element = $(element);
            if (value)
                $element.modal('show');
            else
                $element.modal('hide');

            return returnValue;
        }
    };

} (jQuery, ko));