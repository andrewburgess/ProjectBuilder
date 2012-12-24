(function ($, ko) {
    $('#system-message').hide();

    $(document).ajaxError(function (e, jqxhr, settings, exception) {
        $('#system-message').hide();
        if (jqxhr.status === 400 || jqxhr.status === 500) {
            $('#system-message').html('').
                                 removeClass().
                                 addClass('alert alert-error').
                                 append($('<h4>Error</h4>'));
            var ret = JSON.parse(jqxhr.responseText);
            if (typeof ret.Error === 'string') {
                $('#system-message').text();
            } else {
                var ul = $('<ul />');
                $.each(ret.Error, function (index, el) {
                    ul.append($('<li />').text(el));
                });
                $('#system-message').append(ul);
            }
        } else if (jqxhr.status === 401) { //Unauthorized
            window.location = jqxhr.responseText + "?returnUrl=" + encodeURIComponent(window.location.pathname);
        } else if (jqxhr.status === 403) {  // Forbidden

        }

        $('#system-message').fadeIn('fast').delay(5000).fadeOut('fast');
    });

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