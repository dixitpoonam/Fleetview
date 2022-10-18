<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		alert("in method...")
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
	alert("ii "+i);
	document.getElementById("tableheaderslength").value =i;
	alert("list:"+list);
	 var flag=document.getElementById("setDefFlag").value;
	alert("flag "+flag); 
	
	
	if(flag == "false")
		{
		alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				
			} 
		};
		alert("in ajax call.."+(nodes.length/2));
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
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 

double averageDaySpeed = 0;
int totalDays = 0;
double sum = 0.00;
double sum2 = 0.00;
double avggg = 0.00;
double avggg2 = 0.00;
double sumtime = 0.00;

double sum3 = 0.00;
username = (String) session.getAttribute("usertypevalue");

//System.out.println("Session name----------------->:"+username); 
String yyyyyyyyy = "";

NumberFormat numberformat = new DecimalFormat("#0.00");
String Code = "";
String Veh = "", vehicle = "";
float p = 0;
float y = 0;
int g = 0;

String datex1, datex2, data1, data2;
%>
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st4 = null,st20=null,st21=null;
	
	Connection conn1 = null;
	ResultSet rst = null;
	ResultSet rs4 = null;
	PreparedStatement ps = null;

	 
%>
<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		st = conn.createStatement();
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st4 = conn.createStatement();
		
	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%
String summ1 = "", summ2 = "";
String summ = "";
DecimalFormat df = new DecimalFormat("#.##");
String ddx = request.getQueryString();
	String bt = request.getParameter("button");
	//System.out.println(" buttom :- "+bt);
	String vehcode = "";
	
	if (bt== null || bt.equals("null")) {
		
		vehicle = "All";
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		data1 = data2 = session.getAttribute("CurrentMonthFirst").toString();   //yyyy-mm-dd
		datex2 = session.getAttribute("today").toString();
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		
		vehicle = request.getParameter("vehicle");

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));

String dt1time=""+dt1+" 23:59:59";

System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);
	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

String Selection = request.getParameter("basicSelect");
System.out.println("selection:"+Selection);

%>

<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

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
	//for report conversion use this query
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


