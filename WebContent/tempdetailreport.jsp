<%@ include file="headernew1.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
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
		//for report conversion uncomment the line below and erase the line above
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}


</script>
<script>

function fun1()
{	
	var c=document.getElementById("days").value;
	
	if(c=="")
		{
		document.getElementById("days").value=1;
		}
	else
		{
		var v=document.getElementById("days").value;
		v++;
		document.getElementById("days").value=v;
		
		}
	
	return false;
}
</script>
<script>
function fun3()
{
	/* alert("inside fun3"); */
	
	var interval=document.getElementById("interval").value;
	if(interval=="")
		{
		document.getElementById("interval").value=60;
		}
	else
		{
		var i=document.getElementById("interval").value;
		i++;
		
		document.getElementById("interval").value=i;
		
		}
	
	return false;
}
</script>
<script>
function fun4()
{
	var interval=document.getElementById("interval").value;
	if(interval=="")
		{
		document.getElementById("interval").value=60;
		}
	if(interval==0)
		{
		document.getElementById("interval").value=1;
		}
	else
		{
		var a=document.getElementById("interval").value;
		a--;
		document.getElementById("interval").value=a;
		
		}
	
	return false;
}


</script>
<script>
function datevalidate()
{
	
	
	var interval=document.getElementById("interval").value;
	

	 	
	 	
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
//	          else if(date1 > currentDate)
//	          {
//	              alert("From Date should be less than current date");
//	              return false; 
//	          }
//	          else if(date2 > currentDate) 
//	          {
//	              alert("To Date should be less than current date");
//	              return false; 
//	          }
	         
	         
	         var ftime=document.getElementById("ftime1").value;
	         /* alert(ftime); */
	         
	         
	         var ttime1=document.getElementById("ttime1").value;
/* 	         alert(ttime1); */
	         
	         if(ftime>ttime1)
	        	 {
	        	 alert("Please select valid time");
	        	 return false;
	        	 }
	         
	         
	         

	         return true;
	 	
	 

	  
	   
	
}


</script>

<script>
function graphlink()
{
	
	var b=document.getElementById("interval").value;
	
	var v=document.getElementById("Vehicle").value;
	
	
	
	var from=document.getElementById("fromdate").value;
/* 	alert(from); */
	
	var todate=document.getElementById("todate").value;
	/* alert(todate); */
	
	/* alert(b);
	alert(a);
	alert(v); */
	
	
	location.assign("temperaturegraph.jsp?vehcode="+v+"&data="+from+"&data1="+todate+"");
	

	
}


</script>
</head>
<body onload="ondemand()">
<%
String username="";
String VehicleCode="",sql="",vehregno="";

username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datenew1="", datenew2="", data="", data1="", data2="";
String fromdate="",todate="";
String days1="",interval1="";


%>
<%
	Connection conn=null;
	Statement st=null, st1=null,st20=null,st21=null;
	Statement sttemp=null;
	Statement stmt1=null,stmt2=null,stmt3=null,stmt4=null;
%>


<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
		st=conn.createStatement();
		st1=conn.createStatement();

		stmt1=conn.createStatement();
		stmt2=conn.createStatement();
		stmt3=conn.createStatement();
		stmt4=conn.createStatement();

	    st20=conn.createStatement();
	    st21=conn.createStatement();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
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
	setDefFlag=true;    //uncomment this line for report conversion testing
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
		setDefFlag=true;   //uncomment this line for report conversion
		
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
						<h3 class="content-header-title  mb-0">Temperature and Humidity Report</h3>
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
		<%
String ddx = request.getQueryString();
String bt=request.getParameter("submit");
System.out.println(" buttom :- "+bt);


DecimalFormat df = new DecimalFormat("0.00");

String dateinterval="",mininterval="";

String interval=request.getParameter("interval");
String Vehicle=request.getParameter("Vehicle");


System.out.println("Interval is------>:"+interval);


java.util.Date date1=new java.util.Date();
java.util.Date date2=new java.util.Date();



