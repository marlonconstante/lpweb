// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require moment
//= require moment/pt-br
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

jQuery(document).ready(function () {
    $('.input-group.date').datetimepicker();

    $('.table').DataTable({
        'language': {
            'sEmptyTable': 'Nenhum registro encontrado',
            'sInfo': 'Mostrando de _START_ até _END_ de _TOTAL_ registros',
            'sInfoEmpty': 'Mostrando 0 até 0 de 0 registros',
            'sInfoFiltered': '(Filtrados de _MAX_ registros)',
            'sInfoPostFix': '',
            'sInfoThousands': '.',
            'sLengthMenu': '_MENU_ resultados por página',
            'sLoadingRecords': 'Carregando...',
            'sProcessing': 'Processando...',
            'sZeroRecords': 'Nenhum registro encontrado',
            'sSearch': 'Pesquisar',
            'oPaginate': {
                'sNext': 'Próximo',
                'sPrevious': 'Anterior',
                'sFirst': 'Primeiro',
                'sLast': 'Último'
            },
            'oAria': {
                'sSortAscending': ': Ordenar colunas de forma ascendente',
                'sSortDescending': ': Ordenar colunas de forma descendente'
            }
        }
    });

    // [Danilo] Dependent dropdowns
    // Copiado na cara dura de http://www.devinterface.com/blog/en/2013/12/come-implementare-in-rails-4-delle-dropdown-dipendenti-con-script-jquery-non-intrusivo/
    $('select[data-option-dependent=true]').each(function (i) {
        var observer_dom_id = $(this).attr('id');
        var observed_dom_id = $(this).data('option-observed');
        var url_mask = $(this).data('option-url');
        var key_method = $(this).data('option-key-method');
        var value_method = $(this).data('option-value-method');
        var prompt = $(this).has('option[value=\'\']').size() ? $(this).find('option[value=\'\']') : $('<option value=\"\">').text('Select a equipment');
        var regexp = /:[0-9a-zA-Z_]+:/g;
        var observer = $('select#' + observer_dom_id);
        var observed = $('#' + observed_dom_id);

        if (!observer.val() && observed.size() > 1) {
            observer.attr('disabled', true);
        }
        observed.on('change', function () {
            observer.empty().append(prompt);
            if (observed.val()) {
                url = url_mask.replace(regexp, observed.val());
                $.getJSON(url, function (data) {
                    $.each(data, function (i, object) {
                        observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
                        observer.attr('disabled', false);
                    });
                });
            }
        });
    });
});