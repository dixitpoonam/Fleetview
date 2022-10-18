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
 	
 	
 	<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
<%
	fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

%>	
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

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
		}
		
		
		function allSelected()
		{
			//alert(allval);
		if(document.customdetail.extAll.checked)
		{
			document.getElementById("tr1").style.display='none';
			document.getElementById("tr3").style.display='none';
		}
		else
		{
			document.getElementById("tr1").style.display='';
			document.getElementById("tr3").style.display='';
			//document.getElementById("tr2").style.display='';
		}
			
		}
		function allSelected1()
		{
			//alert(allval);
		if(document.customdetail.extAll1.checked)
		{
			document.getElementById("tr1").style.display='';
			document.getElementById("tr2").style.display='none';
			//document.getElementById("interval").value='0';
					}
		else
		{
			document.getElementById("tr1").style.display='';
			document.getElementById("tr2").style.display='';
			
		}
			
		}
		
		function popupwin(lat,lon)
		{
			 try{
				 	//alert("lat "+lat+ "long "+lon);
				 //	document.getElementById("geotype").value="Point";
				 	//document.getElementById("lati").value=lat;
				 	//document.getElementById("langi").value=lon;
				    // document.getElementById("tra").style.display="";
				    // document.getElementById("trb").style.display="";
				    // document.getElementById("trc").style.display="";
				    // document.getElementById("trd").style.display="";
				    // document.getElementById("tri").style.display="";
				 	testwindow1 = window.open("geoAddForm.jsp?lati="+lat+"&langi="+lon+"&fpage1=detail_custom_report.jsp", "Add Geofence", "width=500,height=280");
				    testwindow1.moveTo(500,250);
				    
					 }catch(e)
					 {alert(e);}
		}
		
		function Validate()
		{ 
			try
			{
				//alert("date validate");
				var interval=document.getElementById("interval").value;
				//alert(interval);
				if(interval=="" || interval==" ")
					{
					document.getElementById("interval").value="0";
					}
				 var num=interval.match("^[0-9]*[.][0-9]+$")
				//alert(interval);
		    if(isNaN(interval))
		   {
			alert("Please the numeric time interval!!");
			return false;
		   } 
		    else
		        if(num!=null)
		        {
		        	alert("Please the numeric time interval!!");
		        	return false;
		        }
		    var num=interval.match("^[0-9]*[.][0-9]+$")
		    
		    
			if(document.getElementById("data").value=="") 
			{
				alert("Please Select The from date.");
				return false;
			}
			if(document.getElementById("data1").value =="")
		  	{
				alert("please select To Date");
				return false;
		  	}  		
				return datevalidate();
			return true;
			}
			catch(e)
			{
				alert(e);
			}
		}
		function datevalidate()
		{
			var date1=document.getElementById("data").value;
			var date2=document.getElementById("data1").value;
			var hr1=document.getElementById("ftime1").value;
			var min1=document.getElementById("ftime2").value;
			var hr2=document.getElementById("ttime1").value;
			var min2=document.getElementById("ttime2").value;
			var dm1,dd1,dy1,dm2,dd2,dy2;
			var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
			dd11=date1.substring(0,2);
			dd22=date2.substring(0,2);
			mm1=date1.substring(3,6);
			mm2=date2.substring(3,6);
			mm11=dateformat(mm1);
			mm22=dateformat(mm2);
			yy11=date1.substring(7,11);
			yy22=date2.substring(7,11);
			var date=new Date();
			var month=date.getMonth()+1;
			var day=date.getDate();
			var hr=date.getHours();
			
			var min=date.getMinutes();
			//alert(hr);
			//alert(min);
			var year=date.getFullYear();
			if(yy11>year  || yy22>year) 
			{
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			else if(year==yy11 && year==yy22)
			{
					if(mm11>month || mm22>month)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			if(mm11==month && mm22==month)
			{
				if(dd11>day || dd22>day)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
		
			if(yy11 > yy22)
			{
				alert("From date year should not be greater than to date year");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			else if(year==yy11 && year==yy22)
			{
				 if(mm11>mm22)
			{
				alert("From date month should not be greater than to date month");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			}
			if(mm11==month && mm22==month) 
			{
				if(yy11==yy22)
				{
				if(dd11 > dd22)
				{
					alert("From date should not be greater than to date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				}
			}
			else
				if(yy11<yy22)
				{
					return true;
				}int colcount=0;   //special code for detailed view
				String setSequence ="";
				String detailViewSequence = "",ColumnList="";
				boolean setDefFlag=false;

			else
				if(dd11 > dd22)
			{
					if(mm11<mm22)
					{
						return true;
					}
					
				alert("From date should not be greater than to date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		
			  
			   
			return true;
		}
		
		function dateformat(days)
		{
			 if(days=='Jan')
				return(1);
			 else
				if(days=='Feb')
					return(2);
				else
					if(days=='Mar')
						return(3);
					else
						if(days=='Apr')
							return(4);
						else
							if(days=='May') //timeformat: "%M:%S"
								
								return(5);
							else
								if(days=='Jun')
									return(6);
								else
									if(days=='Jul')
										return(7);
									else
										if(days=='Aug')
											return(8);
										else
											if(days=='Sep')
												return(9);
											else
												if(days=='Oct')
													return(10);
												else
													if(days=='Nov')
														return(11);
													else
														if(days=='Dec')
															return(12);
		 }
</script>
 	
<body onload="ondemand()">	


<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
	
	int colcount=0;   //special code for detailed view
	String setSequence ="";
	String detailViewSequence = "",ColumnList="";
	boolean setDefFlag=false;

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
			String VehicleCode, fromdate, todate, desc,vehregno,fromtime,totime,ftime1,ftime2,ttime1,ttime2;
			String vehid,ss1,ss2,ss3,dd,vehicle;
			String datenew1,datenew2,date3;
			
			Connection conn;
			Statement st,sttemp,st1,stcolor,stfuel;
			String sql,sql1;
	
	
	%>
<%
	
			/* String PageName=this.getClass().getName().replaceAll("_",".");
			System.out.println(PageName); */
			String userTypeValue = session.getAttribute("usertypevalue").toString();
			System.out.println(">>>>>>>>>++ " +userTypeValue);
			
			String targetvalue1=session.getAttribute("usertypevaluemain").toString();
			String selecteduser= (String)session.getAttribute("selecteduser");
			System.out.println(selecteduser);
			String dateformat="dd-MMM-yyyy";
			dateformat=session.getAttribute("dateformat").toString();
			String geoname="";
			String violation="";
			ArrayList<String> target1=(ArrayList<String>)session.getAttribute("TargetList");
			String empnamee="";
			String fromPage=request.getParameter("fromPage");
			if("runAnalysis".equalsIgnoreCase(fromPage)){
			//	VehicleCode=request.getParameter("vehcode");
			//	datenew1=datenew2=request.getParameter("data");
				
				vehicle =request.getParameter("vehreg");
				//datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dd")));
				datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("dd")));
				ss1 =request.getParameter("ss1");
				String timestampStr = ss1;
				String[] tokens = timestampStr.split(":");
				int hours = Integer.parseInt(tokens[0]);
				int minutes = Integer.parseInt(tokens[1]);
				int seconds = Integer.parseInt(tokens[2]);
				int duration = (3600 * hours + 60 * minutes + seconds)/60;
				ss1=Integer.toString(duration);
				ss2 =request.getParameter("ss2");
				String timestampStr1 = ss2;
				String[] tokens1 = timestampStr1.split(":");
				int hours1 = Integer.parseInt(tokens1[0]);
				int minutes1 = Integer.parseInt(tokens1[1]);
				int seconds1 = Integer.parseInt(tokens1[2]);
				int duration1 = (3600 * hours1 + 60 * minutes1 + seconds1)/60;
				ss2=Integer.toString(duration1);
				ss3 =request.getParameter("ss3");
				String timestampStr2 = ss3;
				String[] tokens2 = timestampStr2.split(":");
				int hours2 = Integer.parseInt(tokens2[0]);
				int minutes2 = Integer.parseInt(tokens2[1]);
				int seconds2 = Integer.parseInt(tokens2[2]);
				int duration2 = (3600 * hours2 + 60 * minutes2 + seconds2)/60;
				ss3=Integer.toString(duration2);
				VehicleCode =request.getParameter("vehcode");
				
			}
			else{
				VehicleCode=request.getParameter("vehcode");
				date3=datenew1=request.getParameter("data");
				datenew2=request.getParameter("data1");
				ftime1=request.getParameter("ftime1");
				ftime2=request.getParameter("ftime2");
				ttime1=request.getParameter("ttime1");
				ttime2=request.getParameter("ttime2");
			}
			//System.out.println("VehicleCode "+VehicleCode);
			//System.out.println("date3 "+date3);
			//System.out.println("datenew1 "+datenew1);
			//System.out.println("datenew2 "+datenew2);
			//System.out.println("ftime1 "+ftime1);
			//System.out.println("ftime2 "+ftime2);
			//System.out.println("ttime1 "+ttime1);
			//System.out.println("ttime2 "+ttime2);
			
			if(null==datenew1 || datenew1.equalsIgnoreCase("null"))
			{
				datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
				 ttime1=new SimpleDateFormat("HH").format(new java.util.Date());
			     ttime2=new SimpleDateFormat("mm").format(new java.util.Date());
			     Calendar cal=Calendar.getInstance();
			     cal.add(Calendar.DATE,-1);
			     cal.add(Calendar.HOUR,+12);
			     datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(cal.getTime());
			     ftime1=new SimpleDateFormat("HH").format(cal.getTime());
			     ftime2=new SimpleDateFormat("mm").format(cal.getTime());
			     System.out.println("VehicleCode "+VehicleCode);
			     //System.out.println("date3 "+date3);
			    // System.out.println("datenew1 "+datenew1);
			    // System.out.println("datenew2 "+datenew2);
			   //  System.out.println("ftime1 "+ftime1);
			   //  System.out.println("ftime2 "+ftime2);
			    // System.out.println("ttime1 "+ttime1);
			    // System.out.println("ttime2 "+ttime2);
			}
			try{
				conn = fleetview.ReturnConnection();
				st=conn.createStatement();
				sttemp=conn.createStatement();
				stfuel = conn.createStatement();
				st1=conn.createStatement();
				stcolor=conn.createStatement();
				String arcolor[] = new String [7];
				int j =0;
				
				sql1="select * from db_gps.t_geouserinfo where Transporter ='"+selecteduser+"' and Status='Yes'";
				ResultSet rs=st1.executeQuery(sql1);
				if(rs.next())
				{
					//System.out.println("in geouser");
					geoname="Yes";
				}
				sql="select * from t_vehicledetails where VehicleCode='"+VehicleCode+"'";
				ResultSet rst=st.executeQuery(sql);
				if(rst.next())
				{
					vehregno=rst.getString("VehicleRegNumber");
					if(target1.contains(targetvalue1))
					{
						empnamee=rst.getString("EmpName");
					}
				}
				
				sql1 = "Select * from db_gps.t_weekcolors";
				 rs=st1.executeQuery(sql1);
				 while(rs.next())
				 {
					 arcolor[j]=rs.getString("colors");
					 j++;
				 }
				
				 String Bt=request.getParameter("submit");
					
					System.out.print("Button Value "+Bt);
				 
		
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
 
 
<%
		

		String username = "";
		username = (String) session.getAttribute("usertypevalue");

		System.out.println("Session name----------------->:" + username);
%>

			<!-- Form Comes here -->
			
<%
	if("runAnalysis".equalsIgnoreCase(fromPage))
	{
		
	}
	else
	{
%>	
			
	
						<!-- Table Starts here -->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">Custom Detail Report </h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">

							<button id="detailedView"
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0">
								Detailed View</button>

							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#SetCustomModal">
								Set Custom</button>

							<button
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
								data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
								Register Complaint</button>

							<button id="kt_engage_demos_toggle"
								class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0">
								<span id="kt_engage_demos_label">Help</span>
							</button>

						</div>
					</div>
				</div>
			
			<!-- Form Comes Here  -->
			
			<form name="formreport" id="formreport" method="post">
				<div class="row col-12">
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
										if (Bt == null) {
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
										if (Bt == null) {
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
										if (Bt == null) {
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
										if (Bt == null) {
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
					         <label for="search">Interval(minutes):</label>
					         <div class="input-group input-group-merge">
					         <%
      
      String Bt1=request.getParameter("submit");
		
		System.out.print("Button Value in Interval Block :- "+Bt1);
		
		
		if(Bt1==null)
		{
			%>
			<input type="text" id="interval" name="interval" class="form-control" value="0"/>
			<% 
		}
		else
		{
      int interval1=0;
	String interval=request.getParameter("interval");
	if(interval==null)
	{
		//System.out.println("562 ^^^^^^^ in if");
		interval1=0;
	 
	}
	else
	{
		interval1=Integer.parseInt(interval);
	}
	
	System.out.println("Interval Value  :- "+interval1);
	%>
	<input type="text" id="interval" name="interval" class="form-control" value="<%=interval1%>"/>
	<% 
	
	}
	%></div>
	  </div>
					         <div class="col-md-1">
					         <label for="checkAll"> show start/stop </label>
					         <div class="input-group input-group-merge" >
					         <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected(this.value);" />
					         </div>
					         </div>
					         <div class="col-md-1">
					         <label for="checkAll">Don't Show Start/Stop:</label>
					         <div class="input-group input-group-merge" >
					         	<input type="checkbox" name="extAll1" id="extAll1" value="yes"  onclick="allSelected1(this.value);">
					         </div>
					         </div>
					         <div class="col-md-1">
					         	<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="submit" id="submit" onclick="return chk()"  value="Submit">
					         </div>
					         </div>  <!-- 12 -->
	</form>
 	
 	<%
	}
	if("runAnalysis".equalsIgnoreCase(fromPage)){
		//fromdate=todate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dd")));
		fromdate=todate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("dd")));
		
	////	if(null==ftime1||"null".equalsIgnoreCase(ftime1))
	//	{
			fromtime = "00:00:00";
			totime="23:59:59";
	//	}
		
		//System.out.println(fromdate+" "+fromtime+"----"+todate+" "+totime);
	}
	else //if(!(null==request.getParameter("data")))
			{
		//System.out.print("in else");
		
			fromdate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
			todate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));	
			
			//ftime1=request.getParameter("ftime1");
			//ftime2=request.getParameter("ftime2");
			//ttime1=request.getParameter("ttime1");
			//ttime2=request.getParameter("ttime2");
		
			fromtime=ftime1+":"+ftime2+":00";
			totime=ttime1+":"+ttime2+":00";
			//System.out.print("fromdate "+fromdate);
			//System.out.print("todate "+todate);
			//System.out.print("ftime1 "+ftime1);
			//System.out.print("ttime1 "+ttime1);
			//System.out.print("ftime2 "+ftime2);
			//System.out.print("ttime2 "+ttime2);
			//System.out.print("fromtime "+fromtime);
			//System.out.print("totime "+totime);
		
	//out.print(fromtime+"  "+totime);
			}
	
	int interval1=0;
	String interval=request.getParameter("interval");
	String chbxAll=request.getParameter("extAll");
	String chbxAll1=request.getParameter("extAll1");
	System.out.println("558 **********  "+chbxAll1);
	
	if(interval==null)
	{
		//System.out.println("562 ^^^^^^^ in if");
		interval1=0;
	 
	}
	else
	{
		interval1=Integer.parseInt(interval);
	}
	
	System.out.println("558 **********  "+interval1);
	
	%>
 	<br>
 	<br>
 	<h4>Detail Report for Vehicle <%=vehregno%> from <%=datenew1 %> <%=fromtime%> to <%=datenew2%> <%=totime%></h4>
 	<br>

<font size="3"><B></B><a href="#" onclick="javascript:window.open('ShowCustomReportonTWMap.jsp?tripid=null&vehcode=<%=VehicleCode %>&data=<%=fromdate %>&data1=<%= todate%>&ftime1=<%=ftime1 %>&ftime2=<%=ftime2 %>&ttime1=<%=ttime1 %>&ttime2=<%=ttime2 %>&fromtime=<%=fromtime%>&totime=<%=totime%>');""> <font size="2"> <u>Journey On Map.</u></font></a> </font>
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3"><B></B><a href="#" onclick="javascript:window.open('tankerkml.jsp?tripid=null&vehcode=< %=VehicleCode %>&data=< %=fromdate %>&data1=< %= todate%>&ftime1=< %=ftime1 %>&ftime2=< %=ftime2 %>&ttime1=< %=ttime1 %>&ttime2=< %=ttime2 %>&fromtime=< %=fromtime%>&totime=< %=totime%>');""> <font size="2"> <u>Tanker KML.</u></font></a> </font>-->
<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3"><B></B><a href="#" onclick="javascript:window.open('tankerCamerakml.jsp?tripid=null&vehcode=< %=VehicleCode %>&data=< %=fromdate %>&data1=< %= todate%>&ftime1=< %=ftime1 %>&ftime2=< %=ftime2 %>&ttime1=< %=ttime1 %>&ttime2=< %=ttime2 %>&fromtime=< %=fromtime%>&totime=< %=totime%>');""> <font size="2"> <u>Camera/Tanker KML.</u></font></a> </font>-->
<!-- 
 uncomment "Tanker KML" and "Camera/Tanker KML" link while uploading on fleetview -spring
-->

<table>
	<tr>
		<td><div class="box" style="background-color: #F0E68C; " align="right"><font color="#F0E68C"> Su</font></div></td>
		<td> Sunday</td>
		<td><div class="box" style="background-color: #FFCC99;" align="right"><font color="#FFCC99"> Mo</font></div></td>
		<td> Monday</td>
		<td><div class="box" style="background-color: #EEC5C8;" align="right"><font color="#EEC5C8"> Su</font></div></td>
		<td> Tuesday</td>
		<td><div class="box" style="background-color: #FFFFCC;" align="right"><font color="#FFFFCC"> Su</font></div></td>
		<td> Wednesday</td>
		<td><div class="box" style="background-color: #D4C0F0;" align="right"><font color="#D4C0F0"> Su</font></div></td>
		<td> Thursday</td>
		<td><div class="box" style="background-color: #CCFFCC;" align="right"><font color="#CCFFCC"> Su</font></div></td>
		<td> Friday</td>
		<td><div class="box" style="background-color: #BDEDFF;" align="right"><font color="#BDEDFF"> Su</font></div></td>
		<td> Saturday</td>
	</tr>

</table>

Distance column in custom detail report shows speed value for RA/RD and overspeed duration for OS violation.</td>

<%
	String isfuel = "No";
	
	String sqlchecksensorveh="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
	ResultSet rsttemp=sttemp.executeQuery(sqlchecksensorveh);
	if(rsttemp.next())
	{
%>
      <a  href="temperaturegraph.jsp?vehcode=<%=VehicleCode %>&data=<%=datenew1 %>&data1=<%=datenew2 %>&ftime1=<%=ftime1 %>&ftime2=<%=ftime2 %>&ttime1=<%=ttime1 %>&ttime2=<%=ttime2 %>"><font size="2" face="Arial">Temperature Graph</font></a>
<%
	}
%>

 	
 	
 	
 	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
									
<tr>
	<th>Sr.</th>
	<th style="width: 20%">Date-Time</th>
	<!-- <th style="width: 10%">Violation</th> -->
	<th style="width: 10%">Speed</th>
	<th style="width: 10%">Distance</th>
<%
/*
if(geoname.equalsIgnoreCase("Yes"))
{*/
%>
<!-- <th align="left" colspan="2" style="width: 50%">Location</th>-->
<%
/*}
else
{*/
%>
<th align="left">Location</th>
<%
//}


if(userTypeValue.equals("Croda Chemicals (India) Private Limited"))
{
	%>
	        <th>Temp1</th>
			<th>Temp2</th>
			<th>RPM</th>
			<th>SK</th>
	
	<% 
	
}
else{
sqlchecksensorveh="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
rsttemp=sttemp.executeQuery(sqlchecksensorveh);
if(rsttemp.next())
{
	%>
	<th>Sen1</th>
	<th>Sen2</th>
	<th>Sen3</th>
	<th>Sen4</th>
	
	<% 
}
}
%>
<%
String sqlcheckfuel = "select Vehiclecode from t_vehicledetails where Description='FUELFLOW' and vehiclecode='"+VehicleCode+"'";
ResultSet rscheckfuel = stfuel.executeQuery(sqlcheckfuel);
if(rscheckfuel.next())
{
	isfuel = "Yes";
	%>
	<th>Fuel Level</th>
	<%
}
%>
</tr>
<%

boolean flag=true;

String sqlnew="select * from t_veh"+VehicleCode+" where TheFieldDataDateTime <='"+fromdate+" "+fromtime+"' and TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime desc limit 1";
ResultSet rstnew=st.executeQuery(sqlnew);
if(rstnew.next())
{
	fromdate=rstnew.getString("TheFieldDataDate");
	fromtime=rstnew.getString("TheFieldDataTime");
//	System.out.println("fromdate---->"+fromdate+"fromtime-->"+fromtime);
	
}
else
{
	fromdate=fromdate;
	fromtime=fromtime;
}

//sql="select * from t_veh"+VehicleCode+" where TheFieldDataDateTime >='"+fromdate+" "+fromtime+"' and TheFieldDataDateTime <='"+todate+" "+totime+"' and TheFiledTextFileName in ('SI','OF','ON','ST','SP','AC','DC','OS') order by TheFieldDataDateTime asc";
			
sql="select * from t_veh"+VehicleCode+" where TheFieldDataDateTime >='"+fromdate+" "+fromtime+"' and TheFieldDataDateTime <='"+todate+" "+totime+"' and TheFiledTextFileName in ('SI','OF','ON','ST','SP') order by TheFieldDataDateTime asc";
			
System.out.println(sql);
ResultSet rst1=st.executeQuery(sql);
int i=1;
int x=0;
int dist=0;
double dist1=0.00;

//System.out.println("662 &&&&&&&&&& "+interval); 
//System.out.println("&&&&&&&&&& "+interval.length()); 
java.util.Date date1=new java.util.Date();
java.util.Date date2=new java.util.Date();
long millis=0;
long millis1=0;
long millis2=0;
int num=0;

//System.out.println("670 %%%%%%%%%%% "+interval1);
//System.out.println("671 $$$$$$$$$$ "+flag);
 if(rst1.first())
{
	
	
	violation=rst1.getString("TheFiledTextFileName");
	if(violation.equals("OS"))
	 {
violation="OS";
	 }

else 
{
if(violation.equals("AC"))
{
violation="RA";
}
else
{
		if(violation.equals("DC"))
		{
			violation="RD";
		}
		else
		{
			violation="-";
		}

}
} 
	
	
	if(i==1)
	{
		//dist=rst1.getInt("Distance");
		dist1=rst1.getDouble("Distance");
		//dist1=(int)dist1;
	}
	flag=true;
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
	num=date1.getDay();
	
	
	if(chbxAll==null)
	{
%>
	<tr>
		<td class="bodyText"  style="background-color:  <%=arcolor[num]%>;"><div align="right"><%=i%></div></td>
		
		<%System.out.println("violation label==>"+violation);
		System.out.println("speed==>"+rst1.getInt("Speed"));
		
		%>
		<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num]%>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%> <%=rst1.getString("TheFieldDataTime")%></div></td>
		<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
		<td class="bodyText" style="width: 10%;background-color: <%=arcolor[num]%>;"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
	<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
		
		System.out.println("Distanceformat===>"+session.getAttribute("distformat").toString());
		 %>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		
		<%
	}else
	{
		
		System.out.println("inside else distance==>"+rst1.getDouble("Distance"));
		if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{	System.out.println("inside violation equals"+rst1.getDouble("Distance"));
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance"))%></div></td> 
			
			<%
		}
		else
			
		{
			
			
			double dist5=rst1.getDouble("Distance")-dist1;
			System.out.println("else violation equals dist5==>"+dist5);
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)dist5%></div></td> 
		
		<%
		}
	}
	
						%>
					<!--<td class="bodyText" style="width: 40%">
						<div align="left" ><a href="shownewmap.jsp?lat=<  %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<td class="bodytext">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>  -->
						<%
	/*	}
				else
				{*/
					%>
		
		
		<!--<td class="bodyText" style="width: 40%">
		<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
		</div></td>
		<td class="bodyText">
		<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
		</td>-->
		<%
			
	
		if(target1.contains(targetvalue1))
		{
                System.out.println("Target1==>"+targetvalue1);   			
			System.out.println("");
				String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
				System.out.println("");
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;">
				<div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
				</div>
				</td>
				<%
		}
		else
		{
			%>
             <td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
             </div>
             </td>
<%
		}

		
String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
if(rsttemp1.next())
{
	
	if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
	{
		%>
		<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right">xxxx</div></td>
		<%		
	}
	else
	{
	%>
	<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
	<%
	}
	if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
	{
		%>
		<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right">xxxx</div></td>
		<%		
	}
	else
	{
	%>
	<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
	<%
	}
	if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
	{
		%>
		<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right">xxxx</div></td>
		<%		
	}
	else
	{
	%>
	<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
	<%
	}
	if(rst1.getString("Sen4").length()< 2 && !(rst1.getString("Sen4").equals("0")))
	{
		%>
		<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right">xxxx</div></td>
		<%		
	}
	else
	{
	%>
	<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
	<%
	}
	%>
	<% 
}



if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
{
	%>
	<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
	<%
}

%>
	</tr>
<%
i++;
	}
}









while(rst1.next())
{
	
	violation=rst1.getString("TheFiledTextFileName");
	//System.out.println("Stamp ---> "+violation);
	
		if(violation.equals("OS"))
		 {
	violation="OS";
		 }

else 
{
	if(violation.equals("AC"))
	{
	violation="RA";
	}
	else
	{
			if(violation.equals("DC"))
			{
				violation="RD";
			}
			else
			{
				violation="-";
			}
	
    }
}
		if(rst1.getString("TheFiledTextFileName").equals("SI") || rst1.getString("TheFiledTextFileName").equals("ST") || rst1.getString("TheFiledTextFileName").equals("SP") || rst1.getString("TheFiledTextFileName").equals("AC") || rst1.getString("TheFiledTextFileName").equals("DC") || rst1.getString("TheFiledTextFileName").equals("OS"))
	{
		
		if(rst1.getInt("Speed")==0)
		{
			if(flag==true)
			{
				date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
				num=date1.getDay();
				flag=false;
				x=1;
				if(chbxAll1 == null)
				{
				%>
				<tr>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
					<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
					<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
					<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%="Stop"%></div></td>
				<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
				{
					
					System.out.println("Distance format===>"+session.getAttribute("distformat").toString());
					
		 %>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		
		<%
		System.out.println("Distance kmto mile"+(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1));
				}
				else
				{
		if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{
			
			System.out.println("Distance RA RD Os"+rst1.getDouble("Distance"));
			
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)rst1.getDouble("Distance")%></div></td> 
			
			<%
		}
		else
		{
			System.out.println("else Distance"+rst1.getDouble("Distance"));
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance")-dist1)%></div></td> 
		
		<%
		}
				}
				/*	if(geoname.equalsIgnoreCase("Yes"))
					{
						if(target1.contains(targetvalue1))
						{
							String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
							%>
						<!-- 	 <td class="bodyText" style="width: 40%">
							<div align="left"><a href="shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
							</div></td>
							<td class="bodyText">
							<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
							</td>-->
							<%
					/*	}
						else
						{*/
						%>
					<!-- 	<td class="bodyText" style="width: 40%">
						<div align="left" >&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
						</div></td>
						<td class="bodyText">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>-->
						<%
					/*	}
					}
					else
					*/
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<%
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
					</div></td>
					<%
					}

					%>
					<%
			String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}								
	%>
					
				</tr>
				<%
				i++;
				}
			}
		}
		
		else if(rst1.getInt("Speed")>0 && x==1)
			
		{
			
			date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
				num=date1.getDay();
			  flag=true;
			  if(chbxAll1 == null)
			  {
				%>
				<tr>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
					<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
					<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
					<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%="Start"%></div></td>
					<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
		 %>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		
		<%
	}else
	{
		if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance"))%></div></td> 
			
			<%
		}
		else
		{
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance")-dist1)%></div></td> 
		
		<%
		}
	}
				/*	if(geoname.equalsIgnoreCase("Yes"))
					{
						if(target1.contains(targetvalue1))
						{
							String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
							%>
						<!-- <td class="bodyText" style="width: 40%">
							<div align="left"><a href="shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
							</div></td>
							<td class="bodyText">
							<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
							</td>-->
							<%
				/*	}
						else
						{*/
						%>
					 <!--    <td class="bodyText" style="width: 40%">
						<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
						</div></td>
						<td class="bodyText">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>-->
						<%
					/*}
					}
					else
					{*/
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
						<div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<%
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
					<div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
					</div></td>
					<%
					}
			//	}
					%>
					<%
			String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}									
	%>
				</tr>
				<%
				i++;
				
			
			  }
				
			  x++;
				
				
				
				
		
			flag=true;	
			//System.out.println("1108 ############# ");
			if(chbxAll==null)
			{
				//System.out.println("1112 &&&&&&&&& not checked");
			%>
			<tr>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
				<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
				<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
				<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
				
				<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
		 %>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		
		<%
	}else
	{
		if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)rst1.getDouble("Distance")%></div></td> 
			
			<%
		}
		else
		{
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance")-dist1)%></div></td> 
		
		<%
		}
	}
		/*	if(geoname.equalsIgnoreCase("Yes"))
				{
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
						%>
					<!-- <td class="bodyText" style="width: 40%">
						<div align="left"><a href="shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<td class="bodyText">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>-->
						<%
			/*	}
					else
					{*/
					%>
				
				<!--  <td class="bodyText" style="width: 40%">
				<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
				</div></td>
				<td class="bodyText">
				<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
				</td>-->
				<%
			/*	}
				}
				else
				{*/
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
						<div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<%
					}
					else
					{
					%>
				
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
				<div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
				</div></td>
				<%
					}
				//}
				%>
				<%
			String  sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}    
											
	%>
			</tr>
			<%
			i++;
			}
		}
		
		
	//555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555	
		
		
		
		
		
		
		else
		{
			if(chbxAll==null)
			{
				//System.out.println("1250 &&&&&&&&& not checked");
			flag=true;
			date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
		    num=date2.getDay();
			
			millis=date1.getTime();
			millis1=date2.getTime();
		    millis2=millis1-millis;
		    millis2=millis2/1000/60;
			
			 if(millis2>=interval1)
			    {
				 //System.out.println("\nSI********************** "+date1+" $$$$$$$$ "+date2);
					//System.out.println("********************** "+millis2+" $$$$$$$$ "+i);
			    	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
		          //System.out.println("&&&&&&&&&&&& "+date1);
			    	%>
			<tr>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
				<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
				<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
				<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
				
				<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
	{
		 %>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		
		<%
	}else
	{
		if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)rst1.getDouble("Distance")%></div></td> 
			
			<%
		}
		else
		{
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)(rst1.getDouble("Distance")-dist1)%></div></td> 
		
		<%
		}
	}
		/*	if(geoname.equalsIgnoreCase("Yes"))
				{
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
						%>
					<!-- <td class="bodyText" style="width: 40%">
						<div align="left"><a href="shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<td class="bodyText">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>-->
						<%
			/*	}
					else
					{*/
					%>
				
				<!--  <td class="bodyText" style="width: 40%">
				<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
				</div></td>
				<td class="bodyText">
				<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
				</td>-->
				<%
			/*	}
				}
				else
				{*/
					
					
					
					
					
					
					if(target1.contains(targetvalue1))
					{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
						<div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<%
					}
					else
					{
					%>
				
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
				<div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
				</div></td>
				<%
					}
				//}
				%>
				<%
			String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}
			i++;
			
			    }
											
	%>
			</tr>
			<%
			
		}
		}
	}//ens of SI check
	
	
	
	
	
	
	
	
	else
    {
		
		if(rst1.getString("TheFiledTextFileName").equals("OF"))
		{
			
			date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
			
			
			millis=date1.getTime();
			millis1=date2.getTime();
		    millis2=millis1-millis;
		    millis2=millis2/1000/60;
		
			 if(millis2>=interval1)
			    {
				   //System.out.println("\nOF********************** "+date1+" $$$$$$$$ "+date2);
					//System.out.println("********************** "+millis2+" $$$$$$$$ "+i);
			    	
			String long1,long2,long3,lat1,lat2,lat3,loc1,loc2,loc3;
			int num1=0;
			double ds1=0.00,ds2=0.00,ds3=0.00;
			java.util.Date dt1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
			num=dt1.getDay();
			loc1=rst1.getString("TheFieldSubject");
			lat1=rst1.getString("LatinDec");
			long1=rst1.getString("LonginDec");
			ds1=rst1.getDouble("Distance");
			String speedof = rst1.getString("Speed");
			if(rst1.next())
			{
				if(rst1.getString("TheFiledTextFileName").equals("ON")||rst1.getString("TheFiledTextFileName").equals("SI")||rst1.getString("TheFiledTextFileName").equals("ST")||rst1.getString("TheFiledTextFileName").equals("SP"))
				{
					if(rst1.getString("TheFiledTextFileName").equals("SI") || rst1.getString("TheFiledTextFileName").equals("ST") || rst1.getString("TheFiledTextFileName").equals("SP"))
					{
						if(chbxAll==null)
						{
							//System.out.println("1431 &&&&&&&&& not checked");
						java.util.Date dt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
						num1=dt2.getDay();
						loc2=rst1.getString("TheFieldSubject");
						lat2=rst1.getString("LatinDec");
						long2=rst1.getString("LonginDec");
						ds2=rst1.getDouble("Distance");
						String speedsi = rst1.getString("Speed");
						long hrs=00,mins=00;
						long mils1=dt1.getTime();
						long mils2=dt2.getTime();
						long mils3=mils2-mils1;
						mils3=mils3/1000/60;
						//flag=true;
						if(mils3 > 20)
						{
							date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
							//System.out.println("SI##############  "+date1);
							%>
							<tr>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
						<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt1)%></div></td>
						<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
						<%
					/*	if(mils3>=60)
						{
							hrs=mils3/60;
							mins=mils3%60;*/
							%>
							<!--<td class="bodyText"><div align="right">&nbsp;&nbsp;< %=""+hrs+" Hrs. "+mins+" Mins. OFF"%></div></td>-->
							<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%=speedof%></div></td>
							<%								
					/*	}
						
						else
						{*/
							
							%>
						<!--<td class="bodyText"><div align="right">&nbsp;&nbsp;< %="00 Hrs. "+mils3+" Mins. OFF"%></div></td>-->
						<%
						//}
						if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
						{
						 %>
						
						<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"> out intfleet<%=(int)fleetview.KM_TO_MILES1(ds1-dist1)%></div></td>
						<% }
						else
						{
							if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
							{
								%>
								 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">out ds1<%=(int)ds1%></div></td> 
								
								<%
							}
							else
							{
							%>
						<%-- 	line commented for printing distance once <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"> out ds1-dist<%=ds1-dist%></div></td>  --%>
							
							<%
							}
							%>
							<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)(ds1-dist1)%></div></td>
							<%
						}
					/*	if(geoname.equalsIgnoreCase("Yes"))
						{
							if(target1.contains(targetvalue1))
							{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
						%>
						<!--  <td class="bodyText" style="width: 40%">
						<div align="left"><a href="shownewmap.jsp?lat=< %=lat1 %>&long=< %=long1%>&discription=< %=empnamee+"<br>"+loc1%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat1 %>&long=< %=long1%>&discription=< %=empnamee+"<br>"+loc1%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc1 %></a>
						</div></td>
						<td class="bodyText">
						<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
						</td>-->
						<%
							
						/*}
						else
							{*/
							%>
									
									
							     	<!-- <td class="bodyText" style="width: 40%">
									<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat1,long1,loc1) %>
									</div></td>
									<td class="bodyText">
									<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
									</td>-->
									<%
						/*	}
						}
						else
						{*/
							if(target1.contains(targetvalue1))
							{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
						<div align="left"><a href="shownewmap.jsp?lat=<%=lat1 %>&long=<%=long1%>&discription=<%=empnamee+"<br>"+loc1%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=long1%>&discription=<%=empnamee+"<br>"+loc1%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc1 %></a>
						</div>
						
						</td>
						<%
							
						}
						else
							{
							%>
									
									
									<td class="bodyText" style="background-color: <%=arcolor[num] %>;">
									<div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(lat1,long1,loc1) %>
									</div>
									
									</td>
									<%
							}
					//	}
									%>
									<%
			String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}						
	%>
									</tr>
									<%		
					i++;
					%>
					
					<tr>
												<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=i%></div></td>
												<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num1] %>;"><div align="left"><%=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt2)%></div></td>
												<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1]%>;"><div align="left"><%=violation%></div></td> --%>
												<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right">&nbsp;&nbsp;<%=speedsi%></div></td>
												<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
												{
												 %>
												<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(ds2-dist1)%></div></td>
												<% }
												else
												{
													if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
													{
														%>
														 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)ds2%></div></td> 
														
														<%
													}
													else
													{
														if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
														{
															%>
														<!-- 	 <script>
														  alert("xxx==>");
														  </script> -->
															 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)ds2%></div></td> 
															
															<%
														}
														else
														{
														  %>
														 <!--  <script>
														  alert("xx==>");
														  </script> -->
														 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)(ds2-dist1)%></div></td> 
														
														<%
														}
													%>
													  
													
													<%
													}
												%>
												
												<%
												}
												/*if(geoname.equalsIgnoreCase("Yes"))
												{
													if(target1.contains(targetvalue1))
													{
													String d3=empnamee+"<br>"+loc2;*/
												%>
											 	<!-- <td class="bodyText" style="width: 40%">
												<div align="left"><a href="shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc2 %></a>
												</div></td>
												<td class="bodyText">
												<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
												</td>-->
												
										<!-- 	/*	}
												else
													{*/ -->
												
															
														<!-- 	 <td class="bodyText" style="width: 40%">
															<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat2,long2,loc2) %>
															</div></td>
															<td class="bodyText">
															<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
															</td>-->
															<%
												/*	}
												}
												else
												{*/
												if(target1.contains(targetvalue1))
												{
												String d3=empnamee+"<br>"+loc2;
											%>
											<td class="bodyText" style="background-color: <%=arcolor[num1] %>;">
											<div align="left"><a href="shownewmap.jsp?lat=<%=lat2 %>&long=<%=long2%>&discription=<%=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat2 %>&long=<%=long2%>&discription=<%=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc2 %></a>
											</div>
											</td>
											<%
											}
											else
												{
												%>
														
														<td class="bodyText" style="background-color: <%=arcolor[num1] %>;">
														<div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(lat2,long2,loc2) %>
														</div>
														</td>
														<%
												}
												//}
														%>
														<%
			String sqlchecksensorveh11="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp11=sttemp.executeQuery(sqlchecksensorveh11);
			if(rsttemp11.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}								
	%>
													</tr>	
													<%		
				//	i++;
					%>
					<!-- 
					
					<tr>
												<td class="bodyText"><div align="right">< %=i%></div></td>
												<td class="bodyText"><div align="left">< %=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt2)%></div></td>
												<td class="bodyText"><div align="right">&nbsp;&nbsp;< %="Start"%></div></td>-->
												<%/*if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
												{*/
												 %>
											<!-- 	<td class="bodyText"><div align="right">< %=(int)fleetview.KM_TO_MILES1(ds2-dist)%></div></td>-->
												<%/* }
												else
												{*/
												%>
												<!-- <td class="bodyText"><div align="right">< %=ds2-dist%></div></td>-->
												<%
												/*}
												if(geoname.equalsIgnoreCase("Yes"))
												{
													if(target1.contains(targetvalue1))
													{
												String d3=empnamee+"<br>"+loc2;*/
												%>
												<!-- <td class="bodyText">
												<div align="left" style="width: 50%;"><a href="shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc2 %></a>
												</div>
												<div align="center" style="width: 50%;margin-left: 50%;"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence This location</a></div>
												</td>-->
												<%
												/*}
												else
													{*/
													%>
															
															<!-- <td class="bodyText">
															<div align="left" style="width: 50%;">&nbsp;&nbsp;< %=fleetview.showNewMap(lat2,long2,loc2) %>
															</div>
															<div align="center" style="width: 50%;margin-left: 50%;"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence This location</a></div>
															</td>-->
															<%
													/*}
												}
												else
												{
												if(target1.contains(targetvalue1))
												{
											String d3=empnamee+"<br>"+loc2;*/
											%>
											<!-- <td class="bodyText">
											<div align="left" style="width: 50%;"><a href="shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc2 %></a>
											</div>
											</td>-->
											<%
										/*	}
											else
												{*/
												%>
														
													<!-- 	<td class="bodyText">
														<div align="left" style="width: 50%;">&nbsp;&nbsp;< %=fleetview.showNewMap(lat2,long2,loc2) %>
														</div>
														</td>-->
														<%
											//	}
											//	}
														%>
														<%
			/*String sqlchecksensorveh111="select Vehiclecode from t_vehicledetails where Description='TEMPSENSOR' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp111=sttemp.executeQuery(sqlchecksensorveh111);
			if(rsttemp111.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{*/
					%>
				<!-- 	<td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen1")%></div></td>-->
				<%
			/*	}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
			/*	}
				else
				{*/
				%>
			<!-- 	<td class="bodyText"><div align="right">< %=rst1.getString("Sen2")%></div></td>-->
				<%
				/*}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen3")%></div></td>-->
				<%
				/*}
				if(rst1.getString("Sen4").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
			/*	}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen4")%></div></td>-->
				<%
			//	}
				%>
				<% 
//}
											
	%>
												<!-- 	</tr>	-->
													<%		
					//i++;
				//	flag=true;
					%>
					
					
				<!-- 	<tr>
							<td class="bodyText"><div align="right">< %=i%></div></td>
							<td class="bodyText" style="width: 20%"><div align="left">< %=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt2)%></div></td>
							<td class="bodyText" style="width: 10%"><div align="right">&nbsp;&nbsp;< %=rst1.getInt("Speed")%></div></td>-->
							<%/*if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
												{*/
												 %>
											<!-- 	<td class="bodyText" style="width: 10%"><div align="right">< %=(int)fleetview.KM_TO_MILES1(ds2-dist)%></div></td>-->
												<% /*}
												else
												{*/
												%>
												<!-- <td class="bodyText" style="width: 10%"><div align="right">< %=ds2-dist%></div></td>-->
												<%
											//	}
						/*	if(geoname.equalsIgnoreCase("Yes"))
							{
								if(target1.contains(targetvalue1))
								{
							String d2=empnamee+"<br>"+loc2;*/
							%>
						 <!-- 	<td class="bodyText" style="width: 40%">
							<div align="left"><a href="shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc2 %></a>
							</div></td>
							<td class="bodyText">
							<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
							</td>-->
							<%
							/*}
							else
								{*/
								%>
										
										<!--<td class="bodyText" style="width: 40%"> 
										<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat2,long2,loc2) %>
										</div></td>
										<td class="bodyText">
										<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
										</td>  -->
										<%
								/*}
							}
							else
							{*/
							/*if(target1.contains(targetvalue1))
							{
						String d2=empnamee+"<br>"+loc2;*/
						%>
					<!-- >	<td class="bodyText">
						<div align="left"><a href="shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat2 %>&long=< %=long2%>&discription=< %=empnamee+"<br>"+loc2%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc2 %></a>
						</div>
						</td>-->
						<%
						/*}
						else
							{*/
							%>
									
									<!-- <td class="bodyText">
									<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat2,long2,loc2) %>
									</div>
									</td>-->
									<%
							//}
						//	}
									%>
									<%
			/*String sqlchecksensorveh1111="select Vehiclecode from t_vehicledetails where Description='TEMPSENSOR' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1111=sttemp.executeQuery(sqlchecksensorveh1111);
			if(rsttemp1111.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
			<!-- 	<td class="bodyText"><div align="right">< %=rst1.getString("Sen1")%></div></td>-->
				<%
			/*	}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen2")%></div></td>-->
				<%
				/*}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{*/
					%>
					<!-- <td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen3")%></div></td>-->
				<%
				/*}
				if(rst1.getString("Sen4").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{*/
					%>
					<!-- -><td class="bodyText"><div align="right">xxxx</div></td>-->
					<%		
				/*}
				else
				{*/
				%>
				<!-- <td class="bodyText"><div align="right">< %=rst1.getString("Sen4")%></div></td>-->
				<%
				//}
				%>
				<% 
