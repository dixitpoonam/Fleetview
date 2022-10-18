
<%@page import="java.util.Date"%>

<%@page import="com.transworld.diary.springframework.UnitDaoSpringBeanImpl"%>
 <%@page import="sun.rmi.server.UnicastRef"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>

<!-- Included new header file -->
<%@ include file="headernew1.jsp"%>
<!-- Included new header file -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Include new css files start -->
<link rel="stylesheet" type="text/css" href="css/table/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="css/table/rowGroup.bootstrap5.min.css">
	<script src="js/datatable/feather.min.js"></script>
<!-- Include new css files end -->

<!-- Include new Js files start -->

 <script src="js/datatable/jquery.dataTables.min.js"></script>
 <script src="js/datatable/slick.js"></script>
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
   <!-- Include new js files end -->
   <style>
   #table-1 {
   width: "50%" ;
   float: left
   }
   
   #table-2 {
   width: "50%" ;
   float: right
   }
   </style>

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
        function myGeeks() { 
        
        	var val1=document.getElementById("stopcounter").value;
        	document.getElementById('sp1').innerHTML=val1;
        	
             var val2=document.getElementById("movcounter").value;
        	document.getElementById('mp1').innerHTML=val2;
        	var val3=document.getElementById("discounter").value;
           	document.getElementById('dp1').innerHTML=val3;
          	var val4=document.getElementById("mdcounter").value;
           	document.getElementById('mdp1').innerHTML=val4;
           	
        } 
    </script>

</head>


<body onLoad="ondemand()">

	<script type="text/javascript">

function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
	} else {
		popup.style.visibility = "hidden";
	}
}

function toggleDetails1(id, show)
{	
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
	} else {
		popupx.style.visibility = "hidden";
	}
}

function article(programName,width,height)
{
	var temp = "menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width="+width+",height="+height; 
	displayWindow=window.open(programName,"displayWindow",temp) ;
}

function fun(aa)
{
	document.searchform.h.value=aa.value;
}

</script>
<% 
java.util.Date NewDate =new java.util.Date();

long dateMillis = NewDate.getTime();
long dayInMillis = 1000 * 60 * 60 *24;
dateMillis = dateMillis - dayInMillis;
NewDate.setTime(dateMillis);
Format NewFormatter = new SimpleDateFormat("yyyy-MM-dd");
Format NewFormatter1 = new SimpleDateFormat("dd-MMM-yyyy");
String data22 = NewFormatter.format(NewDate);
String data44 = NewFormatter1.format(NewDate);
long dayInMills1=14000*60*60*24;
NewDate.setTime(dateMillis-dayInMills1);
String data11 = NewFormatter.format(NewDate);
System.out.println("data11 >>"+data11);
System.out.println("data22 >>"+data22);
System.out.println("dateMillis >>"+dateMillis);

%>


<%! 
Connection conn,conn1;
String data1,sql,sql1,data2,jcode,origin,destination,startdate;
Statement stt,st,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12,st13,st15,st16,st17,st18,st19,st20,st21,st22;
%>

<%!

private String getFromDate() {
	
	String fromdate = "";
	final String sdate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	try {
		fromdate = new SimpleDateFormat("yyyy-MM-dd").format(
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate1));
	} catch (Exception e) {
		try{
			fromdate = new SimpleDateFormat("yyyy-MM-dd").format(
							new SimpleDateFormat("yyyy-MM-dd").parse(sdate1));
		}catch(Exception e1){
		}
	}
	return fromdate;
}

private String getToDate() {

	String todate = "";
	final String sdate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	try {
		todate = new SimpleDateFormat("yyyy-MM-dd").format(
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(sdate1));
	} catch (Exception e) {
		try{
			todate = new SimpleDateFormat("yyyy-MM-dd").format(
						new SimpleDateFormat("yyyy-MM-dd").parse(sdate1));
		}catch(Exception e1){				
		}
	}
	return todate;
}

private String getFromTimeHrs() {
	return "00";
}

private String getFromTimeMins() {
	return "00";
}

private String getToTimeHrs() {
	return "23";
}

private String getToTimeMins() {
	return "59";
}

private String getTripStartDate(final String datetime) {
	String fromdate="";
	//System.out.println("datetime--------->"+datetime);
	if("-".equalsIgnoreCase(datetime)){
		return datetime;
	}
	try {
		fromdate = new SimpleDateFormat("yyyy-MM-dd").format(
					new SimpleDateFormat("dd-MMM-yyyy").parse(datetime));
	} catch (Exception e) {
		try{
			fromdate = new SimpleDateFormat("yyyy-MM-dd").format(
						new SimpleDateFormat("dd-MMM-yyyy").parse(datetime));
		}catch(Exception e1){
			e1.printStackTrace();
		}
	}
	return fromdate;
}

private String getTripEndDate(final String datetime) {
	String todate = "";
	if("-".equalsIgnoreCase(datetime)){
		return datetime;
	}
	try {
		todate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	} catch (Exception e) {
	}
	return todate;
}

private String getTripStartTimeHrs(final String datetime) {
	String ftime1 = "00";
	try {
		java.util.Date dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
		ftime1 = new SimpleDateFormat("HH").format(dt);
	} catch (Exception e) {
	}
	return ftime1;
}

private String getTripStartTimeMins(final String datetime) {
	String ftime2 = "00";
	try {
		java.util.Date dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
		ftime2 = new SimpleDateFormat("mm").format(dt);
	} catch (Exception e) {
	}
	return ftime2;
}

private String getTripStartTimesec(final String datetime) {
	String ftime3 = "00";
	try {
		java.util.Date dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime);
		ftime3 = new SimpleDateFormat("ss").format(dt);
	} catch (Exception e) {
	}
	return ftime3;
}

private String getTripEndTimeHrs(final String datetime) {
	String ttime1 = "23";
	try {
		ttime1 = new SimpleDateFormat("HH").format(new java.util.Date());
	} catch (Exception e) {
	}
	return ttime1;
}

private String getTripEndTimeMins(final String datetime) {
	String ttime1 = "59";
	try {
		ttime1 = new SimpleDateFormat("mm").format(new java.util.Date());
	} catch (Exception e) {
	}
	return ttime1;
}

private String getTripEndTimesec(final String datetime) {
	String ttime1 = "59";
	try {
		ttime1 = new SimpleDateFormat("ss").format(new java.util.Date());
	} catch (Exception e) {
	}
	return ttime1;
}

private boolean isOSTodayZero(String osToday) {
	try{
		if (Integer.parseInt(osToday) > 0) {
			return true;
		}
	}catch(Exception e) {
	}
	return false;
}

private String getfuelAlert_AddedTodayDate() {
	String today = "", prevDay = "";
	Calendar cal;
	DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
	cal = Calendar.getInstance();
	today = dateFormat.format(cal.getTime());
	return today;

}

