<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
    
    <%@page 
	import="com.transworld.fleetview.framework.OverSpeedDetailsData"
	import="com.transworld.fleetview.framework.RapidAccelerationDetailsData"
	import="com.transworld.fleetview.framework.ContinuousDrivingDetailsData"
	import="com.transworld.fleetview.framework.GetVehicleDetails"
	import="com.transworld.fleetview.framework.Utilities"%>
	
	<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">


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
 
 <script language="javascript">

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
<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
<body>


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />

<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data2;
%>

<%!

String vid="", sql="",sql1="",sql2="", transporter="", vehregno="", thedate1="", thedate2="",usertype="";
String showdate="",dateformat="";
Connection con=null ;
int ab=0;

%>

<%
try
{
//	Class.forName(MM_dbConn_DRIVER);
	con = fleetview.ReturnConnection();
	Statement st4=con.createStatement();
	 Statement st5=con.createStatement();
	 Statement st12=con.createStatement();
	 Statement st41=con.createStatement();
	 Statement st42=con.createStatement();
	 Statement stn=con.createStatement();Statement stn1=con.createStatement();Statement stn2=con.createStatement();
	 Statement stn3=con.createStatement();Statement stn4=con.createStatement();Statement stn5=con.createStatement(); 
	  
	 ResultSet rsn=null;	 ResultSet rsn1=null;	 ResultSet rsn2=null;ResultSet rsn3=null;ResultSet rsn4=null;ResultSet rsn5=null;
	dateformat = session.getAttribute("dateformat").toString();
	usertype=session.getAttribute("usertypevalue").toString();
	System.out.println("Transporter name"+usertype);
	vid=request.getParameter("vehcode");
	System.out.println("vid:-----"+vid);
	java.util.Date NewDate= new java.util.Date();
	long dateMillis= NewDate.getTime();
	long dayInMillis = 1000 * 60 * 60 *24;
	dateMillis = dateMillis - dayInMillis;
	NewDate.setTime(dateMillis);
	thedate2=new SimpleDateFormat("yyyy-MM-dd").format(NewDate);
	dayInMillis = 14000 * 60 * 60 *24;
	dateMillis = dateMillis - dayInMillis;
	NewDate.setTime(dateMillis);
	thedate1=new SimpleDateFormat("yyyy-MM-dd").format(NewDate);
	List<GetVehicleDetails> currRecord=null;

	String datat=request.getParameter("data");
	String datat1=request.getParameter("data1");
	
	String datatt=datat+" 00:00:00";
	String datatt1=datat1+" 23:59:59";
	
	String interval="";
	if(datat.equals("24hrs") && datat1.equals("24hrs")){
		System.out.println("24 hours condition");
		interval="24";
	}
	else if(datat.equals("48hrs") && datat1.equals("48hrs")){
		System.out.println("48 hours condition");
		interval="48";
	}
	
	if(!(interval.equals(""))){
	
	String datetimesql="select DATE_FORMAT(NOW(),'%Y-%m-%d %T') as current,DATE_FORMAT(NOW() - INTERVAL "+interval+" Hour,'%Y-%m-%d %T') as fromdatetime";
	System.out.println("date time sql:"+datetimesql);
	ResultSet res_dttime = stn5.executeQuery(datetimesql);
	if(res_dttime.next()){
		
		datat = res_dttime.getString("fromdatetime").substring(0,11); 
		datat1 = session.getAttribute("Today").toString(); 
		
		datatt = res_dttime.getString("fromdatetime");
		datatt1 = res_dttime.getString("current");
	}
	}
	

	int numRecords11 = 0;
	try {
		//currRecord = vehicleDao.getVehicleDetails(vid);
		
//		numRecords11 = currRecord.size();
	} catch (Exception e) {
		e.printStackTrace();
	}
	//for (int counter = 0; counter < numRecords11; counter++)
	//{
		String sql="SELECT VehicleRegNumber,OwnerName " +
	            "FROM t_vehicledetails " +
	            "WHERE VehicleCode='"+vid+"'"; 
		rsn=stn.executeQuery(sql);
		while(rsn.next()){
		vehregno=rsn.getString("VehicleRegNumber");
		transporter=rsn.getString("OwnerName");} 
	//}
	try
	{
		String sql11="select * from t_vehicledetails where VehicleCode='"+vid+"'";
		ResultSet rst=st12.executeQuery(sql11);
		if(rst.next())
		{
			vehregno=rst.getString("VehicleRegNumber");		
			transporter=rst.getString("OwnerName");
			
		}	
	}
	catch(Exception e)
	{
		System.out.println(">>>>>>>>>>>>>>>>.Exception:"+e);
	}
	int discounter=0;
    if(request.getParameter("counterv")!=null)
    {
	  String str=request.getParameter("counterv");
	  //System.out.println("\n\n\nstr---->>>>>-->>"+str);
      discounter=Integer.parseInt(str);
      //System.out.println("\n\n\n---->>>>>-->>"+discounter);
    }
%>



<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
					<%if(!(interval.equals(""))){
					%><h3 class="content-header-title  mb-0">Exception Report For Vehicle <%=vehregno%> For The Period:<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datatt))%> to <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datatt1))%></h3>
					<%}else{ %>
						<h3 class="content-header-title  mb-0">Exception Report For Vehicle <%=vehregno%> For The Period:<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(datat))%> 00:00:00 to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(datat1))%> 23:59:59</h3>
					<%}%>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
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
		
		
<form id="tripwise" name="tripwise" action="" method="post">