System.out.println(date1);
System.out.println(date2);
long millis=0;
long millis1=0;
long millis2=0;
	


System.out.println("Interval is------>:"+Vehicle);


	if(bt==null)
	{
		datenew1 = session.getAttribute("today").toString();
		datenew2 = session.getAttribute("today").toString();
		
		fromdate= session.getAttribute("Today").toString();
		todate= session.getAttribute("Today").toString();
		
		
		fromdate=fromdate+" 00:00:00";
		todate=todate+" 23:59:59";
		
	
		
		String a="23";
		String b="59";
			
		
		interval1="60";
		
		
		VehicleCode=request.getParameter("vehcode");
		
	%>
		
		<script>
		document.getElementById("ttime1").value = '<% out.print(a); %>';
		document.getElementById("ttime2").value = '<% out.print(b); %>';
		</script>
	
		<% 
		
		mininterval=" select *  from db_gps.t_veh"+VehicleCode+" where TheFieldDataDateTime >= '"+fromdate+"' and TheFieldDataDateTime <='"+todate+"'  and TheFiledTextFileName in('SI') order by Thefielddatadatetime";
		
		
		System.out.println("Query is:"+mininterval);
		
		System.out.println("Button not Press:"+days1);
		System.out.println("Button not Press:"+interval1);
		
	}
	else
	{
		
		
		String date12=request.getParameter("data");
		String ftime1=request.getParameter("ftime1");
		String ftime2=request.getParameter("ftime2");




		String date13=request.getParameter("data1");
		String ttime1=request.getParameter("ttime1");
		String ttime2=request.getParameter("ttime2");



		String fromtime=ftime1+":"+ftime2+":00";
		
		String totime=ttime1+":"+ttime2+":59";
		
		
		
		
		System.out.println("-------------------->"+fromtime);
		
		
		
		System.out.println("----------------------->"+ftime1);
		System.out.println("----------------------->"+ftime2);

		System.out.println("----------------------->"+date12);
		System.out.println("----------------------->"+date13);

		System.out.println("----------------------->"+ttime1);
		System.out.println("----------------------->"+ttime2);

		%>
		<script>
		document.getElementById("data").value = '<% out.print(date12); %>';
		document.getElementById("data1").value = '<% out.print(date13); %>';
		document.getElementById("ftime1").value = '<% out.print(ftime1); %>';
		document.getElementById("ftime2").value = '<% out.print(ftime2); %>';
		
		document.getElementById("ttime1").value = '<% out.print(ttime1); %>';
		document.getElementById("ttime2").value = '<% out.print(ttime2); %>';
		
		</script>
		
		
		<% 
fromdate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date12));

todate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date13));



fromdate=fromdate+" "+fromtime;
todate=todate+" "+totime;


System.out.println("---===>"+fromdate);
System.out.println("---===>"+todate);


		
		
		
		
		interval1=request.getParameter("interval");
		
		System.out.println("Button Press interval:"+interval1);
		
		VehicleCode=request.getParameter("Vehicle");
		
		
		if(interval1.equals("0"))
		{
			interval1="1";
		}
		
		fromdate=fromdate+" 00:00:00";
		todate=todate+" 23:59:59";
		
		
		mininterval="select *  from db_gps.t_veh"+VehicleCode+" where TheFieldDataDateTime >= '"+fromdate+"' and TheFieldDataDateTime <='"+todate+"'  and TheFiledTextFileName in('SI')   order by Thefielddatadatetime";
		
		System.out.println("Query after enter submit:"+mininterval);
	}


String Selection = request.getParameter("Vehicle");
System.out.println("selection:"+Selection);

%>
<!-- FORM COMES HERE -->
<form name="formreport" id="formreport" method="post">
		    <div class="row col-12">
		    <div class="col-md-2">
		    <label for="basicSelect">Vehicle</label>
						<div class="input-group input-group-merge">
							<select name="Vehicle" id="Vehicle" name="Vehicle" class="form-select" id="vehicle">
								<option value="<%=VehicleCode %>" ><%=vehregno %></option>