private String getfuelAlert_AddedPreviousDate() {
	String today = "", prevDay = "";
	Calendar cal;
	DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

	cal = Calendar.getInstance();
	today = dateFormat.format(cal.getTime());

	cal.add(Calendar.DATE, -1);
	prevDay = dateFormat.format(cal.getTime());

	return prevDay;

}
%>
<%

Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
stt=conn1.createStatement();
st=conn1.createStatement();
st1=conn1.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
st4=conn1.createStatement();
st5=conn1.createStatement();
st6=conn1.createStatement();
st7=conn1.createStatement();
st8=conn1.createStatement();
st9=conn1.createStatement();
st10=conn1.createStatement();
st11=conn1.createStatement();
st12=conn1.createStatement();
st13=conn1.createStatement();st15=conn1.createStatement();
Statement st14=conn1.createStatement();st16=conn1.createStatement();st17=conn1.createStatement();st18=conn1.createStatement();
st19=conn1.createStatement();
st20=conn1.createStatement();
st21=conn1.createStatement();st22=conn1.createStatement();
ResultSet rs = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
ResultSet rs5 = null;
ResultSet rs7 = null;
ResultSet rs6 = null;
ResultSet rs8 = null;
ResultSet rs9 = null;
String Veh="";
String VehType="";
String vehstatus="";
String UnitID="";
String UserName="";
String UserNo="";
String Group="";
String Updated="";
String Transporter="";
String TripId="";
String TripViolation="";
String DriverName="";
String DriverCode="";
String TripOrigin="";
String StartDate="";
String TripDestination="";
String ETA="";
String Location="";
String Ignition="";
String Speed="";
String StoppedSince=""; String timestop="";
String OSToday="";
String RAToday="";
String RDToday="";String rowbgcolor="";
double DistanceToday=0;
double DistanceThisMonth=0;
String Sen1="";
String Sen2="";
String Sen3="";
String Sen4="";
String Sen6="";
String Sen7="";
String Sen8="";
String Sen9="";
String EngineStatus="";
String Batterycharging="";
String BatteryDate="";
String username="";String spcomment="";
int srno=1;
String vehid="";String rid="";int stopcounter=0; int movcounter=0;int discounter=0;int mdcounter=0;
String vehlist = session.getAttribute("VehList").toString();
System.out.println("vehlist is:-" + vehlist);
String TypeofUser = session.getAttribute("TypeofUser").toString();
System.out.println("TypeofUserrrr:-" + TypeofUser);
username=(String)session.getAttribute("usertypevalue");

final String userTypeValue = session.getAttribute("usertypevalue").toString();
final String typeOfUser1 = session.getAttribute("mainuser").toString();
System.out.println("User ::  "+username);
String Lat="";String Lon="";
String FirstDayMonth="";String stime="";
String StDate="";String EDate="";String hh="";String mm="";String ss="";String ehh="";String emm="";String ess="";String plannedstatus = "No";
String prevdayavg="";String avgofmonth="";String todayfuel="";String yesterdayfuel="";
double monthfuelavg=0;
double yestfuelavg=0;
String briefid="";NumberFormat formatter = new DecimalFormat("#0.00"); 

int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

//digits no date-right side   varchar left  constant center
String dat="select DATE_FORMAT(DATE(NOW()),'%Y-%m-01') as First,Month(NOW()) as Month,YEAR (DATE(NOW())) As Year";
ResultSet rsdat=st13.executeQuery(dat);
if(rsdat.next())
{
	FirstDayMonth=rsdat.getString("First");
}
 
 
 System.out.println("Date:-"+FirstDayMonth);
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

					
<!-- Included new html code start -->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Current Status</h2>
					</div>
				</div>
			</div>
			
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
						<!-- <a href="#" class="engage-purchase-link btn  btn-success h-35px  btn-color-gray-700 btn-active-color-gray-900  shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#myModal">#code</a> -->
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
			
			
		<button id="SetCustom" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
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
		
<table style="width:50%">
	<tr>
		<td><div class="box" style="background-color: #CCFFCC; " align="right"><font color="#CCFFCC">----</font></div></td>
		<td><a href="moving.jsp">Moving</a></td>
		
		<td><div class="box" style="background-color: #FFFFCC;" align="right"><font color="#FFFFCC">----</font></div></td>
		<td><a href="stopped.jsp">Stopped</a></td>
		
		<td><div class="box" style="background-color: #FFFFFF;" align="right"><font color="#FFFFFF">----</font></div></td>
		<td><a href="activeTrips.jsp">Active Trips</a></td>
		
		<td><div class="box" style="background-color: #DCDCDC;" align="right"><font color="#DCDCDC">----</font></div></td>
		<td><a href="disconnected.jsp">Disconnected</a></td>
		
		<td><div class="box" style="background-color: #FFC475;" align="right"><font color="#FFC475">----</font></div></td>
		<td><a href="maindisconnected.jsp">Main Disconnected</a></td>
		
		<td><div class="box" style="background-color: #FFFFFF;" align="right"><font color="#FFFFFF">----</font></div></td>
		<td><a href="notactive.jsp"> InActive</a></td>
		
	</tr>
</table>
<br>
<br>
		

  
		<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
										<tr>
											<th>SrNo</th>
											<th>Asset ID</th>
											<th align="center" style="display: none">Asset ID(E)</th>
											<th>Asset Type</th>
											<th>UnitID</th>
											<th>User Name</th>
											<th>User Contact</th>
											<th>Group</th>
											<th>Updated</th>
											<th>Owner</th>
											<th>Trip Id</th>
											<th align="center" style="display: none">Trip Id(E)</th>
											<!-- <th>Trip Violation</th> -->
											<th>Driver Name(Code)</th>
											<th>Trip Origin</th>
											<th>Start Date</th>
											<th>Trip Destination</th>
											<th>ETA</th>
											<th>Location</th>
											<th>Ignition</th>
											<th>Speed</th>
											<th>Stopped Since (HH:mm)</th>
											<th>OS Today</th>
											<th>RA Today</th>
											<th>RD Today</th>
											<th>Distance Today</th>
											<th>Distance This Month</th>
											<th>Previous Day Avg.</th>
											<th>Avg. This Month</th>
											<th>Fuel</th>
											<th>Fuel Alert</th>
											<th>Yesterday's Fuel Added</th>
											<th>Day Shift Driver</th>
											<th>Night Shift Driver</th>
											<th>Sen1</th>
											<th>Sen2</th>
											<th>Sen3</th>
											<th>Sen4</th>
											<th>Sen6</th>
											<th>Sen7</th>
											<th>Sen8</th>
											<th>Sen9</th>
											<th>Engine Status</th>
											<th>Battery Charging</th>
											<th>Battery Date</th>
										</tr>
									</thead>
									<tbody>
									<%
		
		//String query1="select * from  db_gps.t_vehicledetails  where VehicleCode in "+vehlist+"";
		String query1="select distinct(a.vehiclecode) as VehicleCode,a.status,b.thedate,b.thetime,b.UnitID,b.Transporter,b.Location,b.TheSpeed,b.EngineStatus,b.bcharging,b.bdatetime,a.VehicleRegNumber,a.vehtype from  db_gps.t_vehicledetails  a , db_gps.t_onlinedata b where a.vehiclecode=b.Vehiclecode and a.VehicleCode in "+vehlist+" order by thedate desc,thetime desc";
		rs=st.executeQuery(query1);
		String linkdate="";int datediff=0;
		while(rs.next())
		{
			Veh=rs.getString("VehicleRegNumber");
			vehstatus=rs.getString("status");
			VehType=rs.getString("vehtype");
		    vehid=rs.getString("VehicleCode");
		
		    UnitID=rs.getString("UnitID");
	    	Updated=rs.getString("TheDate")+" "+rs.getString("TheTime");
	    	linkdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
	    	        .format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	    	                .parse(Updated));
	    	Transporter=rs.getString("Transporter");
	    	Location=rs.getString("Location");
	    	Speed=rs.getString("TheSpeed");
	    	EngineStatus=rs.getString("EngineStatus");
	    	Batterycharging=rs.getString("bcharging");
	    	BatteryDate=rs.getString("bdatetime");
	    	
