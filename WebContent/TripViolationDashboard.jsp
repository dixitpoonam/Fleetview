<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ include file="headernew1.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
<link rel="stylesheet" type="text/css"
	href="css/table/dataTables.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/responsive.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/buttons.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/rowGroup.bootstrap5.min.css">
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

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link
	href='https://fonts.googleapis.com/css?family=Arial+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="css/jquery.simple-dtpicker.js"></script>
<link type="text/css" href="css/jquery.simple-dtpicker.css"
	rel="stylesheet" />


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

<script>	
 	function chk()
 {

 	
 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	
 	
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("data1").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }

         return true;
 	
 }
 
</script>
</head>
<body onload="ondemand()">
	<%!Connection conn, conn1;
	String data1, sql, sql1, data2, jcode, origin, destination, startdate;
	Statement st, st1, st2, st3, st4, st20, st21;%>

	<%
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st1 = conn1.createStatement();
		st2 = conn1.createStatement();
		st = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st20 = conn.createStatement();
		st21 = conn.createStatement();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs4 = null;
		int colcount = 0; //special code for detailed view
		String setSequence = "", detailViewSequence = "", ColumnList = "";
		boolean setDefFlag = false;
		String username = "", RequestId = null, datex1, datex2, data1, data2;
		String vehiclecode = "", vehiclecode1 = "", VehRegNo = "", VehRegNo1 = "";
		String type = "", status = "";

		username = (String) session.getAttribute("usertypevalue");
		System.out.println("User :- " + username);

		String TypeofUser = session.getAttribute("TypeofUser").toString();

		System.out.println(" TypeofUser :- " + session.getAttribute("TypeofUser").toString());

		/* String plansql = "select PickUpDateTime,PickUpLocation,DropDateTime,DropLocation,Status,EntryBy,count(*) as Count"
						+"from db_gps.t_RequestData where Status='Pending' group by PickUpDateTime,PickUpLocation,"
						+"DropLocation order by PickUpDateTime"; */

		//String PlanQuery = "select * from db_gps.RequestData where RequesterId";
		//String sql = "select * from db_gps.t_RequestData";
	%>
	<%
		String Bt = request.getParameter("button");
		System.out.println(" Button :- " + Bt);

		if (Bt == null) {

			datex1 = session.getAttribute("PresentMonthFirst").toString(); //dd-MMM-yyyy
			datex2 = session.getAttribute("today").toString();

		} else {

			datex1 = request.getParameter("data");
			datex2 = request.getParameter("data1");

		}

		System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

		String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

		String dttime = "" + dt + " 00:00:00";

		String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

		String dt1time = "" + dt1 + " 23:59:59";

		System.out.println("Query pass date params:  from:" + dt + " to: " + dt1);

		System.out.println("Query pass date time  params:  from:" + dttime + " to: " + dt1time);
	%>
	<%
		String setdefault = "select * from db_gps.ColumnDisplayMaster where userid='"
				+ session.getAttribute("UserID").toString() + "' and reportno='" + reportno + "'";
		System.out.println("set custom query:" + setdefault);
		ResultSet rssetdefault = st20.executeQuery(setdefault);
		if (rssetdefault.next()) {
			setDefFlag = true;
			colcount = rssetdefault.getInt("ColumnCount");
			setSequence = rssetdefault.getString("SetSequence");
			detailViewSequence = rssetdefault.getString("DetailViewSequence");
			ColumnList = rssetdefault.getString("ColumnList");
		} else {

			String setdefault1 = "select * from db_gps.ColumnDisplayMaster where userid='default' and reportno='"
					+ reportno + "'";
			System.out.println("set custom query1:" + setdefault1);

			ResultSet rssetdefault1 = st21.executeQuery(setdefault1);
			if (rssetdefault1.next()) {
				setDefFlag = true;

				colcount = rssetdefault1.getInt("ColumnCount");
				setSequence = rssetdefault1.getString("SetSequence");
				detailViewSequence = rssetdefault1.getString("DetailViewSequence");
				ColumnList = rssetdefault1.getString("ColumnList");
			}

		}

		System.out.println("set default flag " + setDefFlag);
		System.out.println("column count " + colcount);
		System.out.println("set sequence " + setSequence);
		System.out.println("detailed view sequence " + detailViewSequence);
	%>
	<input type="hidden" id="setDefFlag" name="setDefFlag"
		value="<%=setDefFlag%>">

	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Trip Violation Report of From
								<%=datex1%>
								To
								<%=datex2%>
								Of
								<%=username%></h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">

							<button id="detailedView"
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0">
								Detailed View</button>

							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#SetCustomModal">
								Set Custom</button>

							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>

							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0">
								<span id="kt_engage_demos_label">Help</span>
							</button>

						</div>
					</div>
				</div>

			</div>

			<!-- Form Comes here -->

			<form name="formreport" id="formreport" method="post">
				<div class="row col-12">
					<div class="col-md-4"></div>
					<div class="col-md-2">
						<label for="from">From:</label>
						<div class="input-group input-group-merge">
							<input type="text" name="data" id="data" class="form-control"
								value="<%=datex1%>"> <span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="14"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-calendar">
									<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
									<line x1="16" y1="2" x2="16" y2="6"></line>
									<line x1="8" y1="2" x2="8" y2="6"></line>
									<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
						</div>

						<script>

						$(document).ready(function() {
							$( function() {
   				 $( "#data" ).datepicker({
		    dateFormat: 'dd-M-yy',
			changeMonth: true,
            changeYear: true
	});
  } );
				
});

				   </script>

					</div>
					<div class="col-md-2">
						<label for="to">To:</label>
						<div class="input-group input-group-merge">
							<input type="text" id="data1" name="data1" class="form-control"
								value="<%=datex2%>" /> <span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="14"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-calendar">
									<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
									<line x1="16" y1="2" x2="16" y2="6"></line>
									<line x1="8" y1="2" x2="8" y2="6"></line>
									<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
						</div>
						<script>

					$(document).ready(function() {
						$( function() {
				$( "#data1" ).datepicker({
		dateFormat: 'dd-M-yy',
		changeMonth: true,
            changeYear: true
			/* minDate: 0,
			maxDate:7 */
});
} );
			
});

			   </script>
					</div>

					<div class="col-md-2">
						<input type="submit" class="btn btn-primary"
							style="margin-top: 10px;" name="button" onclick="return chk()"
							value="Submit">
					</div>
				</div>
				<br>
			</form>
			<div class="content-body">
				<!-- Basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Transporter</th>
										<th>RA</th>
										<th>RD</th>
										<th>OS</th>
										<th>ND</th>
										<th>CD</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<%
										String ViolationQuery = "select ownername,SUM(RACOunt) as RA, SUM(RDcount) as RD, SUM(OSCOunt) as OS, SUM(NDCount) as ND, SUM(CRCount) as CD, SUM(RACount+RDCount+OSCount+NDCount+CRCount) as Total from db_gps.t_completedjourney where (gpname = '"
												+ username + "' or ownername = '" + username + "') and startdate >= '" + dt
												+ " 00:00:00' and startdate <= '" + dt1 + " 23:59:59' group by ownername";

										ResultSet rsviolation = st1.executeQuery(ViolationQuery);

										System.out.println("Violation Query is : " + ViolationQuery);

										int i = 1;

										String RA = "";
										String RD = "";
										String OS = "";
										String ND = "";
										String CD = "";
										String Total = "";
										String ownername = "";

										while (rsviolation.next()) {

											ownername = rsviolation.getString("ownername");
											RA = rsviolation.getString("RA");
											RD = rsviolation.getString("RD");
											OS = rsviolation.getString("OS");
											ND = rsviolation.getString("ND");
											CD = rsviolation.getString("CD");
											Total = rsviolation.getString("Total");
									%>


									<tr>
										<td align="right"><%=i%></td>
										<td align="left"><%=ownername%></td>
										<td align="right"><%=RA%></td>
										<td align="right"><%=RD%></td>
										<td align="right"><%=OS%></td>
										<td align="right"><%=ND%></td>
										<td align="right"><%=CD%></td>
										<td align="right"><%=Total%></td>
									</tr>
									<%
										i++;
										}
									%>
								</tbody>
								<tfoot>
									<tr>
										<th>Sr No</th>
										<th>Transporter</th>
										<th>RA</th>
										<th>RD</th>
										<th>OS</th>
										<th>ND</th>
										<th>CD</th>
										<th>Total</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<%
					List empdetails1 = new LinkedList();
					Map<Object, Object> map = null;
					List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
					String dataPoints = "";
					String dataPoints2 = "";

					String Sql_RA = "";
					Sql_RA = "select ownername,SUM(RACOunt) as RA, SUM(RDcount) as RD, SUM(OSCOunt) as OS, SUM(NDCount) as ND, SUM(CRCount) as CD from db_gps.t_completedjourney where (gpname = '"
							+ username + "' or ownername = '" + username + "') and startdate >= '" + dt
							+ " 00:00:00' and startdate <= '" + dt1 + " 23:59:59' group by ownername";
					System.out.println("Sql Total:-" + Sql_RA);
					ps1 = conn.prepareStatement(Sql_RA);
					String Data_RA = "";
					ResultSet rs12 = ps1.executeQuery();
					while (rs12.next()) {

						String OwnerName = rs12.getString("ownername");
						String RAChart = rs12.getString("RA");

						Data_RA += "[" + "'" + OwnerName + "'," + RAChart + "],";

					}

					String Sql_RD = "";
					Sql_RD = "select ownername,SUM(RACOunt) as RA, SUM(RDcount) as RD, SUM(OSCOunt) as OS, SUM(NDCount) as ND, SUM(CRCount) as CD from db_gps.t_completedjourney where (gpname = '"
							+ username + "' or ownername = '" + username + "') and startdate >= '" + dt
							+ " 00:00:00' and startdate <= '" + dt1 + " 23:59:59' group by ownername";
					System.out.println("Sql Total:-" + Sql_RD);
					ps1 = conn.prepareStatement(Sql_RD);
					String Data_RD = "";
					rs12 = ps1.executeQuery();
					while (rs12.next()) {

						String OwnerName = rs12.getString("ownername");
						String RDChart = rs12.getString("RD");

						Data_RD += "[" + "'" + OwnerName + "'," + RDChart + "],";

					}

					String Sql_OS = "";
					Sql_OS = "select ownername, SUM(OSCOunt) as OS from db_gps.t_completedjourney where (gpname = '" + username
							+ "' or ownername = '" + username + "') and startdate >= '" + dt + " 00:00:00' and startdate <= '"
							+ dt1 + " 23:59:59' group by ownername";
					System.out.println("Sql Total:-" + Sql_OS);
					ps1 = conn.prepareStatement(Sql_OS);
					String Data_OS = "";
					rs12 = ps1.executeQuery();
					while (rs12.next()) {

						String OwnerName = rs12.getString("ownername");
						String OSChart = rs12.getString("OS");

						Data_OS += "[" + "'" + OwnerName + "'," + OSChart + "],";

					}

					String Sql_ND = "";
					Sql_ND = "select ownername,SUM(RACOunt) as RA, SUM(RDcount) as RD, SUM(OSCOunt) as OS, SUM(NDCount) as ND, SUM(CRCount) as CD from db_gps.t_completedjourney where (gpname = '"
							+ username + "' or ownername = '" + username + "') and startdate >= '" + dt
							+ " 00:00:00' and startdate <= '" + dt1 + " 23:59:59' group by ownername";
					System.out.println("Sql Total:-" + Sql_ND);
					ps1 = conn.prepareStatement(Sql_ND);
					String Data_ND = "";
					rs12 = ps1.executeQuery();
					while (rs12.next()) {

						String OwnerName = rs12.getString("ownername");
						String NDChart = rs12.getString("ND");

						Data_ND += "[" + "'" + OwnerName + "'," + NDChart + "],";

					}

					String Sql_CD = "";
					Sql_CD = "select ownername,SUM(RACOunt) as RA, SUM(RDcount) as RD, SUM(OSCOunt) as OS, SUM(NDCount) as ND, SUM(CRCount) as CD from db_gps.t_completedjourney where (gpname = '"
							+ username + "' or ownername = '" + username + "') and startdate >= '" + dt
							+ " 00:00:00' and startdate <= '" + dt1 + " 23:59:59' group by ownername";
					System.out.println("Sql Total:-" + Sql_CD);
					ps1 = conn.prepareStatement(Sql_CD);
					String Data_CD = "";
					rs12 = ps1.executeQuery();
					while (rs12.next()) {

						String OwnerName = rs12.getString("ownername");
						String CDChart = rs12.getString("CD");

						Data_CD += "[" + "'" + OwnerName + "'," + CDChart + "],";

					}

					String todate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt));

					String fromdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt1));

					System.out.println("Date is:" + todate);

					String RA_Title = "RA Trip Violation Count For ";
					String RD_Title = "RD Trip Violation Count For ";
					String OS_Title = "OS Trip Violation Count For ";
					String ND_Title = "ND Trip Violation Count For ";
					String CD_Title = "CD Trip Violation Count For ";

					RA_Title += username;
					RD_Title += username;
					OS_Title += username;
					ND_Title += username;
					CD_Title += username;

					String date = " From " + todate + " To " + fromdate + "";

					RA_Title += date;
					RD_Title += date;
					OS_Title += date;
					ND_Title += date;
					CD_Title += date;

					/* System.out.println("transporter:"+RA_Title);
					String Destination="RD Trip Violation Count For ";
					Destination+=username;
					Destination+=date;
					 */
				%>

				<!-- RA Script  -->

				<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		  <%=Data_RA%>
	  ]);

	  var container = document.getElementById('piechartRA');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdfRA');


	  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  
	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('RA_Summary.pdf');
	  }, false);

	  
	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	     sliceVisibilityThreshold: 0.0001, 
	    is3D: true,
	    legend: {
	    	position: 'labeled',
	    	labeledValueText:'both',
	    	textStyle: {
	            color: 'black'
	        }
	    	},
	     /* pieSliceText: 'value-and-percentage', */
	       sliceVisibilityThreshold:0,
	     pieSliceText: 'none',
	    title: '<%=RA_Title%>',
	    width: 500
	  });
	});
