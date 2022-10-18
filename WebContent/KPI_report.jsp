

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
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
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">

<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,	MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
%>
 	
 	<!-- Declaration of Global Variable -->
<%!
	Connection conn=null, conn1=null;
	Statement st, st1, st2, st3,st12,st13,st14,st15;
	Statement st20=null,st21=null;
	String sql, data, data1, trips,sql2,sql3,d1,da2;
	String startplace;
	String s="",g="",p="",y="";

	NumberFormat nf = DecimalFormat.getNumberInstance();
%>
	
<%

nf.setMaximumFractionDigits(2);
nf.setMinimumFractionDigits(2);	
nf.setGroupingUsed(false);
         d1=request.getParameter("date1");
         System.out.println("value of d1"+d1);
         da2=request.getParameter("date2");
         System.out.println("value of d2"+da2);
         
		data=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date1")));
		System.out.println("value of data"+data);
// 		String g=data.concat(" ");
// 		 s=g.concat("00:00:00");
// 		System.out.println("values of data appendeddata*****"+s);
		
		data1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date2")));
		System.out.println("value of data1"+data1);
		startplace=request.getParameter("startplace");
		
		System.out.println("startpalce value"+startplace);
		
// 		if(startplace.contains("Bhiwandi")||(startplace.contains("GETL (Kandla-M&EL)")))
// 		{
// // 			System.out.println("heeeeeeeeeeeee");
// 		}
// 		else
// 		{
// // 		System.out.println("helloooooooooo");	
// 		startplace=startplace.replace("and","&");
// 		}

// 		System.out.println("startpalce value after"+startplace);
         if(startplace.contains("and1"))
         {
        	 startplace=startplace.replace("and1","&");
         }
         if(startplace.contains("&"))
         {
        	 startplace=startplace.replace("&","%26");
         }
		String usertypevalues=session.getAttribute("usertypevalue").toString();
		System.out.println("transporter name===>"+usertypevalues);
        
		
%>

<!-- JavaScript for export to excel and export to PDF -->
<head>

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


int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

	try{
		
		//Class.forName(MM_dbConn_DRIVER);
		conn = fleetview.ReturnConnection();
		st=conn.createStatement();
		st1=conn.createStatement();
		st12=conn.createStatement();
		st13=conn.createStatement();
		st14=conn.createStatement();
		st15=conn.createStatement();
		
		 st20=conn.createStatement();
		 st21=conn.createStatement();
		
		
	if(!(null==request.getQueryString()))
	{
%>

<body onload="ondemand()">


<%
	
	
	//for report conversion use this query
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


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />


<input type="hidden" name="paramflag" id="paramflag" value="true">
<input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>"> 

<%
	String username="";
	username=(String)session.getAttribute("usertypevalue");
	
	System.out.println("Session name----------------->:"+username); 
	
	
	String datex1,datex2,dt1,dt2;
	
	dt1 = request.getParameter("date1");
	dt2 = request.getParameter("date2");
	
	datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt1));
	datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt2));
	
	
%>


<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">KPI Report From <%=datex1 %> To <%=datex2%> Of <%=username %></h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
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

	String startplace=request.getParameter("startplace");
	String owner=session.getAttribute("usertypevalue").toString();

