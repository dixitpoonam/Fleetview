<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.transworld.fleetview.framework.VehicleDao"
		import="com.transworld.fleetview.framework.RapidAccelerationDetailsData"
		import="com.transworld.fleetview.framework.Utilities" %>

<%@ include file="headernew1.jsp"%>

<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
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
		alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				
			} 
		};
		alert("in ajax call.."+(nodes.length/2));
				
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}


</script>
</head>
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;
%>
<% try{ 
	final String vehicleCode = request.getParameter("vid");
	final String vehicleRegistrationNumber = request.getParameter("vehno");
	final String fromDate = (null != request.getParameter("dd")) ? request
			.getParameter("dd")
			: session.getAttribute("data1").toString();
	final String toDate = (null != request.getParameter("dd")) ? request
			.getParameter("dd")
			: session.getAttribute("data2").toString();
	final String pageType = request.getParameter("pageType");
	
	session.setAttribute("data1",fromDate);
	session.setAttribute("data2",toDate);
	
	System.out.println("data1 >>>"+fromDate);
	System.out.println("data2 >>>"+toDate);
	

%>
<body onload="ondemand()">
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Rapid Acceleration Report for Vehicle <%=vehicleRegistrationNumber%> From
		Date :<%
 	java.util.Date date = new SimpleDateFormat("yyyy-MM-dd")
 				.parse(fromDate);
 		Format formatter = new SimpleDateFormat("dd-MMM-yyyy");
 		String fromdt = formatter.format(date);
 		out.print(fromdt);
 %> To Date :<%
 	java.util.Date date3 = new SimpleDateFormat("yyyy-MM-dd")
 				.parse(toDate);
 		Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
 		String todt = formatter1.format(date3);
 		out.print(todt);
 %></h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
	 
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
			Set Custom</button>
		
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>
		
		<%
		try {
			/* List<RapidAccelerationDetailsData> data = null; */
			int numRecords = 0;
			/* try {
				data = vehicleDao.getRapidAccelerationDetailsData(
							vehicleCode, fromDate+" 00:00:00", toDate+" 23:59:59", pageType);
				numRecords = data.size();
			} catch (Exception e) {
				e.printStackTrace();
			} */
			
			String FromSpeed="",ToSpeed="",Thedate="",TheTime="";
			
			String  TheFieldSubject="";
			String LatinDec="",LonginDec="";
			Connection conn = fleetview.ReturnConnection();
			
			Statement st=conn.createStatement();
			Statement st20=conn.createStatement();
			Statement st21=conn.createStatement();
			
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
			
		<!-- Table start  -->
		<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
										<tr>
			<th>Sr.</th>
			<th>Date </th>
			<th>Time </th>
			<th>From Speed</th>
			<th>To Speed</th>
			<th>Location </th>
			</tr>
									</thead>
									<tbody>
									<%
	
		
		
		ResultSet rs=null;
		String SQL="SELECT  ra.Thedate, ra.TheTime, ra.FromSpeed, ra.ToSpeed , veh.TheFieldSubject ,veh.LatinDec, veh.LonginDec, veh.ZoneColor  FROM (SELECT Thedate, TheTime, FromSpeed, ToSpeed  FROM db_gpsExceptions.t_veh"+vehicleCode+"_ra WHERE  concat(TheDate,' ',TheTime)  >= '"+fromDate+" 00:00:00' AND  concat(TheDate,' ',TheTime) <= '"+toDate+" 23:59:59') ra LEFT OUTER JOIN    (SELECT LatinDec, LonginDec, TheFieldSubject,TheFieldDataDate,TheFieldDataTime,ZoneDesc AS ZoneColor,TheFieldDataDateTime  FROM db_gps.t_veh"+vehicleCode+" WHERE   TheFieldDataDateTime >= '"+fromDate+" 00:00:00' AND TheFieldDataDateTime <= '"+toDate+" 23:59:59') veh  ON (veh.TheFieldDataDate = ra.TheDate AND veh.TheFieldDataTime = ra.TheTime)  GROUP BY CONCAT(ra.Thedate ,' ', ra.TheTime )ORDER BY CONCAT( ra.Thedate ,' ', ra.TheTime )";
		System.out.println("SQL >>>"+SQL); 
		rs=st.executeQuery(SQL);
		 
		
		 int count=0;
		 while(rs.next()){
			 Thedate=rs.getString("Thedate");
			 TheTime=rs.getString("TheTime");
			 FromSpeed=rs.getString("FromSpeed");
			 ToSpeed=rs.getString("ToSpeed");
			 TheFieldSubject=rs.getString("TheFieldSubject");
			 LatinDec=rs.getString("LatinDec");
			 LonginDec=rs.getString("LonginDec");
			 

			 count++;
		 
		 
		
%>
					<tr>
					<td style="text-align: right"><%=count%></td>
					<td style="text-align: right;">
						<%=new SimpleDateFormat("dd-MMM-yyyy")
									.format(new SimpleDateFormat("yyyy-MM-dd")
											.parse(Thedate))%>
					</td>
					<td style="text-align: right;"><%= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("HH:mm:ss").parse(TheTime)) %></td>
					<td><div align="right"><%=FromSpeed%></div></td>
					<td><div align="right"><%=ToSpeed%></div></td>
					<td><div align="left">						 
								<%="<a href=\"shownewmap.jsp?lat="+LatinDec+"&long="+LonginDec+"&discription="+TheFieldSubject+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+LatinDec+"&long="+LonginDec+"&discription="+TheFieldSubject+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+TheFieldSubject+"</a>"%>  								 

 	
					</div></td>
					</tr>
<%  
		 }
	
	} catch (Exception e) {
		e.printStackTrace();
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
									</tbody>
									<tfoot>
										<tr>
			<th>Sr.</th>
			<th>Date </th>
			<th>Time </th>
			<th>From Speed</th>
			<th>To Speed</th>
			<th>Location </th>
			</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							</div>
		<!--Table end  -->
		</div>
		</div>

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Rapid Acceleration Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			 
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
							<div align="left"><input type="text" id="net_id1<%=kk %>" name="net_id1<%=kk %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=kk %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=kk %>"   id="check<%=kk %>"  /></td>
						<td><input type="text" name="clname<%=kk %>"   id="clname<%=kk %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%kk++;}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=kk %>"/>
						<input type="hidden" name="reportno" id="reportno" value="<%=reportno%>">
						<input type="hidden" id="tableheaders" name="tableheaders" value="">
						<input type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" name="pagename" id="pagename" value="<%=PageName%>">
						<input type="hidden" name="paramflag" id="paramflag" value="true">
						<input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>">
				
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
								title: 'Rapid Acceleration Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration Report',
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
		
		

</body>
</html>
</jsp:useBean>