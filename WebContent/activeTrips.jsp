<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
	<link rel="stylesheet" type="text/css" href="css/table/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/rowGroup.bootstrap5.min.css">
	<script src="https://unpkg.com/feather-icons@4.10.0/dist/feather.min.js"></script>
	<!-- Included our css file End -->
	
	<!-- Included our Js file Start-->

	<script src="js/datatable/jquery.dataTables.min.js"></script>
	<script src="js/datatable/moment.js"></script>
	<link rel="stylesheet" href="css/table/jquery-ui.css">

	<script src="js/datatable/jquery-ui.js"></script>

    <script src="js/datatable/dataTables.bootstrap5.min.js"></script>
    <script src="js/datatable/dataTables.responsive.min.js"></script>
    <script src="js/datatable/responsive.bootstrap5.js"></script>
    <script src="js/datatable/datatables.checkboxes.min.js"></script>
    <script src="js/datatable/datatables.buttons.min.js"></script>
    <script src="js/datatable/jszip.min.js"></script>
    <script src="js/datatable/pdfmake.min.js"></script>
    <script src="js/datatable/vfs_fonts.js"></script>
    <script src="js/datatable/buttons.html5.min.js"></script>
    <script src="js/datatable/buttons.print.min.js"></script>
    <script src="js/datatable/dataTables.rowGroup.min.js"></script>
 	<!-- Included our Js file End-->
 	
 	<script>
 list=""
 nodes=[];

	 	function ondemand(){
	 		//alert("in method...")
	 	const element = document.getElementById("example1");
	 	//alert("elements:"+element);
	 	nodes = element.getElementsByTagName("th");	
	 	//alert("nodes:"+nodes.length);

	 	heads = document.getElementsByTagName("th");

	 	for( i=0;i<(nodes.length/2);i++){
	 	//alert(heads[i].innerHTML);
	 	if (list=="")
	 		{
	 		list = heads[i].innerHTML;
	 		}
	 	else{
	 	    list= list+","+heads[i].innerHTML
	 	}

	 	}
	 	console.log(list);
	 	document.getElementById("tableheaders").value = list;
	 	//alert("ii "+i);
	 	document.getElementById("tableheaderslength").value =i;
	 	//alert("list:"+list);
	 	 var flag=document.getElementById("setDefFlag").value;
	 	//alert("flag "+flag); 
	 	
	 	
	 	if(flag == "false")
	 		{
	 		//alert("flag is false..");
	 		
	 		ajaxRequest = new XMLHttpRequest();
	 		
	 		
	 		var ajaxRequest;
	 		ajaxRequest.onreadystatechange = function()
	 		{
	 			if(ajaxRequest.readyState == 4)
	 			{
	 				
	 			} 
	 		};
	 		//alert("in ajax call.."+(nodes.length/2));
	 		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
	 		ajaxRequest.send(); 
	 		}
	 	}
 </script>

 	
 	
 	
 
</head>
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
	String username="";
	username=(String)session.getAttribute("usertypevalue");
	
	System.out.println("Session name----------------->:"+username); 
	
	
	String datex1, datex2, data1, data2;
%>


	<%
		Connection conn = null;
		Statement st = null, st1 = null, st2 = null;
	%>
	<%
		try {
			/* String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
			String MM_dbConn_USERNAME="fleetview";
			String MM_dbConn_PASSWORD="1@flv";
			String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/db_gps"; */
			Class.forName(MM_dbConn_DRIVER);
			conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

			st = conn.createStatement();
			st1 = conn.createStatement();
			st2 = conn.createStatement();

		} catch (Exception e) {

		}
	%>


<!-- start set custom -->


<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

Statement st20 = conn.createStatement();
Statement st21 = conn.createStatement();


String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st20.executeQuery(setdefault);
if(rssetdefault.next())
{
	setDefFlag=true;
	colcount = rssetdefault.getInt("ColumnCount");
	setSequence = rssetdefault.getString("SetSequence");
	detailViewSequence = rssetdefault.getString("DetailViewSequence");
	ColumnList= rssetdefault.getString("ColumnList");
}
else
{
	String setdefault1="select * from db_gps.ColumnDisplayMaster where userid='default' and reportno='"+reportno+"'";
	System.out.println("set custom query1:"+setdefault1);

	ResultSet rssetdefault1=st21.executeQuery(setdefault1);
	if(rssetdefault1.next())
	{
		setDefFlag=true;
		
		colcount = rssetdefault1.getInt("ColumnCount");
		setSequence = rssetdefault1.getString("SetSequence");
		detailViewSequence = rssetdefault1.getString("DetailViewSequence");
		ColumnList= rssetdefault1.getString("ColumnList");
	}
	
}

