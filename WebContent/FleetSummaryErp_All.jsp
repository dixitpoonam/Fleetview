<%@ include file="headernew1.jsp"%>

<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
<!-- 	
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
 -->

<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>
<%@page import="java.util.Date"%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>

	<%
		String username = "";
		username = (String) session.getAttribute("usertypevalue");

		System.out.println("Session name----------------->:" + username);

		String defaultDate = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
		System.out.println("The default date is ==>" + defaultDate);
		String datex1, datex2, data1, data2;
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

		String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

		String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));
		String date1 = "";
		String date2 = "";

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		c1.setTime(new Date());
		c1.add(Calendar.DATE, -1);
		String default_date_2 = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());

		date1 = request.getParameter("data");
		date2 = request.getParameter("data1");
	%>



	<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />



	<%-- 


<form name="formreport" id="formreport" method="post">
	<input type="hidden" id="username" name="username" value=<%=username %>>

	<div align="center" style="font-size: 13px;">
		<font><b> Fleet Summary Report From <%=datex1 %>
				To <%=datex2 %> Of <%=username %></b></font>


		<table border="0" width=600 align="center">
			
			<br></br>
			<tr>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</label>
					&nbsp;&nbsp; <input type="text" id="data" name="data"
					style="text-align: center; color: gray; font-size: 12px;" value="<%if(date1==null){ %><%=defaultDate%><%}else{%><%=date1%><%}%>" size="10" readonly
					class="element text medium"/ > <script
						type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "data"       // ID of the button
			    }
			  );
			</script></div></td>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To</label>
					&nbsp;&nbsp; <input type="text" id="data1" name="data1"
					style="text-align: center; color: gray; font-size: 12px;" value="<%if(date2==null){ %><%=default_date_2%><%}else{%><%=date2%><%}%>" size="10" readonly
					class="element text medium" /> <script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "data1",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",    // the date format
			      button      : "data1"       // ID of the button
			    }
			  );
			</script></div></td>
				<td><div style="display:flex; flex-direction: row; justify-content: center; align-items: center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="submit" name="button" onclick="return chk()"  style="text-align: center; color: gray; font-size: 12px;" value="Submit"></div></td>


			</tr>
		</table>
	</div>