<!-- Table 1 : Over Speed -->

						<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Over Speed</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr.No.</th>
											<th>From-Date-Time</th>
											<th>Speed</th>
											<th>Duration in Sec.</th>
											<th>Location - Click To View On Map.</th>
											<th>Zone</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</thead>
									
									<tbody>
									  <%System.out.println("vid:--"+vid);
	     System.out.println("usertype:--"+usertype);
	     System.out.println("vehregno:--"+vehregno);
	     System.out.println("datat:--"+datat);
	     System.out.println("datat1:--"+datat1);%>
		
		 <% try
		{
			String role=session.getAttribute("userrole").toString();
			
			System.out.println("role is :-"+role);
			if(role.equalsIgnoreCase("Castrolsuperadmin"))
			  {  %>
				<div align="left"><a href="#" onclick="javascript:window.open('OverrideReport.jsp?vid=<%=vid %>&Transporter=<%=usertype%>&tripid=-&vehRegNo=<%=vehregno%>&SD=<%=datat %>&ED=<%=datat1 %>')">
   Violation Override</a> </div>
				
			  <% }
			
	     }
		catch(Exception e)
		{
			System.out.println(">>>>>>>>>>>>>>>>.Exception:"+e);
		} %> 
		
		<tr>
		<%
		
			try{
				int os=1;
				String bgcolor="",zonecolor="",fromdate="",zoneval="";
			//String sqloscalc="SELECT os.Duration, os.FromDate, os.FromTime, os.ToDate, os.ToTime,veh.LatinDec, veh.LonginDec, veh.TheFieldSubject, os.Speed, os.Zone FROM db_gpsExceptions.t_veh"+vid+"_overspeed os LEFT OUTER JOIN (SELECT TheFieldDataDate, TheFieldDataTime, MAX(LonginDec) AS LonginDec, MAX(LatinDec) AS LatinDec,MAX(TheFieldSubject) AS TheFieldSubject FROM  db_gps.t_veh"+vid+"  WHERE  TheFiledTextFileName= 'OS' GROUP BY TheFieldDataDate, TheFieldDataTime) veh ON (veh.TheFieldDataDate = os.FromDate AND veh.TheFieldDataTime = os.FromTime) WHERE concat(FromDate,' ',FromTime) >='"+datat+" 00:00:00' and concat(FromDate,' ',FromTime) <='"+datat1+" 23:59:59' ORDER BY concat(os.FromDate,os.FromTime)";
			String sqloscalc="SELECT os.Duration, os.FromDate, os.FromTime, os.ToDate, os.ToTime,veh.LatinDec, veh.LonginDec, veh.TheFieldSubject, os.Speed, os.Zone FROM db_gpsExceptions.t_veh"+vid+"_overspeed os LEFT OUTER JOIN (SELECT TheFieldDataDate, TheFieldDataTime, MAX(LonginDec) AS LonginDec, MAX(LatinDec) AS LatinDec,MAX(TheFieldSubject) AS TheFieldSubject FROM  db_gps.t_veh"+vid+"  WHERE  TheFiledTextFileName= 'OS' and TheFieldDataDateTime >= '"+datatt+"' and TheFieldDataDateTime <= '"+datatt1+"' GROUP BY TheFieldDataDateTime) veh ON (veh.TheFieldDataDate = os.FromDate AND veh.TheFieldDataTime = os.FromTime) WHERE concat(os.FromDate,' ',os.FromTime) >='"+datatt+"' and concat(os.FromDate,' ',os.FromTime) <='"+datatt1+"' ORDER BY concat(os.FromDate,os.FromTime)";
			System.out.println("Join OS query is"+sqloscalc);
			ResultSet rsoscalc=st4.executeQuery(sqloscalc);
			while(rsoscalc.next())
			{
				fromdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsoscalc.getString("FromDate")));
				
				zonecolor=rsoscalc.getString("Zone");
				if(zonecolor.equalsIgnoreCase("Red") || zonecolor=="Red")
				{
					bgcolor="background-color:#FC545F";
					zoneval="R";
				}
				else if(zonecolor.equalsIgnoreCase("Green") || zonecolor=="Green")
				{
					bgcolor="background-color:#B3FAB3";
					zoneval="G";

				}
				else if(zonecolor.equalsIgnoreCase("Yellow") || zonecolor=="Yellow")
				{
					bgcolor="background-color:#FDFD82";
					zoneval="Y";

				}
				else{
					bgcolor="background-color:#FFFFFF";
					zoneval="0";

					
				}
					 %>
					 
					 
					 <td style="text-align:right;<%=bgcolor%>"><%=os%></td>
						<td style="text-align:right;<%=bgcolor%>"><%=fromdate%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsoscalc.getString("FromTime"))) %></td>
						<td style="text-align:right;<%=bgcolor%>"><%=rsoscalc.getString("Speed")%></td>
						<td style="text-align:right;<%=bgcolor%>"><%=rsoscalc.getString("Duration")%></td>
						<td style="text-align:left;<%=bgcolor%>">
						<%
						
						if(null!= rsoscalc.getString("TheFieldSubject") && !"null".equalsIgnoreCase(rsoscalc.getString("TheFieldSubject"))) 
						{
						
						%>
						<a href="javascript: flase;"
			onClick="window.open ('shownewmap.jsp?lat=<%=rsoscalc.getString("LatinDec")%>&long=<%=rsoscalc.getString("LonginDec")%>&discription=<%=rsoscalc.getString("TheFieldSubject")%>', 'win1', 'width=600, height=550, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=os%>,false);">
		
					<%=rsoscalc.getString("TheFieldSubject")%></a>
					
					<%}else{ %>
						<%="NA" %>
						<%} %>
						</td>
						<td style="text-align:left;<%=bgcolor%>"><%=zoneval%></td>
						
						<%
			String sqlostodate="select DATE_ADD('"+rsoscalc.getString("FromDate")+" "+rsoscalc.getString("FromTime")+"', INTERVAL '"+rsoscalc.getString("Duration")+"' second) datetim";
			//System.out.println("Join query is2"+sqlostodate);
			ResultSet rsostodate=st42.executeQuery(sqlostodate);
			//System.out.println("After Result is"+sqloscount);
			if(rsostodate.next()){
			String sqloscount="select count(*) count,category from db_gps.t_jpgsnap where category='Cabin' and vehid="+vid+" and snapdatetime>='"+rsoscalc.getString("FromDate")+" "+rsoscalc.getString("FromTime")+"' and snapdatetime<=DATE_ADD('"+rsoscalc.getString("FromDate")+" "+rsoscalc.getString("FromTime")+"', INTERVAL '"+rsoscalc.getString("Duration")+"' second)  and type='Exception' group by category";
			System.out.println("OS Count query is1:-"+sqloscount);
			ResultSet rsoscount=st41.executeQuery(sqloscount);
			//out.println("After Result is"+sqloscount);
			if(rsoscount.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;<%=bgcolor%>"><a href="CameraImageReport.jsp?data=<%=rsoscalc.getString("FromDate") %> <%=rsoscalc.getString("FromTime") %>&data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount.getString("category")%>&type=Exception" target="_blank"><%=rsoscount.getString("count")%></a></td>
				<%
			}else{%>
			<td style="text-align:right;<%=bgcolor%>">0</td>
			<%}
			String sqloscount1="select count(*) count,category from db_gps.t_jpgsnap where category='Road' and vehid="+vid+" and snapdatetime>='"+rsoscalc.getString("FromDate")+" "+rsoscalc.getString("FromTime")+"' and snapdatetime<=DATE_ADD('"+rsoscalc.getString("FromDate")+" "+rsoscalc.getString("FromTime")+"', INTERVAL '"+rsoscalc.getString("Duration")+"' second) and type='Exception' group by category";
			System.out.println("OS Count query is 2:-"+sqloscount1);
			ResultSet rsoscount1=st41.executeQuery(sqloscount1);
			//out.println("After Result is"+sqloscount);
			if(rsoscount1.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;<%=bgcolor%>"><a href="CameraImageReport.jsp?data=<%=rsoscalc.getString("FromDate") %> <%=rsoscalc.getString("FromTime") %>&data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount1.getString("category")%>&type=Exception" target="_blank"><%=rsoscount1.getString("count")%></a></td>
				<%
			}else{%>
			<td style="text-align:right;<%=bgcolor%>">0</td>
			<%}
			}
			
			%>
			</tr>
			
			<%
			os++;
			}}catch(Exception e)
			{
				
				System.out.println("Hereeeeeee");
				e.printStackTrace();
				
			}
			
			%>
																		
									</tbody>
									
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>From-Date-Time</th>
											<th>Speed</th>
											<th>Duration in Sec.</th>
											<th>Location - Click To View On Map.</th>
											<th>Zone</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