<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0"> Run Analysis Report From <%=datex1 %>
							To <%=datex2 %> Of <%=username %></h3>
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
			<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />
			<form name="formreport" id="formreport" method="post">
			<input type="hidden" id="username" name="username" value=<%=username%>>
		    <div class="row col-12">
		    <div class="col-md-2"></div>
		    <div class="col-md-2">
		    <label for="basicSelect">Vehicle:</label>
						<div class="input-group input-group-merge">
						<select class="form-select" id="vehicle" name="vehicle">
						<%
							
								String sql = "select * from db_gps.t_vehicledetails where VehicleCode in "
										+ session.getAttribute("VehList").toString() + " order by VehicleRegNumber";
								rst = st.executeQuery(sql);
								System.out.println("vehicle  Master Query : "+ sql);
								
								while (rst.next()) {
									%>
									<option value="<%=rst.getString("VehicleRegNumber")%>"
										<%if (vehicle.equals(rst.getString("VehicleRegNumber"))) {%>
										Selected <%}%>><%=rst.getString("VehicleRegNumber")%></option>
									<%
										}
									%>
							</select>
														
							
		    </div>
		    </div>
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
					<input type="text" id="data1" name="data1"  
					class="form-control" value="<%=datex2%>"/> 
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
			maxDate:7 */
});
} );
			
});

			   </script>
		</div>

			<div class="col-md-2">
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
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


				<th align="center">Vehicle</th>
				<th align="center">Date</th>
				<th align="center">Running Time</th>
				<th align="center">Night Stop Time</th>
				<th align="center">Day Stop Time</th>
				<th align="center">Km Travelled</th>
				<th align="center">Avg Running Speed(Km/hr)</th>
				<th align="center">Avg Speed(Km/hr)</th>



			</tr>
		</thead>
		<tbody>

			<%
			int totalHours1 = 0;
			int totalMinutes1 = 0;
			int totalSeconds1 = 0;

			int totalHours1day = 0;
			int totalMinutes1day = 0;
			int totalSeconds1day = 0;

			int totalHours1night = 0;
			int totalMinutes1night = 0;
			int totalSeconds1night = 0;

			int totalHours = 0;
			int totalMinutes = 0;
			int totalSeconds = 0;

			int totalHoursday = 0;
			int totalMinutesday = 0;
			int totalSecondsday = 0;

			int totalHoursnight = 0;
			int totalMinutesnight = 0;
			int totalSecondsnight = 0;
				String sqll = "select * from db_gps.t_vehicledetails where VehicleCode in "
										+ session.getAttribute("VehList").toString() + " order by VehicleRegNumber";
				ResultSet rst1 = st.executeQuery(sqll);

			System.out.println("Query Vehicle Code : " + sqll);

				while(rst1.next()) {
					vehcode = rst1.getString("vehicleCode");
				

				sql = "SELECT VehCode,DATE_FORMAT(TheDate,'%d/%m/%Y') as TheDate,TheDate as Date,RDuration,NightStopDuration,DayStopDuration,Distance,RAvg,(Distance/24) as AveSpeed FROM  db_gpsExceptions.t_veh"+vehcode + "_ds  WHERE TheDate>='" + dt + "'  AND  TheDate<='" + dt1 + "'";
				System.out.println("Query is : " + sql);
				ps = conn.prepareStatement(sql);
				rs4 = ps.executeQuery();

				String TheDate = "", Date = "", AvgSpeedConsidered = "", RDuration = "", NightStopDuration = "",
						DayStopDuration = "", Distance = "", RAvg = "", AveSpeed = "";
				

				String Excludedkm = "";
				
				int S = 1;

				
				while (rs4.next()) {

					TheDate = rs4.getString("TheDate");
					Date = rs4.getString("Date");
					RDuration = rs4.getString("RDuration");
					NightStopDuration = rs4.getString("NightStopDuration");
					DayStopDuration = rs4.getString("DayStopDuration");
					Distance = rs4.getString("Distance");
					RAvg = rs4.getString("RAvg");
					AveSpeed = rs4.getString("AveSpeed");

					//String VehicleNo="select VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode='"+vehcode+"'";

					String VehicleNo = "select VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode='" + vehcode
							+ "'";

					ResultSet rsVeh = st1.executeQuery(VehicleNo);
					String vehicleregnumber = "";
					if (rsVeh.next()) {
						vehicleregnumber = rsVeh.getString("VehicleRegNumber");
					}

					String VehAllDs = "SELECT VehCode,DATE_FORMAT(TheDate,'%d/%m/%Y') as TheDate,RDuration,NightStopDuration,DayStopDuration,Distance,RAvg,(Distance-Excludedkm)/30 As NewRAvg,(Distance/24) as AveSpeed,(Distance-Excludedkm)/24 As NewAvgSpeed,AvgSpeedConsidered,Excludedkm,(Distance-Excludedkm) As NewDist FROM  db_gpsExceptions.t_vehall_ds  WHERE TheDate ='"
							+ Date + "'   and VehCode=" + vehcode + "";
					ResultSet rsVehAllDs = st2.executeQuery(VehAllDs);

					System.out.println("Query is : " + VehAllDs);

					double RDurationNew = 0.00;
					if (rsVehAllDs.next()) {
						double dis = 0.00;
						double dis2 = 0.00;
						double dis3 = 0.00;
						double dis5 = 0.00;

						AvgSpeedConsidered = rsVehAllDs.getString("AvgSpeedConsidered");

						System.out.println("AvgSpeedConsidered  is : " + AvgSpeedConsidered);
						if (AvgSpeedConsidered.equalsIgnoreCase("Yes")) {
							System.out.println("INNNNNNNNNNNNNNNNNN");
							TheDate = rsVehAllDs.getString("TheDate");

							RDuration = rsVehAllDs.getString("RDuration");
							NightStopDuration = rsVehAllDs.getString("NightStopDuration");
							DayStopDuration = rsVehAllDs.getString("DayStopDuration");
							Distance = rsVehAllDs.getString("NewDist");

							dis = Double.parseDouble(Distance);
							//	System.out.println("dis::"+dis);

							sum = sum + dis;
							//System.out.println("sum::"+sum);

							RAvg = rsVehAllDs.getString("NewRAvg");

							//System.out.println(" NEW RAvg::"+RAvg);

							AveSpeed = rsVehAllDs.getString("NewAvgSpeed");

							dis3 = Double.parseDouble(AveSpeed);
							//System.out.println("dis3::"+dis3);

							sum3 = sum3 + dis3;
							summ2 = "" + sum3;

							summ2 = df.format(Double.parseDouble(summ2));

							//System.out.println("sum3::"+sum3);

							//System.out.println("RAvg  is : "+RAvg);

							String temp1 = "", temp2 = "";
							if (RAvg.contains(".")) {
								temp1 = RAvg.substring(0, RAvg.indexOf("."));

								temp2 = RAvg.substring(RAvg.indexOf("."));

								double HrsConvertedToMin1 = Double.parseDouble(temp2) * 60;

								temp2 = df.format(HrsConvertedToMin1);
							} else {
								temp1 = RAvg;
								temp2 = "00";
							}
							///System.out.println("temp[0]  is : "+temp1);

							//System.out.println("temp[1]  is : "+temp2);

							///System.out.println("temp[0]  is : "+temp1);

							//System.out.println("temp[1]  is : "+temp2);

							//double HrsConvertedToMin1 =Double.parseDouble(temp2)*60;

							//temp2=df.format(HrsConvertedToMin1);

							int temp3 = Integer.parseInt(temp1);
							int temp4 = Integer.parseInt(temp2);

							if (temp3 < 10) {
								temp1 = "0" + temp1;
							}

							if (temp4 < 10) {
								temp2 = "0" + temp2;
							}
							if (temp1.equals("000"))

							{
								temp1 = "00";
							}
							if (temp2.equals("000")) {
								temp2 = "00";
							}
							String totalMinutes2 = temp1 + ":" + temp2 + ":00";

							System.out.println("totalMinutes2 tmp   is : " + totalMinutes2);

							RDuration = totalMinutes2;

							RAvg = temp1 + "." + temp2;

							totalHours = totalHours + Integer.parseInt(temp1);

							totalMinutes = totalMinutes + Integer.parseInt(temp2);

							RDurationNew = Double.parseDouble(Distance) / Double.parseDouble(RAvg);
							RAvg = "" + RDurationNew;
							//gaphrs=totalMinutes1/60;

							System.out.println("RAvg in iffffffffffffffffffff  :: " + RAvg);
							if (RAvg.equals("NaN")) {
								//sum2=Double.parseDouble(numberAsString);  
								RAvg = "" + 0;
								System.out.println("RAvgnb::" + RAvg);

							}

							dis2 = Double.parseDouble(RAvg);
							//	System.out.println("dis2::"+dis2);
							if (dis2 > 0.0) {
								g++;
							}

							sum2 = sum2 + dis2;

							summ1 = "" + sum2;
							summ1 = df.format(Double.parseDouble(summ1));

							String numberAsString = Double.toString(sum2);
							if (numberAsString.equals("NaN")) {
								//sum2=Double.parseDouble(numberAsString);  
								sum2 = 0.00;
								System.out.println("sum2nan::" + sum2);

							}
							System.out.println("sum2::" + sum2);
							System.out.println("sum2::" + sum2);

						} else {
							System.out.println("EEELLLLLLLLLLLLLLLLll");
							dis = 0.00;
							dis2 = 0.00;
							TheDate = rs4.getString("TheDate");
							Date = rs4.getString("Date");
							RDuration = rs4.getString("RDuration");

							if (RDuration.equals("-")) {
								RDuration = "00:00:00";
							}

							String DocumentName123[] = RDuration.split(":");

							for (int j = 0; j < 3; j++) {
								//System.out.println("jjjjjjjjjj ::"+ Integer.parseInt(DocumentName123[j]));
								if (j == 0) {
									totalHours = totalHours + Integer.parseInt(DocumentName123[0]);
								}
								if (j == 1) {
									totalMinutes = totalMinutes + Integer.parseInt(DocumentName123[1]);
								}
								if (j == 2) {
									totalSeconds = totalSeconds + Integer.parseInt(DocumentName123[2]);
								}

							}

							NightStopDuration = rs4.getString("NightStopDuration");
							DayStopDuration = rs4.getString("DayStopDuration");
							Distance = rs4.getString("Distance");

							dis = Double.parseDouble(Distance);
							//System.out.println("dis::"+dis);

							sum = sum + dis;
							summ = "" + sum;
							summ = df.format(Double.parseDouble(summ));
							//System.out.println("summ::"+summ);

							//System.out.println("sum::"+sum);

							RAvg = rs4.getString("RAvg");

							System.out.println("RAvg in elsssssssssssssss :: " + RAvg);

							dis2 = Double.parseDouble(RAvg);

							//	System.out.println("dis2::"+dis2);
							if (dis2 > 0.0) {
								g++;
							}
							//   System.out.println("g:: "+g);

							sum2 = sum2 + dis2;
							String numberAsString1 = Double.toString(sum2);
							if (numberAsString1.equals("NaN")) {
								//sum2=Double.parseDouble(numberAsString);  
								sum2 = 0.00;
								System.out.println("sum2nan::" + sum2);

							}
							summ1 = "" + sum2;
							summ1 = df.format(Double.parseDouble(summ1));

							System.out.println("sum2::" + sum2);
							//System.out.println("summ1::"+summ1);

							//p = (float) sum2;
							//System.out.println("p::"+p);

							AveSpeed = rs4.getString("AveSpeed");

							dis3 = Double.parseDouble(AveSpeed);
							AveSpeed = df.format(Double.parseDouble(AveSpeed));

							//System.out.println("dis3::"+dis3);

							sum3 = sum3 + dis3;
							summ2 = "" + sum3;
							summ2 = df.format(Double.parseDouble(summ2));

							//	System.out.println("summ2::"+summ2);
							//System.out.println("sum3::"+sum3);
							// y = (float) sum3;
							//	System.out.println("y::"+y);

						}

						if (NightStopDuration.equals("-")) {
							NightStopDuration = "00:00:00";
						}

						String DocumentName1234[] = NightStopDuration.split(":");

						for (int j = 0; j < 3; j++) {
							//System.out.println("jjjjjjjjjj ::"+ Integer.parseInt(DocumentName1234[j]));
							if (j == 0) {
								totalHoursday = totalHoursday + Integer.parseInt(DocumentName1234[0]);
							}
							if (j == 1) {
								totalMinutesday = totalMinutesday + Integer.parseInt(DocumentName1234[1]);
							}
							if (j == 2) {
								totalSecondsday = totalSecondsday + Integer.parseInt(DocumentName1234[2]);
							}

						}

						if (DayStopDuration.equals("-")) {
							DayStopDuration = "00:00:00";
						}

						String DocumentName1235[] = DayStopDuration.split(":");

						for (int j = 0; j < 3; j++) {
							//System.out.println("jjjjjjjjjj ::"+ Integer.parseInt(DocumentName1235[j]));
							if (j == 0) {
								totalHoursnight = totalHoursnight + Integer.parseInt(DocumentName1235[0]);
							}
							if (j == 1) {
								totalMinutesnight = totalMinutesnight + Integer.parseInt(DocumentName1235[1]);
							}
							if (j == 2) {
								totalSecondsnight = totalSecondsnight + Integer.parseInt(DocumentName1235[2]);
							}

						}

						RAvg = df.format(Double.parseDouble(RAvg));
					}

					AveSpeed = df.format(Double.parseDouble(AveSpeed));
			%>
			<tr>
				<td><%=S%></td>
				<td><%=vehicleregnumber%></td>
				<td><%=TheDate%></td>

				<td><%=RDuration%></td>
				<td><%=NightStopDuration%></td>

				<td><%=DayStopDuration%></td>
				<td><%=Distance%></td>

				<td><%=RAvg%></td>
				<td><%=AveSpeed%></td>


			</tr>


			<%
				S++;
				}



				totalHours1 = totalHours1 + totalHours;
				totalMinutes1 = totalMinutes1 + totalMinutes;
				totalSeconds1 = totalSeconds1 + totalSeconds;

				System.out.println("Total Hrs ::" + totalHours1);
				System.out.println("Total Min ::" + totalMinutes1);
				System.out.println("Total Sec ::" + totalSeconds1);
				}
				if (totalSeconds1 >= 60) {

					System.out.println("in sec >60");

					int a = totalSeconds1 / 60;

					System.out.println("AAAAAAAAAAA Hrs ::" + a);

					totalMinutes1 = totalMinutes1 + a;

					System.out.println("Total Minutes  Hrs ::" + totalMinutes1);

					totalSeconds1 = totalSeconds1 % 60;

					System.out.println("mod of sec  Hrs ::" + totalSeconds1);

				}
				if (totalMinutes1 >= 60) {

					int b = totalMinutes1 / 60;

					System.out.println(" BBBBBBBBBBBB  Hrs ::" + b);

					totalHours1 = totalHours1 + b;

					System.out.println("Total totalHours1  Hrs ::" + totalHours1);

					totalMinutes1 = totalMinutes1 % 60;

					System.out.println("mod of min  Hrs ::" + totalMinutes1);

				}

				/* System.out.println("Total Hrs ::"+totalHours1);
				System.out.println("Total Min ::"+totalMinutes1);
				System.out.println("Total Sec ::"+totalSeconds1); */

				int totalHours2 = totalHours1;

				int totalMinutes2 = totalMinutes1;

				int totalSeconds2 = totalSeconds1;

				System.out.println("Total Hrs New ::" + totalHours2);
				System.out.println("Total Min ::" + totalMinutes2);
				System.out.println("Total Sec ::" + totalSeconds2);

				totalHours1day = totalHours1day + totalHoursday;
				totalMinutes1day = totalMinutes1day + totalMinutesday;
				totalSeconds1day = totalSeconds1day + totalSecondsday;

				if (totalSeconds1day >= 60) {
					int c = totalSeconds1day / 60;
					totalMinutes1day = totalMinutes1day + c;
					totalSeconds1day = totalSeconds1day % 60;
				}
				if (totalMinutes1day >= 60) {
					int d = totalMinutes1day / 60;

					totalHours1day = totalHours1day + d;
					totalMinutes1day = totalMinutes1day % 60;
				}

				System.out.println("Total Hrs New night::" + totalHours1day);
				System.out.println("Total Min ::" + totalMinutes1day);
				System.out.println("Total Sec ::" + totalSeconds1day);

				totalHours1night = totalHours1night + totalHoursnight;
				totalMinutes1night = totalMinutes1night + totalMinutesnight;
				totalSeconds1night = totalSeconds1night + totalSecondsnight;

				System.out.println("Total Hrs  day ::" + totalHours1night);
				System.out.println("Total Min ::" + totalMinutes1night);
				System.out.println("Total Sec ::" + totalSeconds1night);

				if (totalSeconds1night >= 60) {

					int e = totalSeconds1night / 60;

					System.out.println(" EEEEEEEEEEEEEE Hrs ::" + e);

					totalMinutes1night = totalMinutes1night + e;

					System.out.println(" EEEEEEEEE minn  Hrs ::" + totalMinutes1night);

					totalSeconds1night = totalSeconds1night % 60;

					System.out.println("mod of sec  eeeeeeeeeee ::" + totalSeconds1night);

				}
				if (totalMinutes1night >= 60) {
					int f = totalMinutes1night / 60;

					System.out.println(" ffffffffffffffffff  min  ::" + f);

					totalHours1night = totalHours1night + f;

					System.out.println(" ffffffffffffffffffff hrs  Hrs ::" + totalHours1night);

					totalMinutes1night = totalMinutes1night % 60;

					System.out.println("mod of min  ffffffffffffffff ::" + totalMinutes1night);

				}

				if (sum2 > 0) {
					avggg = sum2 / g;
					//	System.out.println("avggg::"+avggg);
					summ1 = "" + avggg;
					summ1 = df.format(Double.parseDouble(summ1));

				}
				if (sum3 > 0) {
					avggg2 = sum3 / g;
					//	System.out.println("avggg2::"+avggg2);
					summ2 = "" + avggg2;
					summ2 = df.format(Double.parseDouble(summ2));

				}
				String t = "";
				String t1 = "";
				String t2 = "";
				String t3 = "";
				String t33 = "";

				String t4 = "";
				String t5 = "";
				String t6 = "";
				String t7 = "";

				if (totalHours2 < 10) {
					t = ("0" + totalHours2).toString();

					System.out.println("   tttttttt ::" + t);

					totalHours2 = Integer.parseInt(("0" + totalHours2).toString());
				} else {
					t = "" + totalHours2;
				}
				if (totalMinutes2 < 10) {
					t1 = ("0" + totalMinutes2).toString();

					System.out.println("   tttttttt11 ::" + t1);
					totalMinutes2 = Integer.parseInt(("0" + totalMinutes2).toString());
				} else {
					t1 = "" + totalMinutes2;
				}

				if (totalSeconds2 < 10) {
					t2 = ("0" + totalSeconds2).toString();

					System.out.println("   tttttttt2 ::" + t2);
					totalSeconds2 = Integer.parseInt(("0" + totalSeconds2).toString());
				} else {
					t2 = "" + totalSeconds2;
				}

				String NewtotalHours1 = t + ":" + t1 + ":" + t2;

				if (totalHours1day < 10) {
					t3 = ("0" + totalHours1day).toString();

					System.out.println("   tttttttt33 ::" + t3);
					totalHours1day = Integer.parseInt(("0" + totalHours1day).toString());
				} else {
					t3 = "" + totalHours1day;
				}
				if (totalMinutes1day < 10) {

					t33 = ("0" + totalMinutes1day).toString();

					System.out.println("   tttttttt33 ::" + t33);

					totalMinutes1day = Integer.parseInt((t33).toString());

				} else {
					t33 = "" + totalMinutes1day;
				}

				if (totalSeconds1day < 10) {
					t4 = ("0" + totalSeconds1day).toString();

					System.out.println("   tttttttt4 ::" + t4);
					totalSeconds1day = Integer.parseInt(("0" + totalSeconds1day).toString());
				} else {
					t4 = "" + totalSeconds1day;
				}

				String NewtotalHours2 = t3 + ":" + t33 + ":" + t4;

				if (totalHours1night < 10) {
					t5 = ("0" + totalHours1night).toString();

					System.out.println("   tttttttt5 ::" + t5);

					totalHours1night = Integer.parseInt(("0" + totalHours1night).toString());
				} else {
					t5 = "" + totalHours1night;
				}

				if (totalMinutes1night < 10) {
					t6 = ("0" + totalMinutes1night).toString();

					System.out.println("   tttttttt6::" + t6);
					totalMinutes1night = Integer.parseInt(("0" + totalMinutes1night).toString());
				} else {
					t6 = "" + totalMinutes1night;
				}

				if (totalSeconds1night < 10) {
					t7 = ("0" + totalSeconds1night).toString();

					System.out.println("   t7 ::" + t7);

					totalSeconds1night = Integer.parseInt(("0" + totalSeconds1night).toString());
				} else {
					t7 = "" + totalSeconds1night;
				}
				String NewtotalHours3 = t5 + ":" + t6 + ":" + t7;
			%>
		</tbody>

		<tr>
			<td>Summation</td>
			<td></td>

			<td></td>
			<td align="left"><%=NewtotalHours1%></td>
			<td align="left"><%=NewtotalHours2%></td>
			<td align="left"><%=NewtotalHours3%></td>
			<td align="left"><%=sum%></td>
			<td align="left"><%=summ1%></td>
			<td align="left"><%=summ2%></td>


		</tr>
		<tfoot>
			<tr>
				<th width="4%" align="center">Sr No</th>


				<th align="center">Vehicle</th>
				<th align="center">Date</th>
				<th align="center">Running Time</th>
				<th align="center">Night Stop Time</th>
				<th align="center">Day Stop Time</th>
				<th align="center">Km Travelled</th>
				<th align="center">Avg Running Speed(Km/hr)</th>
				<th align="center">Avg Speed(Km/hr)</th>

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
						<h4 class="modal-title">Custom Column Selection for Run Analysis </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			//String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
			String showList=""+ColumnList;    //uncomment this line for report conversion 
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">  <!-- change this to ReSet.jsp for conversion  -->
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
</html>