</script>

				<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		   <%=Data_RD%>
	  ]);

	  var container = document.getElementById('piechartRD');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdfRD');

	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('RD_Summary.pdf');
	  }, false);

	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	    is3D: true,
	    legend: {
	    	position: 'labeled',
	    	
	    	labeledValueText:'both',
	    	textStyle: {
	            color: 'black'
	        }
	    	},
	    	sliceVisibilityThreshold:0,
	     /* pieSliceText: 'value-and-percentage', */
	     pieSliceText: 'none',
	    title: '<%=RD_Title%>',
	    width: 500
	  });
	});
</script>

				<!-- OS Script -->

				<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		  <%=Data_OS%>
	  ]);

	  var container = document.getElementById('piechartOS');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdfOS');


	  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  
	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('OS_Summary.pdf');
	  }, false);

	  
	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	    is3D: true,
	    legend: {
	    	position: 'labeled',
	    	labeledValueText:'both',
	    	textStyle: {
	            color: 'black'
	        }
	    	},
	  /*   pieSliceText: 'value-and-percentage', */
	    sliceVisibilityThreshold:0,
	   pieSliceText: 'none',
	    title: '<%=OS_Title%>',
	    width: 500
	  });
	});
</script>

				<!-- ND Script -->

				<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		  <%=Data_ND%>
	  ]);

	  var container = document.getElementById('piechartND');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdfND');


	  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  
	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('ND_Summary.pdf');
	  }, false);

	  
	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	    is3D: true,
	    legend: {
	    	position: 'labeled',
	    	labeledValueText:'both',
	    	textStyle: {
	            color: 'black'
	        }
	    	},
	     /* pieSliceText: 'value-and-percentage', */
	       sliceVisibilityThreshold:0,
	     pieSliceText: 'none',
	    title: '<%=ND_Title%>',
	    width: 500
	  });
	});
