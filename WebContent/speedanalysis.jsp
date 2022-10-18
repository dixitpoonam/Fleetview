<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    <%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*" import="moreservlets.listeners.*" errorPage=""%>
	<%@ page import="java.io.FileNotFoundException"%>
	<%@ page import="java.io.FileOutputStream"%>
	<%@ page import=" java.io.IOException"%>
	<%@ page import="javax.activation.*"%>
    
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
 	
 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<link href='https://fonts.googleapis.com/css?family=Arial+Web:400,300,600' rel='stylesheet' type='text/css'>
 	<script type="text/javascript" src="css/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
 	
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
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st3=null,st20=null,st21=null;
	int cnt1,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
	int cnttotal1=0,cnttotal2=0,cnttotal3=0,cnttotal4=0,cnttotal5=0,cnttotal6=0,cnttotal7=0;
%>
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 

String datex1, datex2,vehicle="", data1, data2,date2,date1;
%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		vehicle="All";
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		
		datex2 = session.getAttribute("today").toString();
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");
		vehicle=request.getParameter("vehicle");

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));

String dt1time=""+dt1+" 23:59:59";

System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);
	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

/* String Selection = request.getParameter("vehicle");
System.out.println("selection:"+Selection); */

%>

<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st= conn.createStatement();
	    st1=conn.createStatement();
	    st2=conn.createStatement();
	    st3=conn.createStatement();
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


