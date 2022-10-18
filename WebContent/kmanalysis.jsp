<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
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
 
</head>
<body>
<body>


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />

<%!
		Connection conn, con1;
		Statement st,st1,st2, st3, st4,st5;
		String sql, sql1, sql2,sql3;
		ResultSet rs2=null;
		String today,lastweek, lastmonth,startDate,startCode,startTime,endCode,TransTime,updatedTm,scheTmDt,updtetime="",DisDate;
		int km1,km2,km3,km4,km5,km6,km7,km8,km9, kmrun1, kmrun2, kmrundist, totKm,remKm,todaysdist;
		long diffDays,tTime;
		java.util.Date dt1 = null;
		//String tempUpDate;
	 %>
	 <%
	try{
		String dateformat="dd-MMM-yyy";
		dateformat=session.getAttribute("dateformat").toString();
		//System.out.println("======1========");
		today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		String currenttime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
		//out.println(today);
		//out.println("currenttime---->"+currenttime);
		Class.forName(MM_dbConn_DRIVER); 
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		st1=conn.createStatement();
		st2=conn.createStatement();
		st3=con1.createStatement();
		st4=con1.createStatement();
		st5=conn.createStatement();
	
		int noofdays=0;
		sql="select WEEKDAY('"+today+"')";
		ResultSet rstd11=st.executeQuery(sql);
		if(rstd11.next())
		{
			noofdays=rstd11.getInt(1);
		}
	
		sql="select SUBDATE('"+today+"', INTERVAL "+noofdays+" DAY)";
		ResultSet rstd12=st.executeQuery(sql);
		if(rstd12.next())
		{
			lastweek=rstd12.getString(1);
		}
	
		sql="select DATE_SUB(NOW(), INTERVAL (DAYOFWEEK(NOW())-2) DAY) as d1";
		//System.out.println("==lastweek===sql===> "+sql);
		ResultSet rstd1=st.executeQuery(sql);
		if(rstd1.next())
		{
			lastweek=new SimpleDateFormat("yyyy-MM-dd").format(rstd1.getDate("d1"));
			//System.out.println("==lastweek==> "+lastweek);
		} 
		
		sql="select DATE_SUB(NOW(), INTERVAL (DAY(NOW())-1) DAY) as d2";
		//System.out.println("==lastmonth===sql===> "+sql);
		ResultSet rstd2=st.executeQuery(sql);
		if(rstd2.next())
		{
			lastmonth=new SimpleDateFormat("yyyy-MM-dd").format(rstd2.getDate("d2"));
			//System.out.println("==lastmonth==> "+lastmonth);
		} 
		String 	username="";

		 username=(String)session.getAttribute("usertypevalue");


		 System.out.println("Customer NAme:"+username);

		 String selected=request.getParameter("status");

		 System.out.println("--------"+selected);
		  

	 %>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">KM Analysis Report for Open Trips</h3>
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
	<th> Sr </th>
	<th>Vehicle</B></th> 
	<th>TripID</th>
	<th>Driver</th>
	<th>Start Date-Time</th>
	<th>VehicleType</th>	
	<th> Transporter</th>
	<th> Start Place</th>
	<th>End Place</th>
	<th>Updated Date-Time</th>
	<th>Current Position</th>
	<th>FixedTime</th>
	<th>FixedKm</th>
  	<th>Kms run</th>
 	<th>Kms to run</th>  
	<th>Scheduled Date-Time To Arrival</th>										
	</tr>
									</thead>
									<tbody>
									<%

 String vehicletype1=request.getParameter("vehicle");
  	//String vehregisterno= 
  	String vehicletype="";    

    System.out.println("-------------------------------->"+vehicletype1);
    if(vehicletype1==null)
    {
    	vehicletype1="All";
    }
    %>
    
    <script>
    document.getElementById("vehicle").value='<%out.print(vehicletype1); %>';
    
    </script>
	    <% 
    /* String fromdate= request.getParameter("data");
    System.out.println("-------------------------------->"+fromdate);
    
    String todate= request.getParameter("data1");
    System.out.println("-------------------------------->"+todate);
     */
	
     if(vehicletype1.equals("All"))
	 {
    	 vehicletype1="%%";
	 }
     try{
 		DecimalFormat df2 = new DecimalFormat("0.00");
         
 		
 	    int cnt = 0;
 	   
 	 	/* String sql = "Select vehtype from db_gps.t_vehicledetails where  vehtype!='' and VehicleRegNumber='"+rs.getString("VehicleRegNumber")+"' and ownername='"+username+"' and status='-'  order by vehtype";
 	 	ResultSet rs = st.executeQuery(sql);

 		System.out.println("The sql is ==>"+sql);
 		while(rs.next()){
 		vehicletype = rs.getString("vehtype"); 
 			 
 		}
 */ 	 		}
 	     catch(Exception e11)
 	 			{
 	 				//System.out.println("---I am in exception--kmrundist-");
 	 				e11.printStackTrace();
 	 			}  
     %>
	<%
	sql="select * from t_startedjourney where Jstatus='Running' and Vehid in"+session.getAttribute("VehList").toString()+" order by StartDate desc";
	ResultSet rsttrips=st.executeQuery(sql);
	int j=1;
	while(rsttrips.next())
	{
		String curpos="",  lat="", lon="";
		kmrundist=0;
		String vehno=rsttrips.getString("VehRegNo");
		   vehicletype="";   
			String sql4 = "Select vehtype from db_gps.t_vehicledetails where  vehtype!='' and VehicleRegNumber='"+rsttrips.getString("VehRegNo")+"' and ownername='"+username+"' and status='-'  order by vehtype";
	 		
			ResultSet rs2 = st1.executeQuery(sql4);
	 		System.out.println("The sql is ==>"+sql4);
	 		if(rs2.next()){
	 		vehicletype = rs2.getString("vehtype");
	 		} 
		sql="select * from t_onlinedata where VehicleCode='"+rsttrips.getString("VehId")+"'";
		//out.print(sql);
		ResultSet rs1=st1.executeQuery(sql);
		
		try{
			if(rs1.next())
			{
				curpos=rs1.getString("Location");
				
				updtetime=new SimpleDateFormat(dateformat).format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TheDate")))+" "+new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rs1.getString("TheTime"))); //rs1.getString("TheTime");
				lat=rs1.getString("LatitudePosition");
				lon=rs1.getString("LongitudePosition");
			}
			// tempUpDate=updtetime;
			
		  }catch(Exception exc)
		  {
				//System.out.print("--i am in exception 5==");
				exc.printStackTrace();
	      }
		
		try{
				//sql="select Distance from t_veh"+rsttrips.getString("VehId")+" where TheFieldDataDate ='"+today+"'  and TheFiledTextFileName='SI' order by TheFieldDataTime asc limit 1";
				//out.println("\nsql ==6==="+sql);
				sql="select Distance from t_veh"+rsttrips.getString("VehId")+" where TheFieldDataDateTime >='"+rsttrips.getString("StartDate")+" "+rsttrips.getString("StartTime")+"' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
				ResultSet rstkmrun1=st1.executeQuery(sql);
				if(rstkmrun1.next())
				{
					kmrun1=rstkmrun1.getInt("Distance");
				}
		  }catch(Exception e)
			{
				//System.out.println("---I am in exception--rstkmrun1-");
				e.printStackTrace();
			}
		  //45044
		  try{
				sql="select Distance from t_veh"+rsttrips.getString("VehId")+" where TheFieldDataDateTime <='"+today+" "+currenttime+"' and TheFieldDataDateTime >= '"+rsttrips.getString("StartDate")+" "+rsttrips.getString("StartTime")+"'  and TheFiledTextFileName='SI' order by TheFieldDataDateTime desc limit 1";
				//out.print("sql ====7===="+sql);
				ResultSet rstkmrun2=st1.executeQuery(sql);
			if(rstkmrun2.next())
			{
				kmrun2=rstkmrun2.getInt("Distance");
				//out.println("kmrun2----->"+kmrun2);
			}
		}catch(Exception e1)
		{
			//System.out.println("---I am in exception--rstkmrun2-");
			e1.printStackTrace();
		}
		
	try{
		long myMilisec;
		tTime=0;
		//sql="select sum(Distance) as kmrundist from t_veh"+rsttrips.getString("VehId")+"_ds where TheDate>='"+rsttrips.getDate("StartDate")+"'and TheTime>='"+rsttrips.getTime("StartTime")+"' and startCode>='"+rsttrips.getString("StartCode")+"' and endCode>='"+rsttrips.getString("EndCode")+"' ";
		sql="select * from db_gps.t_startedjourney where StartDate='"+rsttrips.getDate("StartDate")+"'and StartTime='"+rsttrips.getTime("StartTime")+"' and StartCode='"+rsttrips.getString("StartCode")+"' and EndCode='"+rsttrips.getString("EndCode")+"' and Vehid="+rsttrips.getString("VehId")+"";
		///System.out.println(":::---SQL----:::"+sql);
		ResultSet rstTotKm=st3.executeQuery(sql);
		if(rstTotKm.next())
		{
			sql3="select * from db_gps.t_castrolroutes where StartPlace = '"+rsttrips.getString("StartPlace")+"' and EndPlace = '"+rsttrips.getString("EndPlace")+"' || EndPlace = '"+rsttrips.getString("StartPlace")+"' and StartPlace = '"+rsttrips.getString("EndPlace")+"' limit 1 ";
			
		//	System.out.println(":::---SQL2----:::"+sql3);
			ResultSet rst123=st4.executeQuery(sql3);
				if(rst123.next())
				{
					totKm=rst123.getInt("Km");
				    tTime=rst123.getInt("TTime");
				}
		}
		kmrundist=kmrun2-kmrun1;  //Finding tot run km by vehicle after trip started.
		remKm=totKm-kmrundist;  // Adding todays km also
		
		myMilisec=(tTime*60*60*1000);
		if(myMilisec!=0)
		{
		//System.out.println(":::::-myMilisec-::::"+myMilisec);
      	java.util.Date resultdate = new java.util.Date();
      	java.util.Date startDtTm=rsttrips.getDate("StartDate");
      	
		//System.out.println(":::::-startDtTmOriginal-::::"+startDtTm);
		long start=startDtTm.getTime();
		long totdate= start+myMilisec;
		resultdate.setTime(totdate);
        DisDate=new SimpleDateFormat(dateformat+" HH:mm").format(resultdate);
		//System.out.println(":::::-startDtTmAftAdd-::::"+DisDate);
		}
		else{
			DisDate="NA";
		}
	}catch(Exception e11)
	{
		//System.out.println("---I am in exception--kmrundist-");
		e11.printStackTrace();
		
	}

      
	%>

	<tr>
	<td style="text-align: right"><%=j%></td>
	<td id="vehcol<%=j%>" style="text-align: left"><div align="left">  <%=rsttrips.getString("VehRegNo")%> </div></td>
	<td id="tripcol<%=j%>" style="text-align: right"><font face="Arial" size="2"><%=rsttrips.getString("TripId")%></font></td>
	<td id="drivcol<%=j%>"><div align="left"><%=rsttrips.getString("DriverName")+"("+rsttrips.getString("DriverCode")+")"%></div></td>
	<%//String sttime=
	String sttime=new SimpleDateFormat("HH:mm").format(rsttrips.getTime("StartTime"));
	String stdate=new SimpleDateFormat(dateformat).format(rsttrips.getDate("StartDate"))+" "+sttime;
	%>
	<td id="stdatecol<%=j%>" style="text-align: right;"><%=stdate %>
	<td><div align="left"><%=vehicletype%></div></td>
				
	</td>
	<td><div align="left"><%=rsttrips.getString("OwnerName")%></div></td>
	<td id="stplacecol<%=j%>"><div align="left"><%=rsttrips.getString("StartPlace")%></div></td>
	<td id="endplacecol<%=j%>"><div align="left"><%=rsttrips.getString("EndPlace")%></div></td>
	<td id="updtetmecol<%=j%>"><div align="right"><%=updtetime%> </div></td>
	<td id="curposcol<%=j%>"><div align="left"> 
	<a href="shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>" onclick="popWin = open('shownewmap.jsp?lat=<%=lat%>&long=<%=lon%>&discription=<%="<b>" + vehno + "</b><br>"%><%=curpos%>','myWin','width=500,height=500');popWin.focus();return false">
	<%=curpos%> </div></td>
	<%
		if(DisDate.equalsIgnoreCase("NA"))
		{
			%>
				<td id="FixedTimecol<%=j%>" align="left"><div align="left"> <br> NA</div></td>
				<td id="FixedKmcol<%=j%>" align="left"><div align="left"> <br>NA</div></td>
				
			<%
		}
		else
		{
			%>
				<td id="FixedTimecol<%=j%>" align="right"><div align="right"> <br> <%=tTime%></div></td>
				<td id="FixedKmcol<%=j%>" align="right"> <div align="right"><br> <%=totKm %></div></td>
				
			<%
		}
	
	%>
	
	<td id="kmsruncol<%=j%>"> <div align="right"><%=kmrundist%></div></td>  
	<%
		if(DisDate.equalsIgnoreCase("NA"))
		{
			%>
				
				<td id="kmstoruncol<%=j%>"><div align="left">NA</div></td>
			<%
		}
		else
		{
			%>
				
				<td id="kmstoruncol<%=j%>"><div align="right"><%=remKm%></div></td>
			<%
		}
	
	%>
 	
	<td id="etacol<%=j%>"><div align="right"><%=DisDate%> </div></td>
	
	</tr>
	<%
	j++;
	}
	//out.println("===end of 1st table===");
	%>
									</tbody>
									<tfoot>
									<tr>
									<th> Sr </th>
	<th>Vehicle</B></th> 
	<th>TripID</th>
	<th>Driver</th>
	<th>Start Date-Time</th>
	<th>VehicleType</th>	
	<th> Transporter</th>
	<th> Start Place</th>
	<th>End Place</th>
	<th>Updated Date-Time</th>
	<th>Current Position</th>
	<th>FixedTime</th>
	<th>FixedKm</th>
  	<th>Kms run</th>
 	<th>Kms to run</th>  
	<th>Scheduled Date-Time To Arrival</th>
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
						<h3 class="content-header-title  mb-0">The Kilometer Analysis Report</h3>
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
	<th>Sr</th>
	<th>Vehicle</th>
	<th>Transporter</th>
	<th>Vehicle Type</th>
	<th>
	<% 
		if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{
	%> 		<br>Miles Today</br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<%		}else
	{ 
		%>	<br>Km. Today</br>  (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<% } %>

	</th>
	
	<th>
	<% 
		if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{
	%> 		<br>Miles This Week <br>(Mon-Sun)
	<%		}else
	{ 
		%>	<br>Km. This Week <br>(Mon-Sun) 
	<% } %>

	</th>
	<th>
	<% 
	if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
	%>
	 		<br>Miles This Month <br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastmonth))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<%		}else
	{ 
		%>	Km. This Month <br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastmonth))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>) 
	<% } %>
     
	</th>
	
	</tr>
									</thead>
									<tbody>
										<%
	String vehicletype2=request.getParameter("vehicle");
    String vehicletypedemo="";    

    System.out.println("-------------------------------->"+vehicletype2);
    if(vehicletype2==null)
    {
    	vehicletype2="All";
    }
    %>
    
   
    
    <% 
    /* String fromdate= request.getParameter("data");
    System.out.println("-------------------------------->"+fromdate);
    
    String todate= request.getParameter("data1");
    System.out.println("-------------------------------->"+todate);
     */
	
     if(vehicletype2.equals("All"))
	 {
    	 vehicletype2="%%";
	 }
     try{
 		DecimalFormat df2 = new DecimalFormat("0.00");
         
 		
 	int cnt = 0;
 		/* String sql = "Select vehtype from db_gps.t_vehicledetails where vehtype!='' and ownername='"+username+"' and status='-'  order by vehtype " ;
        
 		ResultSet rs = st.executeQuery(sql);
 		System.out.println("The sql is ==>"+sql);
 		while(rs.next()){
 		vehicletypedemo = rs.getString("vehtype");
 		 */	 
 		
 	 		}
 	     catch(Exception e11)
 	 			{
 	 				//System.out.println("---I am in exception--kmrundist-");
 	 				e11.printStackTrace();
 	 			} 
     %>
     
	
	<%
	sql="select * from t_vehicledetails where VehicleCode in "+session.getAttribute("VehList").toString()+" order by VehicleCode";
	ResultSet rst=st.executeQuery(sql);
	int i=1;	
	km3=0;
	km6=0;
	km9=0; 
	while(rst.next())
	{
		km1=0;
		km2=0;
		km4=0;
		km5=0;
		km7=0;
		km8=0; 
		String vehcode=rst.getString("VehicleCode");
		 vehicletype="";   
			String sql4 = "Select vehtype from db_gps.t_vehicledetails where  vehtype!='' and VehicleRegNumber='"+rst.getString("VehicleRegNumber")+"' and ownername='"+username+"' and status='-'  order by vehtype";
	 		
			ResultSet rs2 = st2.executeQuery(sql4);
	 		System.out.println("The sql is ==>"+sql4);
	 		if(rs2.next()){
	 		vehicletypedemo = rs2.getString("vehtype");
	 		} 
		//System.out.println("---vehcode--->"+vehcode);
	%>
 
	 
		<tr>
		<td style="text-align: right"><%=i%></td>
		<td ><div align="left"><%=rst.getString("VehicleRegNumber")%></div></td>
				<td ><div align="left"><%=rst.getString("OwnerName")%></div></td>
		
		<td><div align="left"><%=vehicletypedemo%></div></td>
				 
	
		<td style="text-align: right"><div>
		<% 
		//System.out.println("vehicle code===>"+rst.getString("VehicleCode"));
		//report for today
		try{
			sql="select Distance from t_veh"+rst.getString("VehicleCode")+" where TheFieldDataDate ='"+today+"'  and TheFiledTextFileName='SI' order by TheFieldDataTime asc limit 1";
			//System.out.println("---2---sql--->"+sql);
			ResultSet rstkm1=st1.executeQuery(sql);
			//System.out.println("---3---");
			if(rstkm1.next())
			{
				//System.out.println("---4---");
				km1=rstkm1.getInt("Distance");
			}
			//System.out.println("---5---");
			sql="select Distance from t_veh"+rst.getString("VehicleCode")+" where TheFieldDataDate ='"+today+"'  and TheFiledTextFileName='SI' order by TheFieldDataTime desc limit 1";
			//System.out.println("---6---sql--->"+sql);
			ResultSet rstkm2=st5.executeQuery(sql);
			//System.out.println("---7---");
			if(rstkm2.next())
			{
				//System.out.println("---8---");
				km2=rstkm2.getInt("Distance");
				//System.out.print("---====km2--->"+km2);
			}
			//System.out.println("---9---");
			km3=km3+(km2-km1); 
			
			todaysdist=km2-km1;
			//System.out.println("---10---");
		%>
		<%
		if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{%>
			<%= (int)fleetview.KM_TO_MILES1(todaysdist) %>
		<% 
		}else
			{
		%>
			<%= todaysdist %>
		<%
			}
		%>
		</div> </td>
		<% 
		}catch(Exception ee1){
			//System.out.println("----I am in today---");
			ee1.printStackTrace();
		}%>
		<td ><div align="right">
		<% 
			////report for week
		try{
			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date tdydte1 = new java.util.Date();
			long ms=tdydte1.getTime();
			ms=ms-1000 * 60 * 60 *24;
			tdydte1.setTime(ms);
			String onedaybfre = formatter.format(tdydte1);
			sql2="select sum(Distance) as distlastweek from t_veh"+vehcode+"_ds where TheDate between '"+lastweek+"' and '"+onedaybfre+"' ";
			//sql2="select sum(Distance) from t_veh"+vehcode+"_ds where TheDate between '"+lastweek+"' and '"+onedaybfre+"' order by concat(TheFieldDataDate, TheFieldDataTime) desc limit 1";
			//System.out.print("---=in week===sql2--->"+sql2);
			rs2=st3.executeQuery(sql2);	
			if(rs2.next())
			{
				km4=rs2.getInt("distlastweek");
				//System.out.println("\nKm4===>"+km4);
			}
			km4=km4+(km2-km1);// Adding todays km also
			//System.out.println("\nKm4=after addiing==>"+km4);
				if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
			{
				out.print((int)fleetview.KM_TO_MILES1(km4));
			}
			else
			{
				out.print(km4);
			}
			km6=km6+km4; // adding total kms
		%>
		</div></td>
		
		<td >
	<div align="right">
		<% //report for month
			sql="select sum(Distance) as distlastmnth from t_veh"+vehcode+"_ds where TheDate between '"+lastmonth+"' and '"+onedaybfre+"' ";
			//out.print("sql===km7==distlastweek=>"+sql);
			ResultSet rstkm7=st4.executeQuery(sql);
			if(rstkm7.next())
			{
				km7=rstkm7.getInt("distlastmnth");
				//System.out.println("-km7==distlastmnth---->"+km7);
			}
				km7=km7+(km2-km1);// Adding todays km also
				if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
				{
					out.print((int)fleetview.KM_TO_MILES1(km7));
				}
				else
				{
					out.print(km7);
				}
				//System.out.println("  ==== km7=km7+(km2-km1)===> "+km7);
				km9=km9+km7; //adding total kms
		%>
		</div></td>	
		</tr>	
		<%
		}catch(Exception ee1){
			//System.out.println("----I am in week and mon loop---");
			ee1.printStackTrace();
			out.print("Exception---->"+ee1);
		}	
		i++;
		}
		%>
		
	<tr>
		<td style="text-align: right"><%=i%></td>
	
	<td  ><div align="left"><b>Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	
	<td></td>
	<td></td>
	<%
	//System.out.println("session.getAttribute(distformat)----->" + session.getAttribute("distformat"));
	if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{%>
	<td  width="100"><div align="right" ><b><%=(int)fleetview.KM_TO_MILES1(km3) %>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<td ><div align="right" ><b><%=(int)fleetview.KM_TO_MILES1(km6)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<td ><div align="right"  ><b><%=(int)fleetview.KM_TO_MILES1(km9)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<%}else{ %>
	
	<td ><div align="right"><%= km3 %></div></td>
	<td ><div align="right"><%= km6%></div></td>
	<td ><div align="right"><%= km9%></div></td>
	<% } %>
	
	</tr> 
		
	<%-- <tr>
	<td ><div align="left">Total:</div></td>
	<td></td>

	
	<%
	//System.out.println("session.getAttribute(distformat)----->" + session.getAttribute("distformat"));
	if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{%>
	<td  width="100"><div align="right"><b><%=(int)fleetview.KM_TO_MILES1(km3) %>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<td ><div align="right"><b><%=(int)fleetview.KM_TO_MILES1(km6)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<td ><div align="right"><b><%=(int)fleetview.KM_TO_MILES1(km9)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></div></td>
	<%}else{ %>
	
	<td ><div align="right"><%= km3 %></div></td>
	<td ><div align="right"><%= km6%></div></td>
	<td ><div align="right"><%= km9%></div></td>
	<% } %>
	</tr>	
 --%>	