String queryw="SELECT DATEDIFF(now(), '"+Updated+"') AS 'Result'";
System.out.println("Querywwwww:-"+queryw);
ResultSet r=st3.executeQuery(queryw);
	    	if(r.next())
	    	{
	    		datediff=r.getInt("Result");
	    		

	    	
    			    		
	    	}	
	    	
	    	if(EngineStatus.equals("0") || EngineStatus.equals("1"))
	    	{
	    		EngineStatus=rs.getString("EngineStatus");
	    	}else
	    	{
	    		EngineStatus="-";
	    	}
      	
		    String query2="select GPName  from db_gps.t_group where VehCode='"+vehid+"' and active='Yes' order by UpdatedDatetime desc limit 1;";
		    rs2=st2.executeQuery(query2);
		    if(rs2.next())
		    {
		    Group=rs2.getString("GPName");
		    	
		    }
		    /* String query3="select * from db_gps.t_onlinedata where VehicleCode='"+vehid+"'  ORDER BY TheDate desc,TheTime DESC";
		    
		    System.out.println("ON Line Data :- "+query3);
		    
		    rs3=st3.executeQuery(query3);
		    if(rs3.next())
		    {
		    	
		    	UnitID=rs3.getString("UnitID");
		    	Updated=rs3.getString("TheDate")+" "+rs3.getString("TheTime");
		    	
		    	Transporter=rs3.getString("Transporter");
		    	Location=rs3.getString("Location");
		    	Speed=rs3.getString("TheSpeed");
		    	EngineStatus=rs3.getString("EngineStatus");
		    	Batterycharging=rs3.getString("bcharging");
		    	BatteryDate=rs3.getString("bdatetime");
		    	
		    	if(EngineStatus.equals("0") || EngineStatus.equals("1"))
		    	{
		    		EngineStatus=rs3.getString("EngineStatus");
		    	}else
		    	{
		    		EngineStatus="-";
		    	}
	      	}
		    else{
		    	EngineStatus="-";
		    	Batterycharging="-";
		    	BatteryDate="-";
		    } */
		String query4="select * from db_gps.t_startedjourney where vehid='"+vehid+"' and JStatus='Running' order by StartDate desc ,StartTime desc limit 1";
		    System.out.println("Started Jpurney Qery:---"+query4);
		    rs4=st4.executeQuery(query4);
		    if(rs4.next())
		    {
		    	TripId=rs4.getString("TripID");
		        TripOrigin=	rs4.getString("StartPlace");
		        TripDestination=rs4.getString("EndPlace");
		        ETA=rs4.getString("ETA");
		        if(ETA=="NULL"||ETA==null||ETA.equalsIgnoreCase("NULL")||ETA.equalsIgnoreCase(""))
		        {
		        	
		        	ETA="0000-00-00 00:00:00";
		        	
		        	
		        }
		        else 
		        {
		        	
		        	
		        	ETA=ETA.substring(0, 19);
		
		        	EDate=ETA.substring(0, 10);
		
		        	ehh=ETA.substring(11, 13);
		        	
		        	emm=ETA.substring(14, 16);
		        	
		        	ess=ETA.substring(17, 19);
		        	
		        }
		        
		        
		        StartDate=rs4.getString("StartDate");
		        StDate=rs4.getString("StartDate");
		        stime=rs4.getString("StartTime");
		        
		        hh=stime.substring(0,2);
		        
		        mm=stime.substring(3,5);
		        
		        ss=stime.substring(6,8);
		        
		        
		        
		        DriverName=rs4.getString("DriverName");
		        rid=rs4.getString("rid");
		        DriverCode=rs4.getString("DriverCode");
		        DriverName=DriverName+"("+DriverCode+")";
		        
	      	}
			else{
				TripId="-";
				TripOrigin="-";
				TripDestination="-";
				ETA="";
				StartDate="-";
				StDate="0000-00-00 00:00:00";
				}
		    
		    String query5=" select count(*) as oscount from  db_gpsExceptions.t_vehall_overspeed where Vehcode ='"+vehid+"' and  violationstatus='Open' AND Date(FromDatetime)=Date(now())";

		    		rs5=st5.executeQuery(query5);
		    if(rs5.next())
		    {
		    OSToday=rs5.getString("oscount");
		    	
	      	}
			String query6="select count(*) as racount from  db_gpsExceptions.t_vehall_ra where Vehcode='"+vehid+"' and  violationstatus='Open' AND Date(TheDatetime)=Date(now()) ";
			rs6=st6.executeQuery(query6);
		    if(rs6.next())
		    {
		    RAToday=rs6.getString("racount");
		    	
	      	}
		    String query7="select count(*) as rdcount  from db_gpsExceptions.t_vehall_rd  where Vehcode = '"+vehid+"' AND violationstatus='Open' AND Date(TheDatetime)=Date(now())";
		    rs7=st7.executeQuery(query7);
		    if(rs7.next())
		    {
		    RDToday=rs7.getString("rdcount");
		    	
	      	}
		    
		    
		    //Moving
		     //String query8="select count( * ) as Diccount from db_gps.t_disconnectionData where vehicleCode='"+vehid+"' AND Duration>='0:30' and Reason ='Disconnection' and ignoredstamp='no' and violationstatus ='open' and updateDateTime =Date(now()) ;";
		     String query8="select (select CDistance from db_gps.t_veh"+vehid+" where TheFiledTextFileName in ('SI','ON','OF','ST','SP') and Thefielddatadate=DATE(now()) order by Thefielddatadatetime asc limit 1) as 'first' , (select CDistance from db_gps.t_veh"+vehid+" where TheFiledTextFileName in ('SI','ON','OF','ST','SP') and Thefielddatadate=DATE(now()) order by Thefielddatadatetime desc limit 1) as 'Last' from db_gps.t_veh"+vehid+" limit 1 ";
		    rs8=st8.executeQuery(query8);
            if(rs8.next())
		    {
		   // DistanceToday=rs8.getString("Diccount");
		   
		    DistanceToday=rs8.getDouble("last")-rs8.getDouble("first");
		    
	      	}
		    else{
		    	DistanceToday=0;	
		    }
		    
		    String query9="select * from db_gps.t_veh"+vehid+" where thefielddatadate =Date(now()) and  TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by thefielddatadatetime desc limit 1";
		    System.out.println("Queryyyyyy For Color:-"+query9);
            rs9=st9.executeQuery(query9);
		    String speedcolor="";
		    
		    if(rs9.next())
		    {
		    Sen1=rs9.getString("Sen1");
		    Sen2=rs9.getString("Sen2");
		    Sen3=rs9.getString("Sen3");
		    Sen4=rs9.getString("Sen4");
		    Sen6=rs9.getString("Sen6");
Sen7=rs9.getString("Sen7");
Sen8=rs9.getString("Sen8");
Sen9=rs9.getString("Sen9");
		    Ignition=rs9.getString("Sen5");
		    Lat=rs9.getString("Latitude");
		    Lon=rs9.getString("Longitude");
		    speedcolor=rs9.getString("speed");
		    
		    System.out.println("SPeeddddddddddd:-"+speedcolor);
	      	}
		    else
		    {
		    	Sen1="xxxx";
			    Sen2="xxxx";
			    Sen3="xxxx";
			    Sen4="xxxx";
			    Sen6="-";
Sen7="-";
Sen8="-";
Sen9="-";
			    Ignition="-";
			    //EngineStatus="-";
			    Lat="-";
			    Lon="-";
			    speedcolor="0";
		    }
		    
		    
		    
		  
		    
		    
		    String query10="Select * from db_gps.t_userdetails where vehid='"+vehid+"'";
			   ResultSet rs10=st10.executeQuery(query10);
			   if(rs10.next())
			   {
				   UserName=rs10.getString("FirstName")+" "+rs10.getString("LastName");
				   UserNo=rs10.getString("MobNo");
				  
			   }
			   else
			   {
				   UserName="-";
				   UserNo="-";
				   
			   }
  		    String query11="select Sum(Distance) as aldist,VehCode from db_gpsExceptions.t_vehall_ds where  thedate>= '"+FirstDayMonth+"' and thedate<='Date(now())' and VehCode='"+vehid+"'";
		    
		    ResultSet rs11=st11.executeQuery(query11);
			   if(rs11.next())
			   {
				   DistanceThisMonth=rs11.getDouble("aldist");
				   System.out.println("Disssss"+DistanceThisMonth);
				  		  }
			   else
			   {
				   DistanceThisMonth=0;
				   
				   
			   }
			   String DataDate=Updated;
			   
			   /* DataDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				        .format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
				                .parse(DataDate)); */
			   
			   if(username.equals("Al Rama"))
				{
				String IgnData="select * from db_gps.t_veh"+vehid+" where Thefielddatadatetime >=DATE_SUB(NOW(), INTERVAL 2 HOUR) and  Thefielddatadatetime <='"+DataDate+"' order by Thefielddatadatetime desc limit 1";
				ResultSet rsIgnData=st12.executeQuery(IgnData);
				
				
				
				int INGStatus=0;
				String ENGStatus="";
				if(rsIgnData.next())
				{
					INGStatus=rsIgnData.getInt("EngineStatus");
					if(INGStatus==0)
					{
						EngineStatus="OFF";
					}else if(INGStatus==1){
						
						EngineStatus="ON";
					}else{
						EngineStatus="OFF";
					}
					
				}
				else
				{
					EngineStatus="OFF";
				
				}
				
				
				
				}
				        
				                
				                if(speedcolor.equalsIgnoreCase("0")||speedcolor.equalsIgnoreCase("0.00"))
				    		    {
				    		    	rowbgcolor="#FFFFCC";
			
				    		    	if(Batterycharging.equalsIgnoreCase("OFF"))
				    		    	{
				    		    		rowbgcolor="#FFC475";
				    		    		mdcounter++;				    		    }
				    		    	
				    		    	
				    		    	   if(datediff>7)
						    	    	{
						    	    			rowbgcolor="#DCDCDC";
						    	    			discounter++;
						    	    			
						    	    	}
					    		    	stopcounter++;	    		    	
				    		    }	
				    		    else{
				    		    	
				    		    	rowbgcolor="#CCFFCC";
				    		    	movcounter++;
				    		    	
				    		    }
				    		    
				    		 
				    		    
				    		    String stopsince="select Thefielddatadatetime,TheFiledTextFileName,Speed,TheFieldSubject from db_gps.t_veh"+vehid+" where TheFieldDataDate=DATE(now()) and (TheFiledTextFileName='SI' or TheFiledTextFileName='SP') and speed!=0 order by Thefielddatadatetime desc limit 1";
								ResultSet rs13=st14.executeQuery(stopsince);
								System.out.println("Query StopSince:---"+stopsince);
								if(rs13.next())
									
								{
									timestop=rs13.getString("Thefielddatadatetime");
									String sq="select time_format(SUM(abs(timediff('"+timestop+"',now() ))),'%H:%i') as SUM ";
									ResultSet rsn=st14.executeQuery(sq);
									if(rsn.next())
									{
										StoppedSince=rsn.getString("SUM");
									}
									
								
									}
								else
								{
									StoppedSince="-";
								}
								
								
								String querysp="SELECT spc.entdatetime,spc.vehregno,spc.spcomment FROM db_CustomerComplaints.t_techspecialrep spc  INNER JOIN  (  SELECT Max(entdatetime) as entdatetime, spcomment,visibleInFleetview,cmmt_type,Closed, vehregno  FROM db_CustomerComplaints.t_techspecialrep  WHERE visibleInFleetview='Yes'   AND cmmt_type = 'vehicle'  AND Closed = 'No'  and vehregno like '%"+Veh+"%' and VehId='"+vehid+"' GROUP BY vehregno  ) spcd ON (spc.VehRegNo= spcd.VehRegNo AND spc.entdatetime=spcd.entdatetime) order by spc.entdatetime desc limit 1 ";;
								
								String  sdt="";
								ResultSet rssp=st15.executeQuery(querysp);
								if(rssp.next())
								{			
									
									
										spcomment=rssp.getString("SpComment");
										
									

								}	
								else {
									
									spcomment="";
								}
								
								String fuelquery="select  (select IF(sum(Litres) IS NULL or sum(Litres) = '', '0', sum(Litres) ) as eLiters from  db_gps.t_fuelinfo where vehcode='"+vehid+"'and DATE(TheDateTime)=date(DATE_SUB(NOW(), INTERVAL 1 DAY)) group by vehcode ) as Yesterday ,(select IF(sum(Litres) IS NULL or sum(Litres) = '' , '0', sum(Litres) ) as eLiters from  db_gps.t_fuelinfo where vehcode='"+vehid+"' and DATE(TheDateTime)=date(now()) group by vehcode  ) as Today,(select IF(sum(Litres) IS NULL or sum(Litres) = '', '0', sum(Litres) ) as eLiters from  db_gps.t_fuelinfo where vehcode='" +vehid+ "' and DATE(TheDateTime)>=date(DATE_SUB(NOW(), INTERVAL 1 Month)) group by vehcode )/30 as Month from db_gps.t_fuelinfo limit 1";
								ResultSet frs=st19.executeQuery(fuelquery);
								                                if(frs.next())
                                {
                                	todayfuel=frs.getString("Today");
                                	yesterdayfuel=frs.getString("Yesterday");
                                	
                                }	
                                if(todayfuel=="NULL"||todayfuel==null||todayfuel.equalsIgnoreCase("NULL")||todayfuel.equalsIgnoreCase(""))
                		        {
                		                	todayfuel="NA";
                               }
                                if(yesterdayfuel=="NULL"||yesterdayfuel==null||yesterdayfuel.equalsIgnoreCase("NULL")||yesterdayfuel.equalsIgnoreCase(""))
                		        {
                                	yesterdayfuel="NA";
                               }
                                String Idlecomment, VehComment, otherComment, currentDate2;
                                Idlecomment="";
                                String queryidel="select VehComment, otherComment from  db_gps.t_VehicleIdleEntry   where ActiveStatus='-' and  VehCode='"+vehid+"' and toDate>=date(now()) and ActiveStatus='-' ";
                                ResultSet rstComment=st22.executeQuery(queryidel);
                                
                                System.out.println("IdleeeeeeeeeeQuery"+queryidel);        						
                                while(rstComment.next())
        						{
        							VehComment=rstComment.getString("VehComment");
        							otherComment=rstComment.getString("otherComment"); 
        							System.out.println("VehComment:---"+VehComment);
        							if(!VehComment.equals("Other"))  
        							{
        								Idlecomment=VehComment;
        							}
        							else
        							{
        							Idlecomment=otherComment;
        							}
        						}
                                
                                String DeviceStatus="",color="";
                                if(vehstatus.equalsIgnoreCase("Removed"))
                                {
                                	DeviceStatus="Device Removed";
                                	color="Green";
                                }
                                else if(vehstatus.equalsIgnoreCase("Missing"))
                                {
                                	DeviceStatus="Device Missing";
                                }else if(vehstatus.equalsIgnoreCase("DeActivated"))
                                {
                                	DeviceStatus="Device DeActivated";
                                }else if(datediff>7)
                        		{
                        			DeviceStatus="Device Disconnected";
                        			color="Red";
                        		}
                             
		%>
		
		
		<%-- <tr background="<%=rowbgcolor%>"> --%>
		<tr style="background-color:  <%=rowbgcolor%>;">
		<td style="text-align:right;background-color:<%=rowbgcolor%>; "><%=srno %></td>
				<td WIDTH="6%"
				style="text-align:left;"><a
				href="javascript:toggleDetails(<%=srno%>,true);"
				title="Click To See the Reports"><font size="2"><%=Veh%></font></a>

				<div class="popup" id="popup<%=srno%>" style="visibility:hidden;position:absolute;background-color:white; opacity:1">
					<table border="1">
						<tr>
							<td><a href="CustomReportDrillDown.jsp?vehcode=<%=vehid%>&data=24hrs&data1=24hrs" onclick="toggleDetails(<%=srno%>,false)">Report For Last 24 Hours </a></td>
						</tr>
						<tr>
							<td><a href="CustomReportDrillDown.jsp?vehcode=<%=vehid%>&data=48hrs&data1=48hrs" onclick="toggleDetails(<%=srno%>,false)">Report For Last 48 Hours </a></td>
						</tr>
						<tr>
							<td><a href="CustomReportDrillDown.jsp?vehcode=<%=vehid%>&data=<%=session.getAttribute("7DaysBack").toString().substring(0,11)%>&data1=<%=data22%>" onclick="toggleDetails(<%=srno%>,false)">Report For Last 7 Days</a></td>
						</tr>
						<tr>
							<td><a
								href="CustomReportDrillDown.jsp?vehcode=<%=vehid%>&data=<%=data11%>&data1=<%=data22%>"
								onclick="toggleDetails(<%=srno%>,false);">Report For Last 15
									Days </a></td>
						</tr>

						<tr>
							<td><a
								href="ShowCustomReportonTWMap.jsp?tripid=null&vehcode=<%=vehid%>&data=<%=getFromDate()%>&data1=<%=getToDate()%>&ftime1=<%=getFromTimeHrs()%>&ftime2=<%=getFromTimeMins()%>&ttime1=<%=getToTimeHrs()%>&ttime2=<%=getToTimeMins()%>"
								onclick="toggleDetails(<%=srno%>,false);">Today's Journey On
									Map </a></td>
						</tr>
						<tr>
							<td><a
								href="hourly_detail_report.jsp?vehcode=<%=vehid%>&h1=no"
								onclick="toggleDetails(<%=srno%>,false);">Hourly Report </a></td>
						</tr>
						<tr>
							<td><a
								href="detail_custom_report.jsp?vehcode=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">Custom Detail Report
							</a></td>

						</tr>

						<tr>
							<td><a
								href="customdetailfirst.jsp?vehcode2=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">New Custom Detail
									Report(Beta) </a></td>
						</tr>



						<%
		   	if(userTypeValue == "Rajlaxmi" || userTypeValue.equalsIgnoreCase("Rajlaxmi") || userTypeValue == "RK Transport" || userTypeValue.equalsIgnoreCase("RK Transport"))
		   	{
		   		%>
						<tr>
							<td><a
								href="detail_custom_report_bk.jsp?vehcode=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">Custom Detail Report
									- Backup</a></td>
						</tr>
						<%
		   	}
		   	if(typeOfUser1=="suman_mishra@praxair.com" ||  typeOfUser1.equalsIgnoreCase("suman_mishra@praxair.com"))
		   	{
		   	%>
						<tr>
							<td><a
								href="repunit.jsp?vid=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">Unit Replace </a></td>
						</tr>
						<%
		   	}%>
		   	
		   	


						<tr>
							<td><a
								href="tempdetailreport.jsp?vehcode=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">Temperature and Humidity Report </a></td>
						</tr>
				

						<tr>
							<td><a
								href="humiditydetailreport.jsp?vehcode=<%=vehid%>"
								onclick="toggleDetails(<%=srno%>,false);">Sensor Report </a></td>
						</tr>

						<tr>
							<td><a href="javascript: flase;"
								onclick="window.open('CameraInspectionForm.jsp?vehcode=<%=vehid%>','mywindow','width=700, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');  javascript:toggleDetails1(<%=srno%>,false);">Camera
									Inspection </a></td>
						</tr>
						<tr>
							<td><a href="javascript: flase;"
								onclick="window.open('DriverChangeForm.jsp?vehcode=<%=vehid%>&b=<%=Veh%>','mywindow','width=700, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');  javascript:toggleDetails1(<%=srno%>,false);">Change
									Driver</a></td>
						</tr>

                      
						<tr>
							<td><a
								href="EmpNameEditNew.jsp?vehcode=<%=vehid%>&pagename=<%=PageName %>"
								onclick="toggleDetails(<%=srno%>,false);">Edit User Details </a></td>
						</tr>
						
                     <%if(Veh.contains("Dummy")||(Veh.contains("dummy"))){ %> 
                            <tr>
							<td><a href="javascript: flase;"
								onclick="window.open('VehChangeForm.jsp?vehcode=<%=vehid%>&Veh=<%=Veh%>&Owner=<%=Transporter%>','mywindow','width=700, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');  javascript:toggleDetails1(<%=srno%>,false);">Change
									Vehicle </a></td>
						</tr>
						<%} %> 
						<tr>
							<td><a href="javascript:toggleDetails(<%=srno%>,false);">Close
							</a></td>
						</tr>
					</table>
				</div></td>
				<td style="text-align: left; display: none"><%=Veh%></td>
				
		<td style="text-align:left;"><%=VehType%></td>							
		<td style="text-align:right;"><%=UnitID %></td>
		<td style="text-align:left;"><%=UserName %></td>
		<td style="text-align:right;"><%=UserNo%></td>
		<td style="text-align:left;"><%=Group %></td>
		<td style="text-align:right;"><%=Updated %></td>
		<td style="text-align:left;"><%=Transporter %></td>
	<%-- 	<td><%=TripId %></td> --%>
		<td WIDTH="6%" id="tdd<%=srno%>"
				style="text-align:right;">
				<% if(TripId.equals("-")){
	
				
				
				%>
				<a
				href="TripStart.jsp?vehno=<%=Veh%>&vehtype=<%=VehType%>" onclick="toggleDetails1(<%=srno%>,false);">Enter Trip</a>
				
				
		<%		 
				}
			 else{%> <a href="javascript:toggleDetails1(<%=srno%>,true);"
				title="Click To See the Reports"><font size="2"> <%=TripId%></font></a>
				<% }%>
				<div class="popup" id="popupx<%=srno%>" style="visibility:hidden;position:absolute;background-color:white; opacity:1">
					<table border="1">
						<tr>
							<td><a
								href="ActAndPlanJrnyCompOnMap.jsp?tripid=<%=TripId%>
										&vehcode=<%=vehid%>
										&data=<%=StDate%>
										&data1=<%=EDate%>
										&ftime1=<%=hh%>
										&ftime2=<%=mm%>
										&ftime3=<%=ss%>
										&ttime1=<%=ehh%>
										&ttime2=<%=emm%>
										&ttime3=<%=ess%>
										&pg=st&pstatus=<%=plannedstatus %>&brifid=<%=briefid %>&rid=<%=rid %>
										&driverid=<%=DriverCode %>"
								onclick="toggleDetails1(<%=srno%>,false);">Show Trip on Map </a></td>
						</tr>

						<%-- <%



				if (currentRecord.isTripEditable()) {
%>	 --%>
						<tr>
							<td><a
								href="edittrip.jsp?vehno=<%=vehid%>
				   							&ReportDateTime=<%=StDate+" "+hh+":"+mm+":"+ss %>
				   							&strloc=<%=TripOrigin%>
				   							&strdate=<%=StDate%>
				   							&StartTime=<%=hh+":"+mm+":"+ss %>
				   							&ETA=<%=ETA%>
				   							&endp=<%=TripDestination%>
				   							&driverid=<%=DriverCode%>
				   							&drivern=<%=DriverName%>
				   							&tripid=<%=TripId%>"
								onclick="toggleDetails1(<%=srno%>,false);">Edit Trip </a></td>
						</tr>
						<tr>
							<td><a href="javascript:toggleDetails1(<%=srno%>,true);"
								onclick="javascript:window.open ('via_point_report.jsp?vehcode=<%=vehid%>&tripid=<%=TripId%>','win3','scrollbars=1,resizeable=0,width=500,height=500');";>Via
									Point</a></td>
						</tr>
						
						<tr>
							<td><a href="javascript:toggleDetails1(<%=srno%>,true);"
								onclick="javascript:window.open ('CancelTrip.jsp?vehno=<%=Veh%>&tripid=<%=TripId%>','win3','scrollbars=1,resizeable=0,width=500,height=500');";>Cancel
									Trip</a></td>
						</tr>

						<%
				//}
String pageflag="currentposition";
%>
						<tr>
							<td><a href="javascript: flase;"
								onClick="window.open ('endtrip.jsp?tripid=<%=TripId%>&vehcode=<%=vehid%>&vehno=<%=Veh%>&pageflag=<%=pageflag%>', 'win1', 'width=850, height=550, location=0, menubar=0, scrollbars=yes, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=srno%>,false);">End
									Trip </a></td>
						</tr>


						<tr>
							<td><a href="javascript:toggleDetails1(<%=srno%>,false);">Close
							</a></td>
						</tr>
					</table></div></td>
				
			
	<td style="text-align: left; display: none"><%=TripId%></td>
		<td style="text-align:left;"><%=DriverName %></td>
		<!-- <td></td> -->
		<td style="text-align:left;"><%=TripOrigin %></td>
		<td style="text-align:right;"><%=StartDate %></td>
		<td style="text-align:left;"><%=TripDestination %></td>
		<td style="text-align:right;"><%=ETA %></td>
		<td style="text-align:left;"> <a href="javascript: false;"
				onClick="window.open ('Showonmap24.jsp?tripid=null&vehcode=<%=vehid%>&lat=<%=Lat%>&long=<%=Lon%>&discription=<%=Location%>&pname=currposition&vehname=<%=Veh%>&speed=<%=Speed%>&travel=<%=linkdate%>', 'win1', 'width=600, height=550, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0'); javascript:toggleDetails1(<%=srno%>,false);"><%=Location %></a><br><font size='1' color=<%=color %>> <b><%=DeviceStatus %></b><br><font size='1' color='black'><%=spcomment %><br><font size='2' color='red'><b><%=Idlecomment %></b></td>
		<td style="text-align:left;"><%=Ignition %></td>
		<td style="text-align:right;"><%=Speed %></td>
		<td style="text-align:right;"><%=StoppedSince %></td>
		<td style="text-align:right;"><%=OSToday %></td>
		<td style="text-align:right;"><%=RAToday %></td>
		<td style="text-align:right;"><%=RDToday %></td>
		<td style="text-align:right;"><%=formatter.format(DistanceToday) %></td>
		<td style="text-align:right;"><%=formatter.format(DistanceThisMonth) %></td>
		<td></td>
		<td></td>
		<td><%=todayfuel %></td>
		<td>NA</td>
		<td><%=yesterdayfuel %></td>
		<td>NA</td>
		<td>NA</td>
		<td style="text-align:right;"><%=Sen1 %></td>
		<td style="text-align:right;"><%=Sen2 %></td>
		<td style="text-align:right;"><%=Sen3 %></td>
		<td style="text-align:right;"><%=Sen4 %></td>
		<td style="text-align:right;"><%=Sen6 %></td>
<td style="text-align:right;"><%=Sen7 %></td>
<td style="text-align:right;"><%=Sen8 %></td>
<td style="text-align:right;"><%=Sen9 %></td>
		<td style="text-align:left;"><%=EngineStatus %></td>
		<td style="text-align:left;"><%=Batterycharging %></td>
		<td style="text-align:right;"><%=BatteryDate %></td>
		
		
		</tr>
		<%
		srno++;
		}
		String queryn="select distinct(vehiclecode) from  db_gps.t_vehicledetails  where VehicleCode in "+vehlist+"and VehicleCode not in (select distinct(vehiclecode) from db_gps.t_onlinedata where vehiclecode in "+vehlist+")";
		ResultSet nrs=st16.executeQuery(queryn);
		
		while(nrs.next())
		{	
			String online="select * from db_gps.t_onlinedata where vehiclecode='"+nrs.getString("vehiclecode")+"' order by thedate desc,thetime desc limit 1";
			System.out.println("Query For details 111:----"+online);
			ResultSet rson=st17.executeQuery(online);
			if(rson.next())
			{
				
			}else
			{
				
			String unreplc="select * from db_gps.t_unitreplacement where VehCode='"+nrs.getString("vehiclecode")+"' order by insertedDateTime desc  limit 1";
			ResultSet rsunrepl=st18.executeQuery(unreplc);
			System.out.println("Query For details 222 :----"+unreplc);
			if(rsunrepl.next())
			{

				
				Veh=rsunrepl.getString("VehRegNo");
				UnitID=rsunrepl.getString("NewUnitID");
				Group="-";
				Updated=rsunrepl.getString("insertedDateTime");
				Sen1="xxxx";
				Sen2="xxxx";
				Sen3="xxxx";
				Sen4="xxxx";
				Sen6="-";
Sen7="-";
Sen8="-";
Sen9="-";
				OSToday="-";
				RAToday="-";
				RDToday="-";
				spcomment="Device Installed But InActive";
				Ignition="OFF";
				Location="-";
			}
			
			}
			%>
			<td  style="text-align:right;"><%=srno %></td>
			<td WIDTH="6%"
			style="text-align:left;"><a><font size="2"><%=Veh%></font></a>
			
			
</td>
											<td style="text-align: left; display: none"><%=Veh%></td>
			
	<td style="text-align:left;"><%=VehType%></td>							
	<td style="text-align:right;"><%=UnitID %></td>
	<td style="text-align:left;"><%=UserName %></td>
	<td style="text-align:right;"><%=UserNo%></td>
	<td style="text-align:left;"><%=Group %></td>
	<td style="text-align:right;"><%=Updated %></td>
	<td style="text-align:left;"><%=Transporter %></td>
<%-- 	<td><%=TripId %></td> --%>
	<td>-</td>
							<td style="text-align: left; display: none">-</td>	
			

					<%
			//}
String pageflag="currentposition";
%>
					
	<td style="text-align:left;"><%=DriverName %></td>
	<!-- <td></td> -->
	<td style="text-align:left;"><%=TripOrigin %></td>
	<td style="text-align:right;"><%=StartDate %></td>
	<td style="text-align:left;"><%=TripDestination %></td>
	<td style="text-align:right;"><%=ETA %></td>
	<td style="text-align:left;"> <b><%=spcomment %></b><br><b></b></td>
	<td style="text-align:left;"><%=Ignition %></td>
	<td style="text-align:right;"><%=Speed %></td>
	<td style="text-align:right;"><%=StoppedSince %></td>
	<td style="text-align:right;"><%=OSToday %></td>
	<td style="text-align:right;"><%=RAToday %></td>
	<td style="text-align:right;"><%=RDToday %></td>
	<td style="text-align:right;"><%=formatter.format(DistanceToday) %></td>
	<td style="text-align:right;"><%=formatter.format(DistanceThisMonth) %></td>
	<td>NA</td><td>NA</td>
	<td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td>
	<td style="text-align:right;"><%=Sen1 %></td>
	<td style="text-align:right;"><%=Sen2 %></td>
	<td style="text-align:right;"><%=Sen3 %></td>
	<td style="text-align:right;"><%=Sen4 %></td>
	<td style="text-align:right;"><%=Sen6 %></td>
<td style="text-align:right;"><%=Sen7 %></td>
<td style="text-align:right;"><%=Sen8 %></td>
<td style="text-align:right;"><%=Sen9 %></td>
	<td style="text-align:left;"><%=EngineStatus %></td>
	<td style="text-align:left;"><%=Batterycharging %></td>
	<td style="text-align:right;"><%=BatteryDate %></td>
	
</tr>
		<% srno++;}	
		%>
		<input type="hidden"  name=stopcounter id="stopcounter" value="<%=stopcounter%>">
				    		    <input type="hidden"  name=movcounter id="movcounter" value="<%=movcounter%>">
				    		    <input type="hidden"  name=discounter id="discounter" value="<%=discounter%>">
				    		    <input type="hidden"  name=mdcounter id="mdcounter" value="<%=mdcounter%>">
				<script>myGeeks();</script>
				
									</tbody>
									<tfoot>
										<tr>
										<th>SrNo</th>
											<th>Asset ID</th>
											<th align="center" style="display: none">Asset ID</th>
											<th>Asset Type</th>
											<th>UnitID</th>
											<th>User Name</th>
											<th>User Contact</th>
											<th>Group</th>
											<th>Updated</th>
											<th>Owner</th>
											<th>Trip Id</th>
											<th align="center" style="display: none">Trip Id</th>
											<!-- <th>Trip Violation</th> -->
											<th>Driver Name(Code)</th>
											<th>Trip Origin</th>
											<th>Start Date</th>
											<th>Trip Destination</th>
											<th>ETA</th>
											<th>Location</th>
											<th>Ignition</th>
											<th>Speed</th>
											<th>Stopped Since (HH:mm)</th>
											<th>OS Today</th>
											<th>RA Today</th>
											<th>RD Today</th>
											<th>Distance Today</th>
											<th>Distance This Month</th>
											<th>Previous Day Avg.</th>
											<th>Avg. This Month</th>
											<th>Fuel</th>
											<th>Fuel Alert</th>
											<th>Yesterday's Fuel Added</th>
											<th>Day Shift Driver</th>
											<th>Night Shift Driver</th>
											<th>Sen1</th>
											<th>Sen2</th>
											<th>Sen3</th>
											<th>Sen4</th>
											<th>Sen6</th>
											<th>Sen7</th>
											<th>Sen8</th>
											<th>Sen9</th>
											<th>Engine Status</th>
											<th>Battery Charging</th>
											<th>Battery Date</th>
										</tr>
									</tfoot>
							
							</table>
						</div>
					</div>
				</div>
				<!-- Modal to add new record -->
		   </section>
			<!--/ Basic table -->


		</div>
	</div>
	