<!-- Table 2 : Rapid Acceleration -->							

			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Rapid Acceleration</h3>
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
											<th> Sr. </th>
											<th>Date-Time</th>
											<th>From Speed</th>
											<th>To Speed</th>
											<th>Location - Click To View On Map.</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</thead>
									
									<tbody>
									<%
					System.out.println("Datat"+datat);System.out.println("Datat"+datat1);
						String sql1="SELECT "+
							    " ra.Thedate, ra.TheTime, ra.FromSpeed, ra.ToSpeed , " +
 							    "           veh.TheFieldSubject ,veh.LatinDec, veh.LonginDec, veh.ZoneColor " +
							    " FROM "+
							    "(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
							    "          FROM db_gpsExceptions.t_veh"+vid+"_ra" +
							    "             WHERE"+
							    "          concat(TheDate,' ',TheTime)  >= '"+datatt+"'" +
							    "             AND" +
							    "          concat(TheDate,' ',TheTime) <= '"+datatt1+"') ra"+
							    " LEFT OUTER JOIN " +
							    "   (SELECT LatinDec, LonginDec, TheFieldSubject,TheFieldDataDate,TheFieldDataTime,ZoneDesc AS ZoneColor,TheFieldDataDateTime " +
							    " FROM db_gps.t_veh"+vid+"" +
							    "    WHERE" +
							    "       TheFieldDataDateTime >= '"+datatt+"' " +
							    "    AND" +
							    "         TheFieldDataDateTime <= '"+datatt1+"')veh "+
							    " ON(veh.TheFieldDataDate = ra.TheDate AND veh.TheFieldDataTime = ra.TheTime) " +
							    " GROUP BY " +
							    "    CONCAT( ra.Thedate ,' ', ra.TheTime )" +
							    "ORDER BY CONCAT( ra.Thedate ,' ', ra.TheTime ) ";
						int countern=1;
					    rsn1=stn1.executeQuery(sql1);
					    System.out.println("Query For RA 1:-"+sql1);
				 		while(rsn1.next())
						{
							
				 			System.out.println("RA From Spedd"+rsn1.getString("FromSpeed"));
				 			
				 			
				 			
				 			//final RapidAccelerationDetailsData currentRecord1 = data.get(counter);
							%>
							
							<tr>
				<td align="right"><%=countern%></td>
				<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsn1.getString("TheDate")))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse( rsn1.getString("TheTime")))	%></div></td>
				<td>
				<div align="right"><%=rsn1.getString("FromSpeed")%></div>
				</td>
				<td>
				<div align="right"><%=rsn1.getString("ToSpeed")%></div>
				</td>
				<td>
				<div align="left">
				<%
	if (null != rsn1.getString("TheFieldSubject")
					&& !"null".equalsIgnoreCase(rsn1.getString("TheFieldSubject"))
					&& null != rsn1.getString("LatinDec")) {
								String lat1=rsn1.getString("LatinDec");
								String lon1=rsn1.getString("LonginDec");
								String disc=rsn1.getString("TheFieldSubject");
%>							 

								<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
 	} else if (null != rsn1.getString("TheFieldSubject")
 					&& !"null".equalsIgnoreCase(rsn1.getString("TheFieldSubject"))) {
 				out.println(rsn1.getString("TheFieldSubject"));
 			}
 %>
				</div>
				</td>
				<%
			String sqlostodate="select DATE_ADD('"+rsn1.getString("Thedate")+" "+rsn1.getString("TheTime")+"', INTERVAL 2 second) datetim,DATE_SUB('"+rsn1.getString("Thedate")+" "+rsn1.getString("TheTime")+"', INTERVAL 2 second) datetim1";
			//out.println("Join query is"+sqloscount);
			ResultSet rsostodate=st42.executeQuery(sqlostodate);
			//out.println("After Result is"+sqloscount);
			if(rsostodate.next()){
			String sqloscount="select count(*) count,category from db_gps.t_jpgsnap where category='Cabin' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim1")+"' and snapdatetime<='"+rsostodate.getString("datetim")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount=st41.executeQuery(sqloscount);
			//out.println("After Result is"+sqloscount);
			if(rsoscount.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim1") %> &data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount.getString("category")%>&type=Exception" target="_blank"><%=rsoscount.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			String sqloscount1="select count(*) count,category from db_gps.t_jpgsnap where category='Road' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim1")+"' and snapdatetime<='"+rsostodate.getString("datetim")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount1=st41.executeQuery(sqloscount1);
			//out.println("After Result is"+sqloscount);
			if(rsoscount1.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim1") %> &data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount1.getString("category")%>&type=Exception" target="_blank"><%=rsoscount1.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			}
			
			%>
			</tr>
			<%
			 countern++;}
						%>						
						</tbody>
									
									<tfoot>
											<tr>
											<th> Sr. </th>
											<th>Date-Time</th>
											<th>From Speed</th>
											<th>To Speed</th>
											<th>Location - Click To View On Map.</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>