<%
String ven="";
String vehlist = session.getAttribute("VehList").toString();
String veh="select VehicleRegNumber,VehicleCode  from db_gps.t_vehicledetails where vehiclecode in "+vehlist+" order by VehicleRegNumber";
System.out.println("vendor1"+veh);
ResultSet rstvendor=st1.executeQuery(veh);
while(rstvendor.next())
{	 ven=rstvendor.getString("VehicleRegNumber") ;
%>
<option value="<%=rstvendor.getString("VehicleCode") %>" ><%=rstvendor.getString("VehicleRegNumber") %></option>
<%} %>
</select>
</div>
		    </div>
		    <div class="col-md-2">
						<label for="from">From:</label>
						<div class="input-group input-group-merge">

							<input type="text" name="data" id="data" class="form-control"
								value="<%=datenew1%>"> <span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="14"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-calendar">
									<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
									<line x1="16" y1="2" x2="16" y2="6"></line>
									<line x1="8" y1="2" x2="8" y2="6"></line>
									<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
						</div>

						<script>
							$(document).ready(function() {
								$(function() {
									$("#data").datepicker({
										dateFormat : 'dd-M-yy',
										changeMonth : true,
										changeYear : true
									});
								});

							});
						</script>
						</div>
					
					<div class="col-md-1">
					<label for="basicSelect">HH:</label>
						<div class="input-group input-group-merge">
					<select name="ftime1" id="ftime1" class="form-select">
									<%
										if (bt == null) {
									%>

									<option value="00" selected>00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String hour = request.getParameter("ftime1");
												////System.out.println("Hour In else :- "+hour);
									%>
									<option value="<%=hour%>" selected><%=hour%></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>
					</select>
					</div>
					</div>
					
					<div class="col-md-1">
					    <label for="basicSelect">MM</label>
						<div class="input-group input-group-merge">
					     <select name="ftime2" id="ftime2" class="form-select">
																		<%
										if (bt == null) {
									%>
									<option value="00" selected>00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String min = request.getParameter("ftime2");
												////System.out.println("Minute  In else :- "+min );
									%>
									<option value="<%=min%>" selected><%=min%></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>

								</select>
					</div>
					</div>
					
					<div class="col-md-2">
						<label for="to">To:</label>
						<div class="input-group input-group-merge">

							<input type="text" id="data1" name="data1" class="form-control"
								value="<%=datenew2%>" /> <span class="input-group-text"><svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="14"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-calendar">
									<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
									<line x1="16" y1="2" x2="16" y2="6"></line>
									<line x1="8" y1="2" x2="8" y2="6"></line>
									<line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
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
					
					<div class="col-md-1">
					<label for="basicSelect">HH:</label>
						<div class="input-group input-group-merge">
					<select name="ttime1" id="ttime1" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="23" selected>23</option>

									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String hour = request.getParameter("ttime1");
												////System.out.println("Hour In else :- "+hour);
									%>
									<option value="<%=hour%>" selected><%=hour%></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 24; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

											}
									%>

								</select>
								</div>
					</div>
					
					<div class="col-md-1">  
					<label for="basicSelect">MM:</label>
						<div class="input-group input-group-merge">
					          <select name="ttime2" id="ttime2" class="form-select">
									<%
										if (bt == null) {
									%>
									<option value="59" selected>59</option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}
											} else {
												String min = request.getParameter("ttime2");
												////System.out.println("Minute  In else :- "+min );
									%>
									<option value="<%=min%>" selected><%=min%></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<%
										for (int i = 10; i < 60; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
										}

																}
									%>

								</select>
								</div>
					         </div>
		    			<div class="col-md-1">
		    			<label for="interval">Interval:</label>
		    			<div class="input-group input-group-merge">
		    			<button onclick="return fun4()">-</button>
<%

if(bt==null)
{
%>
<input class="form-control" type="text" id="interval" pattern="[0-9]*" title="Only Number values are allowed" name="interval" value="60" style="width:30px">
<%}
else
{
	String inter=request.getParameter("interval");
	%>
	<input class="form-control" type="text" id="interval"  pattern="[0-9]*" title="Only Number values are allowed"  name="interval" value=<%=inter %> style="width:30px">	
	<% 
}%>