</form>
 --%>




	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Fleet Summary Report From
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
					<div class="col-md-3"></div>
					<div class="col-md-2">


						<label for="from">From:</label>
						<div class="input-group input-group-merge">
							<input type="text" name="data" id="data" class="form-control"
								value="<%if (date1 == null) {%><%=defaultDate%><%} else {%><%=date1%><%}%>">
							<span class="input-group-text"><svg
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
								value="<%if (date2 == null) {%><%=default_date_2%><%} else {%><%=date2%><%}%>" />
							<span class="input-group-text"><svg
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
							style="margin-top: 20px;" name="button" onclick="return chk()"
							value="Submit">
					</div>
				</div>
				<br>
			</form>






			<%
			
				Connection conn = null;
				Statement st = null, st1 = null, st2 = null;
				Statement st3 = null;
				
				String latinDec="", loninDec="";
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
					st3 = conn.createStatement();

				} catch (Exception e) {

				}

				//setting for the to date

				int no_of_column = 0;
				String date_3 = "";
				String date_4 = "";

				//	System.out.println("Date1 = "+date1+"Date2 ="+date2);
				if (date1 == null || date2 == null) {
					//System.out.println("in if");

					//	System.out.println("The default date is :"+defaultDate);
					//	System.out.println("The default date_2 is :"+default_date_2);

					date1 = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(defaultDate));
					date2 = new SimpleDateFormat("yyyy-MM-dd")
							.format(new SimpleDateFormat("dd-MMM-yyyy").parse(default_date_2));
					/*	date1 = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
						int index = date1.lastIndexOf("-");
						String date_Sub = date1.substring(index);
						date1 = date1.replace(date_Sub,"");
						date1.trim();
						date1 = date1+"-01";
						date2 = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); */

					//	System.out.println("If Date1 = "+date1+"Date2 ="+date2);
					date_3 = date1;
					date_4 = date1;
					//	System.out.println("The date3 is "+date_3);

					String datediff = "Select datediff('" + date2 + "','" + date1 + "') as deteDif";
					ResultSet rs1 = st1.executeQuery(datediff);
					if (rs1.next()) {
						no_of_column = rs1.getInt("deteDif");
					}
					//		System.out.println("The number of columns in the table :"+no_of_column);

				} else {
					//System.out.println("in else");

					date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date1));
					date2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date2));

					System.out.println("else Date1 = " + date1 + "Date2 =" + date2);

					date_3 = date1;
					date_4 = date1;
					//	System.out.println("The date3 is "+date_3);

					String datediff = "Select datediff('" + date2 + "','" + date1 + "') as deteDif";
					ResultSet rs1 = st1.executeQuery(datediff);
					if (rs1.next()) {
						no_of_column = rs1.getInt("deteDif");
					}

					//	System.out.println("The number of columns in the table :"+no_of_column);
				}
			%>


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
											<th align="center">VehRegNo</th>
											<th align="center">Transporter</th>
											<th align="center">VehicleType</th>
											<%
												if (date2 == null) {
											%><th align="center">Update on <%=default_date_2%> before
												10:00:00
											</th>
											<%
												
											%><th align="center">Location on <%=default_date_2%> before
												10:00:00
											</th>
											<%
												} else {
											%><th align="center">Update on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%>
												before 10:00:00 AM
											</th>
											<%
												
											%><th align="center">Location on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%>
												before 10:00:00 AM
											</th>
											<%
												}
											%>
											<%
												for (int i = 0; i <= no_of_column; i++) {

													if (i > 0) {
														SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
														Calendar c = Calendar.getInstance();
														c.setTime(sdf.parse(date1));
														c.add(Calendar.DATE, 1);
														date1 = sdf.format(c.getTime());
													}

													System.out.println("The date1 is=====================> :" + date1);
											%><th align="center">Distance <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%></th>
											<%
												
											%><th align="center">RunHrs <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%></th>
											<%
												}
											%>
											<th align="center">Total Distance</th>
											<th align="center">Total RunHrs</th>
										</tr>
									</thead>
									<tbody>

										<%
											String vehicletype1 = request.getParameter("vehicle");

											System.out.println("-------------------------------->" + vehicletype1);
											if (vehicletype1 == null) {
												vehicletype1 = "All";
											}
										%>
										<script>
    document.getElementById("vehicle").value='<%out.print(vehicletype1);%>';
    
    </script>
										<%
											if (vehicletype1.equals("All")) {
												vehicletype1 = "%%";
											}

											try {
												DecimalFormat df2 = new DecimalFormat("0.00");
												String vehlist = session.getAttribute("VehList").toString();

												int cnt = 0;
												String sql = "Select VehicleCode,VehicleRegNumber,OwnerName,vehtype from db_gps.t_vehicledetails where VehicleCode  IN "
														+ vehlist + "  and  vehtype like '" + vehicletype1 + "'";
												ResultSet rs = st.executeQuery(sql);
												System.out.println("The sql is ==>" + sql);
												while (rs.next()) {
													String vehcode = rs.getString("VehicleCode");
													String vehregno = rs.getString("VehicleRegNumber");
													String trans = rs.getString("OwnerName");
													String vehicletype = rs.getString("vehtype");
													//				System.out.println("The srno is :"+cnt+"The vehicle code is :"+vehcode+"The vehicle reg no is :"+vehregno);
													if (vehicletype == "null" || vehicletype.equalsIgnoreCase("null")) {
														vehicletype = "-";
													} else {
														vehicletype = vehicletype;
													}
													//add the data into the table
										%>

										<tr>
											<td><div align="right"><%=++cnt%></div></td>
											<td><div align="left"><%=vehregno%></div></td>
											<td><div align="left"><%=trans%></div></td>
											<td><div align="left"><%=vehicletype%></div></td>

											<%
												
														double total_distance = 0;
														double total_runhrs = 0;
														String last_loc = "", date_loc = "";

														//find the last location
														String sql3 = "Select TheFieldSubject,Thefielddatadatetime, LatinDec, LonginDec from db_gps.t_veh"
																+ vehcode + " where Thefielddatadatetime >= '" + date_3
																+ " 00:00:00' and Thefielddatadatetime <= '" + date2
																+ " 10:00:00' order by Thefielddatadatetime DESC limit 1";
														System.out.println("The sql2 is==>" + sql3);

														ResultSet rs3 = st3.executeQuery(sql3);

														if (rs3.next()) {
															last_loc = rs3.getString("TheFieldSubject");
															date_loc = rs3.getString("Thefielddatadatetime");
															
															latinDec = rs3.getString("LatinDec");
															loninDec = rs3.getString("LonginDec");
															
														} else {
															last_loc = "-";
															date_loc = "-";
														}
											%>
											<%
												if (date_loc == "-" || date_loc.equals("-")) {

															date_loc = "-";
														} else {
															date_loc = new SimpleDateFormat("dd-MMM-yyyy HH:mm")
																	.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_loc));
														}
											%>
											<td><div align="left"><%=date_loc%></div></td>