<!-- Table 3 : Rapid Deceleration -->							
							
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Rapid Deceleration</h3>
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
											<th> Sr. </th>
											<th>Date-Time</th>
											<th>From Speed</th>
											<th>To Speed</th>
											<th>Location - Click To View On Map.</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</thead>
									<tbody>
										<%
		
		List<RapidAccelerationDetailsData> data1 = null;
		int numRecords2 = 0;
		try {
	//		data1 = vehicleDao.getRapidAccelerationDetailsData(vid,datat+" 00:00:00", datat1+" 23:59:59", "RapidDecceleration");
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql2="SELECT "+
			    " rd.Thedate, rd.TheTime, rd.FromSpeed, rd.ToSpeed , " +
			    "           veh.TheFieldSubject , veh.LatinDec, veh.LonginDec, veh.ZoneColor " +
			    " FROM "+
			    "(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
			    "          FROM db_gpsExceptions.t_veh"+vid+"_rd " +
			    "             WHERE"+
			    "          concat(TheDate,' ',TheTime)  >= '"+datatt+"'" +
			    "             AND" +
			    "          concat(TheDate,' ',TheTime) <= '"+datatt1+"') rd "+
			    " LEFT OUTER JOIN " +
			    "   (SELECT LatinDec, LonginDec, TheFieldSubject, TheFieldDataDate, TheFieldDataTime, ZoneDesc AS ZoneColor,TheFieldDataDateTime " +
			    " FROM db_gps.t_veh"+vid+"" +
			    "    WHERE " +
			    "       TheFieldDataDateTime >= '"+datatt+"' " +
			    "    AND " +
			    "         TheFieldDataDateTime <= '"+datatt1+"')veh "+
			    " ON(veh.TheFieldDataDate = rd.TheDate AND veh.TheFieldDataTime = rd.TheTime) " +
			    " GROUP BY " +
			    "    CONCAT( rd.Thedate,' ',rd.TheTime )" +
			    "ORDER BY CONCAT( rd.Thedate,' ',rd.TheTime )";
		int countern2=1;
rsn2=stn2.executeQuery(sql2);

System.out.println("RD  query is1:-"+sql2);
while(rsn2.next())
		{
			//final RapidAccelerationDetailsData currentRecord2 = data1.get(counter);
			
			
			System.out.println("From Speed:-"+rsn2.getString("FromSpeed"));
			%><tr>
				<td align="right"><%=countern2 %></td>
				<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsn2.getString("Thedate")))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn2.getString("TheTime")))%></div></td>
				<td>
				<div align="right"><%=rsn2.getString("FromSpeed")%></div>
				</td>
				<td>
				<div align="right"><%=rsn2.getString("ToSpeed")%></div>
				</td>
				<td>
				<div align="left">
				<%
if (null != rsn2.getString("TheFieldSubject")
	&& !"null".equalsIgnoreCase(rsn2.getString("TheFieldSubject"))
	&& null != rsn2.getString("LatinDec")) {
								String lat1=rsn2.getString("LatinDec");
								String lon1=rsn2.getString("LonginDec");
								String disc=rsn2.getString("TheFieldSubject");
%>							 

								<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
} else if (null != rsn2.getString("TheFieldSubject")
		&& !"null".equalsIgnoreCase(rsn2.getString("TheFieldSubject"))) {
	out.println(rsn2.getString("TheFieldSubject"));
}
%>
				</div>
				</td>
				<%
			String sqlostodate="select DATE_ADD('"+rsn2.getString("Thedate")+" "+rsn2.getString("TheTime")+"', INTERVAL 2 second) datetim,DATE_SUB('"+rsn2.getString("Thedate")+" "+rsn2.getString("TheTime")+"', INTERVAL 2 second) datetim1";
			//out.println("Join query is"+sqloscount);
			ResultSet rsostodate=st42.executeQuery(sqlostodate);
			//out.println("After Result is"+sqloscount);
			if(rsostodate.next()){
			String sqloscount="select count(*) count,category from db_gps.t_jpgsnap where category='Cabin' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim1")+"' and snapdatetime<='"+rsostodate.getString("datetim")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount=st41.executeQuery(sqloscount);
			//out.println("After Result is"+sqloscount);
			if(rsoscount.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim1") %> &data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount.getString("category")%>&type=Exception" target="_blank"><%=rsoscount.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			String sqloscount1="select count(*) count,category from db_gps.t_jpgsnap where category='Road' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim1")+"' and snapdatetime<='"+rsostodate.getString("datetim")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount1=st41.executeQuery(sqloscount1);
			//out.println("After Result is"+sqloscount);
			if(rsoscount1.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim1") %> &data1=<%=rsostodate.getString("datetim") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount1.getString("category")%>&type=Exception" target="_blank"><%=rsoscount1.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			}
			
			%>
			</tr>
			<%
			countern2++;}
						%>
									</tbody>
									<tfoot>
										<tr>
											<th> Sr. </th>
											<th>Date-Time</th>
											<th>From Speed</th>
											<th>To Speed</th>
											<th>Location - Click To View On Map.</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
							
					
<!-- Table 4 : Stops-->

<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Stops</h3>
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
											<th> Sr.</th>
											<th>Start Date-Time</th>
											<th>End Date-Time</th>
											<th>Duration</th>
											<th>Location - Click To View On Map.</th>
										</tr>
									</thead>
									
									<tbody>
									<%				
		
		
		try {
			//data3 = vehicleDao.getContinuousDrivingDetailsData(
//					vid, datat+" 00:00:00", datat1+" 23:59:59", "Stops");
						
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql3="SELECT " +
				" 	st.FromDate, st.FromTime, veh.TheFieldSubject, veh.LatinDec,veh.LonginDec ,st.ToDate ,st.ToTime , " +
				"	0 , 0 , 0 , 0, st.Duration, veh.ZoneColor, st.stopReportLocation " +
				"	FROM ( " +
				"	SELECT " +
				"	 	FromDate, FromTime, ToDate, ToTime, Duration,Location as stopReportLocation " +
				"	 FROM " +
				" 		db_gpsExceptions.t_veh"+vid+"_stsp " +
				"	WHERE " +
				"		CONCAT( Fromdate,' ',FromTime ) >= '"+datatt+"'" +
				"	AND CONCAT( Fromdate,' ',FromTime ) <= '"+datatt1+"'" +
				"	 )st " +
				"	LEFT OUTER JOIN ( " +
				"	SELECT " +
				"			TheFieldSubject,  LatinDec, LonginDec, TheFieldDataDate,  TheFieldDataTime,ZoneDesc AS ZoneColor,TheFieldDataDateTime " +
				"	FROM " +
				"		db_gps.t_veh"+vid+" " +
				"	WHERE " +
				"		 TheFieldDataDateTime >= '"+datatt+"' " +
				"	AND  TheFieldDataDateTime <= '"+datatt1+"' " +
				"	)veh " +
				"	ON ( veh.TheFieldDataDate = st.Fromdate " +
				"	AND veh.TheFieldDataTime = st.FromTime ) " +
				"	GROUP BY " +
				"		CONCAT( Fromdate,' ',FromTime )" +
				"ORDER BY CONCAT( Fromdate,' ',FromTime )";
int n3=1;
System.out.println("Query For Stop:-"+sql3);
rsn3=stn3.executeQuery(sql3);
		while(rsn3.next())
		{
		
		%>
		<tr>
				<td align="right"><%=n3 %></td>
				<td>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rsn3.getString("FromDate")))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn3.getString("FromTime")))%></div>
				</td>
				<td>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rsn3.getString("ToDate")))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn3.getString("ToTime")))%></div>
				</td>
				<td>
				<div align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn3.getString("Duration")))%></div>
				</td>
				<td>
				<div align="left">
				<%
					if (null != rsn3.getString("TheFieldSubject")
									&& !"null".equalsIgnoreCase(rsn3.getString("TheFieldSubject"))
									&& null != rsn3.getString("LatinDec")) {
						String lat1= rsn3.getString("LatinDec");
						String lon1=rsn3.getString("LonginDec");
						String disc=rsn3.getString("TheFieldSubject");
%>							 

						<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
					} else if (null != rsn3.getString("TheFieldSubject")
									&& !"null".equalsIgnoreCase(rsn3.getString("TheFieldSubject"))) {
								out.println(rsn3.getString("TheFieldSubject"));
							}
				%>
				</div>
				</td>
			</tr>
			<% n3++;		
		}
		%>
									</tbody>
									
									<tfoot>
										<tr>
											<th> Sr.</th>
											<th>Start Date-Time</th>
											<th>End Date-Time</th>
											<th>Duration</th>
											<th>Location - Click To View On Map.</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
