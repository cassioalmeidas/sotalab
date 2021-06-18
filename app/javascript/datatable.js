import 'datatables.net-bs5';
import 'datatables.net-responsive-bs5' 
// import 'datatables.net-buttons-bs5'
// import 'datatables.net-colreorder-bs5' 
// import 'datatables.net-datetime' 
// import 'datatables.net-fixedcolumns-bs5' 
// import 'datatables.net-fixedheader-bs5' 
// import 'datatables.net-keytable-bs5' 
// import 'datatables.net-rowgroup-bs5' 
// import 'datatables.net-rowreorder-bs5' 
// import 'datatables.net-scroller-bs5' 
// import 'datatables.net-searchbuilder-bs5' 
// import 'datatables.net-searchpanes-bs5' 
// import 'datatables.net-select-bs5'


$(document).on('turbolinks:load', function() {
  $('#projects-datatable').DataTable({
    processing: true,
    serverSide: true,
    stateSave: true,
    responsive: true,
    columnDefs: [
      { width: '50%', targets: 1 },
    ],
    ajax: $('#projects-datatable').data('source'),
    pagingType: 'full_numbers',
    language:{
      url: window.location.origin + '/datatable_i18n'
    },
    columns: [
      { data: 'id' },
      { data: 'name' },
      { data: 'created_at' },
      { data: 'dt_actions' }
    ]
  });
});

$(document).on('turbolinks:before-cache', function() {
  var dataTable;
  dataTable = $($.fn.dataTable.tables(true)).DataTable();
  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();
    return dataTable = null;
  }
});