<%-- 											<td><div align="left"><%=last_loc%></div></td>
 --%>
<td><div align="left"><a href="shownewmap.jsp?lat=<%=latinDec%>&long=<%=loninDec%>&discription=<%=last_loc%>" onclick="popWin=open('shownewmap.jsp?lat=<%=latinDec%>&long=<%=loninDec%>&discription=<%=last_loc%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=last_loc %></a> </div></td>


											<%
												date_3 = date_4;
														for (int i = 0; i <= no_of_column; i++) {
															String distance = "", runHrs = "";

															if (i > 0) {
																SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
																Calendar c = Calendar.getInstance();
																c.setTime(sdf.parse(date_3));
																c.add(Calendar.DATE, 1);
																date_3 = sdf.format(c.getTime());
															}

															//		System.out.println("The date1 is=====================> :"+date_3);
															String sql2 = "Select Distance,RDurationinHrs from db_gpsExceptions.t_veh" + vehcode
																	+ "_ds where TheDate = '" + date_3 + "'";
															ResultSet rs2 = st2.executeQuery(sql2);
															System.out.println("The sql2 is==>" + sql2);
															if (rs2.next()) {

																distance = rs2.getString("Distance");
																runHrs = rs2.getString("RDurationinHrs");

																total_distance = total_distance + Double.parseDouble(distance);
																total_runhrs = total_runhrs + Double.parseDouble(runHrs);

															} else {

																distance = "-";
																runHrs = "-";
															}

															//add data into table
											%>
											<td><div align="right"><%=distance%></div></td>
											<%
												if (runHrs == "-" || runHrs.equals("-")) {
											%><td><div align="right"><%=runHrs%></div></td>
											<%
												} else {
											%><td><div align="right"><%=df2.format(Double.parseDouble(runHrs))%></div></td>
											<%
												}

														}
											%>
											<td><div align="right"><%=Double.valueOf(df2.format(total_distance))%></div></td>
											<td><div align="right"><%=Double.valueOf(df2.format(total_runhrs))%></div></td>

											<%
												
											%>


										</tr>

										<%
											}
											} catch (Exception e1) {
												System.out.println(e1.getMessage());
												e1.printStackTrace();
											}
										%>

									</tbody>


									<tfoot>
										<tr>
											<th width="4%" align="center">Sr No</th>
											<th align="center">VehRegNo</th>
											<th align="center">Transporter</th>
											<th align="center">VehicleType</th>
											<%
												if (date2 == null) {
											%><th align="center">Update on <%=default_date_2%> before
												10:00:00
											</th>
											<%
												
											%><th align="center">Location on <%=default_date_2%> before
												10:00:00
											</th>
											<%
												} else {
											%><th align="center">Update on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%>
												before 10:00:00 AM
											</th>
											<%
												
											%><th align="center">Location on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%>
												before 10:00:00 AM
											</th>
											<%
												}
											%>
											<%
												for (int i = 0; i <= no_of_column; i++) {

													if (i > 0) {
														SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
														Calendar c = Calendar.getInstance();
														c.setTime(sdf.parse(date1));
														c.add(Calendar.DATE, 1);
														date1 = sdf.format(c.getTime());
													}

													System.out.println("The date1 is=====================> :" + date1);
											%><th align="center">Distance <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%></th>
											<%
												
											%><th align="center">RunHrs <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%></th>
											<%
												}
											%>
											<th align="center">Total Distance</th>
											<th align="center">Total RunHrs</th>
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
								title: 'Fleet Summary Report'
                                
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Fleet Summary Report'
                                
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Fleet Summary Report'
                              
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Fleet Summary Report'
                                
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Fleet Summary Report'
                                
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

            /* dt_basic.columns([8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26,27,28,29,30,31,32,33,34]).visible(false) ,*/

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


        /* $("#detailedView").on("click", function () {

            dt_basic.columns([8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26,27,28,29,30,31,32,33,34]).visible(true),

                $('#example1').addClass('table-responsive');

        }); */


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