</tbody>
									<tfoot><tr>
									<th>Sr</th>
	<th>Vehicle</th>
	<th>Transporter</th>
	<th>Vehicle Type</th>
	<th>
	<% 
		if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{
	%> 		<br>Miles Today</br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<%		}else
	{ 
		%>	<br>Km. Today</br>  (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<% } %>

	</th>
	
	<th>
	<% 
		if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{
	%> 		<br>Miles This Week <br>(Mon-Sun)
	<%		}else
	{ 
		%>	<br>Km. This Week <br>(Mon-Sun) 
	<% } %>

	</th>
	<th>
	<% 
	if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
	%>
	 		<br>Miles This Month <br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastmonth))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>)
	<%		}else
	{ 
		%>	Km. This Month <br> (<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastmonth))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(today))%>) 
	<% } %>
     
	</th>
	
	</tr>	
									</tfoot>
							</table>
							<input type="hidden" name="totrec" value="<%=j-1%>" />
							<%
	}catch(Exception ee)
	{
		//System.out.println("===HI 222 ===");
		out.print("Exception---->"+ee);
	}	
	finally
	{
		try
		{
			conn.close();
		}catch(Exception e)
		{}
		try
		{
			con1.close();
		}catch(Exception e)
		{}
	}
	%>
							</div>
							</div>
							</div>
							</section>
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
								title: 'KM Analysis Report for Open Trips',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'KM Analysis Report for Open Trips',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'KM Analysis Report for Open Trips',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'KM Analysis Report for Open Trips',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'KM Analysis Report for Open Trips',
                                exportOptions: { columns: [0,1,2,3,4,5] }
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
								title: 'The Kilometer Analysis Report',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'The Kilometer Analysis Report',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'The Kilometer Analysis Report',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'The Kilometer Analysis Report',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'The Kilometer Analysis Report',
                                exportOptions: { columns: [0,1,2,3,4,5] }
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