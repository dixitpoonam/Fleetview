<%@ include file="headernew1.jsp"%>

<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
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
<%! 		int colcount = 0; //special code for detailed view
String setSequence = "";
String detailViewSequence = "", ColumnList = "";
boolean setDefFlag = false;
 %>

	<%
		try {
			Connection conn, conn1;
			String sql, sql1, jcode, origin, destination, startdate;
			Statement st, st1, st2, stgeo, st3, st4, stlogo;
			String username = "";
			username = (String) session.getAttribute("usertypevalue");
			Class.forName(MM_dbConn_DRIVER);
			conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			st1 = conn.createStatement();
			st2 = conn.createStatement();
			st = conn.createStatement();
			st3 = conn.createStatement();
			st4 = conn.createStatement();
			stgeo = conn.createStatement();
			stlogo = conn.createStatement();
			PreparedStatement ps = null;
			ResultSet rs4 = null;
			ResultSet rs6 = null;
			ResultSet rs8 = null;

			String datex1, datex2, data1, data2;
	%>




	<!-- start set default code -->

	<%

			Statement st20 = conn.createStatement();
			Statement st21 = conn.createStatement();

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


	<!-- end set default code -->




	<%
		//Class.forName("org.gjt.mm.mysql.Driver");
			String wareHouseCode = "-", wareHouse = "-", owner = "-", html1 = null, wtype = "-",
					PolygonCoordinates = "-", fwUser = "", selecteduser = "";//,rad="";

			String smap = "", smap1 = "", geoname = "", geotrans = "", logoname = "", logotrans = "";
	%>
	<%
		String rfname = session.getAttribute("rfname").toString(); //user name  //.setAttribute("rfname",fnamelist);
			String rlname = session.getAttribute("rlname").toString();
			//System.out.println("31 firstname "+rfname+ "lastname " +rlname);
			selecteduser = (String) session.getAttribute("selecteduser");

			System.out.println("name----------------- " + selecteduser);
			fwUser = (String) session.getAttribute("user");

			String name = (String) session.getAttribute("mainuser");

			String sqlgeoinfo = "select * from db_gps.t_geouserinfo where Transporter ='" + selecteduser
					+ "' and Status='Yes'";
			//System.out.println("38 sqlgeoinfo "+sqlgeoinfo);
			ResultSet rstgeo = stgeo.executeQuery(sqlgeoinfo);
			System.out.println("Query no 1" + sqlgeoinfo);
			if (rstgeo.next()) {
				geoname = "Yes";
			}

			String sqllogo = "select * from db_gps.t_logouserinfo where Transporter ='" + selecteduser
					+ "' and Status='Yes'";
			//System.out.println("46 sqllogo "+sqllogo);
			ResultSet rstlogo = stlogo.executeQuery(sqllogo);
			System.out.println("Query no 2" + sqlgeoinfo);
			if (rstlogo.next()) {
				//logoname=rstlogo.getString("User");
				logotrans = rstlogo.getString("Transporter");
			}
	%>
	<%
		String ddx = request.getQueryString();
			String bt = request.getParameter("button");
			System.out.println(" buttom :- " + bt);

			if (bt == null || bt.equals("null")) {

				datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

				Calendar c = Calendar.getInstance(); // this takes current date
				c.set(Calendar.DAY_OF_MONTH, 1);
				System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
				datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());

			} else {

				System.out.println("Inside ELSSSSSSSSS ");

				data1 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
				data2 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));

				datex1 = request.getParameter("data");
				datex2 = request.getParameter("data1");

			}

			System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

			String dt = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

			String dt1 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));
	%>




	<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />

	<input type="hidden" id="username" name="username" value=<%=username%>>
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Geofence Location Report From
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
								data-bs-toggle="modal" data-bs-target="#SetCustomModal">Set
								Custom</button>


							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">Register
								Complaint</button>

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
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<label for="Status">Status:</label>
						<div class="input-group input-group-merge">

							<!-- 						<select class="form-select" id="basicSelect" name="basicSelect">
						
						  -->

							<select class="form-select" name="Status" id="Status">

								<option value="All" selected>All</option>

								<%
									String status = "";
										String sql6 = "SELECT Distinct Status FROM  db_gps.t_warehousedata order by Status asc";
										System.out.println("*******" + sql6);
										ResultSet rs5 = st4.executeQuery(sql6);
										while (rs5.next()) {

											status = rs5.getString("status");
											System.out.println("Status-->" + status);
								%>
								<option value="<%=status%>"><%=status%></option>
								<%
									}
								%>
							</select>
							<script>