<button onclick="return fun3()">+</button>
		    			</div>
		    			</div>
		    <div class="col-md-1">
		    	<input type="submit" name="submit" value="Submit"  class="btn btn-primary" style="margin-top: 20px;" onclick="return datevalidate();" >
		    </div>
			</div> <!--col-md-12-->
			</form>
			<br>
<!-- TABLE COMES HERE  -->
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
           					<th>Date-Time</th>
                			<th>Speed</th>
                			<th>Distance</th>
                			<th>Location</th>
       		    			<th>Sen1</th>
                			<th>Sen2</th>
                			<th>Sen3</th>
                			<th>Sen4</th>
                			<th>Sen6</th>
                			<th>Sen7</th>
                			<th>Sen8</th>
                			<th>Sen9</th>
                          </tr>
							</thead>
							<tbody>
							<%
	
	String VhNumber="";
	String sql12="select * from t_vehicledetails where VehicleCode='"+VehicleCode+"'";
	ResultSet rs121=st.executeQuery(sql12);
	if(rs121.next())
	{
		VhNumber=rs121.getString("VehicleRegNumber");
		
	}
	
	VhNumber=VhNumber.replace(" ", "");
	System.out.println("=============================>"+VhNumber);
	
	
	 data = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
	
	
	 data1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
	
	%>
	
	<% 
	
	
	String Lat="",Lon="";
	
	int dist=0;
	
	ResultSet rs12=stmt3.executeQuery(mininterval);
	int i=1;
	int j=2;
	System.out.println("Query is---------->:"+mininterval);
	
	
	while(rs12.next())
	{
		Lat=rs12.getString("LatinDec");
	    Lon=rs12.getString("LonginDec");
		String dt=rs12.getString("Thefielddatadatetime").substring(0,19);
		
		String dt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
		        .format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		                .parse(dt));
		
		
		if(i==1)
		{
			dist=rs12.getInt("Distance");
			
			
			date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs12.getString("TheFieldDataDate")+" "+rs12.getString("TheFieldDataTime"));

		}
		
		
	//	System.out.println("Calculation Part is Below:");
		
		
	date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs12.getString("TheFieldDataDate")+" "+rs12.getString("TheFieldDataTime"));
	    
	System.out.println(date2);	
	
		millis=date1.getTime();
		millis1=date2.getTime();
	    millis2=millis1-millis;
	    
	  //  System.out.println("Millies Before Calculation:"+millis2);
	    
	    millis2=millis2/1000/60;
	    
	    int interval2=Integer.parseInt(interval1);
	    
	 
	  if(i==1)
	  {
		%>
		
		<tr>
  	
	    	<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
	    	<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=dt1%></td>
	    	<%
	
		%>
		
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs12.getString("Speed")%></td>
			
			<%

			if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
			{
			
				 %>
				
				<%-- <td style="font-size: 11px; face:san-serif; color:black" align="right"><%=(int)fleetview.KM_TO_MILES1(rs12.getInt("Distance")-dist)%></td> --%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=(int)Double.parseDouble(new DecimalFormat("#0.00").format((rs12.getInt("Distance")-dist)/ 1.609344D))%></td>
				<%
			}else
			{
				%>
				
				<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs12.getInt("Distance")-dist%></td>
			
				<%
				
			}
			
			%>
			
			<td><div align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rs12.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rs12.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rs12.getString("TheFieldSubject") %></a>
				</div>
				</td>
			<%
		//	System.out.println("Inside Value sen 1111111111111111111111 :-->"+rs12.getString("Sen1"));
			if(rs12.getString("Sen1").equals("-") || rs12.getString("Sen1").equals("TD"))
			{
				
				
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				
				int n2=1;
				double Sen1=0;
				String sen1=rs12.getString("Sen1");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen1.charAt(n1) >= '0' && sen1.charAt(n1) <= '9') 
		            {
		            	Sen1=Double.parseDouble(sen1);
		            	
		            }
		            
		          
		        }   
				
				System.out.println("Sen1===========" + sen1);
				//double Sen1=Double.parseDouble(sen1);
				
				
			%>
			
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen1)%></td>
			<%
			}
			%>
			
			
			
			<%
			
			if(rs12.getString("Sen2").equals("-"))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{

				int n2=1;
				double Sen2=0;
				String sen2=rs12.getString("Sen2");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen2.charAt(n1) >= '0' && sen2.charAt(n1) <= '9') 
		            {
		            	Sen2=Double.parseDouble(sen2);
		            }
		            else
		            {
		            	
		            }
		          
		        } 
				/* String sen2=rs12.getString("Sen2");
				
				double Sen2=Double.parseDouble(sen2); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen2)%></td>
			<%
			}
			%>
			
			
			<%
			
			if(rs12.getString("Sen3").equals("-"))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen3=0;
				String sen3=rs12.getString("Sen3");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen3.charAt(n1) >= '0' && sen3.charAt(n1) <= '9') 
		            {
		            	Sen3=Double.parseDouble(sen3);
		            }
		          
		        } 
				
				/* String sen3=rs12.getString("Sen3");
				
				double Sen3=Double.parseDouble(sen3); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen3)%></td>
			<%
			}
			%>
			
			<%
			
			System.out.println("Inside Value sen 4:-->"+rs12.getString("Sen4"));
			System.out.println("Inside Length condition::::"+rs12.getString("Sen4").length());
			
			if(rs12.getString("Sen4").equals("-"))
			{
				
				
				
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen4=0;
				String sen4=rs12.getString("Sen4");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen4.charAt(n1) >= '0' && sen4.charAt(n1) <= '9') 
		            {
		            	Sen4=Double.parseDouble(sen4);
		            }
		          
		        } 
				
				
				/* String sen4=rs12.getString("Sen4");
				
				double Sen4=Double.parseDouble(sen4); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen4)%></td>
			<%
			}
	    
			
			%>
			<%
			
			if(rs12.getString("Sen6").equals("-") || rs12.getString("Sen6").contains("NAN"))
			{				System.out.println("Inside Match condition");

				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen6=0;
				String sen6=rs12.getString("Sen6");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen6.charAt(n1) >= '0' && sen6.charAt(n1) <= '9') 
		            {
		            	Sen6=Double.parseDouble(sen6);
		            }
		          
		        } 
				
				
				/* String sen6=rs12.getString("Sen6");
				
				double Sen6=Double.parseDouble(sen6); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen6)%></td>
			<%
			}
			%>
			<%
			
			if(rs12.getString("Sen7").equals("-") || rs12.getString("Sen7").contains("NAN") )
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen7=0;
				String sen7=rs12.getString("Sen7");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen7.charAt(n1) >= '0' && sen7.charAt(n1) <= '9') 
		            {
		            	Sen7=Double.parseDouble(sen7);
		            }
		          
		        } 
				/* String sen7=rs12.getString("Sen7");
				
				double Sen7=Double.parseDouble(sen7); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen7)%></td>
			<%
			}
			%>
			<%
			
			if(rs12.getString("Sen8").equals("-") || rs12.getString("Sen8").contains("NAN") )
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen8=0;
				String sen8=rs12.getString("Sen8");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen8.charAt(n1) >= '0' && sen8.charAt(n1) <= '9') 
		            {
		            	Sen8=Double.parseDouble(sen8);
		            }
		          
		        } 
				
				
				/* String sen8=rs12.getString("Sen8");
				
				double Sen8=Double.parseDouble(sen8); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen8)%></td>
			<%
			}
			%>
			<%
			
			if(rs12.getString("Sen9").equals("-") || rs12.getString("Sen9").contains("NAN") )
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				int n2=1;
				double Sen9=0;
				String sen9=rs12.getString("Sen9");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (sen9.charAt(n1) >= '0' && sen9.charAt(n1) <= '9') 
		            {
		            	Sen9=Double.parseDouble(sen9);
		            }
		          
		        } 
				/* String sen9=rs12.getString("Sen9");
				
				double Sen9=Double.parseDouble(sen9); */
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen9)%></td>
			<%
			}
			%>
			
		</tr>
		
		<%   
	  }
		
		%>
			<%  if(millis2>=interval2)
	    {
			
	    	date1=date2;
	    	System.out.println("The Field date Time:"+dt1);
	    	System.out.println("***************************************************");
	    	%>
		<tr>
		 	
	    	<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=j%></td>
	    	<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=dt1%></td>
	    	<%
	    
			System.out.println("*"+rs12.getString("Speed"));
		%>
		
				
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs12.getString("Speed")%></td>
			
			
			
			<%

			if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
			{
				 %>
				
				
				
				<%-- <td style="font-size: 11px; face:san-serif; color:black" align="right"><%=(int)fleetview.KM_TO_MILES1(rs12.getInt("Distance")-dist)%></td> --%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=(int)Double.parseDouble(new DecimalFormat("#0.00").format((rs12.getInt("Distance")-dist)/ 1.609344D))%></td>
				<%
			}else
			{
				%>
				
				
				
				<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rs12.getInt("Distance")-dist%></td>
				
				
				
				
				
				
				
				<%
				
				
				
				
				
			}
			
			
			
			//System.out.println(rs12.getString("TheFieldSubject"));
			
			%>
			
			
                <td><div align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rs12.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rs12.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rs12.getString("TheFieldSubject") %></a>
				</div>
				</td>
			
			
			<%
			
			
			
			
				String sen1=rs12.getString("Sen1");
				
				if(sen1.equals("-") || sen1.equals("TD"))
				{
					%>
					
					
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				
				//double Sen1=Double.parseDouble(sen1);
					int n2=1;
				double Sen1=0;
				 String senn1=rs12.getString("Sen1");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn1.charAt(n1) >= '0' && senn1.charAt(n1) <= '9') 
		            {
		            	Sen1=Double.parseDouble(senn1);
		            }
		          
		        } 	
				
			%>
			
			
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen1)%></td>
			<%
				}
			
			%>
			
			
			
			<%
			
			if((rs12.getString("Sen2").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
	String sen2=rs12.getString("Sen2");
				
	
		if(sen2.equals("-"))
		{
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
			<%
		}
		else
		{
				
				//double Sen2=Double.parseDouble(sen2);
				int n2=1;
				double Sen2=0;
				 String senn2=rs12.getString("Sen2");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn2.charAt(n1) >= '0' && senn2.charAt(n1) <= '9') 
		            {
		            	Sen2=Double.parseDouble(senn2);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen2)%></td>
			<%
		}
			}
			%>
			
			
			<%
			
			if((rs12.getString("Sen3").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				String sen3=rs12.getString("Sen3");
				
				if(sen3.equals("-"))
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen3=Double.parseDouble(sen3);
				int n2=1;
				double Sen3=0;
				 String senn3=rs12.getString("Sen3");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn3.charAt(n1) >= '0' && senn3.charAt(n1) <= '9') 
		            {
		            	Sen3=Double.parseDouble(senn3);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen3)%></td>
			<%
				}
			}
			%>
			
			<%
			
			System.out.println("Inside Value sen 4:-->"+rs12.getString("Sen4"));
			System.out.println("Inside Length condition::::"+rs12.getString("Sen4").length());
			
			if((rs12.getString("Sen4").equals("0.0")))
			{
				
				
				System.out.println("Inside Match condition");
				
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				
				String sen4=rs12.getString("Sen4");
				
				if(sen4.equals("-"))
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen4=Double.parseDouble(sen4);
				int n2=1;
				double Sen4=0;
				 String senn4=rs12.getString("Sen4");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn4.charAt(n1) >= '0' && senn4.charAt(n1) <= '9') 
		            {
		            	Sen4=Double.parseDouble(senn4);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen4)%></td>
			<%
				}
			}
	    
			
			%>
				
			<%
			
			if((rs12.getString("Sen6").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				String sen6=rs12.getString("Sen6");
				
				if(sen6.equals("-") || rs12.getString("Sen6").contains("NAN"))
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen6=Double.parseDouble(sen6);
				int n2=1;
				double Sen6=0;
				 String senn6=rs12.getString("Sen6");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn6.charAt(n1) >= '0' && senn6.charAt(n1) <= '9') 
		            {
		            	Sen6=Double.parseDouble(senn6);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen6)%></td>
			<%
				}
			}
			%>	
			<%
			
			if((rs12.getString("Sen7").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				String sen7=rs12.getString("Sen7");
				
				if(sen7.equals("-") || rs12.getString("Sen7").contains("NAN"))
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen7=Double.parseDouble(sen7);
				int n2=1;
				double Sen7=0;
				 String senn7=rs12.getString("Sen7");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn7.charAt(n1) >= '0' && senn7.charAt(n1) <= '9') 
		            {
		            	Sen7=Double.parseDouble(senn7);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen7)%></td>
			<%
				}
			}
			%>	
			<%
			
			if((rs12.getString("Sen8").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				String sen8=rs12.getString("Sen8");
				
				if(sen8.equals("-") || rs12.getString("Sen8").contains("NAN") )
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen8=Double.parseDouble(sen8);
				int n2=1;
				double Sen8=0;
				String senn8=rs12.getString("Sen8");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					
		            if (senn8.charAt(n1) >= '0' && senn8.charAt(n1) <= '9') 
		            {
		            	Sen8=Double.parseDouble(senn8);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen8)%></td>
			<%
				}
			}
			%>	
			<%
			
			if((rs12.getString("Sen9").equals("0.0")))
			{
				%>
				<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
				<%		
			}
			else
			{
				String sen9=rs12.getString("Sen9");
				
				if(sen9.equals("-") || rs12.getString("Sen9").contains("NAN") )
				{
					%>
					<td style="font-size: 11px; face:san-serif; color:black" align="right">-</td>
					<%
				}
				else
				{
				//double Sen9=Double.parseDouble(sen9);
				int n2=1;
				double Sen9=0;
				 String senn9=rs12.getString("Sen9");
				 
				for (int n1 = 0; n1 < n2; n1++) 
				{
					  
		          
		            if (senn9.charAt(n1) >= '0' && senn9.charAt(n1) <= '9') 
		            {
		            	Sen9=Double.parseDouble(senn9);
		            }
		          
		        } 	
			%>
			<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=df.format(Sen9)%></td>
			<%
				}
			}
			%>		
		</tr>
		<%
		j++;
	} 
			i++;
	}
	
	String data123 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
	String data1234 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
