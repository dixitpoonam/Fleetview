

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


<script>
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
					{
						try{
					/* var result1;
					result1=reslt;
					result1=result1.replace(/^\s+|\s+$/g,'');
					if(result1=="Updated") */
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
			}


</script>


</head>

<body onload="ondemand()">
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>
<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%!
String datex1, datex2, dat1, dat2;
ResultSet rs=null;

int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;
%>


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />

<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 

%>
<%

String owner=session.getAttribute("usertypevalue").toString();

String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		System.out.println("on load");
		
		datex1 =  session.getAttribute("today").toString();  //dd-MMM-yyyy
		datex2 = session.getAttribute("today").toString();
		
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

String dt1time=""+dt1+" 23:59:59";


System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);

	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

%>


<!-- Database Connection -->
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
	<%
		fleetview.getConnection(MM_dbConn_DRIVER, MM_dbConn_STRING,	MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 	%>
 	<!--Global variable declaration  -->
 <%!
	 	
	Connection conn=null,conn1=null;
	Statement st,st1,st2,st3,st11,st111,st45;
	String sql,sql1,sql2, data,data1,trips,ndcount1="",datan,datan1;
	String g="",s="",y="",p="",newdata="",newdata1="";
	int kmcountall,kmcount,tripcount,drivercount,tripcountall,drivercountall,vehcount,vehcountall,oscount,oscount1,oscountall,oscountall1,racount,racountall,rdcount,rdcountall,cdcount,cdcountall,ndcount,ndcountall,countlatency,latency,durationall,duration,RHcount,RHcountall,stop,stopall,BriefGoalsall,AdhJRMall,DeBriefGoalall,Geocountall;
	String startplace,StartCode;
	double ratingcount,ratingcountall;
	double Accelaration1=0.0,Decelaration1=0.0,OverSpeed1=0.0;
	double ss,aa,rr,rt;
	NumberFormat nf = DecimalFormat.getNumberInstance();
	String geofence ="-";
	String BriefGoals="-";
	String AdhJRM="-";
	String DeBriefGoal="-";
	int Geocount=0;

%>
<%
	String usertypevalue=session.getAttribute("usertypevalue").toString();
	System.out.println("transportername"+usertypevalue);
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);	
	nf.setGroupingUsed(false);
	if(!(null==request.getQueryString()))
	{
		data=request.getParameter("data");
		data=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
		 g=data.concat(" ");
		 s=g.concat("00:00:00");
		System.out.println("values of data appendeddata*****"+s);
		
		data1=request.getParameter("data1");
		data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
        y=data1.concat(" ");
	     p=y.concat("23:59:59");
		System.out.println("values of appendeddata11111@@@@@@"+p);
	}
	else
	{
		data=data1=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	}
%>
<input type="hidden" id="owner" name="owner" value="<%=usertypevalue%>"></input>

<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">	
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Key Performance Indicator Report From <%=datex1 %> To <%=datex2 %> Of <%=username %></h2>
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

			<!-- Form Comes here -->
			
			<form name="formreport" id="formreport" method="post">
		    <div class="row col-12">
		    <div class="col-md-3"></div>
			<div class="col-md-2">
				

				<label for="from">From:</label>
				<div class="input-group input-group-merge" >
				
					<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>"> 
					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
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
				<div class="input-group input-group-merge" >
				
					<input type="text" id="data1" name="data1"  class="form-control" value="<%=datex2%>"/> 
				<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
				</div>
				<script>

							$(document).ready(function() {
								$( function() {
						$( "#data1" ).datepicker({
				dateFormat: 'dd-M-yy',
				changeMonth: true,
		            changeYear: true
					 /* minDate: 0,
					maxDate:7  */
		});
		} );
					
		});

			   </script>
		</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
			</form>
			
		
			
		<input type="hidden" id="datann" name="datann" value="<%=datan%>"></input>
        <input type="hidden" id="datann1" name="datann1" value=<%=datan1%>"></input>
 
 
 
<%
		String Bt=request.getParameter("button");
		if(Bt=="Submit")
		{
%>
	

<%
		}