//}
											
	%>
								</tr>	
								<%
								i++;
						}
						}
					}//end of SI check after OF stamp
					
					
					
					
					
					
					else if(rst1.getString("TheFiledTextFileName").equals("ON"))
					{
						java.util.Date dt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
						num1=dt2.getDay();
						loc2=rst1.getString("TheFieldSubject");
						lat2=rst1.getString("LatinDec");
						long2=rst1.getString("LonginDec");
						ds2=rst1.getDouble("Distance");
						String speedon = rst1.getString("Speed");
						long hrs=00,mins=00;
						long mils1=dt1.getTime();
						long mils2=dt2.getTime();
						long mils3=mils2-mils1;
						mils3=mils3/1000/60;
						
						if(mils3 > 20)
						{
							date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
							//System.out.println("ON##############  "+date1);
							if(rst1.next())
							{
								if(rst1.getString("TheFiledTextFileName").equals("SI") || rst1.getString("TheFiledTextFileName").equals("ST") || rst1.getString("TheFiledTextFileName").equals("SP"))
								{
									
									date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
									int num2=date2.getDay();
									loc3=rst1.getString("TheFieldSubject");
									//System.out.println("Stamp::>>"+rst1.getString("TheFiledTextFileName"));
									lat3=rst1.getString("LatinDec");
									long3=rst1.getString("LonginDec");
									ds3=rst1.getDouble("Distance");
									
									if(chbxAll==null)
									{
										//System.out.println("2027 &&&&&&&&& not checked");
									%>
									<tr>
								<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
								<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt1)%></div></td>
								<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
								<%
						/*		if(mils3>=60)
								{
									hrs=mils3/60;
									mins=mils3%60;*/
									%>
									<!--<td class="bodyText"><div align="right">&nbsp;&nbsp;< %=""+hrs+" Hrs. "+mins+" Mins. OFF"%></div></td>-->
									<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%=speedof%></div></td>
									<%								
							/*	}
								
								else
								{*/
									
									%>
								<!--<td class="bodyText"><div align="right">&nbsp;&nbsp;< %="00 Hrs. "+mils3+" Mins. OFF"%></div></td>-->
								<%
								//}
								%>
								
								
								<%
						
						if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
						{
						 %>
						
						<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(ds1-dist1)%></div></td>
						<% }
						else
						{
							if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
							{
								%>
								 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)ds1%></div></td> 
								
								<%
							}
							else
							{
							%>
							 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"><%=(int)(ds1-dist1)%></div></td> 
							
							<%
							}
						}
								/*if(geoname.equalsIgnoreCase("Yes"))
								{
									if(target1.contains(targetvalue1))
									{
								String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
								%>
								<!--  <td class="bodyText" style="width: 40%">
								<div align="left"><a href="shownewmap.jsp?lat=< %=lat1 %>&long=< %=long1%>&discription=< %=empnamee+"<br>"+loc1%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat1 %>&long=< %=long1%>&discription=< %=empnamee+"<br>"+loc1%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc1 %></a>
								</div></td>
								 <td class="bodyText">
								<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
								</td>-->
								<%
									
							/*	}
								else
									{*/
									%>
											
										 	
											<!-- <td class="bodyText" style="width: 40%">
											<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat1,long1,loc1) %>
											</div></td>
											 <td class="bodyText">
											<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
											</td>-->
											<%
								/*	}
								}
								else
								{*/
									if(target1.contains(targetvalue1))
									{
								String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
								%>
								<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left"><a href="shownewmap.jsp?lat=<%=lat1 %>&long=<%=long1%>&discription=<%=empnamee+"<br>"+loc1%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=long1%>&discription=<%=empnamee+"<br>"+loc1%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc1 %></a>
								</div></td>
								<%
									
								}
								else
									{
									%>
											
											
											<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(lat1,long1,loc1) %>
											</div></td>
											<%
									}
								//}
											%>
											<%
			String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
			if(rsttemp1.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
					<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}								
	%>
											</tr>
											<%		
									i++;
											%>
											<tr>
												<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=i%></div></td>
												<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num1] %>;"><div align="left"><%=new SimpleDateFormat(dateformat+" HH:mm:ss").format(dt2)%></div></td>
												<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
												<!--<td class="bodyText"><div align="right">&nbsp;&nbsp;< %="ON"%></div></td>-->
												<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right">&nbsp;&nbsp;<%=speedon%></div></td>
												<%
						
						if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
						{
						 %>
						
						<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right"> <%=(int)fleetview.KM_TO_MILES1(ds2-dist1)%></div></td>
						<% }
						else
						{
							
							if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
							{
								%>
								 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right">  <%=(int)ds2%></div></td> 
								
								<%
							}
							else
							{
							%>
							 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num1] %>;"><div align="right" > <%=(int)(ds2-dist1)%></div></td> 
							
							<%
							}
							%>
							
							<%
						}
											/*	if(geoname.equalsIgnoreCase("Yes"))
												{
													if(target1.contains(targetvalue1))
													{
												String d3=empnamee+"<br>"+loc3;*/
												%>
												<!-- <td class="bodyText" style="width: 40%">
												<div align="left"><a href="shownewmap.jsp?lat=< %=lat3 %>&long=< %=long3%>&discription=< %=empnamee+"<br>"+loc3%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat3 %>&long=< %=long3%>&discription=< %=empnamee+"<br>"+loc3%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc3 %></a>
												</div></td>
												<td class="bodyText">
												<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
												</td>-->
												<%
												/*}
												else
													{*/
													%>
															
															<!--  <td class="bodyText" style="width: 40%">
															<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat3,long3,loc3) %>
															</div></td>
															<td class="bodyText">
															<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
															</td>-->
															<%
												/*	}
												}
												else
												{*/
												if(target1.contains(targetvalue1))
												{
											String d3=empnamee+"<br>"+loc3;
											%>
											<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="left"><a href="shownewmap.jsp?lat=<%=lat3 %>&long=<%=long3%>&discription=<%=empnamee+"<br>"+loc3%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat3 %>&long=<%=long3%>&discription=<%=empnamee+"<br>"+loc3%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc3 %></a>
											</div></td>
											<%
											}
											else
												{
												%>
														
														<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(lat3,long3,loc3) %>
														</div></td>
														<%
												}
										//	}
														%>
														<%
			String sqlchecksensorveh2="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp2=sttemp.executeQuery(sqlchecksensorveh2);
			if(rsttemp2.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num1] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}													
	%>
													</tr>	
													<%
													i++;
									}
													
													if(rst1.getInt("Speed")==0)
													{
													    if(flag==true)
													     {
													         flag=false;	 
													         x=1;
														
													%>
														<tr>
														<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right"><%=i%></div></td>
														<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num2] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%>  <%=" "+rst1.getString("TheFieldDataTime")%></div></td>
														<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
														<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num2] %>;"><div align="right">&nbsp;&nbsp;<%="Stop"%></div></td>
																	<%
						
						if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
						{
						 %>
						
						<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num2] %>;"><div align="right"> out km to miles <%=(int)fleetview.KM_TO_MILES1(ds3-dist1)%></div></td>
						<% }
						else
						{
							
							if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
							{
								%>
								 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num2] %>;"><div align="right">  <%=(int)ds3%></div></td> 
								
								<%
							}
							else
							{
							%>
							 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num2] %>;"><div align="right"><%=(int)(ds3-dist1)%></div></td> 
							
							<%
							}
							%>
							
							<%
						}
											  /*   if(geoname.equalsIgnoreCase("Yes"))
												{
											    	 if(target1.contains(targetvalue1))
														{
															String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
															%>
															<!-- <td class="bodyText" style="width: 40%">
															<div align="left"><a href="shownewmap.jsp?lat=< %=lat3 %>&long=< %=long3%>&discription=< %=empnamee+"<br>"+loc3%>" onclick="popWin=open('shownewmap.jsp?lat=< %=lat3 %>&long=< %=long3%>&discription=< %=empnamee+"<br>"+loc3%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=loc3 %></a>
															</div></td>
															<td class="bodyText">
															<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
															</td>-->
															<%
													/*	}
														else
														{*/
														%>
													 <!-- 	<td class="bodyText" style="width: 40%">
														<div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(lat3,long3,loc3) %>
														</div></td>
														<td class="bodyText">
														<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
														</td>-->
														<%
													/*	}		
												}
												else
												{*/
																		
														if(target1.contains(targetvalue1))
														{
															String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
															%>
															<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="left"><a href="shownewmap.jsp?lat=<%=lat3 %>&long=<%=long3%>&discription=<%=empnamee+"<br>"+loc3%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat3 %>&long=<%=long3%>&discription=<%=empnamee+"<br>"+loc3%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc3 %></a>
															</div></td>
															<%
														}
														else
														{
														%>
														<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(lat3,long3,loc3) %>
														</div></td>
														<%
														}
															//	}
														%>
														<%
			String sqlchecksensorveh3="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
			ResultSet rsttemp3=sttemp.executeQuery(sqlchecksensorveh3);
			if(rsttemp3.next())
			{
				
				if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
				<%
				}
				if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
				<%
				}
				if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
				<%
				}
				if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right">xxxx</div></td>
					<%		
				}
				else
				{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num2] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
				<%
				}
				%>
				<% 
}
			
			if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
			{
				%>
				<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
				<%
			}										
	%>
													</tr>
													<%
													i++;
													}
													}			
								}
							}
						}
					}//end of ON stamp after OF stamp
				}//end of SI or ON stamp check
			}
			rst1.previous();
			    }
		}//end of OF stamp check
		//flag=true;
    }
    
}//end of while loop

				



					

		
if(rst1.last())
{
	if(chbxAll==null)
	{
		
		date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime"));
		num=date2.getDay();
%>
	<tr>
		<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=i%></div></td>
		<td class="bodyText" style="width: 20%; background-color: <%=arcolor[num] %>;"><div align="left"><%=new SimpleDateFormat(dateformat).format(rst1.getDate("TheFieldDataDate"))%> <%=rst1.getString("TheFieldDataTime")%></div></td>
		<%-- <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="left"><%=violation%></div></td> --%>
		<td class="bodyText" style="width: 10%; background-color: <%=arcolor[num] %>;"><div align="right">&nbsp;&nbsp;<%=rst1.getInt("Speed")%></div></td>
		<%if(session.getAttribute("distformat").toString().equalsIgnoreCase("ML"))
		{ System.out.println("session==>"+session.getAttribute("distformat").toString());
			 %>
			<td class="bodyText" style="width: 10%;background-color: <%=arcolor[num] %>;"><div align="right"><%=(int)fleetview.KM_TO_MILES1(rst1.getDouble("Distance")-dist1)%></div></td>
		<%}else
		{
			System.out.println("violation==>"+violation);
			System.out.println("vio distance==>"+rst1.getDouble("Distance"));
			if(violation.equals("RA") || violation.equals("RD") || violation.equals("OS"))
		{
			%>
			 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right"><%=(int)rst1.getDouble("Distance")%></div></td> 
			
			<%
		}
		else
		{
			System.out.println(" distance==>"+rst1.getDouble("Distance"));
			System.out.println(" dist==>"+dist1);
		%>
		 <td class="bodyText" style="width: 10%; background-color: <%=arcolor[num]%>;"><div align="right">
		
		 <%=(int)(rst1.getDouble("Distance")-dist1)%></div></td> 
		
		<%
		}
		
		}
		/*if(geoname.equalsIgnoreCase("Yes"))
		{
			if(target1.contains(targetvalue1))
			{
					String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");*/
					%>
					 <!-- <td class="bodyText" style="width: 40%">
					<div align="left"><a href="shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=< %=rst1.getString("LatinDec") %>&long=< %=rst1.getString("LonginDec")%>&discription=< %=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;< %=rst1.getString("TheFieldSubject") %></a>
					</div></td>
					<td class="bodyText">
					<div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
					</td>-->
					<%
			/*}
			else
			{*/
				%>
	                    <!--    <td class="bodyText" style="width: 40%">
	                       <div align="left">&nbsp;&nbsp;< %=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
	                   </div></td>
	                   <td class="bodyText">
	                   <div align="left"><a href="javascript:popupwin(< %=rst1.getString("LatinDec")%>,< %=rst1.getString("LonginDec")%>)">Geofence</a></div>
	                   </td>-->
	                   <%
			/*}

		}
		else
		{*/
				if(target1.contains(targetvalue1))
				{
						String d1=empnamee+"<br>"+rst1.getString("TheFieldSubject");
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left"><a href="shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=rst1.getString("LatinDec") %>&long=<%=rst1.getString("LonginDec")%>&discription=<%=empnamee+"<br>"+rst1.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst1.getString("TheFieldSubject") %></a>
						</div></td>
						<%
				}
				else
				{
					%>
		
		
		<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="left">&nbsp;&nbsp;<%=fleetview.showNewMap(rst1.getString("LatinDec"),rst1.getString("LonginDec"),rst1.getString("TheFieldSubject")) %>
		</div></td>
		<%
				}
	//	}
				
				String sqlchecksensorveh1="select Vehiclecode from t_vehicledetails where Description like '%TEMPSENSOR%' and vehiclecode='"+VehicleCode+"'";
				ResultSet rsttemp1=sttemp.executeQuery(sqlchecksensorveh1);
				if(rsttemp1.next())
				{
					
					if(rst1.getString("Sen1").length()< 2 && !(rst1.getString("Sen1").equals("0")))
					{
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
						<%		
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen1")%></div></td>
					<%
					}
					if(rst1.getString("Sen2").length()< 2 && !(rst1.getString("Sen2").equals("0")))
					{
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
						<%		
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen2")%></div></td>
					<%
					}
					if(rst1.getString("Sen3").length()< 2 && !(rst1.getString("Sen3").equals("0")))
					{
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
						<%		
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen3")%></div></td>
					<%
					}
					if(rst1.getString("Sen4").length()<= 2 && !(rst1.getString("Sen1").equals("0")))
					{
						%>
						<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right">xxxx</div></td>
						<%		
					}
					else
					{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num] %>;"><div align="right"><%=rst1.getString("Sen4")%></div></td>
					<%
					}
					%>
					<% 
}
				
				if(isfuel == "Yes" || isfuel.equalsIgnoreCase("Yes"))
				{
					%>
					<td class="bodyText" style="background-color: <%=arcolor[num]%>;"><div align="right"><%=rst1.getString("FuelLevel")%></div></td>
					<%
				}		
		%>
	</tr>
<%
	i++;
	}
	}
