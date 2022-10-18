
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
    
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
 
 <script type="text/javascript">

var renderStart = new Date().getTime();
window.onload=function() { 
var renderEnd=new Date().getTime();
var elapsed = new Date().getTime()-renderStart;   
var PageName = document.getElementById("PageName").value;
	try{var ajaxRequest;
	try{ajaxRequest = new XMLHttpRequest();	}
		catch (e)
		{
		try
		{ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");}
		catch (e)
		{try
		{ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");}
		catch (e)
		{alert("Your browser broke!");
		return false;
		}}}
		ajaxRequest.onreadystatechange = function()
		{if(ajaxRequest.readyState == 4)
		{try
		{var reslt=ajaxRequest.responseText;
		var result1;
		result1=reslt;
		result1=result1.replace(/^\s+|\s+$/g,'');
		if(result1=="Updated")
		{}
		}catch(e)
		{alert(e);
		}}};		 
		var queryString = "?PageName="+PageName+"&renderStart="+renderStart+"&renderEnd="+renderEnd+"&elapsed="+elapsed+"";
		ajaxRequest.open("GET","Ajax_PageLoadingTime.jsp" + queryString, true);
		ajaxRequest.send(null); 
		}
		   catch(e)
		{
			alert(e);
		}  
};
 
</script>

</head>
<body>
<%
	fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<%! 
	Connection conn=null,conn1=null;
	String data1,sql,sql1,data2,jcode,origin,destination,startdate;
	Statement st,st1,st2,st3;
	String trans="";
%>
<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />

<%
	String username="";
	username=(String)session.getAttribute("usertypevalue");
	
	System.out.println("Session name----------------->:"+username); 
	data2 = session.getAttribute("Yesterday").toString();

%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-5 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Driver Rating report for the Date:<%=session.getAttribute("yesterday").toString()%></h2>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-7 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		
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
try{
	//Class.forName(MM_dbConn_DRIVER);
	conn = fleetview.ReturnConnection();
	conn1 = fleetview.ReturnConnection1();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st=conn.createStatement();
	
	String GPName="",Transporter="";
	
	String RejectedBy=session.getAttribute("mainuser").toString();
	

	String usertypevalue=session.getAttribute("usertypevalue").toString();
	System.out.println(" User ");
	String typeofuser=session.getAttribute("TypeofUser").toString();
	String SrchTrans="";
	System.out.println(usertypevalue+" User "+typeofuser);
	if(typeofuser.equalsIgnoreCase("Group"))
	{System.out.println("IN Group ");
		sql="SELECT VehRegno FROM db_gps.t_group WHERE GPName='"+usertypevalue+"' group by VehRegno";
		System.out.println("*****8     "+sql);
		ResultSet rstGrp=st3.executeQuery(sql);
		

		SrchTrans="(";
		int k = 0;
		while(rstGrp.next())
		{
			SrchTrans=SrchTrans+"'"+rstGrp.getString("VehRegno")+"',";
			k++;
		}
		SrchTrans=SrchTrans.substring(0,SrchTrans.length()-1)+")";

	}
	else
	{
		System.out.println("IN Else ");
		SrchTrans="('"+usertypevalue+"')";	
	}
	
%>	

		
		
		<div class="content-body">
			<!-- Basic table -->
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Top 20 Drivers Distance 100-250 km.</h3>
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
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
										</thead>
									<tbody>
									<%
									sql="select * from db_gpsExceptions.t_driver_ds where TheDate='"+data2+"' and Distance between 100 and 250 and nd<>'Yes' and Jcode <>'-' and transporter in "+SrchTrans+" order by Rating, Distance desc limit 20";
									System.out.println("sql1-->"+sql);
									ResultSet rst=st1.executeQuery(sql);
									
									while (rst.next()) {

										jcode = rst.getString("JCode");
							%>
							<tr>
								<td align="left">
										<%
										String DriverName="";
											sql1 = "select DriverName from t_startedjourney where DriverCode='" + rst.getString("Dcode")
															+ "' limit 1";
													System.out.println("sql 1 next:" + sql1);
													ResultSet rst1 = st.executeQuery(sql1);
													if (rst1.next()) {
														DriverName = rst1.getString("DriverName");
													}
										%>
										<%=DriverName%>
								</td>
								<td align="right"><%=rst.getString("Dcode")%></td>
								<td align="left"><%=rst.getString("Transporter")%></td>
								<%
									if (!jcode.equals("-")) {
												sql = "select * from t_startedjourney where TripId='" + jcode
														+ "' and (TO_DAYS(CURDATE())-TO_DAYS(StartDate)) < 10";
												System.out.println("sql2-->" + sql);
												ResultSet rs1 = st.executeQuery(sql);
												if (rs1.next()) {

													java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd")
															.parse(rs1.getString("StartDate"));
													Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
													String showdate1 = formatter1.format(ShowDate1);
													startdate = showdate1;
													origin = rs1.getString("StartPlace");
													destination = rs1.getString("EndPlace");
												}

												else {
													startdate = "-";
													origin = "-";
													destination = "-";
												}
											}
								%>
								<td align="left"><%=startdate%></td>
								<td align="left"><%=origin%></td>
								<td align="left"><%=destination%></td>
								<td align="right"><%=rst.getString("OSCount")%></td>
								<td align="right"><%=rst.getString("RACount")%></td>
								<td align="right"><%=rst.getString("RDCount")%></td>
								<td align="right"><%=rst.getString("Distance")%></td>
								<td align="right">
										<%
											String ss = "" + rst.getDouble("Rating");

													if (ss.length() > 4) {
														out.print(ss.substring(0, 4));
													} else {
														out.print(ss);
													}
										%>
									</td>

							</tr>

							<%
								}
							%>
									</tbody>
									<tfoot>
											<tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
										</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							

			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Bottom 20 Drivers Distance 100-250 km</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example2" class="table table-bordered">
							<thead>
										<tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
									</thead>
									<tbody>
									<%
											String sql2="select * from t_driver_ds where TheDate='"+data2+"' and Distance between 100 and 250 and Jcode <>'-'  and transporter in "+SrchTrans+" order by Rating desc, Distance Asc limit 20";
											ResultSet rst2=st2.executeQuery(sql2);
											//System.out.println("sql2-->"+sql2);
											while(rst2.next())
											{
												
											jcode=rst2.getString("JCode");
									%>
										<tr>
										<td class="bodyText"><div align="left">
									<%
										sql1="select * from t_startedjourney where DriverCode='"+rst2.getString("Dcode")+"' limit 1";
										ResultSet rst3=st.executeQuery(sql1);
										if(rst3.next())
										{
											out.print(rst3.getString("DriverName"));
										}
										
									%>
										</div></td>
										<td class="bodyText"><div align="right"><%=rst2.getString("Dcode")%></div></td>
										<td class="bodyText"><div align="left"><%=rst2.getString("Transporter")%></div></td>
										
										<%
											if(!jcode.equals("-"))
											{
											sql="select * from t_startedjourney where TripId='"+jcode+"'  and (TO_DAYS(CURDATE())-TO_DAYS(StartDate)) < 10";
											ResultSet rs2=st.executeQuery(sql);
											if(rs2.next())
											{
												java.util.Date ShowDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("StartDate"));
												Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
												String showdate2 = formatter2.format(ShowDate2);
												startdate=showdate2;
												origin=rs2.getString("StartPlace");
												destination=rs2.getString("EndPlace");
											}
											
											else
											{
												startdate="-";
												origin="-";
												destination="-";
											}
											}
										%>
										<td class="bodyText"><div align="left"><%=startdate%></div></td>
										<td class="bodyText"><div align="left"><%=origin%></div></td>
										<td class="bodyText"><div align="left"><%=destination%></div></td>
										
										
										<td class="bodyText"><div align="right"><%=rst2.getString("OSCount")%></div></td>
										<td class="bodyText"><div align="right"><%=rst2.getString("RACount")%></div></td>
										<td class="bodyText"><div align="right"><%=rst2.getString("RDCount")%></div></td>
										<td class="bodyText"><div align="right"><%=rst2.getString("Distance")%></div></td>
										<td class="bodyText">
										<div align="right">
											<%
													String sss=""+rst2.getDouble("Rating");
													
													if(sss.length() > 4)
													{
														out.print(sss.substring(0,4));
													}
													else
													{
														out.print(sss);
													}
											%>
										</div>
										</td>
										
										</tr>
<%
}

%>
										</tbody>
										<tfoot>
										<tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>

															
				<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Top 20 Drivers Distance > 250 km</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example3" class="table table-bordered">
							<thead>
										<tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
									</thead>
									<tbody>
									<%
									
									sql="select * from t_driver_ds where TheDate='"+data2+"' and Distance > 250  and Distance < 500 and nd<>'Yes' and Jcode <>'-' and transporter in "+SrchTrans+" order by Rating, Distance desc limit 20";
									ResultSet rst3=st1.executeQuery(sql);
		while(rst3.next())
		{
			jcode=rst3.getString("JCode");
	%>
	<tr>
		<td class="bodyText"><div align="left">
			<%
			sql1="select * from t_startedjourney where DriverCode='"+rst3.getString("Dcode")+"' limit 1";
			ResultSet rst4=st.executeQuery(sql1);
			if(rst4.next())
			{
				out.print(rst4.getString("DriverName"));
			}
		
		%>
		</div></td>
		<td class="bodyText"><div align="right"><%=rst3.getString("Dcode")%></div></td>
		<td class="bodyText"><div align="left"><%=rst3.getString("Transporter")%></div></td>
		
		<%
				if(!jcode.equals("-"))
				{
					sql="select * from t_startedjourney where TripId='"+jcode+"' and (TO_DAYS(CURDATE())-TO_DAYS(StartDate)) < 10";
					ResultSet rs3=st.executeQuery(sql);
					if(rs3.next())
					{
						java.util.Date ShowDate3 = new SimpleDateFormat("yyyy-MM-dd").parse(rs3.getString("StartDate"));
						Format formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
						String showdate3 = formatter3.format(ShowDate3);
						startdate=showdate3;
						origin=rs3.getString("StartPlace");
						destination=rs3.getString("EndPlace");
					}
					
					else
					{
						startdate="-";
						origin="-";
						destination="-";
					}
				}
		%>
			<td class="bodyText"><div align="left"><%=startdate%></div></td>
			<td class="bodyText"><div align="left"><%=origin%></div></td>
			<td class="bodyText"><div align="left"><%=destination%></div></td>
			
			
			<td class="bodyText"><div align="right"><%=rst3.getString("OSCount")%></div></td>
			<td class="bodyText"><div align="right"><%=rst3.getString("RACount")%></div></td>
			<td class="bodyText"><div align="right"><%=rst3.getString("RDCount")%></div></td>
			<td class="bodyText"><div align="right"><%=rst3.getString("Distance")%></div></td>
			<td class="bodyText">
				<div align="right">
					<%
						String ssss=""+rst3.getDouble("Rating");
						
						if(ssss.length() > 4)
						{
							out.print(ssss.substring(0,4));
						}
						else
						{
							out.print(ssss);
						}
					%>
				</div>
			</td>

</tr>
<%
	}

%>


									</tbody>
							<tfoot>
											<tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
											</tr>
							</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
	<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Bottom 20 Drivers Distance > 250 km</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example4" class="table table-bordered">
										<thead>
												<tr>
													<th>Driver Name</th>
													<th>Driver ID</th>
													<th>Transporter</th>
													<th>Start Date</th>
													<th>Origin</th>
													<th>Destination</th>
													<th>OS Count</th>
													<th>RA Count</th>
													<th>DC Count</th>
													<th>Distance</th>
													<th>Rating</th>
												</tr>	
										</thead>
									<tbody>
<%
									
		sql="select * from t_driver_ds where TheDate='"+data2+"' and Distance > 250 and Distance < 500  and Jcode <>'-' and transporter in "+SrchTrans+"  order by Rating desc, Distance Asc limit 20";
		
		
		ResultSet rst5=st1.executeQuery(sql);
		//System.out.println("sql4 "+sql);
		while(rst5.next())
		{
			jcode=rst5.getString("JCode");
%>
		<tr>
			<td class="bodyText">
				<div align="left">
				<%
					sql1="select * from t_startedjourney where DriverCode='"+rst5.getString("Dcode")+"' limit 1";
					ResultSet rst6=st.executeQuery(sql1);
					if(rst6.next())
					{
						out.print(rst6.getString("DriverName"));
					}
		
				%>
				</div>
			</td>
<td class="bodyText"><div align="right"><%=rst5.getString("Dcode")%></div></td>
<td class="bodyText"><div align="left"><%=rst5.getString("Transporter")%></div></td>

<%
		if(!jcode.equals("-"))
		{
		sql="select * from t_startedjourney where TripId='"+jcode+"' and (TO_DAYS(CURDATE())-TO_DAYS(StartDate)) < 10";
		ResultSet rs4=st.executeQuery(sql);
		if(rs4.next())
		{
			java.util.Date ShowDate4 = new SimpleDateFormat("yyyy-MM-dd").parse(rs4.getString("StartDate"));
			Format formatter4 = new SimpleDateFormat("dd-MMM-yyyy");
			String showdate4 = formatter4.format(ShowDate4);
			startdate=showdate4;
			origin=rs4.getString("StartPlace");
			destination=rs4.getString("EndPlace");
		}
		
		else
		{
			startdate="-";
			origin="-";
			destination="-";
		}
		}
%>
	<td class="bodyText"><div align="left"><%=startdate%></div></td>
	<td class="bodyText"><div align="left"><%=origin%></div></td>
	<td class="bodyText"><div align="left"><%=destination%></div></td>
	
	
	<td class="bodyText"><div align="right"><%=rst5.getString("OSCount")%></div></td>
	<td class="bodyText"><div align="right"><%=rst5.getString("RACount")%></div></td>
	<td class="bodyText"><div align="right"><%=rst5.getString("RDCount")%></div></td>
	<td class="bodyText"><div align="right"><%=rst5.getString("Distance")%></div></td>
	<td class="bodyText">
		<div align="right">
			<%
				String sssss=""+rst5.getDouble("Rating");
				
				if(sssss.length() > 4)
				{
					out.print(sssss.substring(0,4));
				}
				else
				{
					out.print(sssss);
				}
			%>
		</div>
	</td>
</tr>
<%
			}
		
		}catch(Exception e)
		{
			out.print("Exception "+e);
		}
		finally
		{
					conn.close();
					conn1.close();
				
				try
				{
					fleetview.closeConnection1();
				}
				catch(Exception e)
				{}
				
				try
				{fleetview.closeConnection();}
				catch(Exception e)
				{}
		}


%>
							</tbody>
									<tfoot>
										    <tr>
												<th>Driver Name</th>
												<th>Driver ID</th>
												<th>Transporter</th>
												<th>Start Date</th>
												<th>Origin</th>
												<th>Destination</th>
												<th>OS Count</th>
												<th>RA Count</th>
												<th>DC Count</th>
												<th>Distance</th>
												<th>Rating</th>
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
								title: 'Top 20 Drivers Distance 100-250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance 100-250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance 100-250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance 100-250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance 100-250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
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

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

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


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


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

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example2').DataTable({
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
								title: 'Bottom 20 Drivers Distance 100-250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance 100-250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance 100-250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance 100-250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance 100-250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
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

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

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


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


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

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example3').DataTable({
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
								title: 'Top 20 Drivers Distance > 250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance > 250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance > 250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance > 250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Top 20 Drivers Distance > 250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
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

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

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


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


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

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example4').DataTable({
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
								title: 'Bottom 20 Drivers Distance >250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance >250 km.',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance >250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance >250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Bottom 20 Drivers Distance >250 km',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
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

             <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

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


         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%> 


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