System.out.println("set default flag "+setDefFlag);
System.out.println("column count "+colcount);
System.out.println("set sequence "+setSequence);
System.out.println("detailed view sequence "+detailViewSequence);

%>
<input type="hidden" id="setDefFlag" name="setDefFlag" value="<%=setDefFlag%>">



<!-- end custom set -->

<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Active Trips 
							</h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
	 
	 
<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">Set Custom</button>
	 
	 
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>

		
			
						<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
                                      <tr>

										<th width="4%" align="center">Sr No</th>
										<th align="center">Vehicle</th>
										<th align="center">TripID</th>
										<th align="center">Startdate-time</th>
										<th align="center">StartPlace</th>
										<th align="center">EndPlace</th>
						
										<th align="center">DriverName</th>
									</tr>
                                    </thead>
                                    <tbody>
      <%	
            int j = 1;
			String dttim="";

				String ven;
				String vehlist = session.getAttribute("VehList").toString();
				int datediff = 0;
				String vehh = "SELECT    a.vehRegNo,a.tripID,a.DriverName,a.DriverCode,a.startdate,a.starttime, a.startplace,a.endplace,b.TheDate,b.TheTime,b.location,b.LatitudePosition,b.LongitudePosition,c.TTime, c.KM , a.Vehid FROM ( SELECT vehRegNo,Vehid,tripID,startdate,startTime,startcode,endcode,DriverName,DriverCode,startplace,endplace FROM db_gps.t_startedjourney where Jstatus='Running' and Vehid in ('"+vehlist+"') order by StartDate desc )a  LEFT OUTER JOIN (	SELECT  VehicleCode,location,LatitudePosition,LongitudePosition,TheDate,TheTime FROM  db_gps.t_onlinedata )b  ON(b.VehicleCode=a.Vehid ) LEFT OUTER JOIN( SELECT KM,TTime , StartCode,EndCode FROM db_gps.t_castrolroutes )c  ON(c.Startcode=a.startcode AND    c.EndCode=a.endcode)";
				System.out.println("vehh " + vehh);

				ResultSet rsss = st.executeQuery(vehh);
				String status="";
				while (rsss.next()) {
					String thedate = rsss.getString("startdate");
					String thetime = rsss.getString("starttime");
					String tripID = rsss.getString("tripID");
					dttim=thedate+" "+thetime;
					
					
					if(dttim.equalsIgnoreCase(null) || dttim.equalsIgnoreCase("null") || dttim.contains("null"))
					{
						dttim="-";
					}
					else
					{
						dttim=new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dttim));
					}
				%>
				
				<tr>
					<td align="center"><%=j%></td>
					<td align="center"><%=rsss.getString("vehRegNo")%></a></td>
					<td align="center"><%=tripID%></td>
					<td align="center"><%= dttim%></td>
					<td align="center"><%=rsss.getString("startplace")%></td>



					<td align="center"><%=rsss.getString("endplace")%></td>

					<td align="center"><%=rsss.getString("DriverName")%></td>
				

				</tr>
					
			<%
				System.out.println("status::" + status);
				j++;}


				
			%>
				
	</tbody>    
       <tfoot>
			<tr>
				<th width="4%" align="center">Sr No</th>
				<th align="center">Vehicle</th>
				<th align="center">TripID</th>
				<th align="center">Startdate-time</th>
				<th align="center">StartPlace</th>
				<th align="center">EndPlace</th>
				<th align="center">DriverName</th>
			</tr>
		</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>
				
				<!-- start custom set -->
				
				
				