</div>
<!-- Included new html code end -->

<!--/ Basic table -->


          <!-- End: Customizer-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>
  
    <!-- <!-- Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                Modal Header
                <div class="modal-header">
                    <h4 class="modal-title">Set Color Code</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                Modal body
                <div class="modal-body">
                    <form action="#" class="align-items-center">
                        <div class="row">
                        <div class="row col-md-6">
                            <div class="col-md-3">
                                <input type="color" id="moving" name="moving" value="#CCFFCC"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="moving">Moving</label>

                            </div>
                        </div>
                        <div class="row col-md-6">
                            <div class="col-md-3">
                                <input type="color" id="stop" name="stop" value="#FFFFCC"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="stop">Stop</label>


                            </div>
                        </div>
                        <div class="row col-md-6">
                            <div class="col-md-3">
                                <input type="color" id="activeTrips" name="activeTrips" value="#FFFFFF"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="activeTrips">ActiveTrips</label>


                            </div>
                        </div>
                        <div class="row col-md-6">
                            <div class="col-md-3">
                                <input type="color" id="disconnected" name="disconnected"
                                    value="#DCDCDC"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="disconnected">Disconnected</label>

                            </div>
                        </div>
                        <div class="row col-md-6">
                            <div class="col-md-3">
                                <input type="color" id="main_disconnection" name="main_disconnection"
                                    value="#FFC475"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="main_disconnection">Main Disconnection</label>

                            </div>
                        </div>
                        <div class="row col-md-6 mb-1">
                            <div class="col-md-3">
                                <input type="color" id="inactive" name="inactive" value="#FFFFFF"><br><br>

                            </div>
                            <div class="col-md-6">
                                <label for="inactive">InActive</label>

                            </div>
                        </div>
                        <div class="row">
                         <div class="demo-inline-spacing" >
                    <span class="badge" style="background-color:#F0E68C">
                      <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span style="color: black;">Color Code Indications</span>
                    </span>
                    <span class="badge" style="background-color:#CCFFCC;">
                    <a href="moving.html">  
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >Moving</span></a>
                    </span>
                    <span class="badge " style="background-color:#FFFFCC;">
                      <a href="stopped.html"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >Stop</span></a>
                    </span>
                    <span class="badge " style="background-color:#FFFFFF;">
                      <a href="activeTrips.html"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >ActiveTrips</span></a>
                    </span>
                    <span class="badge " style="background-color:#DCDCDC;">
                     <a href="disconnected.html"> <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >Disconnected</span></a>
                    </span>
                    <span class="badge " style="background-color:#FFC475;">
                      <a href="maindisconnected.html"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >Main Disconnection</span></a>
                    </span>
                    <span class="badge " style="background-color:#FFFFFF;">
                     <a href="notactive.html"> <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star me-25"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                      <span >InActive</span></a>
                    </span>
                   
                  </div> 
          
                        </div>

                    </div>
                    </form>

                </div>

                Modal footer
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Set</button>

                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div> -->

