<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="/biz/jqgrid/js/jquery.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="/biz/jqgrid/js/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="/biz/jqgrid/js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="/biz/jqgrid/css/ui.jqgrid-bootstrap.css" />
	<script>
		$.jgrid.defaults.width = 780;
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';
	</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
    <script type="text/ecmascript" src="/biz/jqgrid/js/bootstrap-datepicker.js"></script> 
    <script type="text/ecmascript" src="/biz/jqgrid/js/bootstrap3-typeahead.js"></script> 
    <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap-datepicker.css" />

    <meta charset="utf-8" />
    <title>jqGrid Loading Data - Inline - Edit Controls</title>
</head>
<body>

    <style type="text/css">

        /* set the size of the datepicker search control for Order Date*/
        #ui-datepicker-div { font-size:11px; }
        
        /* set the size of the autocomplete search control*/
        .ui-menu-item {
            font-size: 11px;
        }

         .ui-autocomplete { font-size: 11px; position: absolute; cursor: default;z-index:5000 !important;}      

    </style>
<div style="margin-left:20px">
    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
</div>
    <script type="text/javascript"> 
    
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: 'data3.json',
                editurl: 'clientArray',
                mtype: "GET",
                datatype: "json",
                page: 1,
                colModel: [
                    { label: 'Order ID', name: 'OrderID', key: true, width: 75 },                   
                    {
						label: 'Order Date',
                        name: 'OrderDate',
                        width: 150,
                        editable: true,
                        edittype:"text",
                        editoptions: {
                            // dataInit is the client-side event that fires upon initializing the toolbar search field for a column
                            // use it to place a third party control to customize the toolbar
                            dataInit: function (element) {
                               $(element).datepicker({
									autoclose: true,
									format: 'yyyy-mm-dd',
									orientation : 'auto bottom'
                                });
                            }
                        }
                    },
                     {
						 label: 'Customer ID',
                         name: 'CustomerID',
                         width: 150,
                         editable: true,
                         edittype: "select",
                         editoptions: {
							dataUrl : "customer.data",
							cacheUrlData: true,
							buildSelect : function( data) {
								var data = data.split(";"), i=0, len=data.length, s='<select>',d;
								while(i<len) {
									d = data[i].split(":");
									s += '<option>'+d[0]+'</option>';
									i++;
								}
								s += '</select>';
								return s;
							}
                         }
                     },
                    {
						label: 'Freigh',
                        name: 'Freight',
                        width: 150,
						sorttype:"number",
                        editable: true,
                        edittype: "custom",
                        editoptions: {
                            custom_value: getFreightElementValue,
                            custom_element: createFreightEditElement
                        }
                    },
                    {
						label: 'Ship Name',
                        name: 'ShipName',
                        width: 150,
                        editable: true,
                        edittype: "text",
                        editoptions: {
                            // dataInit is the client-side event that fires upon initializing the toolbar search field for a column
                            // use it to place a third party control to customize the toolbar
                            dataInit: function (element) {
							   $(element).attr("autocomplete","off").typeahead({ 
								   appendTo : "body",
									source: function(query, proxy) {
										$.ajax({
											url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/autocompletepbs.php?callback=?&acelem=ShipName',
											dataType: "jsonp",
											data: {term: query},
											success : proxy
										});
									}
							   });
                            }
                        }
                    }
                ],
				loadonce : true,
                onSelectRow: editRow, // the javascript function to call on row click. will ues to to put the row in edit mode
                viewrecords: true,
                width: 750,
                height: 250,
                rowNum: 20,
                pager: "#jqGridPager"
            });

            var lastSelection;

            function editRow(id) {
                if (id && id !== lastSelection) {
                    var grid = $("#jqGrid");
                    grid.jqGrid('restoreRow',lastSelection);
                    grid.jqGrid('editRow',id, {keys:true, focusField: 4});
                    lastSelection = id;
                }
            }

            function createFreightEditElement(value, editOptions) {
                var div =$("<div style='margin-top:5px'></div>");
                var label = $("<label class='radio-inline'></label>");
                var radio = $("<input>", { type: "radio", value: "0", name: "freight", id: "zero", checked: (value != 25 && value != 50 && value != 100) });
				label.append(radio).append("0");
                var label1 = $("<label class='radio-inline'></label>");
                var radio1 = $("<input>", { type: "radio", value: "25", name: "freight", id: "twentyfive", checked: value == 25 });
				label1.append(radio1).append("25");
                var label2 = $("<label class='radio-inline'></label>");
                var radio2 = $("<input>", { type: "radio", value: "50", name: "freight", id: "fifty", checked: value == 50 });
				label2.append(radio2).append("50");
                //var label3 = $("<label class='radio-inline'></label>");
                //var radio3 = $("<input>", { type: "radio", value: "100", name: "freight", id: "hundred", checked: value == 100 });
				//label3.append(radio3).append("100");
                div.append(label).append(label1).append(label2);//.append(label3);

                return div;
            }

            // The javascript executed specified by JQGridColumn.EditTypeCustomGetValue when EditType = EditType.Custom
            // One parameter passed - the custom element created in JQGridColumn.EditTypeCustomCreateElement
            function getFreightElementValue(elem, oper, value) {
                if (oper === "set") {
                    var radioButton = $(elem).find("input:radio[value='" + value + "']");
                    if (radioButton.length > 0) {
                        radioButton.prop("checked", true);
                    }
                }

                if (oper === "get") {
                    return $(elem).find("input:radio:checked").val();
                }
            }

        });

    </script>

    
</body>
</html>