<!-- Table 5 :  Night Driving-->

			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Night Driving</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example5" class="table table-bordered">
							<thead>
										<tr>
											<th> Sr. </th>
											<th>Start Date-Time</th>
											<th>Start Location - Click To View On Map.</th>
											<th>End Date-Time</th>
											<th>End Location - Click To View On Map.</th>
											<th>Distance</th>
											<th>Duration</th>
											<th>Trip ID</th>
											<th>Reason</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</thead>
									
									<tbody>
									<%
			int n4=1;	   
			try {
				//data4 = vehicleDao.getContinuousDrivingDetailsData(
						//vid, datat+" 00:00:00", datat1+" 23:59:59", "NightDriving");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			String sql4="SELECT " +
					"  cd.fromdate,cd.fromtime,b.thefieldsubject as stl,b.LatinDec as s1,b.LonginDec as s2, " +
					"    cd.todate,cd.totime,c.thefieldsubject as stpl,c.LatinDec d1,c.LonginDec d2,cd.distance,cd.duration,c.ZoneColor,0 " +
					" FROM " +
					"	(SELECT fromdate,fromtime,todate,totime,distance,duration " +
					"	 FROM " +
					"	  db_gpsExceptions.t_veh"+vid+"_nd" +
					"    WHERE " +
					"	 	 CONCAT( Fromdate,' ',FromTime ) >='"+datatt+"' " +
					"	 AND CONCAT( Fromdate,' ',FromTime ) <='"+datatt1+"' " +
					"		)cd " +
					"	LEFT OUTER JOIN ( " +
					"	  SELECT " +
					"		LatinDec, LonginDec, TheFieldSubject, TheFieldDataDate, TheFieldDataTime,TheFieldDataDateTime " +
					"	  FROM " +
					"		db_gps.t_veh"+vid+" " +
					"	  WHERE " +
					"		 TheFieldDataDate >= '"+datatt+"' " +
					"	  AND " +
					"		 TheFieldDataDate <= '"+datatt1+"' " +
					"		)b " +
					"	   ON ( b.TheFieldDataDate = cd.fromdate " +
					"	   AND " +
					" 		    b.TheFieldDataTime = cd.fromtime " +
					"		   ) " +
					"	LEFT OUTER JOIN(" +
					"	  SELECT " +
					"		LatinDec, LonginDec, TheFieldSubject, TheFieldDataDate, TheFieldDataTime, ZoneDesc AS ZoneColor,TheFieldDataDateTime " +
					"		FROM " +
					"		 db_gps.t_veh"+vid+" " +
					"		WHERE " +
					"		 TheFieldDataDate >= '"+datatt+"' " +
					"		AND " +
					"		 TheFieldDataDate <= '"+datatt1+"' " +
					"		)c " +
					"		ON ( c.TheFieldDataDate = cd.todate " +
					"					AND c.TheFieldDataTime = cd.totime )";

System.out.println("Night Driving Query is:"+sql4);
rsn4=stn4.executeQuery(sql4);
while(rsn4.next())
			{
			


String sd=rsn4.getString("fromdate");
String st=rsn4.getString("fromtime");


String ed=rsn4.getString("todate");
String et=rsn4.getString("totime");
%>					
<tr>
				<td align="right"><%=n4%></td>
				<td>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(sd)) %> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(st))%></div>
				</td>
				<td>
				<div align="left">
				<%
					if (null != rsn4.getString("stl")
									&& !"null".equalsIgnoreCase(rsn4.getString("stl"))
									&& null != rsn4.getString("s1")) {
						String lat1=rsn4.getString("s1");
						String lon1=rsn4.getString("s2");
						String disc=rsn4.getString("stl");
%>							 

						<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
					} else if (null != rsn4.getString("stl")
									&& !"null".equalsIgnoreCase(rsn4.getString("stl"))) {
								out.println(rsn4.getString("stl"));
							}
				%>
				</div>
				</td>
				<td>
				<div align="center"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rsn4.getString("todate"))) %> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn4.getString("totime")))%></div>
				</td>
				<td>
				<div align="left">
				<%
					if (null != rsn4.getString("stpl")
									&& !"null".equalsIgnoreCase(rsn4.getString("stpl"))
									&& null != rsn4.getString("d1")) {
						String lat1=rsn4.getString("d1");
						String lon1=rsn4.getString("d2");
						String disc=rsn4.getString("stpl");
%>							 

						<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
					} else if (null != rsn4.getString("stpl")
									&& !"null".equalsIgnoreCase(rsn4.getString("stpl"))) {
								out.println(rsn4.getString("stpl"));
							}
				%>
				</div>
				</td>
				<td>
				<div align="right"><%=rsn4.getString("distance")%></div>
				</td>
				<td>
				<div align="right"><%=rsn4.getString("duration")%></div>
				</td>
			
			<%
				String TripID="";
				String tripid="select JCode from db_gpsExceptions.t_veh"+vid+"_nd where concat(FromDate,' ',FromTime) between '"+sd+" "+st+"' and  '"+ed+" "+et+"'";
				ResultSet rs=st4.executeQuery(tripid);
				if(rs.next())
				{
					TripID=rs.getString("JCode");
					System.out.println("------------"+TripID);
				}
				
				%>
				
				<td>
				<div align="left"><%=TripID%></div> 
			   </td>
			
			
			<td>
			<%
			String reason="";
			    try{
			   String sqlreason="select reason from db_gpsExceptions.t_ndpostintimation where VehRegNo='"+vehregno+"' and NdStartDateTime='"+sd+" "+st+"' and NdEndDateTime='"+ed+" "+et+"'";
			   ResultSet rsreason=st5.executeQuery(sqlreason);
			   if(rsreason.next())
			   {
				   reason=rsreason.getString("reason");
				   
			   }
			    }catch(Exception e)
			    {
			    	System.out.println(">>>>>>>>e:"+e);
			    }
			
			if(reason.equals("-") || reason.equals(""))
			{
				%>
			<%="<a href=\"veh_report_ndfeedback.jsp?vehregno="+vehregno+"&vid="+vid+"&tripid="+TripID+"&startdatetime="+sd+" "+st+"&enddatetime="+ed+" "+et+"\"onclick=\"popWin=window.open('veh_report_ndfeedback.jsp?vehregno="+vehregno+"&vid="+vid+"&tripid="+TripID+"&startdatetime="+sd+" "+st+"&enddatetime="+ed+" "+et+"','ND Reason','width=400,height=350');popWin.focus();return false\">Add Reason</a>"%>
			<%
			}
			else
			{
				if(reason.length()>10)
				{
					%>
					<%="<a href=\"veh_showreason.jsp?reason="+reason+"\"onclick=\"popWin=window.open('veh_showreason.jsp?reason="+reason+"','ND Reason','width=400,height=300');popWin.focus();return false\">Show Reason</a>"%>
				<%}
				else
				{
				%>
				<%=reason %>
			<%}} %>  
			</td>
				<%
			String sqlostodate="select concat('"+sd+"',' ','"+st+"') datetim,concat('"+ed+"',' ','"+et+"') datetim1";
			//out.println("Join query is"+sqloscount);
			ResultSet rsostodate=st42.executeQuery(sqlostodate);
			//out.println("After Result is"+sqloscount);
			if(rsostodate.next()){
			String sqloscount="select count(*) count,category from db_gps.t_jpgsnap where category='Cabin' and vehid="+vid+" and snapdatetime>='"+sd+" "+st+"' and snapdatetime<='"+ed+" "+et+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount=st41.executeQuery(sqloscount);
			//out.println("After Result is"+sqloscount);
			if(rsoscount.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim") %> &data1=<%=rsostodate.getString("datetim1") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount.getString("category")%>&type=Exception" target="_blank"><%=rsoscount.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			String sqloscount1="select count(*) count,category from db_gps.t_jpgsnap where category='Road' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim")+"' and snapdatetime<='"+rsostodate.getString("datetim1")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount1=st41.executeQuery(sqloscount1);
			//out.println("After Result is"+sqloscount);
			if(rsoscount1.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim") %> &data1=<%=rsostodate.getString("datetim1") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount1.getString("category")%>&type=Exception" target="_blank"><%=rsoscount1.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			}
			
			%>	
			</tr>
			<%
			n4++; }
		    %>
								</tbody>
									
									<tfoot>
										<tr>
											<th> Sr. </th>
											<th>Start Date-Time</th>
											<th>Start Location - Click To View On Map.</th>
											<th>End Date-Time</th>
											<th>End Location - Click To View On Map.</th>
											<th>Distance</th>
											<th>Duration</th>
											<th>Trip ID</th>
											<th>Reason</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