<!-- Upload logo modal -->
<!-- <div class="modal" id="uploadLogoModal">
<div class="modal-dialog">
    <div class="modal-content">

        Modal Header
        <div class="modal-header">
            <h4 class="modal-title">Upload Logo</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        Modal body
        <div class="modal-body">
            <form action="#" class="align-items-center">
                <div class="row col-12">
                    <label for="formFile" class="form-label">Choose Your Logo : </label>
                    <input class="form-control" type="file" id="formFile">
                </div>
             

            </form>

        </div>

        Modal footer
        <div class="modal-footer">
            <button type="button" class="btn btn-primary">Submit</button>

            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

    </div>
</div>
</div>
 -->
 
 <!-- Set Custom  -->
<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:750px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Current Position</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			//int j=1;
								
			//String showList= "SrNo,Asset ID,Asset ID(E),Asset Type,UnitID,User Name,User Contact,Group,Updated,Owner,Trip Id,Trip Id(E),Driver Name(Code),Trip Origin,Start Date,Trip Destination,ETA,Location,Ignition,Speed,Stopped Since (HH:mm),OS Today,RA Today,RD Today,Distance Today,Distance This Month,Previous Day Avg,Avg. This Month,Fuel,Fuel Alert,Yesterday's Fuel Added,Day Shift Driver,Night Shift Driver,Sen1,Sen2,Sen3,Sen4,Sen6,Sen7,Sen8,Sen9,Engine Status,Battery Charging,Battery Date";
			String showList=""+ColumnList;
	
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">
			<div class="modal-body">
			<div id="table-1">
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk &nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><%
							
							StringTokenizer st = new StringTokenizer(showList,","); 
							while(st.hasMoreTokens() && i<=21){
							%><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=i %>" name="net_id1<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=i %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=i %>"   id="check<%=i %>"  /></td>
						<td><input type="text" name="clname<%=i %>"   id="clname<%=i %>"  value="<%=st.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%i++;}%></tbody>
						</table>
				</div>
				
				<div id="table-2" >
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk&nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><% 
							
							
							while(st.hasMoreTokens() && i>21){  %><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=i %>" name="net_id1<%=i %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right; font: normal 11px Arial, Helvetica, sans-serif;" value="<%=i %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=i %>"   id="check<%=i %>"  /></td>
						<td><input type="text" name="clname<%=i %>"   id="clname<%=i %>"  value="<%=st.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%i++;}
							%></tbody>
						</table>
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=i %>"/>
						<input type="hidden" name="reportno" id="reportno" value="<%=reportno%>">
						<input type="hidden" id="tableheaders" name="tableheaders">
						<input type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" id="setDefFlag" name="setDefFlag" value="true">
						<%-- <input type="hidden" name="pagename" id="pagename" value="<%=PageName%>"> --%>
						
				</div>
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
 
 
 
 
<!-- Register Complaint -->
<div class="modal" id="registerComplaintModal">
    <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> Complaint Registration Form</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <form class="form form-vertical">
                    <div class="row">
                            <div class="col-md-12 mb-1">
                                <h6>Total Complaint :  0  Pending :  0  Closed :  0 </h6>
                            </div>
                            <div class="col-md-12 mb-1">
                                <h6>( <span style="color:red;">*</span> indicates mandatory fields)</h6>
                            </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="first-name-vertical">User Name</label>
                          <input type="text" id="first-name-vertical" class="form-control" name="fname" value="Sumit Debnath">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="email-id-vertical"><span style="color:red;">*</span> Description</label>
                          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" ></textarea>                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="contact-info-vertical">Report Name</label>
                          <input type="text" id="contact-info-vertical" class="form-control" name="contact" value="Current Status">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical">Report No.</label>
                          <input type="number" id="password-vertical" class="form-control" name="contact" value="24">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical"><span style="color:red;">*</span> Category</label>
                          <select class="form-select" id="basicSelect">
                            <option>Request</option>
                            <option>Vehicle</option>
                            <option>Website</option>
                          </select>                        
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical"><span style="color:red;">*</span> Sub Category</label>
                          <select class="form-select" id="basicSelect">
                            <option>Device Install</option>
                            <option>Device pickup</option>
                            <option>Device Reinstall</option>
                            <option>Device Remove</option>
                            <option>Device Swap</option>

                          </select>                        
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical">Vehicle No.</label>
                          <select class="form-select" id="basicSelect">
                            <option>MH 04 FF</option>
                           
                          </select>                        
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical">Date</label>
                          <input type="date" id="password-vertical" class="form-control" name="contact" >
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical"><span style="color:red;">*</span> Priority</label>
                          <select class="form-select" id="basicSelect">
                            <option>Low</option>
                            <option>High</option>
                          </select>                        
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                          <label class="form-label" for="password-vertical">Add Email Recipients</label>
                          <input type="text" id="password-vertical" class="form-control" name="contact" >
                          <span>Add comma separated email ids</span>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-1">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" for="inlineCheckbox1">Call me Back</label>
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="checked" >

                              </div> 
                        </div>
                      </div>
                      <div class="col-12">
                        <div class="mb-1">
                            <label for="formFile" class="form-label">Attach a File</label>
                            <input class="form-control" type="file" id="formFile">                         
                          <span>You can attach a screenshot of error page.</span>
                        </div>
                      </div>
                    </div>
                  </form>
    
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Submit</button>
    
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
    
        </div>
    </div>
    </div>
	 
<!-- 		get trip id  started journey v id=
if(trip iD) -->

<!-- Included new footer file -->
<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->

<!-- New script code start -->
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



<!-- New script code end -->

</body>

<!-- New script code for table start -->

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
                                title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
                                title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
                                title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
                                title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
                                title: 'Current Status',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            // {
                            // extend: 'colvis',
                            // text: feather.icons['columns'].toSvg({ class: 'font-small-4 me-50' }) + 'Hide Show Columns',
                            // className: 'dropdown-item',
                            // exportOptions: { columns: [3, 4, 5, 6, 7] }
                            // }
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

            dt_basic.columns([<%=detailViewSequence%>]).visible(false)


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
</script><!-- New script code for table end -->