%>
							</tbody>
							<tfoot>
							<tr>
           					<th>SrNo</th>
           					<th>Date-Time</th>
                			<th>Speed</th>
                			<th>Distance</th>
                			<th>Location</th>
       		    			<th>Sen1</th>
                			<th>Sen2</th>
                			<th>Sen3</th>
                			<th>Sen4</th>
                			<th>Sen6</th>
                			<th>Sen7</th>
                			<th>Sen8</th>
                			<th>Sen9</th>
                          </tr>
							</tfoot>
	<input type="hidden" name="graphveh" id="graphveh" value=<%=VehicleCode%>>
	<input type="hidden" name="fromdate" id="fromdate" value=<%=data123%>>
	<input type="hidden" name="todate" id="todate" value=<%=data1234%>>
	<input type="hidden" name="codefrvh" id="codefrvh" value=<%=VhNumber%>>
							
							</table>
							</div>
							</div>
							</div>
							</section>
<!-- TABLE ENDS HERE  -->
</div>
</div>
</div>

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Temperature and Humidity Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			 
			String showList=""+ColumnList;     
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
						<input type="hidden" name="paramflag" id="paramflag" value="true">
						<input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>">
				
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
								title: 'Temperature and Humidity Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Temperature and Humidity Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Temperature and Humidity Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Temperature and Humidity Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Temperature and Humidity Report',
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

</body>
</html>