<!-- Table 6 :Continuous Driving -->


			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Continuous Driving</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example6" class="table table-bordered">
							<thead>
										<tr>
											<th> Sr. </th>
											<th>Start Date-Time</th>
											<th>Start Location - Click To View On Map.</th>
											<th>End Date-Time</th>
											<th>End Location - Click To View On Map.</th>
											<th>Distance</th>
											<th>Duration</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</thead>
									
									<tbody>
									<%
		    
			int n5 = 1;
			try {
				//data5 = vehicleDao.getContinuousDrivingDetailsData(
					//	vid, datat+" 00:00:00", datat1+" 23:59:59", "ContinuousDriving");
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			String sql5="SELECT " +
					"  cd.fromdate,cd.fromtime,b.thefieldsubject as stl,b.LatinDec as s1,b.LonginDec as s2, " +
					"    cd.todate,cd.totime,c.thefieldsubject as stpl,c.LatinDec d1,c.LonginDec d2,cd.distance,cd.duration,c.ZoneColor,0 " +
					" FROM " +
					"	(SELECT fromdate,fromtime,todate,totime,distance,duration " +
					"	 FROM " +
					"	  db_gpsExceptions.t_veh"+vid+"_cr" +
					"    WHERE " +
					"	 	 CONCAT( Fromdate,' ',FromTime ) >='"+datatt+"' " +
					"	 AND CONCAT( Fromdate,' ',FromTime ) <='"+datatt1+"' " +
					"		)cd " +
					"	LEFT OUTER JOIN ( " +
					"	  SELECT " +
					"		LatinDec, LonginDec, TheFieldSubject, TheFieldDataDate, TheFieldDataTime,TheFieldDataDateTime " +
					"	  FROM " +
					"		db_gps.t_veh"+vid+" " +
					"	  WHERE " +
					"		 TheFieldDataDate >= '"+datatt+"' " +
					"	  AND " +
					"		 TheFieldDataDate <= '"+datatt1+"' " +
					"		)b " +
					"	   ON ( b.TheFieldDataDate = cd.fromdate " +
					"	   AND " +
					" 		    b.TheFieldDataTime = cd.fromtime " +
					"		   ) " +
					"	LEFT OUTER JOIN(" +
					"	  SELECT " +
					"		LatinDec, LonginDec, TheFieldSubject, TheFieldDataDate, TheFieldDataTime, ZoneDesc AS ZoneColor,TheFieldDataDateTime " +
					"		FROM " +
					"		 db_gps.t_veh"+vid+" " +
					"		WHERE " +
					"		 TheFieldDataDate >= '"+datatt+"' " +
					"		AND " +
					"		 TheFieldDataDate <= '"+datatt1+"' " +
					"		)c " +
					"		ON ( c.TheFieldDataDate = cd.todate " +
					"					AND c.TheFieldDataTime = cd.totime )";
			System.out.println("CD:"+sql5);
			rsn5=st5.executeQuery(sql5);
			while(rsn5.next())
			{
				
%>
<tr>
				<td align="right"><%=n5 %></td>
				<td>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rsn5.getString("fromdate"))) %> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn5.getString("fromtime")))%></div>
				</td>
				<td>
				<div align="left">
				<%
					if (null != rsn5.getString("stl")
									&& !"null".equalsIgnoreCase(rsn5.getString("stl"))
									&& null != rsn5.getString("s1")) {
						String lat1=rsn5.getString("s1");
						String lon1=rsn5.getString("s2");
						String disc=rsn5.getString("stl");
%>							 

						<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
					} else if (null != rsn5.getString("stl")
									&& !"null".equalsIgnoreCase(rsn5.getString("stl"))) {
								out.println(rsn5.getString("stl"));
							}
				%>
				</div>
				</td>
				<td>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy")
											.format(new SimpleDateFormat(
													"yyyy-MM-dd")
													.parse(rsn5.getString("todate"))) %> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rsn5.getString("totime")))%></div>
				</td>
				<td>
				<div align="left">
				<%
					if (null != rsn5.getString("stpl")
									&& !"null".equalsIgnoreCase(rsn5.getString("stpl"))
									&& null != rsn5.getString("d1")) {
						String lat1=rsn5.getString("d1");
						String lon1=rsn5.getString("d2");
						String disc=rsn5.getString("stpl");
%>							 

						<%="<a href=\"shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"\"onclick=\"popWin=open('shownewmap.jsp?lat="+lat1+"&long="+lon1+"&discription="+disc+"','myWin','width=500, height=500'); popWin.focus(); return false\">"+disc+"</a>"%>  								 
<%
					} else if (null != rsn5.getString("stpl")
									&& !"null".equalsIgnoreCase(rsn5.getString("stpl"))) {
								out.println(rsn5.getString("stpl"));
							}
				%>
				</div>
				</td>
				<td>
				<div align="right"><%=rsn5.getString("distance")%></div>
				</td>
				<td>
				<div align="right"><%=rsn5.getString("duration")%></div>
				</td>
				<%
			String sqlostodate="select concat('"+rsn5.getString("fromdate")+"',' ','"+rsn5.getString("fromtime")+"') datetim,concat('"+rsn5.getString("todate")+"',' ','"+rsn5.getString("totime")+"') datetim1";
			//out.println("Join query is"+sqlostodate);
			ResultSet rsostodate=st42.executeQuery(sqlostodate);
			//out.println("After Result is"+sqlostodate);
			if(rsostodate.next()){
			String sqloscount="select count(*) count,category from db_gps.t_jpgsnap where category='Cabin' and vehid="+vid+" and snapdatetime>='"+rsn5.getString("fromdate")+" "+rsn5.getString("fromtime")+"' and snapdatetime<='"+rsn5.getString("todate")+" "+rsn5.getString("totime")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount=st41.executeQuery(sqloscount);
			//out.println("After Result is"+sqloscount);
			if(rsoscount.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim") %> &data1=<%=rsostodate.getString("datetim1") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount.getString("category")%>&type=Exception" target="_blank"><%=rsoscount.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			String sqloscount1="select count(*) count,category from db_gps.t_jpgsnap where category='Road' and vehid="+vid+" and snapdatetime>='"+rsostodate.getString("datetim")+"' and snapdatetime<='"+rsostodate.getString("datetim1")+"' and type='Exception' group by category";
			//out.println("Join query is"+sqloscount);
			ResultSet rsoscount1=st41.executeQuery(sqloscount1);
			//out.println("After Result is"+sqloscount1);
			if(rsoscount1.next())
			{//out.println("inside===> "+rsoscount.getString("count"));
			ab=0;
				%>
				<td style="text-align:right;"><a href="CameraImageReport.jsp?data=<%=rsostodate.getString("datetim") %> &data1=<%=rsostodate.getString("datetim1") %>&VehNo1=<%= vehregno%>&category=<%=rsoscount1.getString("category")%>&type=Exception" target="_blank"><%=rsoscount1.getString("count")%></a></td>
				<%
			}else{
				%>
				<td style="text-align:right;">0</td>
				<%
			}
			}
			
			%>
			</tr>
			<%
			n5++;}
		    %>
									</tbody>
									
									<tfoot>
										<tr>
											<th> Sr. </th>
											<th>Start Date-Time</th>
											<th>Start Location - Click To View On Map.</th>
											<th>End Date-Time</th>
											<th>End Location - Click To View On Map.</th>
											<th>Distance</th>
											<th>Duration</th>
											<th>Cabin Images</th>
											<th>Road Images</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
