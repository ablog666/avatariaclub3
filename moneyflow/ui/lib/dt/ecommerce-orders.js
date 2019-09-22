var EcommerceOrders = function () {

    var initPickers = function () {
        //init date pickers
        $('.date-picker').datepicker({
            rtl: Metronic.isRTL(),
            autoclose: true
        });
    }

    var handleOrders = function () {

        var grid = new Datatable();

        grid.init({
            src: $("#datatable_orders"),
            onSuccess: function (grid) {
                // execute some code after table records loaded

            },
            onError: function (grid) {
                // execute some code on network or other general error  
            },
            dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options 
                "lengthMenu": [
                    [20, 50, 100, 150, -1],
                    [20, 50, 100, 150, 500] // change per page values here
                ],
                "pageLength": 20, // default record count per page
                "ajax": {
                    "url": "index.php?_route=ajax.orders" // ajax source
                },
                "footerCallback": function ( row, data, start, end, display ) {
                    var api = this.api(), data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function ( i ) {
                        return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '')*1 :
                            typeof i === 'number' ?
                                i : 0;
                    };

                    if(this.fnSettings().aoData.length===0) {
                        total = '0.00';
                        pageTotal = '0.00';
                        $( api.column( 7 ).footer() ).html(
                            'Tk. '+pageTotal +' ( Tk. '+ total +' total)'
                        );
                    } else {
                        total = api
                            .column( 7 )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            } );

                        // Total over this page
                        pageTotal = api
                            .column( 7, { page: 'current'} )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );

                        // Update footer

                        $( api.column( 7 ).footer() ).html(
                            'Tk. '+pageTotal +' ( Tk. '+ total +' total)'
                        );
                    }

                    // Total over all pages

                },
                "order": [
                    [1, "asc"]
                ] // set first column as a default sort by asc

            }
        });

        // handle group actionsubmit button click
        grid.getTableWrapper().on('click', '.table-group-action-submit', function (e) {
            e.preventDefault();
            var action = $(".table-group-action-input", grid.getTableWrapper());
            if (action.val() != "" && grid.getSelectedRowsCount() > 0) {
                grid.setAjaxParam("customActionType", "group_action");
                grid.setAjaxParam("customActionName", action.val());
                grid.setAjaxParam("id", grid.getSelectedRows());
                grid.getDataTable().ajax.reload();
                grid.clearAjaxParams();
            } else if (action.val() == "") {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            } else if (grid.getSelectedRowsCount() === 0) {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'No record selected',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            }
        });

        $(document).on("click", '.fview', function(e) {
            e.preventDefault();
            var id = this.id;

            // var message_id = this.attr("data-messageid");
          //  alert(message_id);
            // create the backdrop and wait for next modal to be triggered
            $('body').modalmanager('loading');

            setTimeout(function(){
                $('#ajax-modal').load('index.php?_route=ajax.flexi-view/'+id, '', function(){
                    $('#ajax-modal').modal();
                });
            }, 2000, id);
        });



    }


    return {

        //main function to initiate the module
        init: function () {

            initPickers();
            handleOrders();

        }

    };

}();