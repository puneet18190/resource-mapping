var resourceFieldsUI = {
    init: function() {
        var validationSettings = {
            errorMessagePosition : 'element'
        };
        $('#addButton').click(function(e){
            formHandler.appendFields();
            formHandler.hideForm();
        });
    }
};

var cfg = {
    formId: '#new-resource-fields',
    tableId: '#resource-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        return this.tableId + ' tbody';
    }
};
var formHandler = {
    appendFields: function () {
        var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);
        rowBuilder.link.clone().appendTo($('tr:last td:last'));
    },

    hideForm: function() {
        $(cfg.formId).modal('hide');
    }
};

var rowBuilder = function() {
    var row = $('<tr>', { class: 'fields' });
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this resource.'
    }).append($('<i>', { class: 'icon-remove' }));

    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            $(this).removeAttr('class');
            var td = $('<td/>').append($(this));
            td.appendTo(newRow);
        });

        return newRow;
    }
    var attachRow = function(tableBody, fields) {
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    }

    return {
        addRow: attachRow,
        link: link
    }
}();

// -----------------------------------------
var questionFieldsUI = {
    init: function() {
        var validationSettings = {
            errorMessagePosition : 'element'
        };
        $('#addButton_q').click(function(e){
            formHandler_q.appendFields();
            formHandler_q.hideForm();
        });
    }
};

var cfg_q = {
    formId: '#new-question-fields',
    tableId: '#question-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        return this.tableId + ' tbody';
    }
};
var formHandler_q = {
    appendFields: function () {
        var inputFields = $(cfg_q.formId + ' ' + cfg_q.inputFieldClassSelector);
        inputFields.detach();
        rowBuilder_q.addRow(cfg_q.getTBodySelector(), inputFields);
        rowBuilder_q.link.clone().appendTo($('tr:last td:last'));
    },

    hideForm: function() {
        $(cfg_q.formId).modal('hide');
    }
};

var rowBuilder_q = function() {
    var row = $('<tr>', { class: 'fields' });
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this question.'
    }).append($('<i>', { class: 'icon-remove' }));

    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            $(this).removeAttr('class');
            var td = $('<td/>').append($(this));
            td.appendTo(newRow);
        });

        return newRow;
    }
    var attachRow = function(tableBody, fields) {
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    }

    return {
        addRow: attachRow,
        link: link
    }
}();