<!-- Table 7 :  Disconnection-->


		<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Disconnection</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example7" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr.</th>
										    <th>OFF Date-Time</th>
										    <th>From Location</th>
											<th>ON Date-Time</th>
											<th>To Location</th>
											<th>Distance</th>
											<th>Duration (hh:mm:ss)</th>
											<th>Trip ID</th>
										</tr>
									</thead>
									
									<tbody>
										<%
			int i=0;
			String fromDate1="",toDate1="";
			String fromLocation="",toLocation="",distance="",duration="",tripid="";
			double fromLatitude=0.00,toLatitude=0.00,fromLongitude=0.00,toLongitude=0.00;
            
			//String sql12="SELECT * FROM db_gps.t_disconnectionData WHERE vehicleCode= '"+vid+"' AND  OffTimeFrom>='"+datat+" 00:00:00' and OffTimeFrom<='"+datat1+" 23:59:59' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
		//	String sql12="Select * from db_gps.t_disconnectionData where vehicleCode='"+vehicleCode+"' AND  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeTo >='"+data1+" 00:00:00'";
			String sql12="SELECT TripId,OffTimeFrom,FromLocation,FromLatitude,FromLongitude,OffTimeTo,ToLocation,ToLatitude,ToLongitude,Distance,CONCAT('duration',CAST(duration AS CHAR)) as duration FROM db_gps.t_disconnectionData WHERE vehicleCode= '"+vid+"' AND  OffTimeFrom>='"+datatt+"' and OffTimeFrom<='"+datatt1+"' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
	        System.out.println("\n\n-->>sqlllllllll----....>>>>"+sql12);		
	        ResultSet rsSql=st12.executeQuery(sql12);
			
			while(rsSql.next())
			{
				
				System.out.println("\n\n\nvishal rst--->>>"+rsSql);
				//System.out.println("\n\n\nvishal rst--->>>"+rsSql.next());
				i++;
				fromDate1 = rsSql.getString("OffTimeFrom");
				fromLocation = rsSql.getString("FromLocation");
				fromLatitude = rsSql.getDouble("FromLatitude");
				fromLongitude = rsSql.getDouble("FromLongitude");
				toDate1 = rsSql.getString("OffTimeTo");
				toLocation = rsSql.getString("ToLocation");
				toLatitude = rsSql.getDouble("ToLatitude");
				toLongitude = rsSql.getDouble("ToLongitude");
				distance = rsSql.getString("Distance");
				duration = rsSql.getString("Duration");
				String duration1=duration.toString();
				if(discounter>0)
				{	
					String tripidv = request.getParameter("tripid");			
					tripid=tripidv;	
				}
				else
				{
				  tripid = rsSql.getString("TripId");
				}
				//int length=duration.length();
				String disconnectDuration="";
				
				duration1=duration.replace("duration", "");
				System.out.println("NEW duration---------------"+duration1);
				disconnectDuration=duration1;
				/* if(duration.charAt(length-2)==':') //if duration is 1:6 then display as 1:06
				{
					disconnectDuration=duration.replace(":",":0");
				}
				else
				{
					disconnectDuration=duration;
				} */
				
%>

<tr>
		<td style="text-align: right"><%=i%></td>
	<!--<td style="text-align: left"><%=transporter%></td>
		<td style="text-align: left"><%=vehregno%></td> -->
		<td style="text-align: right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fromDate1))%></td>
		<td style="text-align: left"><a href="javascript: flase;"
			onClick="window.open ('shownewmap.jsp?lat=<%=fromLatitude%>&long=<%=fromLongitude%>&discription=<%=fromLocation%>', 'win1', 'width=600, height=550, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=i%>,false);"><%=fromLocation%>
		</a></td>
		<td style="text-align: right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(toDate1))%></td>
		<td style="text-align: left"><a href="javascript: flase;"
			onclick="window.open ('shownewmap.jsp?lat=<%=toLatitude%>&long=<%=toLongitude%>&discription=<%=toLocation%>', 'win1', 'width=600, height=550, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=i%>,false);"><%=toLocation%>
		</a></td>
		<td style="text-align: right"><%=distance%></td>
		<td style="text-align: center"><%=disconnectDuration%></td>
		<td style="text-align: right"><%=tripid%></td>

	</tr>
<%		   }
			%>
									</tbody>
									
									<tfoot>
										<tr>
											<th>Sr.</th>
										    <th>OFF Date-Time</th>
										    <th>From Location</th>
											<th>ON Date-Time</th>
											<th>To Location</th>
											<th>Distance</th>
											<th>Duration (hh:mm:ss)</th>
											<th>Trip ID</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>
							
							
							