</script>

				<!-- CD Script -->

				<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		  <%=Data_CD%>
	  ]);

	  var container = document.getElementById('piechartCD');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdfCD');


	  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  
	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('CD_Summary.pdf');
	  }, false);

	  
	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	    is3D: true,
	    legend: {
	    	position: 'labeled',
	    	labeledValueText:'both',
	    	textStyle: {
	            color: 'black'
	        }
	    	},
	     /* pieSliceText: 'value-and-percentage', */
	       sliceVisibilityThreshold:0,
	     pieSliceText: 'none',
	    title: '<%=CD_Title%>',
	    width: 500
	  });
	});
</script>


				<div class="row mt-2">
					<div class="col-md-6">
						<div class="card p-1">
							<button class="btn btn-success" id="save-pdfRA"
								style="width: 25%">Export</button>
							<div id="piechartRA"></div>

						</div>
					</div>
					<div class="col-md-6">
						<div class="card p-1">
							<button class="btn btn-success" id="save-pdfRD"
								style="width: 25%">Export</button>
							<div id="piechartRD"></div>

						</div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-md-6">
						<div class="card p-1">
							<button class="btn btn-success" id="save-pdfOS"
								style="width: 25%">Export</button>
							<div id="piechartOS"></div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						</div>
					</div>
					<div class="col-md-6">
						<div class="card p-1">
							<button class="btn btn-success" id="save-pdfND"
								style="width: 25%">Export</button>
							<div id="piechartND"></div>

						</div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="card p-1">
							<button class="btn btn-success" id="save-pdfCD"
								style="width: 25%">Export</button>
							<div id="piechartCD"></div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

	<div class="modal" id="SetCustomModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Custom Column Selection for Trip
						Violation Dashboard</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<%
					int kk = 0;
					String showList = "" + ColumnList;
				%>
				<form id="customselect" name="customselect" method="get"
					action="ReSet.jsp">
					<div class="modal-body">

						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Chk &nbsp;/&nbsp;UnChk</th>
									<th>Col. Name</th>
								</tr>
							</thead>
							<tbody>
								<%
									StringTokenizer stcol = new StringTokenizer(showList, ",");
									while (stcol.hasMoreTokens()) {
								%><tr>
									<td>
										<div align="left">
											<input type="text" id="net_id1<%=kk%>"
												name="net_id1<%=kk%>"
												style="width: 70px; padding: 4px 5px 2px 5px; border: none; text-align: right; font: normal 11px Arial, Helvetica, sans-serif;"
												value="<%=kk%>" readonly />
										</div> <input type="checkbox" name="check<%=kk%>"
										id="check<%=kk%>" />
									</td>
									<td><input type="text" name="clname<%=kk%>"
										id="clname<%=kk%>" value="<%=stcol.nextToken()%>"
										readonly="readonly" style="border: none" /></td>
								</tr>
								<%
									kk++;
									}
								%>
							</tbody>
						</table>

						<input type="hidden" name="checkedNumber" id="checkedNumber"
							value="<%=kk%>" /> <input type="hidden" name="reportno"
							id="reportno" value="<%=reportno%>"> <input type="hidden"
							id="tableheaders" name="tableheaders" value=""> <input
							type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" name="pagename" id="pagename"
							value="<%=PageName%>">


					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Submit</button>

						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
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
								title: 'Trip Violation Dashboard Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Trip Violation Dashboard Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Trip Violation Dashboard Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Trip Violation Dashboard Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Trip Violation Dashboard Report',
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