%>
			<!-- Form Comes here -->
			
			
			
			
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
										<th>TripId</th>
										<th>VehId</th>
										<th>Vehicle</th>
										<th>Owner</th>
										<th>DriverID</th>
										<th>Name</th>
										<th>Start</th>
										<th>Start Date</th>
										<th>End</th>
										<th>End Date</th>
										<th>Km Travelled</th>
										<th>OS Duration</th>
										<th>OS Count</th>
										<th>RA Count</th>
										<th>RD Count</th>
										<th>Cr Count</th>
										<th>Nd Count</th>
										<th>Rating</th>
										<th>Tripstatus</th>
										<th>Days</th>
										<th>GoalsToBe Achieved</th>
										<th>Adh JRM</th>
										<th>Goals Achieved</th>
										<th>Geofenced</th>
										<th>Journey Planning</th>
										<th>Driver FTPR</th>
									</tr>
								</thead>
								
								<tbody>
								
									<%
			
										String sql2 = "";
										int j = 1;
										try {
											
												sql = "select a.TripID,a.Vehid,a.VehRegNo,a.OwnerName,b.DriverID,a.DriverName,a.StartPlace,DATE_FORMAT(a.StartDate,'%d-%b-%Y') as StartDate,a.EndPlace,DATE_FORMAT(b.EndDate,'%d-%b-%Y %H:%i') as EndDate,b.KmTravelled,b.OSDuration,b.OScount,b.RACount, b.RDCount,b.CrCount as cd,b.Ndcount,(((sum(b.osduration)/10/sum(b.kmtravelled))*100)+((sum(b.racount)/sum(b.kmtravelled))*100)+((sum(b.rdcount)/sum(b.kmtravelled))*100)) as Rating ,case when(a.jstatus='completed') then 'Closed' when (a.jstatus<>'completed') then 'Running' end as tripstatus,concat(case when(c.Briefid is not NULL) then 'Briefed' when (c.Briefid is NULL) then 'Not Briefed' end ,'&amp;',case when(d.debriefid is not NULL) then 'DeBriefed' when (d.debriefid is NULL) then 'Not DeBriefed' end )brifDebrif,b.RunHrVio,b.Stoppagecount,DateDIFF(b.EndDate,b.StartDate)+1 as days,c.GoalsToBeAchieved,d.AdhJRM,d.GoalsAchived ,if(a.consideredlatlon='shiptocode','Yes','NO') AS GeoFenced,case when(e.Tripid=a.TripID) then 'Yes' when(e.Tripid is NULL) then 'NO' end as Journeyplanning,case when(f.ReasoneForRejection is NULL) then 'Yes' when(f.ReasoneForRejection is NULL) then 'No' end as DriverFTPR  from db_gps.t_startedjourney a left outer join db_gps.t_completedjourney b on a.tripid=b.tripid left outer join db_gps.t_briefing c on a.tripid=c.tripid left outer join db_gps.t_debriefing as d on a.tripid=d.tripid left outer join db_gps.t_jrnyplanning as e on a.tripid=e.tripid left outer join db_gps.t_reasonOfRejectionForDriver f on b.DriverID=f.DriverId and b.StartDate<=f.UpdatedDateTime and b.EndDate>=f.UpdatedDateTime  where a.StartPlace = '"+startplace+"' and b.StartDate>= '"+dt1+"' and b.StartDate<= '"+dt2+"' and (a.OwnerName LIKE '%"+owner+"%' OR a.GPName LIKE '%"+owner+"%') group by a.Tripid"; 					   
												
												System.out.println("query " + sql);
												ResultSet rs1 = st1.executeQuery(sql);
												while (rs1.next()) 
												{
													
													//  System.out.println("query in while " + sql2);
													
													
									%>
									
									<tr>			
										<td><a href="ShowCustomReportonTWMap.jsp?tripid=<%=rs1.getString("TripID") %>&vehcode=<%=rs1.getString("Vehid") %>&data=<%=dt1%>&data1=<%=dt2%>&ftime1=00&ftime2=00&ttime1=23&ttime2=59"><%=rs1.getString("TripID") %></a></td>                                   
										<%-- <td><a href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=rs1.getString("TripID") %>&vehcode=<%=rs1.getString("Vehid") %>&data=<%=dt1%>&data1=<%=dt2%>&ftime1=00&ftime2=00&ftime3=00&ttime1=23&ttime2=59&ttime3=59&pg=cm&pstatus=No&brifid=&rid=&driverid=<%=rs1.getString("DriverID") %>"><%=rs1.getString("TripID") %></a></td> --%>                                   
										<td><%=rs1.getString("Vehid") %></td>
										<td><%=rs1.getString("VehRegNo") %></td>
										<td><%=rs1.getString("OwnerName") %></td>
										<td><%=rs1.getString("DriverID") %></td>
										<td><%=rs1.getString("DriverName") %></td>
										<td><%=rs1.getString("StartPlace") %></td>
										<td><%=rs1.getString("StartDate") %></td>
										<td><%=rs1.getString("EndPlace") %></td>
										<td><%=rs1.getString("EndDate") %></td>
										<td><%=rs1.getString("KmTravelled") %></td>
										<td><a href="KPI_osduration.jsp?vid=<%=rs1.getString("Vehid") %>&tripid=<%=rs1.getString("TripID") %>&sdate=<%=rs1.getString("StartDate") %>&edate=<%=rs1.getString("EndDate") %>"><%=rs1.getString("OSDuration") %></a></td>
										<td><%=rs1.getString("OScount") %></td>
										<td><a href="KPI_rapidacc.jsp?vid=<%=rs1.getString("Vehid") %>&tripid=<%=rs1.getString("TripID") %>&sdate=<%=rs1.getString("StartDate") %>&edate=<%=rs1.getString("EndDate") %>"><%=rs1.getString("RAcount") %></a></td>
										<td><a href="KPI_rapiddeacc.jsp?vid=<%=rs1.getString("Vehid") %>&tripid=<%=rs1.getString("TripID") %>&sdate=<%=rs1.getString("StartDate") %>&edate=<%=rs1.getString("EndDate") %>"><%=rs1.getString("RDcount") %></a></td>
										<td><%=rs1.getString("cd") %></td>
										<td><%=rs1.getString("Ndcount") %></td>
										<td><%=rs1.getString("Rating") %></td>
										<td><%=rs1.getString("TripStatus") %></td>
										<td><%=rs1.getString("days") %></td>
										<td><%=rs1.getString("GoalsToBeAchieved") %></td>
										<td><%=rs1.getString("AdhJRM") %></td>
										<td><%=rs1.getString("GoalsAchived") %></td>
										<td><%=rs1.getString("GeoFenced") %></td>
										<td><%=rs1.getString("Journeyplanning") %></td>
										<td><%=rs1.getString("DriverFTPR") %></td>
										
										<%
											j++;
														}
													} catch (Exception e) {
														System.out.println(e);
													}
										%>
									</tr>
								</tbody>
								
								
								<tfoot>
									<tr>
										<th>TripId</th>
										<th>VehId</th>
										<th>Vehicle</th>
										<th>Owner</th>
										<th>DriverID</th>
										<th>Name</th>
										<th>Start</th>
										<th>Start Date</th>
										<th>End</th>
										<th>End Date</th>
										<th>Km Travelled</th>
										<th>OS Duration</th>
										<th>OS Count</th>
										<th>RA Count</th>
										<th>RD Count</th>
										<th>Cr Count</th>
										<th>Nd Count</th>
										<th>Rating</th>
										<th>Tripstatus</th>
										<th>Days</th>
										<th>GoalsToBe Achieved</th>
										<th>Adh JRM</th>
										<th>Goals Achieved</th>
										<th>Geofenced</th>
										<th>Journey Planning</th>
										<th>Driver FTPR</th>
									</tr>
								</tfoot>
							</table>
							<%
								}
								}
								catch(Exception ee)
								{
								 out.print("Exception---->"+ee);
								}
								finally
								{
									conn.close();
									try
									{
									fleetview.closeConnection();}
									catch(Exception e)
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

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for ReportTemplateSession </h4>
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
							<tbody>
									<%
									
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
									<%i++;}%>
							</tbody>
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
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'New Report Template',
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

</jsp:useBean>
</html>