<!-- Table 8 : Distance Violations -->



		<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Distance Violations</h3>
					</div>
				</div>
			</div>
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example8" class="table table-bordered">
									<thead>
										<tr>
											<th>Sr.</th>
											<th>Date</th>
											<th>Distance</th>
										</tr>
									</thead>
									
									<tbody>
									<%
			int m=0;
			String TheDate="",Distance="";
			
			String TypeValue1=session.getAttribute("usertypevalue").toString();

			int defaultVal=0;
						int dailtdistancecount=0;
						String sqldefaultval1 ="select dailydistancelimit from db_gps.t_defaultvals where ownername='"+TypeValue1+"'";
						ResultSet rsdefaultval1=st5.executeQuery(sqldefaultval1);
						System.out.println("Default val sqldefaultval1========>"+sqldefaultval1);

						if(rsdefaultval1.next()){
							defaultVal=rsdefaultval1.getInt("dailydistancelimit");
						}
						else
						{
			String sqldefaultval ="select dailydistancelimit from db_gps.t_defaultvals where ownername='default'";
					ResultSet rsdefaultval=st5.executeQuery(sqldefaultval);
					if(rsdefaultval.next()){
						defaultVal=rsdefaultval.getInt("dailydistancelimit");
					}
						}
					System.out.println("Default val========>"+defaultVal);
			//String sql12="SELECT * FROM db_gps.t_disconnectionData WHERE vehicleCode= '"+vid+"' AND  OffTimeFrom>='"+datat+" 00:00:00' and OffTimeFrom<='"+datat1+" 23:59:59' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
		//	String sql12="Select * from db_gps.t_disconnectionData where vehicleCode='"+vehicleCode+"' AND  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeTo >='"+data1+" 00:00:00'";
			String sql122="select TheDate,Distance from db_gpsExceptions.t_vehall_ds where VehCode='"+vid+"' and TheDate>='"+datat+"' and TheDate <= '"+datat1+"' and Distance>'"+defaultVal+"' and Location <> 'No Data'";
	        System.out.println("\n\n-->>sqlllllllll----....>>>>"+sql122);		
	        ResultSet rsSql122=st5.executeQuery(sql122);
			while(rsSql122.next())
			{
				System.out.println("\n\n\nvishal rst--->>>"+rsSql122);
				//System.out.println("\n\n\nvishal rst--->>>"+rsSql.next());
				m++;
				TheDate = rsSql122.getString("TheDate");
				Distance = rsSql122.getString("Distance");
%>
<tr>
		<td style="text-align: right"><%=m%></td>
		<td style="text-align: right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate))%></td>
		<td style="text-align: right"><%=Distance%></td>

	</tr>
<%		   }
			%>
									</tbody>
									
									<tfoot>
										<tr>
											<th>Sr.</th>
											<th>Date</th>
											<th>Distance</th>
										</tr>
									</tfoot>
							</table>
							</div>
							</div>
							</div>
							</section>				
							
							
							
							
							</div>
	</form>
	<%
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
finally
{
	
	try
	{
		con.close();
	}catch(Exception e)
	{
	}
	
	try
	{
	fleetview.closeConnection();
	}catch(Exception e)
	{
	}
	
}

		
	%>
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



<!-- Script for Over Speed -->

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
								title: 'Over Speed',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Over Speed',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Over Speed',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Over Speed',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Over Speed',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
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

<!-- Script for Rapid Acceleration -->

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
								title: 'Rapid Acceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Rapid Acceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
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

<!-- Script for Rapid Deceleration -->

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
								title: 'Rapid Deceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Rapid Deceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Rapid Deceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Rapid Deceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Rapid Deceleration',
                                exportOptions: { columns: [0,1,2,3,4,5,6] }
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

<!-- Script for Stops -->

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
								title: 'Stops',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Stops',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Stops',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Stops',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Stops',
                                exportOptions: { columns: [0,1,2,3,4] }
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

<!-- Script for Night Driving -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example5').DataTable({
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
								title: 'Night Driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Night Driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Night Driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Night Driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8,9,10] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Report Head 3',
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

<!-- Script for Continious driving -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example6').DataTable({
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
								title: 'Continious driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Continious driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Continious driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Continious driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Continious driving',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7,8] }
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

<!-- Script for disconnection -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example7').DataTable({
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
								title: 'Disconnection',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Disconnection',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Disconnection',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Disconnection',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Disconnection',
                                exportOptions: { columns: [0,1,2,3,4,5,6,7] }
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

<!-- Script for Distance Violations -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example8').DataTable({
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
								title: 'Distance Violations',
                                exportOptions: { columns: [0,1,2] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Distance Violations',
                                exportOptions: { columns: [0,1,2] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Distance Violations',
                                exportOptions: { columns: [0,1,2] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Distance Violations',
                                exportOptions: { columns: [0,1,2] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Distance Violations',
                                exportOptions: { columns: [0,1,2] }
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