%>
<br></br>
<%
	try
	{
				
			
				//Class.forName(MM_dbConn_DRIVER);
				conn = fleetview.ReturnConnection();
				st=conn.createStatement();
				st1=conn.createStatement();
				st3=conn.createStatement();
				st11=conn.createStatement();
				st111=conn.createStatement();
				st45=conn.createStatement();
			/* if(!(null==request.getQueryString()))
			{ */
%>
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
				<th> Sr.</th>
				<th> Origin</th>
				<th> Loaded Trips</th>
				<th> Completed Trips</th>
				<th> Brief Trips</th>			
				<th> DeBrief Trips</th>		
				<th> Km. Travelled</th>
				<th> Drivers</th>
				<th> Veh.</th>
				<th>OS Count</th>
				<th>OS Duration</th>
				<th>RA</th>
				<th>RD</th>
				<th>CD</th>
				<th>ND</th>
				<th> RH Violation</th>
				<th> Stops</th>
				<th> Rating</th>
				<th> Goals To Be Achieved</th>
				<th> Geofence</th>
				<th> Adherance to JRM</th>
				<th> Goals achieved</th>
			</tr> 
		</thead>
				
<tbody>

<%
	String sql="";
	int i=1;
	int Loadedtrips=0,CompletedTrips=0,briefed=0,debriefed=0;
	int Km=0,driver=0,VehRegNo=0,OSDuration=0,RA=0,RD=0,cd=0,ND=0,rhvio=0,stops=0,Rating=0,goals=0,Geofence=0,jrm=0,goalachieved=0;


	sql = "select  a.StartPlace as startlocation,count(a.tripid) as LoadeTrips,count(distinct(b.tripid)) as CompletedTrips,count(distinct(c.tripid)) as briefed,count(d.tripid) as debriefed,sum(b.KmTravelled) as Km,count(distinct(a.Drivercode)) as Driver,count(distinct(a.Vehid)) as VehRegNo,sum(b.OSCount) as oscount,sum(b.OSDuration) as OSDuration,sum(b.RACount) as RA,sum(b.RDCount) as RD,sum(b.crcount) as cd,sum(b.NDCount) as ND,sum(b.runhrvio)as rhvio,sum(b.stoppagecount) as stops,(((sum(b.osduration)/10/sum(b.kmtravelled))*100)+((sum(b.racount)/sum(b.kmtravelled))*100)+((sum(b.rdcount)/sum(b.kmtravelled))*100)) as Rating,count(c.goalstobeachieved) as goals,count(if(a.consideredlatlon='shiptocode',1,NULL)) as Geofence,count(d.adhjrm) as jrm,count(d.GoalsAchived) as goalachieved from db_gps.t_startedjourney  as a left outer join db_gps.t_completedjourney as b on a.tripid=b.tripid left outer join db_gps.t_briefing as c on a.tripid=c.tripid  left outer join db_gps.t_debriefing as d on a.tripid=d.tripid where a.StartDate>= '"+dt+"' and a.StartDate<= '"+dt1+"' and (a.OwnerName LIKE '%"+owner+"%' OR a.GPName LIKE '%"+owner+"%') group by a.startplace";         
	
	System.out.println("query " + sql);
	ResultSet rs = st.executeQuery(sql);
	
		while(rs.next())
		{	 
			Loadedtrips=Loadedtrips+rs.getInt("LoadeTrips");
			CompletedTrips=CompletedTrips+rs.getInt("CompletedTrips");
			briefed=briefed+rs.getInt("briefed");
			debriefed=debriefed+rs.getInt("debriefed");
			Km=Km+rs.getInt("Km");
			driver=driver+rs.getInt("driver");
			VehRegNo=VehRegNo+rs.getInt("VehRegNo");
			oscount=oscount+rs.getInt("oscount");
			OSDuration=OSDuration+rs.getInt("OSDuration");
			RA=RA+rs.getInt("RA");
			RD=RD+rs.getInt("RD");
			cd=cd+rs.getInt("cd");
			ND=ND+rs.getInt("ND");
			rhvio=rhvio+rs.getInt("rhvio");
			stops=stops+rs.getInt("stops");
			Rating=Rating+rs.getInt("Rating");
			goals=goals+rs.getInt("goals");
			Geofence=Geofence+rs.getInt("Geofence");
			jrm=jrm+rs.getInt("jrm");
			goalachieved=goalachieved+rs.getInt("goalachieved");
%>

		<tr>
			<td align="right"><%=i++%></td>
			<td align="left"><a href="KPI_report.jsp?startplace=<%=rs.getString("startlocation") %>&date1=<%=dt%>&date2=<%=dt1%>"><%=rs.getString("startlocation") %></a></td>
			<td align="right"><%=rs.getString("LoadeTrips")%></td>
			<td align="right"><%=rs.getString("CompletedTrips")%></td>
			<td align="right"><%=rs.getString("briefed")%></td>
			<td align="right"><%=rs.getString("debriefed")%></td>
			<td align="right"><%=rs.getString("Km")%></td>
			<td align="right"><%=rs.getString("driver")%></td>
			<td align="right"><%=rs.getString("VehRegNo")%></td>
			<td align="right"><%=rs.getString("oscount")%></td>
			<td align="right"><%=rs.getString("OSDuration")%></td>
			<td align="right"><%=rs.getString("RA")%></td>
			<td align="right"><%=rs.getString("RD")%></td>
			<td align="right"><%=rs.getString("cd")%></td>
			<td align="right"><%=rs.getString("ND")%></td>
			<td align="right"><%=rs.getString("rhvio")%></td>
			<td align="right"><%=rs.getString("stops")%></td>
			<td align="right"><%=rs.getString("Rating")%></td>
			<td align="right"><%=rs.getString("goals")%></td>
			<td align="right"><%=rs.getString("Geofence")%></td>
			<td align="right"><%=rs.getString("jrm")%></td>
			<td align="right"><%=rs.getString("goalachieved")%></td>
			
			<%
		}
			
			
			%>
			
		</tr>
			
		<tr>
			<td align="right"><%=i%></td>
			<td align="left">Total</td>
			<td align="right"><%=Loadedtrips%></td>
			
			<td align="right"><%=CompletedTrips%></td>
			<td align="right"><%=briefed%></td>
			<td align="right"><%=debriefed%></td>
			<td align="right"><%=Km%></td>
			
			<td align="right"><%=driver%></td>
			<td align="right"><%=VehRegNo%></td>
			<td align="right"><%=oscount%></td>
			<td align="right"><%=OSDuration%></td>
			<td align="right"><%=RA%></td>
			<td align="right"><%=RD%></td>
			<td align="right"><%=cd%></td>
			<td align="right"><%=ND%></td>
			<td align="right"><%=rhvio%></td>
			<td align="right"><%=stops%></td>
			<td></td>
			<td align="right"><%=goals%></td>
			<td align="right"><%=Geofence%></td>
			<td align="right"><%=jrm%></td>
			<td align="right"><%=goalachieved%></td>
			</tr>
			</tbody>
<%
		
			//}
	}
		catch(Exception ee)
		{
			System.out.println("exception4===>"+ee.getMessage());
		}
		finally
		{
			try
			{
				conn.close();
			}
			catch(Exception e)
			{}
			try
			{
				fleetview.closeConnection();
			}
			catch(Exception e)
			{}
		
			
		}

%>
		<tfoot>
			<tr>
				<th> Sr.</th>
				<th> Origin</th>
				<th> Loaded Trips</th>
				<th> Completed Trips</th>
				<th> Brief Trips</th>			
				<th> DeBrief Trips</th>		
				<th> Km. Travelled</th>
				<th> Drivers</th>
				<th> Veh.</th>
				<th>OS Count</th>
				<th>OS Duration</th>
				<th>RA</th>
				<th>RD</th>
				<th>CD</th>
				<th>ND</th>
				<th> RH Violation</th>
				<th> Stops</th>
				<th> Rating</th>
				<th> Goals To Be Achieved</th>
				<th> Geofence</th>
				<th> Adherance to JRM</th>
				<th> Goals achieved</th>
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

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for KPI Report </h4>
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
								title: 'KPI Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'KPI Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'KPI Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'KPI Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'KPI Report',
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
	
	
	</jsp:useBean>
			
</body>
</html>