const mySel = document.getElementById("Status"); 
mySel.addEventListener("change",function() 
		{ 
			localStorage.setItem("selValue",this.value); // save it 
		}); 

let val = localStorage.getItem("selValue"); 
if (val) 
	mySel.value=val; // set the dropdown 
    // trigger the change in case there are other events on the select 
mySel.onchange(); 
</script>


						</div>
					</div>
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
						<input type="submit" id="submit" class="btn btn-primary"
							style="margin-top: 20px;" name="button" onclick="return chk()"
							value="Submit">
					</div>
				</div>
				<br>
			</form>




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
											<th align="center">Code</th>
											<th align="center">Geofence Type</th>

											<th align="center">Location</th>
											<th align="center">Owner</th>
											<th align="center">Latitude</th>
											<th align="center">Longitude</th>
											<th align="center">Type</th>
											<th align="center">Radius</th>
											<th align="center">Depot</th>
											<th align="center">InnerLimit</th>
											<th align="center">OuterLimit</th>
											<th align="center">AlertStatus</th>
											<th align="center">RouteId</th>
											<th align="center">Updated</th>
											<th align="center">InsertDate</th>

											<th align="center">Status</th>
											<th align="center">EntBy</th>

										</tr>
									</thead>
									<tbody>

										<%
											int j = 1;
												String Code = "", GeofenceType = "", Location = "", Owner = "", Latitude = "", Longitude = "",
														Type = "", EntBy = "", Radius = "", Depot = "", InnerLimit = "", OuterLimit = "",
														AlertStatus = "", RouteId = "", Updated = "", InsertDate = "", Status = "";
												String sql2 = "Select WareHouseCode as Code,WareHouse as Location,Owner,FORMAT(Latitude,2) as Latitude,FORMAT(Longitude,2) as Longitude,WType as Type,EntBy,Radius,vehicleindepot as Depot,InnerLimit,OuterLimit,AlertStatus,RouteId, CASE WHEN DATE_FORMAT(UpdatedDate,'%d-%b-%Y') IS NULL THEN  '-' ELSE DATE_FORMAT(UpdatedDate,'%d-%b-%Y') END as Updated,CASE WHEN DATE_FORMAT(insertDate,'%d-%b-%Y') IS NULL THEN  '-' ELSE DATE_FORMAT(insertDate,'%d-%b-%Y') END as InsertDate,Status from db_gps.t_warehousedata where Owner like '"
														+ username
														+ "' and Latitude <> '0' and Longitude <> '0' and MarkerType='Point' and Status like '" + status
														+ "' and UpdatedDate >='" + dt + "' and UpdatedDate <='" + dt1 + "'";
												System.out.println("83 sql2---->" + sql2);
												ResultSet rs1 = st2.executeQuery(sql2);
												while (rs1.next()) {

													Code = rs1.getString("Code");
													Location = rs1.getString("Location");
													Owner = rs1.getString("Owner");
													Latitude = rs1.getString("Latitude");
													Longitude = rs1.getString("Longitude");
													Type = rs1.getString("Type");
													EntBy = rs1.getString("EntBy");
													Radius = rs1.getString("Radius");
													Depot = rs1.getString("Depot");
													InnerLimit = rs1.getString("InnerLimit");
													OuterLimit = rs1.getString("OuterLimit");
													AlertStatus = rs1.getString("AlertStatus");
													RouteId = rs1.getString("RouteId");
													Updated = rs1.getString("Updated");
													InsertDate = rs1.getString("InsertDate");
													Status = rs1.getString("Status");
													GeofenceType = "Private";
										%>
										<tr>

											<td align="right"><%=j%></td>
											<td align="right"><%=Code%></td>
											<td align="left"><%=GeofenceType%></td>
											<td align="left"><%=Location%></td>
											<td align="left"><%=Owner%></td>
											<td align="right"><%=Latitude%></td>
											<td align="right"><%=Longitude%></td>
											<td align="left"><%=Type%></td>
											<td align="right"><%=Radius%></td>
											<td align="left"><%=Depot%></td>
											<td align="right"><%=InnerLimit%></td>
											<td align="right"><%=OuterLimit%></td>

											<td align="left"><%=AlertStatus%></td>
											<td align="right"><%=RouteId%></td>
											<td align="center"><%=Updated%></td>
											<td align="center"><%=InsertDate%></td>
											<td align="left"><%=Status%></td>
											<td align="left"><%=EntBy%></td>




										</tr>


										<%
											j++;
												}

												String sql4 = "select LocationCode as Code,city as Location,Typevalue as Owner,FORMAT(Lat,2) as Latitude,FORMAT(Lon,2) as Longitude,Category as Type,EntryBy as EntBy,CASE WHEN DATE_FORMAT(EntryDate,'%d-%b-%Y') IS NULL THEN  '-' ELSE DATE_FORMAT(EntryDate,'%d-%b-%Y') END as InsertDate from db_gps.t_citylatlong where Typevalue like '"
														+ username + "' and Lat <> '0' and Lon <> '0'and EntryDate >='" + dt + "' and EntryDate <='"
														+ dt1 + "'";
												System.out.println("84 sql4---->" + sql4);
												ResultSet rs2 = st1.executeQuery(sql4);
												while (rs2.next()) {

													Code = rs2.getString("Code");
													Location = rs2.getString("Location");
													Owner = rs2.getString("Owner");
													Latitude = rs2.getString("Latitude");
													Longitude = rs2.getString("Longitude");
													Type = rs2.getString("Type");
													EntBy = rs2.getString("EntBy");

													InsertDate = rs2.getString("InsertDate");

													GeofenceType = "Public";
										%>
										<tr>


											<td align="right"><%=j%></td>
											<td align="right"><%=Code%></td>
											<td align="left"><%=GeofenceType%></td>
											<td align="left"><%=Location%></td>
											<td align="left"><%=Owner%></td>
											<td align="right"><%=Latitude%></td>
											<td align="right"><%=Longitude%></td>
											<td align="left"><%=Type%></td>
											<td align="right">-</td>
											<td align="left">-</td>
											<td align="right">-</td>
											<td align="right">-</td>

											<td align="left">-</td>
											<td align="right">-</td>
											<td align="center">-</td>
											<td align="center"><%=InsertDate%></td>
											<td align="center"><%=Status%></td>

											<%-- <td align="left"><%=Status%></td> --%>

											<td align="left"><%=EntBy%></td>




										</tr>

										<%
											j++;
												}

											} catch (Exception e) {
												System.out.println("Exception-->" + e);

											}
										%>
									</tbody>
									<tfoot>
										<tr>
											<th width="4%" align="center">Sr No</th>
											<th align="center">Code</th>
											<th align="center">Geofence Type</th>

											<th align="center">Location</th>
											<th align="center">Owner</th>
											<th align="center">Latitude</th>
											<th align="center">Longitude</th>
											<th align="center">Type</th>
											<th align="center">Radius</th>
											<th align="center">Depot</th>
											<th align="center">InnerLimit</th>
											<th align="center">OuterLimit</th>
											<th align="center">AlertStatus</th>
											<th align="center">RouteId</th>
											<th align="center">Updated</th>
											<th align="center">InsertDate</th>

											<th align="center">Status</th>
											<th align="center">EntBy</th>

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


	<!-- start the set default code -->



	<div class="modal" id="SetCustomModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Custom Column Selection for Geofence Location Report</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<%
					int i = 0;
					String showList=""+ColumnList;
							
				//	String showList = "" + ColumnList;
										
				
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
											<input type="text" id="net_id1<%=i%>" name="net_id1<%=i%>"
												style="width: 70px; padding: 4px 5px 2px 5px; border: none; text-align: right; font: normal 11px Arial, Helvetica, sans-serif;"
												value="<%=i%>" readonly />
										</div> <input type="checkbox" name="check<%=i%>" id="check<%=i%>" />
									</td>
									<td><input type="text" name="clname<%=i%>"
										id="clname<%=i%>" value="<%=stcol.nextToken()%>"
										readonly="readonly" style="border: none" /></td>
								</tr>
								<%
									i++;
									}
								%>
							</tbody>
						</table>

						<input type="hidden" name="checkedNumber" id="checkedNumber"
							value="<%=i%>" /> <input type="hidden" name="reportno"
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



	<!-- end the set default code
 -->




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
								title: 'Geofence Location Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Geofence Location Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Geofence Location Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Geofence Location Report',
                                exportOptions: { columns: [<%=setSequence%> ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Geofence Location Report',
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