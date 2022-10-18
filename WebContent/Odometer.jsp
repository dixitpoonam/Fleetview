<%@ include file="headernew1.jsp"%>
<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes"
	scope="page"></jsp:useBean> --%>
<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
<link href="css/ERP.css" rel="stylesheet" type="text/css"></link>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
@import url(jscalendar-1.0/calendar-blue.css);
</style>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="javax.activation.*"%>


<html>
<head>



<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
$.fn.dataTable.ext.search.push(
	    function( settings, data, dataIndex ) {
	        var min = parseInt( $('#min').val(), 10 );
	        var max = parseInt( $('#max').val(), 10 );
	        var age = parseFloat( data[9] ) || 0; // use data for the age column
	 
	        if ( ( isNaN( min ) && isNaN( max ) ) ||
	             ( isNaN( min ) && age <= max ) ||
	             ( min <= age   && isNaN( max ) ) ||
	             ( min <= age   && age <= max ) )
	        {
	            return true;
	        }
	        return false;
	    }
	);
	 
	$(document).ready(function() {
	    var table = $('#example').DataTable();
	     
	    // Event listener to the two range filtering inputs to redraw on input
	    $('#min, #max').keyup( function() {
	        table.draw();
	    } );
	} );

</script>
<script type="text/javascript">
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

<%
String username = "";
username = (String) session.getAttribute("usertypevalue");
int count = 0;
int totalCount = 0;
String vehregno = "";
String trans = "";
String sql11 = "";
String employeeName = "";
String employeeCode = "";
String vehicleCode = "";
String totalfuel1 = "", RSMName = "-", Manager = "-";
String MobNo = "-", Designation = "-", VehicleModel = "-";
double totalfuel2 = 0.00;

DecimalFormat df = new DecimalFormat("####0.00");;
NumberFormat nf = NumberFormat.getNumberInstance();
nf.setMaximumFractionDigits(2);
//System.out.println("Session name----------------->:" + username);

String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		System.out.println("On load ");

		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		datex2 = session.getAttribute("today").toString();
	
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

String dt1time=""+dt1+" 23:59:59";


System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);

	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

	
%>
<body>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Odometer Report From <%=datex1 %>
				To <%=datex2 %> Of <%=username %></h3>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
	 
		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
			
		</div>




<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />

<form name="formreport" id="formreport" method="post">
	<input type="hidden" id="username" name="username" value=<%=username %>>
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
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
	</form>


<%!Connection conn, conn1;
	Statement st0, st, st1, st2, st3,st66, st4,st8,st9,st10,st12,st13,st14,st15,st16, st11, stlast, st5, st6, st7, stRSM, stRSM1, stRSM2;%>