<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Speed Analysis Report From <%=datex1 %>
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
			
			<form name="formreport" id="formreport" method="post">
		    <div class="row col-12">
		    <div class="col-md-2"></div>
		    <div class="col-md-2">
		    <label for="basicSelect">Vehicle</label>
						<div class="input-group input-group-merge">
							<select class="form-select" id="vehicle" name="vehicle">
								<%

			String sql="select * from t_vehicledetails where VehicleCode in "+session.getAttribute("VehList").toString()+" order by VehicleRegNumber";
			ResultSet rst=st.executeQuery(sql);
			while(rst.next())
			{
				%>
				<option value="<%=rst.getString("VehicleRegNumber")%>" <% if(vehicle.equals(rst.getString("VehicleRegNumber"))){ %>Selected<% } %> ><%=rst.getString("VehicleRegNumber")%></option>				
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
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
			</form>
			
			
						<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
							<thead>
										<tr>
											<th>Sr No</th>
											<th>Date</th>
											<th>Below 15 kmph</th>
											<th>15 to 30 kmph</th>
											<th>30 to 40 kmph</th>
											<th>40 to 50 kmph</th>
											<th>50 to 60 kmph</th>
											<th>60 to 80 kmph</th>
											<th>Above 80 kmph</th>
										</tr>
									</thead>
									<tbody>
									<%
				System.out.println("vehicle:"+vehicle);
				String sqll="select * from t_vehicledetails where VehicleRegNumber='"+vehicle+"' order by VehicleRegNumber";
				System.out.println("main Query:-->"+sqll);
				ResultSet rst1=st.executeQuery(sqll);
				if(rst1.next())
				{	
				String sqlll="select distinct(TheFieldDataDate) from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate >='"+dt+"' and TheFieldDataDate <='"+dt1+"' order by TheFieldDataDate ";
				System.out.println("sqlll::"+sqlll);			
				ResultSet rst0=st2.executeQuery(sqlll);
				int j=1;
				cnttotal1=0;
				cnttotal2=0;
				cnttotal3=0;
				cnttotal4=0;
				cnttotal5=0;
				cnttotal6=0;
				cnttotal7=0;
				while(rst0.next())
				{
				cnt1=0;
				cnt2=0;
				cnt3=0;
				cnt4=0;
				cnt5=0;
				cnt6=0;
				cnt7=0;
				sql="select count(*) as cnt1 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed > 0 and Speed <=15";
				ResultSet rstcnt1=st3.executeQuery(sql);
				if(rstcnt1.next())
				{
					cnt1=rstcnt1.getInt("cnt1");
					cnttotal1=cnttotal1+cnt1;
				}
				
				sql="select count(*) as cnt2 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >15 and Speed <=30";
				ResultSet rstcnt2=st3.executeQuery(sql);
				if(rstcnt2.next())
				{
					cnt2=rstcnt2.getInt("cnt2");
					cnttotal2=cnttotal2+cnt2;
				}	
				
				sql="select count(*) as cnt3 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >30 and Speed <=40";
				ResultSet rstcnt3=st3.executeQuery(sql);
				if(rstcnt3.next())
				{
					cnt3=rstcnt3.getInt("cnt3");
					cnttotal3=cnttotal3+cnt3;
				}
				
				sql="select count(*) as cnt4 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >40 and Speed <=50";
				ResultSet rstcnt4=st3.executeQuery(sql);
				if(rstcnt4.next())
				{
					cnt4=rstcnt4.getInt("cnt4");
					cnttotal4=cnttotal4+cnt4;
				}	
				
				sql="select count(*) as cnt5 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >50 and Speed <=60";
				ResultSet rstcnt5=st3.executeQuery(sql);
				if(rstcnt5.next())
				{
					cnt5=rstcnt5.getInt("cnt5");
					cnttotal5=cnttotal5+cnt5;
				}	
				
				sql="select count(*) as cnt6 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >60 and Speed<=80 ";
				ResultSet rstcnt6=st3.executeQuery(sql);
				if(rstcnt6.next())
				{
					cnt6=rstcnt6.getInt("cnt6");
					cnttotal6=cnttotal6+cnt6;
				}	
				sql="select count(*) as cnt7 from t_veh"+rst1.getString("vehicleCode")+" where TheFieldDataDate='"+rst0.getString("TheFieldDataDate")+"' and TheFiledTextFileName='SI' and Speed >80 ";
				ResultSet rstcnt7=st3.executeQuery(sql);
				if(rstcnt7.next())
				{
					cnt7=rstcnt7.getInt("cnt7");
					cnttotal7=cnttotal7+cnt7;
				}	
					%>
				<tr>
				<td style="text-align: right"><%=j%></td>
				<td style="text-align: right"><a href="#" onClick="window.open('dayspeedchart.jsp?vehregno=<%=vehicle%>&cnt1=<%=cnt1%>&cnt2=<%=cnt2%>&cnt3=<%=cnt3%>&cnt4=<%=cnt4%>&cnt5=<%=cnt5%>&cnt6=<%=cnt6%>&cnt7=<%=cnt7%>&thedate=<%=new SimpleDateFormat("dd-MMM-yyyy").format(rst0.getDate("TheFieldDataDate"))%>&vehcode=<%=rst1.getString("vehicleCode")%>','win1','width=800,height=900,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=new SimpleDateFormat("dd-MMM-yyy").format(rst0.getDate("TheFieldDataDate"))%></a></td>
				<td><div align="right"><%=cnt1%></div></td>
				<td><div align="right"><%=cnt2%></div></td>
				<td><div align="right"><%=cnt3%></div></td>
				<td><div align="right"><%=cnt4%></div></td>
				<td><div align="right"><%=cnt5%></div></td>
				<td><div align="right"><%=cnt6%></div></td>	
				<td><div align="right"><%=cnt7%></div></td>	
				</tr>		
					<%
					j++;
				}
			}
			%>
			</tbody>
			
			
			<tbody>
	        <tr>
	        <td></td>
            <td>Total</td>
            <td align="right"><%=cnttotal1%></td>
			<td align="right"><%=cnttotal2%></td>
			<td align="right"><%=cnttotal3%></td>
			<td align="right"><%=cnttotal4%></td>
			<td align="right"><%=cnttotal5%></td>
			<td align="right"><%=cnttotal6%></td>
			<td align="right"><%=cnttotal7%></td>
             </tr></tbody>
										
									
									<tfoot>
										<tr>
											<th>Sr No</th>
											<th>Date</th>
											<th>Below 15 kmph</th>
											<th>15 to 30 kmph</th>
											<th>30 to 40 kmph</th>
											<th>40 to 50 kmph</th>
											<th>50 to 60 kmph</th>
											<th>60 to 80 kmph</th>
											<th>Above 80 kmph</th>
										</tr>
									</tfoot>
							 
							</table>
							</div>
							</div>
							</div>
							
							<div id='graph-images' style='display:none'></div>
							
							<div class="row mt-1">
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
							<h4 class="text-center">Speed Statistics</h4>
	 	<div class="text-left" >
	 		<button type="button" class="btn btn-success" id="save-pdfPerformance" >Export</button>
	 	</div>
		<script type="text/javascript">
		
		// Load the Visualization API and the corechart package.	
		google.charts.load('current', {'packages':['corechart']});
			
	     // Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
	
			function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Speed Range', 'Total'],
		          ['Below 15kmph',<%=cnttotal1%>],
		          ['15 to 30kmph',<%=cnttotal2%>],
		          ['30 to 40 kmph',<%=cnttotal3%>],
		          ['40 to 50 kmph',<%=cnttotal4%>],
		          ['50 to 60 kmph',<%=cnttotal5%>],
		          ['60 to 80 kmph',<%=cnttotal6%>],
		          ['Above 80 kmph',<%=cnttotal7%>]
		          
		        ]);
		
		        var options = {
		                title: 'Speed Statistics',
		                titleTextStyle:{
		                	fontSize: 16
		                	},
		                curveType: 'function',
		                pieHole: 0.4,
		                pieSliceTextStyle:{
		                	fontSize: 15
		                },
		                colors: ['Blue', 'Maroon','Yellow','Orange','Green','Gray','Violet'],
		                legend: {
		        	    	position: 'labeled',
		        	    	labeledValueText:'value',
		        	    	textStyle: {
		        	            color: 'black',
		        	            fontSize: 15,
		        	        }
		        	    },
		        	    chartArea:{width:'100%',height:'75%'},	
	                    'height':300
		              };
		
		          var container = document.getElementById('performance_chart');
		    	  var chart = new google.visualization.PieChart(container);
		    	  var btnSave = document.getElementById('save-pdfPerformance');
		
		
		    	  
		    	  google.visualization.events.addListener(chart, 'ready', function () {
		    	    btnSave.disabled = false;
		    	    var content = '<img src="' + chart.getImageURI() + '">';
			           $('#graph-images').append(content);
		    	  });
		
		    	  
		    	  btnSave.addEventListener('click', function () {
		    	    var doc = new jsPDF();
		    	    doc.addImage(chart.getImageURI(), 50, 30);
		    	    doc.save('/home/ashish/Speed Statistics.pdf');
		    	  }, false);
		
			      chart.draw(data, options);
		      }
		</script>
	 	<div id="performance_chart" style="border:width=1"></div>
		</div>
			</div>
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
			int kk=0; 
			 
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