%>

							</table>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>
 	
 	
<%
//System.out.println("=============="+fromPage);
	if("runAnalysis".equalsIgnoreCase(fromPage))
	{
		//System.out.println(fromPage);
		//System.out.println(ss1);
		//System.out.println(ss3);
		//System.out.println(ss2);
		
%>


			<script type="text/javascript">
		   	  	// Load the Visualization API and the piechart package.
      			google.load('visualization', '1', {'packages':['piechart']});
            	// Set a callback to run when the API is loaded.
      			google.setOnLoadCallback(drawChart);
      	      // Callback that creates and populates a data table, 
      			// instantiates the pie chart, passes in the data and
      			// draws it.
      			function drawChart() {
        			var data = new google.visualization.DataTable();
        			data.addColumn('string', 'Task');
        			data.addColumn('number', 'Hours per Day');
        			data.addRows(3);
        			data.setValue(0, 0, 'Running Time In Min');
        			data.setValue(0, 1, <%=ss1%>);
        			
        			data.setValue(1, 0, 'Day Stops In Min');
        			data.setValue(1, 1, <%=ss3%>);
					data.setValue(2, 0, 'Night Stop In Min');
        			data.setValue(2, 1, <%=ss2%>);
        			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        			chart.draw(data, {width: 700, height: 340, is3D: true, title: 'Time Statistics'});
      			}
    			</script>
				 <div align="center" id="chart_div" order="1"></div>			
			
			
			<%
	}
			%>

Note:- The data is displayed from one record previous to selected date 
for distance accuracy purpose.

 	
 	
<%
		
		}
	
	
	catch(Exception e)
	{
		
		e.printStackTrace();
		//System.out.print("Exception "+e);
	}

%>
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
			
 	
 	
 	</body>
</jsp:useBean>
 	
 	
 	
 	
 	