<%
	String uservalue = session.getAttribute("usertypevalue").toString();
	String user, sql = "", first = "", fulltank = "No", last = "", sql1 = null, sql2 = null, sql3 = null,
			transporter = null, ndcnt = null;
	String fidDate = null, showdate = null, showdate1 = null, trips = null, counDriveYesNo = null,
			ntDriveYesNo = null;
	String ownerNm = "", DriverName = "";
	double Accelaration1 = 0.00, Decelaration1 = 0.00, OverSpeed1 = 0.00;
	double odofirst = 0.00, odolast = 0.00, Odometer = 0.00;
	double gpsfirst = 0.00, gpslast = 0.00, gpsavg = 0.00;
	double gpsfirst1 = 0.00, gpslast1 = 0.00, gpsdiff1 = 0.00;
	double diff = 0.00;
	String odoLastDateTime = "", odoFirstDateTime = "";
	ResultSet rst11 =null;
	float totalfuel = 0, odoavg = 0;
	//ResultSet rstfuel = null;
	String StartDate = "", EndDate = "", EndTime = "", StartTime = "", fromdate = "", todate = "", thedate = "",
			thedate1 = "";
	String fromdate1 = "", todate1 = "";
	try {
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		//conn1 = fleetview.ReturnConnection1();
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = conn.createStatement();
		st0 = conn.createStatement();
		st11 = conn.createStatement();
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st5 = conn.createStatement();
		st6 = conn.createStatement();
		st7 = conn.createStatement();
		stRSM = conn.createStatement();
		stRSM1 = conn.createStatement();
		stRSM2 = conn.createStatement();

		st66 = conn.createStatement();
		st8 = conn.createStatement();
		st9 = conn.createStatement();
		st10 = conn.createStatement();
		st11= conn.createStatement();
		st12= conn.createStatement();
		st13 = conn1.createStatement();
		st14= conn.createStatement();
		st15= conn.createStatement();
		st16= conn.createStatement();

%>


<table cellspacing="5" cellpadding="5" border="0">
        <tbody><tr>
            <td>Minimum Odometer Count:</td>
            <td><input type="text" id="min" name="min"></td>
        </tr>
        <tr>
            <td>Maximum Odometer Count:</td>
            <td><input type="text" id="max" name="max"></td>
        </tr>
    </tbody>
    </table>
<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered table-striped">
	<thead>
		<tr>
			<th width="4%" align="center">Sr No</th>
			<th align="center">Vehicle</th>
			<th align="center">Vehicle Model</th>
			<th align="center">User</th>
			<th align="center">Designation</th>
			<th align="center">MobNo</th>
			<th align="center">Manager</th>
			<th align="center">RSM Name</th>
			<th align="center">Transporter</th>
			<th align="center">Odometer Count</th>
			<th align="center">Odometer Km</th>
			<th align="center">GPS Km</th>
			<th align="center">Difference</th>
			<th align="center">Fuel Added</th>
			<th align="center">Total GPS Km</th>
			<th align="center">Full Tank</th>
			<th align="center">Odometer Avg</th>
			<th align="center">GPS Avg</th>
		</tr>
	</thead>
	<tbody>

		<%
		String ven;
		String vehlist = session.getAttribute("VehList").toString();
		boolean flagFirst = true;
		boolean flag = true;
		double ododiff = 0.00;
		double gpsdiff = 0.00, totaldistanceBetweenSelectedDates = 0.00;

		String veh="select DISTINCT(VehicleCode),VehicleRegNumber from db_gps.t_vehicledetails where  VehicleCode in "+session.getAttribute("VehList").toString()+"";


		 rst11 = st1.executeQuery(veh);
		//System.out.println("Vehicle List" + veh);

		int i = 1;
		while (rst11.next()) {
			vehregno = rst11.getString("VehicleRegNumber");
			trans = session.getAttribute("usertypevalue").toString();
			vehicleCode = rst11.getString("VehicleCode");

			String query = "select * from t_vehicledetails where VehicleRegNumber='" + vehregno + "'";
			ResultSet rs = st2.executeQuery(query);
			if (rs.next()) {
				employeeName = rs.getString("Empname");
				VehicleModel = rs.getString("vehtype");
			}
			//System.out.println("Vehicle query" + query);

			sql = "select Transporter,Driver,VehNo,Odometer,TheDateTime,count(*) AS entries from t_fuelinfo where VehNo='"
					+ vehregno + "' and TheDateTime  between '" + dt + " 00:00:00' and '" + dt1
					+ " 23:59:59' order by thedatetime";
			ResultSet rstlast = st.executeQuery(sql);
			//System.out.println("Vehicle sql" + sql);

			
			if (rstlast.next()) {
				count = rstlast.getInt("entries");
				totalCount = totalCount + count;
			}
			sql = "select Transporter,Driver,VehNo,Odometer,TheDateTime from t_fuelinfo where VehNo='" + vehregno
					+ "' and TheDateTime  >= '" + dt + " 00:00:00' and '" + dt1
					+ " 23:59:59' AND Odometer IS NOT NULL AND Odometer <> '' AND Odometer <> ' '  AND Odometer <> '-' order by thedatetime ASC LIMIT 1";
			ResultSet rst = st0.executeQuery(sql);
			
			//System.out.println("Vehicle sql2" + sql);

			if (rst.next()) {
				odofirst = rst.getDouble("Odometer");
				odoFirstDateTime = rst.getString("TheDateTime");
				flagFirst = false;
			}
			sql = "select Transporter,Driver,VehNo,Odometer,TheDateTime from t_fuelinfo where VehNo='" + vehregno
					+ "' and TheDateTime  >= '" + dt + " 00:00:00' and TheDateTime  <= '" + dt1
					+ " 23:59:59' AND Odometer IS NOT NULL AND Odometer <> ''   AND Odometer <> ' ' AND Odometer <> '-'  order by thedatetime DESC LIMIT 1";
			ResultSet rst1 = st0.executeQuery(sql);
			
			//System.out.println("Vehicle sql3" + sql);


			if (rst1.next()) {
				odolast = rst1.getDouble("Odometer");
				odoLastDateTime = rst1.getString("TheDateTime");
				flagFirst = false;

				String sqlGps = "SELECT Distance, TheFieldDataDate, TheFieldDataTime " + "FROM t_veh" + vehicleCode
						+ " " + "WHERE TheFieldDataDateTime BETWEEN '" + odoFirstDateTime + "' AND '"
						+ odoLastDateTime + "' " + "AND TheFiledTextFileName in ('SI','ON','OF') "
						+ "ORDER BY TheFieldDataDateTime " + "ASC LIMIT 1";
				System.out.println("sqlGps " + sqlGps ); 
				
				ResultSet rstgps1 = st8.executeQuery(sqlGps);
				if (rstgps1.next()) {
					gpsfirst = rstgps1.getDouble("Distance");
				}
				
				//System.out.println("Vehicle sqlgps" + sqlGps);


				sqlGps = "SELECT Distance, TheFieldDataDate, TheFieldDataTime " + "FROM t_veh" + vehicleCode + " "
						+ "WHERE TheFieldDataDateTime BETWEEN '" + odoFirstDateTime + "' AND '" + odoLastDateTime
						+ "' " + "AND TheFiledTextFileName in ('SI','ON','OF') " + "ORDER BY TheFieldDataDateTime "
						+ "DESC LIMIT 1";
				rstgps1 = st9.executeQuery(sqlGps);
				
				//System.out.println("Vehicle sqlgps" + sqlGps);

				
				if (rstgps1.next()) {
					gpslast = rstgps1.getDouble("Distance");
				}
			}

			
			String rstcounts = "select SUM(OSCount),SUM(RACount),SUM(RDCount),SUM(CRCount),SUM(Distance),SUM(StopCount), SUM(RDuration), SUM(FACount),SUM(FTCount),SUM(RDinSec),SUM(RDurationinHrs)  from db_gpsExceptions.t_veh"+vehicleCode+"_ds where  TheDate >='"+fromdate+"' AND TheDate <='"+todate+"'";
			//ResultSet rstcounts = fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(vehicleCode, fromdate, todate);
			System.out.println("Vehicle rstcounts" + rstcounts); 
			ResultSet rstcnt =  st13.executeQuery(rstcounts);
			 

			if (rstcnt.next()) {
				totaldistanceBetweenSelectedDates = rstcnt.getDouble(5);
			}

			if (count > 1) {
				ododiff = odolast - odofirst;

				gpsdiff = gpslast - gpsfirst;
			} else {
				ododiff = 0;
				gpsdiff = 0;
			}
			if (ododiff == 0) {
				gpsdiff = 0;
			}

			String UserName = "";
			String allsql = "select b.vehid,b.Designation,vehiclecode,vehicleregnumber,ownername,b.SrNo,b.location,b.UserName as User,concat(b.firstname,b.lastname) as UserName,b.MobNo,b.Email,c.vehid,c.UserName as Manager,c.SrNo,concat(c.firstname,c.lastname) as ManagerName,c.MobNo,c.Email,d.UserName as RSM,d.vehid,d.SrNo,concat(d.firstname,d.lastname) as RSMName,d.MobNo,d.Email from db_gps.t_vehicledetails a left join db_gps.t_userdetails b on a.vehiclecode=b.vehid  left join db_gps.t_userdetails c on b.hodid=c.srno left join db_gps.t_userdetails d on c.hodid=d.srno where status='-' and vehiclecode ='"
					+ vehicleCode + "' order by ownername asc";
			//System.out.println("Vehicle allsql" + allsql);

			ResultSet rste = st10.executeQuery(allsql);
			

			if (rste.next()) {

				employeeName = rste.getString("User");
				if (employeeName == null) {
					employeeName = "-";

				}
				UserName = rste.getString("UserName");
				if (UserName == null) {
					UserName = "-";

				}
				Manager = rste.getString("Manager");
				if (Manager == null) {
					Manager = "-";
				}
				RSMName = rste.getString("RSM");
				if (RSMName == null) {
					RSMName = "-";
				}
				MobNo = rste.getString("b.MobNo");
				if (MobNo == null) {
					MobNo = "-";

				}
				Designation = rste.getString("b.Designation");
				if (Designation == null) {
					Designation = "-";

				}
			} else {

				employeeName = "-";
				UserName = "-";
				Manager = "-";
				RSMName = "-";
				MobNo = "-";
				Designation = "-";
			}
			String fuelInfoQuery = "SELECT Litres FROM db_gps.t_fuelinfo WHERE vehno='" + vehregno + "' and"
					+ "   TheDateTime >= '" + dt + " 00:00:00' and TheDateTime  <= '" + dt1 + " 23:59:59'"
					+ "	ORDER BY Thedatetime desc";
			String fueltot = "";
			double totalfuel3 = 0.00;
			ResultSet rstfuel=st11.executeQuery(fuelInfoQuery);
			
			//System.out.println("Vehicle List10" + fuelInfoQuery);

			while (rstfuel.next()) {
				//System.out.println("Vehicle List10" + fuelInfoQuery);

				fueltot = rstfuel.getString("Litres");
				if (fueltot.equals("")) {
				} else {
					totalfuel3 = totalfuel3 + Double.parseDouble(fueltot);
					System.out.println("total fuel 3 decimal-->>" + totalfuel3);
					totalfuel2 = totalfuel3;

				}

			}
			//System.out.println("Vehicle List100" + fuelInfoQuery);


			int fullcount = 0;
			int fullcounta = 0;
			float lastfuel = 0, prvfuel = 0, lastOdo = 0, prvOdo = 0, infuel = 0;
			float lastfuel1 = 0, prvfuel1 = 0, lastOdo1 = 0, prvOdo1 = 0;
			float finalfuel = 0, finalOdo = 0;
			fulltank = "No";
			String lastfull = "", lastodo = "", prvfull = "", prvodo = "", timefrom = "", timeto = "",
					infuelstr = "";

			String fulltankquery = "select *  from db_gps.t_fuelinfo where vehno='" + vehregno
					+ "' and FullTank='Yes' AND TheDateTime >= '" + dt + " 00:00:00' and TheDateTime  <= '"
					+ dt1 + " 23:59:59' order by TheDateTime desc";
			ResultSet fullrs = st5.executeQuery(fulltankquery);
			
			//System.out.println("Vehicle List1000" + fulltankquery);

			
			if (fullrs.next()) {
				fullcount++;
				lastfull = fullrs.getString("Litres");
				lastodo = fullrs.getString("Odometer");
				timefrom = fullrs.getString("TheDateTime");
				if (timefrom == null || timefrom.equals("") || timefrom.equals(" ")) {
					timefrom = dt1 + " 23:59:59";
				}

				if (lastfull.equals("")) {
				} else {
					lastfuel = Float.parseFloat(lastfull);
				}
				if (lastodo.equals("") || lastodo.equals("-")) {
				} else {
					lastOdo = Float.parseFloat(lastodo);
				}

			}
			
			//System.out.println("hggggggggg");

			while (fullrs.next()) {
				fullcount++;
				prvfull = fullrs.getString("Litres");
				prvodo = fullrs.getString("Odometer");

				timeto = fullrs.getString("TheDateTime");
				if (timeto == null || timeto.equals("") || timeto.equals(" ")) {
					timeto = dt + " 00:00:00";
				}
				if (prvfull.equals("")) {
				} else {
					prvfuel = Float.parseFloat(prvfull);
				}
				if (prvodo.equals("")) {
				} else {
					prvOdo = Float.parseFloat(prvodo);
				}
			}

			
			//System.out.println("ppppppppppppp");

			
			if (fullcount == 1) {
				String fulltankquery1 = "select * from db_gps.t_fuelinfo where vehno='" + vehregno
						+ "' and FullTank='Yes' AND TheDateTime < '" + dt
						+ " 00:00:00' order by TheDateTime desc";
				ResultSet fullrs1 = st6.executeQuery(fulltankquery1);
				
				//System.out.println("fulltankquery1" + fulltankquery1);

				
				try {
					if (fullrs1.next()) {
						fullcounta++;

						prvfull = fullrs1.getString("Litres");
						prvodo = fullrs1.getString("Odometer");
						timeto = fullrs1.getString("TheDateTime");

						if (prvfull == "" || (prvfull == null) || prvfull == " " || prvfull.equals("")
								|| prvfull.equals("null") || prvfull.equals(" ")) {
						} else {

							prvfuel = Float.parseFloat(prvfull);
						}
						if (prvodo.equals("")) {
						} else {
							prvOdo = Float.parseFloat(prvodo);
						}

					} else
						fullcounta = 0;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//System.out.println("irrrrrrrrrrrrrrrrrrrrr"+fullcount);

			
			if (fullcount > 1 || fullcounta > 0) {
				fulltank = "Yes";
				String infuelquery = "select * from db_gps.t_fuelinfo where vehno='" + vehregno
						+ "'  AND TheDateTime > '" + timeto + "' and TheDateTime  < '" + timefrom
						+ "' order by TheDateTime desc";
				ResultSet infl = st7.executeQuery(infuelquery);
				
				//System.out.println("infuelquery" + infuelquery);

				
				while (infl.next()) {

					infuelstr = infl.getString("Litres");
					if (infuelstr.equals("")) {
					} else

						infuel = infuel + Float.parseFloat(infuelstr);

				}

				
				//System.out.println("iuuuuuuuuuuuuuuuuuuuu");

				prvfuel = prvfuel + infuel;

				finalfuel = prvfuel;

				finalOdo = lastOdo - prvOdo;
				String sqlGps = "SELECT Distance, TheFieldDataDate, TheFieldDataTime " + "FROM t_veh" + vehicleCode
						+ " " + "WHERE TheFieldDataDateTime BETWEEN '" + timeto + "' AND '" + timefrom + "' "
						+ "AND TheFiledTextFileName in ('SI','ON','OF') " + "ORDER BY TheFieldDataDateTime "
						+ "ASC LIMIT 1";
				ResultSet rstgps1 = st12.executeQuery(sqlGps);
				if (rstgps1.next()) {
					gpsfirst1 = rstgps1.getDouble("Distance");
				}

				sqlGps = "SELECT Distance, TheFieldDataDate, TheFieldDataTime " + "FROM t_veh" + vehicleCode + " "
						+ "WHERE TheFieldDataDateTime BETWEEN '" + timeto + "' AND '" + timefrom + "' "
						+ "AND TheFiledTextFileName in ('SI','ON','OF') " + "ORDER BY TheFieldDataDateTime "
						+ "DESC LIMIT 1";
				rstgps1 = st16.executeQuery(sqlGps);
				if (rstgps1.next()) {
					gpslast1 = rstgps1.getDouble("Distance");
				}

				if (gpslast1 > gpsfirst1) {
					gpsdiff1 = gpslast1 - gpsfirst1;
				} else {
					gpsdiff1 = gpsfirst1 - gpslast1;
				}

				if (finalfuel > 0) {
					odoavg = (finalOdo / finalfuel);
					gpsavg = (gpsdiff1 / finalfuel);

				}

			}
			
			//System.out.println("bbbbbbbbbbbbbbbbb"+count);

	%>


	<tr>
		<td align="right"><%=i%></td>
		<td align="left"><%=vehregno%></td>
		
		
		<%
		if(VehicleModel.equals("null") || VehicleModel=="null")
		{
			VehicleModel="-";
		}
		
		%>
		<td align="left"><%=VehicleModel%></td>
		<td align="left"><%=employeeName%></td>
		<td align="left"><%=Designation%></td>
		<td align="right"><%=MobNo%></td>
		<td align="left" id="manager<%=i - 1%>"><%=Manager%></td>
		<td align="left"><%=RSMName%></td>
		<td align="left"><%=trans%></td>
		<%
		
		//System.out.println("bbbbbbbbbbbbbbbbb22222222");

			if (count != 0) {
		%>

		<td align="right"><a
			href="detail_odomter_transporter.jsp?data1=<%=fromdate%>&data2=<%=todate%>&Oname=<%=trans%>&odometer=<%=df.format(ododiff)%>&vehregno=<%=vehregno%>&vehicleCode=<%=vehicleCode%>&employeeName=<%=employeeName%>"><%=count%></a>
			</td>
		<%
			} else {
				//System.out.println("3333333333"+ododiff);

				
		%>
		<td align="right"><%=count%></td>
		<%
			}
		%>

		<%
			if (ododiff != 0) {
		%>


		<td align="right"><a
			href="detail_odomter_transporter.jsp?data1=<%=fromdate%>&data2=<%=todate%>&Oname=<%=trans%>&odometer=<%=df.format(ododiff)%>&vehregno=<%=vehregno%>&vehicleCode=<%=vehicleCode%>&employeeName=<%=employeeName%>"><%=df.format(ododiff)%></a>
			</td>
		<%
			} else {
				
				//System.out.println("44444444444");

				
		%>
		<td align="right"><%=df.format(ododiff)%></td>

		<%
			}
		%>
		<td align="right"><%=df.format(gpsdiff)%></td>

		<%
		//System.out.println("555555555");

			double odomdiff = ododiff;
				double gps1diff = gpsdiff;

				diff = odomdiff - gps1diff;
				String diffstr = "";
				diffstr = "" + diff;
				if (diffstr.startsWith("-")) {
					diffstr = diffstr.replace("-", "");
				}
		%>



		<td align="right"><%=df.format(diff)%></td>

		<%
			if (totalfuel3 != 0) {
					String datefrom = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd").parse(dt));
					String dateto = new SimpleDateFormat("dd-MMM-yyyy")
							.format(new SimpleDateFormat("yyyy-MM-dd").parse(dt1));
		%>



		<td align="right"><a
			href="custfuelfillreport.jsp?vehicleRegistrationNumber=<%=vehregno%>&data=<%=datefrom%>&data1=<%=dateto%>"><%=df.format(totalfuel3)%></a>
		</td>
		<%
			} else {
		%>
		<td align="right">0.00</td>
		<%
			}
		
		//System.out.println("6666666666666");

		%>


		<td align="right"><%=df.format(totaldistanceBetweenSelectedDates)%></td>

		<input type="hidden" name="fullcount" id="fullcount<%=i - 1%>"
			value="<%=fullcount%>"></input>
		<input type="hidden" name="fullcounta" id="fullcounta<%=i - 1%>"
			value="<%=fullcounta%>"></input>
		<%
			if (fullcount > 1 || fullcounta > 0) {
					String odoavgdis = "", gpsavgdis = "";

					odoavgdis = df.format(odoavg);
					gpsavgdis = df.format(gpsavg);
		%>
		<td align="right" id="tda<%=i - 1%>"><a
			href="fuelfulltankreport.jsp?vehcode=<%=vehicleCode%>&fromdate=<%=timeto%>&todate=<%=timefrom%>&ownername=<%=trans%>&vehregnumber=<%=vehregno%>&firstodo=<%=prvOdo%>&lastodo=<%=lastOdo%>&firstgps=<%=gpsfirst1%>&lastgps=<%=gpslast1%>&firstfuel=<%=prvfuel%>&lastfuel=<%=lastfuel%>&betweenfuel=<%=infuel%>&finalgps=<%=gpsdiff1%>&finalfuel=<%=finalfuel%>&finalodo=<%=finalOdo%>&odoavg=<%=odoavg%>&gpsavg=<%=gpsavg%>"><%=fulltank%></a>
		</td>



		<td align="right" id="tdb<%=i - 1%>"><%=odoavgdis%></td>
		<td align="right" id="tdc<%=i - 1%>"><%=gpsavgdis%></td>
		<%
			} else {
		%>
		<td align="right" id="tdp<%=i - 1%>"><%=fulltank%></td>
		<td align="right" id="tdq<%=i - 1%>">NA</td>
		<td align="right" id="tdr<%=i - 1%>">NA</td>
		<%
			}
		
		//System.out.println("7777777777777");

		%>


	</tr>
	<input type="hidden" name="cnt" id="cnt" value=<%=i - 1%>></input>

	<%
		i++;

		}
	}
	catch(Exception e)
	{
		System.out.println("Exception-->" + e);

	}
       %>
	</tbody>
	<tfoot>
		<tr>
			<th width="4%" align="center">Sr No</th>
			<th align="center">Vehicle</th>
			<th align="center">Vehicle Model</th>
			<th align="center">User</th>
			<th align="center">Designation</th>
			<th align="center">MobNo</th>
			<th align="center">Manager</th>
			<th align="center">RSM Name</th>
			<th align="center">Transporter</th>
			<th align="center">Odometer Count</th>
			<th align="center">Odometer Km</th>
			<th align="center">GPS Km</th>
			<th align="center">Difference</th>
			<th align="center">Fuel Added</th>
			<th align="center">Total GPS Km</th>
			<th align="center">Full Tank</th>
			<th align="center">Odometer Avg</th>
			<th align="center">GPS Avg</th>
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
</body>
							   
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
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17] }
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

             dt_basic.columns([9, 10, 11, 12, 13, 14, 15, 16, 17]).visible(false) ,

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

            dt_basic.columns([9, 10, 11, 12, 13, 14, 15, 16, 17]).visible(true),

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


</html>