<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Vehicle Offline Report</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			String showList=""+ColumnList;
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">
			<div class="modal-body">
			
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk &nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><%
							
							StringTokenizer stcol = new StringTokenizer(showList,","); 
							while(stcol.hasMoreTokens()){
							%><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=i %>" name="net_id1<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=i %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=i %>"   id="check<%=i %>"  /></td>
						<td><input type="text" name="clname<%=i %>"   id="clname<%=i %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%i++;}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=i %>"/>
						<input type="hidden" name="reportno" id="reportno" value="<%=reportno%>">
						<input type="hidden" id="tableheaders" name="tableheaders" value="">
						<input type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" name="pagename" id="pagename" value="<%=PageName%>">
						
				
				</div>
				<!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
    
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
				</form>
				</div>
				</div>
				</div>          
				
				
				<!-- end custom set -->
							   
<!-- Included new footer file -->

<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->


<!--New Script code added Start -->
<script>
	$(window).on('load', function () {
		if (feather) {
			feather.replace({
				width: 14,
				height: 14
			});
		}
	})
</script>
<!--New Script code added End -->

<!--New Script code added For table Start -->

<script>

    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example1').DataTable({
                /* order: [[2, 'desc']], */
                dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-4"f><"col-sm-12 col-md-2 dt-action-buttons text-end"B>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
                displayLength: -1,
                lengthMenu: [[-1, 10, 25, 50], ["All", 10, 25, 50]],
                buttons: [
                    {
                        extend: 'collection',
                        className: 'btn btn-outline-secondary dropdown-toggle me-2',
                        text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
                        buttons: [
                            {
                                extend: 'print',
                                text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
                                className: 'dropdown-item',
								title: 'ActiveTrips',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'ActiveTrips',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'ActiveTrips',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'ActiveTrips',
                                exportOptions: { columns: [<%=setSequence%> ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'ActiveTrips',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                           
                        ],
                        init: function (api, node, config) {
                            $(node).removeClass('btn-secondary');
                            $(node).parent().removeClass('btn-group');
                            setTimeout(function () {
                                $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
                            }, 50);
                        }
                    },
                    
                ],
                // responsive: true,
                language: {
                    paginate: {
                        // remove previous & next text from pagination
                        previous: '&nbsp;',
                        next: '&nbsp;'
                    }
                }
            });

            dt_basic.columns([<%=detailViewSequence%>]).visible(false) ,

            $('div.head-label').html('<h6 class="mb-0"></h6>');

            $("#but_showhide").on("click", function () {
                var checked_arr = $("#parent_filter_select2").val();
                var unchecked_arr = [0, 1, 2, 3, 4, 5, 6];
                var defaultArray = [0, 1, 2, 3, 4];

                unchecked_arr.forEach(element => {
                    dt_basic.columns(element).visible(false);
                });
                checked_arr.forEach(element => {
                    dt_basic.columns(element).visible(true);
                });

                console.log(checked_arr)

                if (checked_arr.length == 0) {
                    defaultArray.forEach(element => {
                        dt_basic.columns(element).visible(true);
                    });
                }
            });
        });

        $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); 
        

        $.fn.select2.amd.define(
            "select2/selectAllAdapter",
            ["select2/utils", "select2/dropdown", "select2/dropdown/attachBody"],
            function (Utils, Dropdown, AttachBody) {
                function SelectAll() { }
                SelectAll.prototype.render = function (decorated) {
                    var self = this,
                        $rendered = decorated.call(this),
                        $selectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-check-square-o"></i> Select All</button>'
                        ),
                        $unselectAll = $(
                            '<button class="btn btn-xs btn-default" type="button" style="margin-left:6px;"><i class="fa fa-square-o"></i> Unselect All</button>'
                        ),
                        $btnContainer = $('<div style="margin-top:3px;">')
                            .append($selectAll)
                            .append($unselectAll);
                    if (!this.$element.prop("multiple")) {
                        // this isn't a multi-select -> don't add the buttons!
                        return $rendered;
                    }
                    $rendered.find(".select2-dropdown").prepend($btnContainer);
                    $selectAll.on("click", function (e) {
                        var $results = $rendered.find(".select2-results__option[aria-selected=false]");
                        $results.each(function () {
                            //   self.trigger("select", {
                            // 	data: $(this).data("data"),
                            //   });
                            var $result = $(this);
                            console.log($result);
                            // Get the data object for it
                            var data = $result.data('data');

                            // Trigger the select event
                            self.trigger('select', {
                                data: data
                            });
                        });
                        self.trigger("close");
                    });
                    $unselectAll.on("click", function (e) {
                        var $results = $rendered.find(
                            ".select2-results__option[aria-selected=true]"
                        );
                        $results.each(function () {
                            self.trigger("unselect", {
                                data: $(this).data("data"),
                            });
                        });
                        self.trigger("close");
                    });
                    return $rendered;
                };

                return Utils.Decorate(Utils.Decorate(Dropdown, AttachBody), SelectAll);
            }
        );



        $("#parent_filter_select2").select2({
            placeholder: "Select",
            dropdownAdapter: $.fn.select2.amd.require("select2/selectAllAdapter"),
        });
        // $("#example1").DataTable({
        //   "responsive": true, "lengthChange": false, "autoWidth": false,
        //   "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        // }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });
</script>
<!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
			
</body>
</html>