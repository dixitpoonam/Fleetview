<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
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
 
 
 <SCRIPT LANGUAGE="JavaScript1.2" SRC="js/graph.js"></SCRIPT>
 
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

<script language="javascript">
function validate()
  {
  	if(document.getElementById("data").value=="")
  	{
  	
  		alert("Please select the from date");
  		return false;
  	}
  if(document.getElementById("data1").value=="")
  	{
  	
  		alert("Please select the to date");
  		return false;
  	}
  	//return datevalidate();
	return true;
  	
  }
  function datevalidate()
{	var date1=document.getElementById("data").value;
	var date2=document.getElementById("data1").value;
	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	
	
	
	if(dy1>year || dy2>year)
	{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
	}
	else if(year==dy1 && year==dy2) if(dm1>month || dm2>month)
	{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
	}

	if(dm1==month){
		if(dd1>day || dd2>day)
		{
		alert("selected date should not be greater than todays date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;

		return false;
	
		}
	}
	if(dy1>dy2)
	{
		alert("From date year is should not be greater than to date year");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	
	else if(year==dy1 && year==dy2) if(dm1>dm2)
	{
		alert("From date month is should not be greater than to date month");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	if(dm1==dm2) {
	if(dd1 > dd2)
	{
		alert("From date is should not be greater than to date");
		document.getElementById("data").value="";
		document.getElementById("data1").value="";
		document.getElementById("data").focus;
		return false;
	}
	}
	return true;
}
</script>
</head>
<body onload="ondemand()">
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>

<%
String fromdate11,todate11;
%>
<%
		if(!(null==request.getQueryString()))
			{
			datenew1=request.getParameter("data");
			datenew2=request.getParameter("data1");
			}
			else
			{
				datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			}
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
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

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


<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%
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
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Driver Rating Report</h3>
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

			<!-- Form Comes here -->
			
			<form name="dateform" action="" method="get" onsubmit="return validate();">
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
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" id="submit"  onclick="return chk()"  value="Submit">
			</div>
		</div><br>
			</form>
			
<%
String dd=request.getQueryString();
if(dd==null)
{
%>
<table class="stats">
<tr><td>
<center class='bodyText'><b>Please select the dates to display the Driver Rating report</b></center>
</td></tr>
</table>
<%
}
else
{
%>

<%!
Connection connnew,conn1;
Statement st, st1, st2,st3,st4,st5;
String user,sql,sql1,sql2;
String data1, data2,showdate1,showdate,DriverName,Owner,datenew1,datenew2,Transporter;
String DriverID;
%>

<%
int OScount, RAcount, RDcount,Distance;
double Rating;
boolean flag;

//NumberFormat nf=DecimalFormat.getInstance();

int JCode,VehCode,distance,OSduration,RAcnt=0,RDcnt=0,OScnt=0,Distcnt=0,dailyctr=0,weeklyctr=0,alldailyctr=0,allweeklyctr=0;
double rating;
//double a,b,c;
double ctr=0.0;
double d=0.0;

String ll="";


 %>
 
<%

NumberFormat nf = DecimalFormat.getInstance();
nf.setMaximumFractionDigits(2);
nf.setMinimumFractionDigits(2); 

data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
data2=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));
datenew1=request.getParameter("data");
datenew2=request.getParameter("data1");
//System.out.println("datenew1::>>>>"+datenew1);
//System.out.println("datenew2::>>>>"+datenew2);
Transporter=session.getAttribute("usertypevalue").toString();
//System.out.println("Transporter");

try{
	Class.forName(MM_dbConn_DRIVER); 
	connnew = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=connnew.createStatement();
	st1=connnew.createStatement();
	st2=connnew.createStatement();
	st3=connnew.createStatement();
	st4=connnew.createStatement();
	st5=connnew.createStatement();
	
%>

<table border="0" width="100%" bgcolor="white" >
<tr><td align="center"><font size="2"><b>Driver Rating Report for <%=session.getAttribute("usertypevalue").toString()%> From <%=datenew1%> to <%=datenew2%>. </b></font></td></tr>
</table>
			
			
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
											<th>SR.</th>
											<th>Driver Name</th>
											<th>Driver Code</th>
											<th>Transporter</th>
											<th>OS Duration</th>
											<th>RA Count</th>
											<th>RD Count</th>
											<th>Distance</th>
											<th>Daily CD Violation</th>
											<th>Weekly CD Violation</th>
											<th>Rating</th>
										</tr>
									</thead>
									
									<tbody>
									<%
String DriverIdlist="(";
/*	String Svehlist="(0";
sql13="select Distinct(TripID) from t_alljddata where TripID in (select Distinct(TripID) from t_completedjourney where GPName='Castrol' and EndDate between '"+datenew1+"' and '"+todate+"') and Category = 'Primary' and Status <> 'NotProcessed'";
	//"select sum(KmTravelled) as KmTravelled,sum(RACount) as RACount,sum(RDCount) as RDCount,sum(OSDuration) as OSDuration,(sum(RACount)/sum(KmTravelled))*100 as RARating,(sum(RDCount)/sum(KmTravelled))*100 as RDRating,((sum(OSDuration)/10)/sum(KmTravelled))*100 as OSrating,(sum(RACount)/sum(KmTravelled))*100+(sum(RDCount)/sum(KmTravelled))*100+((sum(OSDuration)/10)/sum(KmTravelled))*100 as Rating from t_completedjourney where TripId in (select Distinct(TripID) from t_alljddata where StartDate between '"+datenew1+"' and '"+todate+"' and Category = 'Primary' and Status <> 'NotProcessed')";
//System.out.println(sql13);	
ResultSet rst13=st13.executeQuery(sql13);
while(rst13.next())
	{
	Svehlist=Svehlist+","+rst13.getString("VehicleCode");
	}
Svehlist=Svehlist+")";

//System.out.println(Svehlist);
*/
//sql="select JourneyCode,Vehid,StartDate,EndDate,sum(RACount) as RAcount,sum(RDCount) as RDcount,sum(OSDuration) as OSDuration,DriverID,DriverName,OwnerName,Sum(KmTravelled) as Distance from t_completedjourney where StartDate>='"+data1+"' and EndDate<='"+data2+"' and KmTravelled>0 and JourneyCode <>'-' and Vehid in "+session.getAttribute("VehList").toString()+" group by DriverID order by TripRating,KmTravelled desc";
//sql="select sum(RACount) as RAcount,sum(RDCount) as RDcount,sum(OSDuration) as OSDuration,DriverID,DriverName,OwnerName,Sum(KmTravelled) as Distance from t_completedjourney where StartDate>='"+data1+"' and EndDate<='"+data2+"' and JourneyCode <>'-'and (OwnerName LIKE '"+session.getAttribute("usertypevalue").toString()+"' OR GPName LIKE '"+session.getAttribute("usertypevalue").toString()+"') group by DriverID,DriverName,OwnerName order by DriverName asc";
//sql="SELECT sum( RACount ) AS RAcount, sum( RDCount ) AS RDcount, sum( OSDuration ) AS OSDuration, DriverID, DriverName, OwnerName, Sum( KmTravelled ) AS Distance FROM t_completedjourney WHERE StartDate >= '"+data1+"' AND StartDate <= '"+data2+"' AND (OwnerName LIKE '"+session.getAttribute("usertypevalue").toString()+"' OR GPName LIKE '"+session.getAttribute("usertypevalue").toString()+"') GROUP BY DriverID, DriverName, OwnerName ORDER BY DriverName ASC";
sql="SELECT sum( RACount ) AS RAcount, sum( RDCount ) AS RDcount, sum( OSDuration ) AS OSDuration, DriverID, DriverName, OwnerName, Sum( KmTravelled ) AS Distance FROM t_completedjourney WHERE StartDate >= '"+dt+"' AND StartDate <= '"+dt1+"' AND Vehid in "+session.getAttribute("VehList").toString()+"  GROUP BY DriverID, DriverName, OwnerName ORDER BY DriverName ASC";
System.out.println("main query:"+sql);

//sql="select sum(KmTravelled) as KmTravelled,sum(OSDuration) as OS,sum(RACount) as RA,sum(RDCount) as RD,count(distinct(TripID)) as Trips,count(distinct(DriverID)) as Driver,count(distinct(VehRegNo)) as VehRegNo, StartPlace from t_completedjourney where StartDate>='"+data+"' and StartDate<='"+data1+"' and (OwnerName LIKE '"+session.getAttribute("usertypevalue").toString()+"' OR GPName LIKE '"+session.getAttribute("usertypevalue").toString()+"') Group by StartPlace";

//System.out.println("SQL:::"+sql);
//sql="select distinct(Dcode), avg(Rating) as Rating ,sum(Distance) as Distance from t_driver_ds where TheDate >='"+data1+"' and TheDate <='"+data2+"' and distance > 0 and Jcode <>'-' group by Dcode order by Rating,Distance desc";
ResultSet rst=st2.executeQuery(sql);
int i=1;
while(rst.next())
{
	DriverIdlist=DriverIdlist+","+rst.getString("DriverID");
	dailyctr=0;
	weeklyctr=0;
	//VehCode=rst.getInt("Vehid");
	RAcount=rst.getInt("RAcount");
	//System.out.println("RACount::"+RAcount);
	RDcount=rst.getInt("RDCount");
	//System.out.println("RDCount::"+RDcount);
	OSduration=rst.getInt("OSDuration");
	//System.out.println("OSDuration::"+OSduration);
	DriverID=rst.getString("DriverID");
	//System.out.println("DriverID-----------------123--------------------------->" + DriverID);

	
	//System.out.println("DriverCode::"+DriverID);
	DriverName=rst.getString("DriverName");
	//System.out.println("DriverName::"+DriverName);
	Transporter=rst.getString("OwnerName");
	//System.out.println("Transporter::"+Transporter);
	//rating=rst.getDouble("Rating");
	distance=rst.getInt("Distance");
	//System.out.println("Distance::"+distance);
	
	%>
	<tr>
	<td class="bodyText"><div align="right"><%=i%></div></td>
	<td class="bodyText"><div align="left"><a href="driver_rating_by_date.jsp?DriverID=<%=rst.getString("DriverID")%>&DriverName=<%=rst.getString("DriverName")%>&data1=<%=data1%>&data2=<%=data2%>&Transporter=<%=rst.getString("OwnerName")%>"><%=DriverName%></a></div></td>
	<td class="bodyText"><div align="right"><%=DriverID%></div></td>
	<td class="bodyText"><div align="left"><%=Transporter%></div></td>
	<td class="bodyText"><div align="right"><%=OSduration%></div></td>
	<td class="bodyText"><div align="right"><%=RAcount%></div></td>
	<td class="bodyText"><div align="right"><%=RDcount%></div></td>
	<td class="bodyText"><div align="right"><%=distance%></div></td>
	
		<%	
	
		String str = "SELECT count(*) as count FROM `t_CastrolDrivers6` WHERE TheDte  BETWEEN '"+ data1 + "' AND '" + data2 + "' AND DrinHrs > 10 and DriverID = '" + DriverID + "'"; 
		//System.out.println(str);
		ResultSet myrst = st4.executeQuery(str);
		
		while(myrst.next()) {
		
			dailyctr=myrst.getInt("count");
			alldailyctr=alldailyctr+dailyctr;
			
		} 
		if(dailyctr>0)
		{
			%>	
			<!--  <td class="bodyText"><div align="right"><a href="Driver_violation_detail.jsp?DriverID=< %=DriverID%>&data1=< %=data1%>&data2=< %=data2%>&DriverName=< %=DriverName%>"> < %=dailyctr %> </a></div></td> -->
			<td class="bodyText"><div align="right"><a href="dailyviolation.jsp?DriverID=<%=DriverID%>&data1=<%=data1%>&data2=<%=data2%>&DriverName=<%=DriverName%>&thename=<%="started" %>"> <%=dailyctr %> </a></div></td>
		<%	
		}
		else
		{
			%>
			<td class="bodyText"><div align="right"><%=dailyctr %></div></td>
			 
		<%
		}
		
		String str1 = "SELECT count(*) as count FROM `t_CastrolDrivers6` WHERE TheDte  BETWEEN '"+ dt + "' AND '" + dt1 + "' AND LastWeekRDurInHrs > 60 and DriverID = '" + DriverID + "'"; 
		System.out.println(str1);
		ResultSet myrst1 = st5.executeQuery(str1);
		
		while(myrst1.next()) {
		
			weeklyctr=myrst1.getInt("count");
			allweeklyctr=allweeklyctr+weeklyctr;
		} 
		if(weeklyctr>0)
		{
			%>	
			 <!-- <td class="bodyText"><div align="right"><a href="Driver_violation_detail1.jsp?DriverID=< %=DriverID%>&data1=< %=data1%>&data2=< %=data2%>&DriverName=< %=DriverName%>">< %=weeklyctr %></a></div></td>-->
			 <td class="bodyText"><div align="right"><a href="weeklyhrsviolation.jsp?DriverID=<%=DriverID%>&data1=<%=data1%>&data2=<%=data2%>&DriverName=<%=DriverName%>&thename=<%="started" %>"><%=weeklyctr %></a></div></td>
		<%	
		}
		else
		{
			%>
			<td class="bodyText"><div align="right"><%=weeklyctr %></div></td>
			<%
			
		}
		%>
		<td class="bodyText"><div align="right">
	<%
	if(distance ==0)
	{
	out.print("NA");
	}
	else
	{
		rating=(((Double.valueOf(RAcount)/distance)*100)+((Double.valueOf(RDcount)/distance)*100)+((Double.valueOf(OSduration)/10/distance)*100));
		out.print(nf.format(rating));
	}
	
	%></div></td>
		
	</tr>
	<%
	i++;
	RAcnt=RAcnt+RAcount;
	//System.out.println("RACnt::::"+RAcnt);
	RDcnt=RDcnt+RDcount;
	//System.out.println("RDCnt::::"+RDcnt);
	OScnt=OScnt+OSduration;
	//System.out.println("OSCnt::::"+OScnt);
	Distcnt=Distcnt+distance;
	//System.out.println("Distcnt::::"+Distcnt);
	//ctr=ctr+d;
	//cntrate=cntrate+rating;
	
	}
DriverIdlist=DriverIdlist+")";
//System.out.println(DriverIdlist);
    ctr=(((Double.valueOf(RAcnt)/Distcnt)*100)+((Double.valueOf(RDcnt)/Distcnt)*100)+((Double.valueOf(OScnt)/10/Distcnt)*100));
    
	%>
	</tbody>
	<tr>
	<td class="bodyText"><div align="right"><b>Total</b></div></td>
	<td></td>
	<td></td>
	<td></td>
	<td class="bodyText"><div align="right"><b><%=OScnt%></b></div></td>
	<td class="bodyText"><div align="right"><b><%=RAcnt%></b></div></td>
	<td class="bodyText"><div align="right"><b><%=RDcnt%></b></div></td>
	<td class="bodyText"><div align="right"><b><%=Distcnt%></b></div></td>
	
	<%if(alldailyctr>0)
		{%>
		<!-- <td align="right"><div align="right"><a href="Drivinghrsviolation.jsp?fromdate=< %=fromdate%>&todate=< %=todate%>&thename=< %=thename%>"><font size="2">< %=rst99.getInt("count")%></font></a></div></td> -->
	<td class="bodyText"><div align="right"><a href="TotalDailyViolation.jsp?fromdate=<%=data1%>&todate=<%=data2%>&thename=<%="started"%>&driverlist=<%=DriverIdlist %>"><b><%=alldailyctr%></b></a></div></td>
	<%}
	else
	{
	%>
	<td class="bodyText"><div align="right"><b><%=0%></b></div></td>
	<%} %>
		<%if(allweeklyctr>0)
		{ %>
	<td class="bodyText"><div align="right"><a href="TotalWeeklyViolation.jsp?fromdate=<%=data1%>&todate=<%=data2%>&thename=<%="started"%>&driverlist=<%=DriverIdlist %>"><b><%=allweeklyctr%></b></a></div></td>
	<%}
	else
	{
	%>
	<td class="bodyText"><div align="right"><b><%=0%></b></div></td>
	<%} %>
	<td class="bodyText"><div align="right"><b><%=nf.format(ctr)%></b></div></td>
	</tr>
									<tfoot>
										<tr>
											<th>SR.</th>
											<th>Driver Name</th>
											<th>Driver Code</th>
											<th>Transporter</th>
											<th>OS Duration</th>
											<th>RA Count</th>
											<th>RD Count</th>
											<th>Distance</th>
											<th>Daily CD Violation</th>
											<th>Weekly CD Violation</th>
											<th>Rating</th>
										</tr>
									</tfoot>
						</table>
<%
}catch(Exception e)
{
	out.print("Exception -->"+ e);
}
finally
{
	try
	{
		conn1.close();
	}catch(Exception e)
	{}
	try
	{
		connnew.close();
	}catch(Exception e)
	{}
	
}
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
						<h4 class="modal-title">Driver Rating Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			//String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
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
								title: 'Driver Rating Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Driver Rating Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Driver Rating Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Driver Rating Report',
                                exportOptions: { columns: [<%=setSequence%> ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Driver Rating Report',
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
