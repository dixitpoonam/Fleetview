<%@ include file="headernew2.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.*" %>
    
<%@ page import="kml.KML1" %>
<%@page import="com.fleetview.beans.classes"%>

<%-- <%@page import="org.apache.poi.hssf.record.formula.functions.Datedif"%>
 --%>  
 
 <%!
 String vehRegNo1="";
 String vehRegNo="";
 String date1,date2;
 %>
 <%
classes fleetview=new classes(); 
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>

<link rel="stylesheet" href= "OpenLayers-6.9/libs/v6.9.0-dist/ol.css">
<script src="OpenLayers-6.9/libs/v6.9.0-dist/ol.js"></script>
 
 <script src="js/main.js"></script>
<style type="text/css">
	#map {
	width: 100%;
	height: 800px;
	border: 1px solid black;
	float: left;
		} 
</style>
<style>
 .ol-popup {
            position: absolute;
            background-color: white;
            -webkit-filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
            filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
            padding: 15px;
            border-radius: 10px;
            border: 1px solid #cccccc;
            bottom: 12px;
            left: -50px;
            min-width: 250px;
        }

        .ol-popup:after,
        .ol-popup:before {
            top: 100%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
        }

        .ol-popup:after {
            border-top-color: white;
            border-width: 10px;
            left: 48px;
            margin-left: -10px;
        }

        .ol-popup:before {
            border-top-color: #cccccc;
            border-width: 11px;
            left: 48px;
            margin-left: -11px;
        }

        /* .ol-popup-closer {
            text-decoration: none;
            position: absolute;
            top: 2px;
            right: 8px;
        }

        .ol-popup-closer:after {
            content: "X";
        } */
 
 </style>
 <script language="javaScript">

 function ajaxFunction(xx)
{

var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
        catch (e)
        {
	        // Internet Explorer Browsers
	        try
                {
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
	        } 
                catch (e)
                {
			try
                        {
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
                        catch (e)
                        {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
	        }
        }
	
// Create a function that will receive data sent from the server

ajaxRequest.onreadystatechange = function()
	{var rsnew="";
		if(ajaxRequest.readyState == 4)
                {
                	var reslt=ajaxRequest.responseText;
                	alert("Ajax Result :- "+reslt);
                	 rsnew = reslt.split("$");
                	 alert("Ajax Count :- "+rsnew[0]);
                	 
                	document.getElementById("side_bar1").innerHTML=rsnew[0];
                	//document.getElementById("side_bar").style.display="none";
		}
	}
if(xx==1)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
//alert("Veh Code"+p);
//alert("Reg name"+p1);
ajaxRequest.open("GET", "ViolationReport.jsp?para=OS&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==2)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
	
	//alert("Veh Code"+p);
	//alert("Reg name"+p1);
ajaxRequest.open("GET","ViolationReport.jsp?para=RA&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==3)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
ajaxRequest.open("GET", "ViolationReport.jsp?para=RDA&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==4)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
ajaxRequest.open("GET", "ViolationRep_Stop.jsp?vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==5)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
ajaxRequest.open("GET","ViolationReport.jsp?para=Disconn&vehcode="+p+"&vehRegNo1="+p1,true);
}
/*
if(xx==5)
{
ajaxRequest.open("GET", "hrst.jsp", true);
}*/
ajaxRequest.send(null); 
}
</script>
 


</head>
<body>
<%! 
Connection conn,conn1,con;
Statement st,st1,st2,st3,st4,st5,stAC,stDisconn,st6,st7,stGPS,stquery;
String htmlvis1,htmlvis2,sql,sql1,sql2,sql3,sql4,sql5,sql6,sqlware,vehcode,location,Stamp,label1,html1,html2,html3,html11,html22,d1,d2,t1,t2,time1,time2,fromtime,totime,ftime1,ftime2,ttime1,ttime2;
String thedate="",thedate1="",startplace1="",endplace1="",thetime="",thetime1="",vehregno="",ownername="",lastlocation="",strtcode="",endcode="",startplace="",endplace="",enddate,sdate1,enddate1,stopdatetime, startdatetime,latStart="",longStart="",locationStart="",thedateStart="",thetimeStart="",firstlocation="-",location1="-";
String mydate1="",mydate2="",data1="", data2="";
String gpname="",transporter="",gpname1="",ownername1="",tripid1="",desc11="";
double lat, lat1, lon, lon1,latw,longw,latw1,longw1,lat11,lon11,lat2,lon2;
float slatitude=0,slongitude=0,elatitude=0,elongitude=0;
int show,dist;

boolean flag1=false,flag2=false;
%>
<%
//System.out.println("ok i am here---1");
vehcode=request.getParameter("vehcode");
String tripid=request.getParameter("tripid");
String unitid=request.getParameter("tripid"); //unitid passed as tripid in unidentified units
String fromPage=request.getParameter("pg");
System.out.println("From Page===>"+fromPage);

//System.out.println("ok i am here---->"+tripid);
//System.out.println("ok i am here----2");
String Bt=request.getParameter("button");
if(Bt==null || Bt==" " || Bt=="")
{
data1=request.getParameter("data");
data2=request.getParameter("data1");
}
else
{
	data1=request.getParameter("data");
	data2=request.getParameter("data1");
	
	 /* data1 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(data1));

			 data2 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(data2)); */
		
			 
			 
}

String ddx = request.getQueryString();
System.out.println("data1--"+data1+" data2--"+data2);



System.out.println("hereeeeeeeeeeeee From date "+mydate1+" To dAte "+mydate2);




ftime1=request.getParameter("ftime1");
ftime2=request.getParameter("ftime2");
ttime1=request.getParameter("ttime1");
ttime2=request.getParameter("ttime2");



time1=ftime1+":"+ftime2+":00";
time2=ttime1+":"+ttime2+":00";

// set the values in  session-----------------

//System.out.println("Setting session variables");


//---------------------------------------------

//time1=request.getParameter("fromtime");
//System.out.println("time1->" +time1);
//time2=request.getParameter("totime");
//System.out.println("time2->" +time2);

try
{
	con = fleetview.ReturnConnection();
	st=con.createStatement();
	st7=con.createStatement();
	
}
catch(Exception e)
{
	System.out.println("====>error in connection");
	e.printStackTrace();
}
String linkmap="";
String maplink="select * from db_gps.t_WebsiteSettings where Website='myfleetview'";
ResultSet rsmaplink=st7.executeQuery(maplink);
			//linkmap="/maphtml/slippymap.html";
	/* if(rsmaplink.next())
	{
		linkmap=rsmaplink.getString("maplink");
	}else{
		linkmap="-";
	} */
	
String vehreg="";
String sqlvehreg="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";

System.out.println("1 st"+sqlvehreg);

ResultSet rstveh=st.executeQuery(sqlvehreg);
if(rstveh.next())
{
	vehreg=rstveh.getString("VehicleRegNumber");
	//System.out.println("VehicleRegNumber====>");
}
String n="null";

if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)) && !("drivrating".equalsIgnoreCase(fromPage)))
{
	String sqltrp="select * from t_startedjourney where TripID='"+tripid+"'";
	
	System.out.println("2 st"+sqltrp);
	
	ResultSet rstrp=st.executeQuery(sqltrp);
//	System.out.println("\n\n started journey query-->>"+sqltrp);
	if(rstrp.next())
	{
		startplace1=rstrp.getString("StartPlace");
	//	System.out.println("\n\n start place-->>"+startplace1);
		endplace1=rstrp.getString("EndPlace");
	//	System.out.println("\n\n end place-->>"+endplace1);
		strtcode=rstrp.getString("StartCode");
		endcode=rstrp.getString("EndCode");
		gpname=rstrp.getString("GPName");
	//	System.out.println("\n\n start code-->>"+strtcode);
	//	System.out.println("\n\n end code-->>"+endcode);
		transporter=rstrp.getString("OwnerName");
	}
	
	 sqltrp="select * from t_warehousedata where WareHouseCode='"+strtcode+"' AND Owner='"+transporter+"'";
	 
	 
	 
	 rstrp=st.executeQuery(sqltrp);
	System.out.println("\n\nwarehouse strt-->>"+sqltrp);
	 if(rstrp.next())
	 {
		 slatitude=rstrp.getFloat("Latitude");
		 slongitude=rstrp.getFloat("Longitude");
		 if(slatitude==0 && slongitude==0)
		 {
		       flag1=false;
		 }
		 else
			 {
			    flag1=true;
			 }
		// System.out.println("\n\n from warehouse lat strt-->>"+slatitude);
		// System.out.println("\n\n from warehouse long strt-->>"+slongitude);
	 }
	 else
	 {
		 String sqlc="select * from t_castrolroutes where StartCode='"+strtcode+"' AND Owner='"+gpname+"'";
			ResultSet rec=st.executeQuery(sqlc);
			System.out.println("\n\ncastrolroutes strt-->>"+sqlc);
			if(rec.next())
			{
				slatitude=rec.getFloat("Startlat");
				 slongitude=rec.getFloat("Startlong");
				 if(slatitude==0 && slongitude==0)
				 {
				       flag1=false;
				 }
				 else
					 {
					    flag1=true;
					 }
			//	 System.out.println("\n\n from castrolroutes lat strt-->>"+slatitude);
			//	 System.out.println("\n\n from castrolroutes long strt-->>"+slongitude);
			}
	 }
	 sqltrp="select * from t_warehousedata where WareHouseCode='"+endcode+"' AND Owner='"+transporter+"'";
	System.out.println("\n\nwarehouse end-->>"+sqltrp);
	 rstrp=st.executeQuery(sqltrp);
	 if(rstrp.next())
	 {
		 elatitude=rstrp.getFloat("Latitude");
		 elongitude=rstrp.getFloat("Longitude");
		 if(elatitude==0 && elongitude==0)
		 {
		 flag2=false;
		 }
		 else
			 {flag2=true;}
		 //flag2=true;
	//	 System.out.println("\n\n from warehouse lat end-->>"+elatitude);
	//	 System.out.println("\n\n from warehouse long end-->>"+elongitude);
	
	 }
	 else
	 {
		 String sqlc="select * from t_castrolroutes where EndCode='"+endcode+"' AND Owner='"+gpname+"'";
			ResultSet rec=st.executeQuery(sqlc);
			 System.out.println("\n\ncastrolroutes end-->>"+sqlc);
			if(rec.next())
			 {
				 elatitude=rec.getFloat("Endlat");
				 elongitude=rec.getFloat("EndLong");
				 if(elatitude==0 && elongitude==0)
				 {
				 flag2=false;
				 }
				 else
					 {flag2=true;}
				 //flag2=true;
			//	 System.out.println("\n\n from warehouse lat end-->>"+elatitude);
			//	 System.out.println("\n\n from warehouse long end-->>"+elongitude);
			
			
			//	 System.out.println("\n\n from castrolroutes lat end-->>"+elatitude);
			//	 System.out.println("\n\n from castrolroutes long end-->>"+elongitude);
			}
	 
		 
	 }
	
}
%>
<%

String Data3="",Data4="";
if(Bt==null || Bt==" " || Bt=="")
{
	
	String fromdate=request.getParameter("data");
	String todate=request.getParameter("data1");
	
    System.out.println(" In Button Null   "+fromdate );
	
	System.out.println(" In Button Null   chkdate 1"+todate );
	
	
	if(fromdate!=null && todate!=null)
	{
	
		mydate1 =new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat("yyyy-MM-dd")
		.parse(fromdate));
		
		mydate2 = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat("yyyy-MM-dd")
		.parse(todate));
		
	data1 =  fromdate;
	
	data2 = todate;


	}
	else
	{
		mydate1 = mydate2 = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date());
	data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new java.util.Date());

Calendar c = Calendar.getInstance();   // this takes current date
	c.set(Calendar.DAY_OF_MONTH, 1);
System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
mydate1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());

System.out.println(" In Button Null   "+fromdate );
			}
}
else
{
	
	System.out.println(" In Button else   " );
	data1 = request.getParameter("data");
			
			
	
	
data2 = request.getParameter("data1");

System.out.println("here 22222222222 datex1 "+data1+" datex2 "+data2);


;
mydate1 =data1;
mydate2 =data2; 

data1 =new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
.parse(mydate1));

data2 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
.parse(mydate2));

//mydate1 = request.getParameter("data")
//mydate2 = request.getParameter("data1");

}
session.setAttribute("hdate1",data1);
session.setAttribute("hdate2",data2);
session.setAttribute("fff",time1);
session.setAttribute("ttt",time2);
session.setAttribute("hvid",vehcode);
 
System.out.println("here 22222222222 datex1 "+mydate1+" datex2 "+mydate2);

//par2=d2;

%>	
<div class="app-content content " style="margin-left: 0px !important;">
								<div class="content-overlay"></div>
								<div class="header-navbar-shadow"></div>
								<div class="content-wrapper container-xxl p-0">
									<div class="content-header row">
										<div class="content-header-left mb-1 col-md-9 col-12">

										<div class="row">
											<div class="col-12">
												<h3>Journey On Map</h3>
												<h4>Trip Report for Vehicle <%=vehreg %> From  <%=mydate1 %> To <%=mydate2 %>
												</h4>

											</div>
										</div>
										

<form name="customdetail" id="customdetail" method="get">
				<input type="hidden" id="vehcode" name="vehcode" size="12" value="<%= vehcode%>"/>
 				<input type="hidden" id ="tripid" name="tripid" size="12" value="<%=tripid%>"/>
				<input type="hidden" id ="vehRegNo1" name="vehRegNo1" size="12" value="<%=vehRegNo%>">
				<div class="row">
				<div class="col-md-2">
						<label for="from">From:</label>
						<div class="input-group input-group-merge">

							<input type="text" name="data" id="data" class="form-control"
								value="<%=mydate1%>"> <span class="input-group-text"><svg
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
						<option value="00" <%if(ftime1.equalsIgnoreCase("00")){ %> Selected <%} %>>00</option>
		<option value="01" <%if(ftime1.equalsIgnoreCase("01")){ %> Selected <%} %>>01</option>
		<option value="02" <%if(ftime1.equalsIgnoreCase("02")){ %> Selected <%} %>>02</option>
		<option value="03" <%if(ftime1.equalsIgnoreCase("03")){ %> Selected <%} %>>03</option>
		<option value="04" <%if(ftime1.equalsIgnoreCase("04")){ %> Selected <%} %>>04</option>
		<option value="05" <%if(ftime1.equalsIgnoreCase("05")){ %> Selected <%} %>>05</option>
		<option value="06" <%if(ftime1.equalsIgnoreCase("06")){ %> Selected <%} %>>06</option>
		<option value="07" <%if(ftime1.equalsIgnoreCase("07")){ %> Selected <%} %>>07</option>
		<option value="08" <%if(ftime1.equalsIgnoreCase("08")){ %> Selected <%} %>>08</option>
		<option value="09" <%if(ftime1.equalsIgnoreCase("09")){ %> Selected <%} %>>09</option>
	
							<%
							int ftt1=Integer.parseInt(ftime1);
							int ftt2=Integer.parseInt(ftime2);
			for(int i=10;i<24;i++)
			{
			%>
				<option value="<%=i%>" <%if(ftt1==i){%> Selected <%} %>><%=i%></option>
			<%
			}		
		%>
									
					</select>
					</div>
					</div>
					
					<div class="col-md-1">
					    <label for="basicSelect">MM</label>
						<div class="input-group input-group-merge">
					     <select name="ftime2" id="ftime2" class="form-select">
						<option value="00"  <%if(ftime2.equalsIgnoreCase("00")){ %> Selected <%} %>>00</option>
		<option value="01"  <%if(ftime2.equalsIgnoreCase("01")){ %> Selected <%} %>>01</option>
		<option value="02"  <%if(ftime2.equalsIgnoreCase("02")){ %> Selected <%} %>>02</option>
		<option value="03"  <%if(ftime2.equalsIgnoreCase("03")){ %> Selected <%} %>>03</option>
		<option value="04"  <%if(ftime2.equalsIgnoreCase("04")){ %> Selected <%} %>>04</option>
		<option value="05"  <%if(ftime2.equalsIgnoreCase("05")){ %> Selected <%} %>>05</option>
		<option value="06"  <%if(ftime2.equalsIgnoreCase("06")){ %> Selected <%} %>>06</option>
		<option value="07"  <%if(ftime2.equalsIgnoreCase("07")){ %> Selected <%} %>>07</option>
		<option value="08"  <%if(ftime2.equalsIgnoreCase("08")){ %> Selected <%} %>>08</option>
		<option value="09"  <%if(ftime2.equalsIgnoreCase("09")){ %> Selected <%} %>>09</option>
		<%
		
		
			for(int i=10;i<60;i++)
			{
			%>
				<option value="<%=i%>"  <%if(ftt2==i){ %> Selected <%} %>><%=i%></option>
			<%
			}		
		%>
		</select>
					</div>
					</div>
					
					<div class="col-md-2">
						<label for="to">To:</label>
						<div class="input-group input-group-merge">

							<input type="text" id="data1" name="data1" class="form-control"
								value="<%=mydate2%>" /> <span class="input-group-text"><svg
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
					<option value="00"  <%if(ttime1.equalsIgnoreCase("00")) {%> Selected <%} %>>00</option>
		<option value="01"  <%if(ttime1.equalsIgnoreCase("01")) {%> Selected <%} %>>01</option>
		<option value="02"  <%if(ttime1.equalsIgnoreCase("02")) {%> Selected <%} %>>02</option>
		<option value="03"  <%if(ttime1.equalsIgnoreCase("03")) {%> Selected <%} %>>03</option>
		<option value="04"  <%if(ttime1.equalsIgnoreCase("04")) {%> Selected <%} %>>04</option>
		<option value="05"  <%if(ttime1.equalsIgnoreCase("05")) {%> Selected <%} %>>05</option>
		<option value="06"  <%if(ttime1.equalsIgnoreCase("06")) {%> Selected <%} %>>06</option>
		<option value="07"  <%if(ttime1.equalsIgnoreCase("07")) {%> Selected <%} %>>07</option>
		<option value="08"  <%if(ttime1.equalsIgnoreCase("08")) {%> Selected <%} %>>08</option>
		<option value="09"  <%if(ttime1.equalsIgnoreCase("09")) {%> Selected <%} %>>09</option>
		<%
		int tt1=Integer.parseInt(ttime1);
		int tt2=Integer.parseInt(ttime2);
			for(int i=10;i<24;i++)
			{
			%>
				<option value="<%=i%>" <%if(tt1==i){%> Selected <%} %>><%=i%></option>
			<%
			}		
		%>
					
					</select>
					</div>
					</div>
					
					<div class="col-md-1">  
					<label for="basicSelect">MM:</label>
						<div class="input-group input-group-merge">
					          <select name="ttime2" id="ttime2" class="form-select">
							 <option value="00" <%if(ttime2.equalsIgnoreCase("00")){ %> Selected <%} %>>00</option>
		<option value="01"  <%if(ttime2.equalsIgnoreCase("01")){ %> Selected <%} %>>01</option>
		<option value="02"  <%if(ttime2.equalsIgnoreCase("02")){ %> Selected <%} %>>02</option>
		<option value="03"  <%if(ttime2.equalsIgnoreCase("03")){ %> Selected <%} %>>03</option>
		<option value="04"  <%if(ttime2.equalsIgnoreCase("04")){ %> Selected <%} %>>04</option>
		<option value="05"  <%if(ttime2.equalsIgnoreCase("05")){ %> Selected <%} %>>05</option>
		<option value="06"  <%if(ttime2.equalsIgnoreCase("06")) {%> Selected <%} %>>06</option>
		<option value="07"  <%if(ttime2.equalsIgnoreCase("07")){ %> Selected <%} %>>07</option>
		<option value="08"  <%if(ttime2.equalsIgnoreCase("08")){ %> Selected <%} %>>08</option>
		<option value="09"  <%if(ttime2.equalsIgnoreCase("09")){ %> Selected <%} %>>09</option>
		<%
			
			for(int i=10;i<60;i++)
			{
			%>
				<option value="<%=i%>" <%if(tt2==i){ %> Selected <%} %>><%=i%></option>
			<%
			}		
		%>
							 </select>
								</div>
					         </div>
			    <div class="col-md-1">
				<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
			   </div>
				
				</div>
				</form>
					</div>
											<div class="content-header-right text-md-end col-md-3 col-12 d-md-block d-none">
												<div class="mb-1 breadcrumb-right">
													<div class="demo-inline-spacing mb-1" >
														<button class="btn btn-danger" onclick="history.back()">Back</button>
										
													  </div>
												</div>
											</div>
											</div>


<%  
try
{
	conn = fleetview.ReturnConnection();
	st=conn.createStatement();
	st1=conn.createStatement();
	st3=conn.createStatement();
	st4=conn.createStatement();
	st2=conn.createStatement();
	st5=conn.createStatement();
	st6=conn.createStatement();
	stDisconn=conn.createStatement();
	stGPS=conn.createStatement();
	stquery=conn.createStatement();
	Class.forName(MM_dbConn_DRIVER); 
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stAC=conn1.createStatement();

}catch(Exception e)
{
	out.print("Exception "+e);
}
String wareHouseCode="-",wareHouse="-",owner="-",html1=null,wtype="-",PolygonCoordinates="-";
String rfname= session.getAttribute("rfname").toString(); //user name  //.setAttribute("rfname",fnamelist);
String rlname=session.getAttribute("rlname").toString();
String getCordiantesSql="",getCordiantesSql1="";
ResultSet rs2=null,rs22=null; 
//String vehRegNo="";
String smap="",smap1="",strtplace="", endplace="", strtLat="",endLat="",strtLong="",endLong="",strtcode="",endcode="",stCodeList="(",endCodeList="(";
String dcode = "";
%>
<%
if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)) && !("drivrating".equalsIgnoreCase(fromPage)))
{
	String sqltrp="select * from t_startedjourney where TripID='"+tripid+"'";
	ResultSet rstrp=st.executeQuery(sqltrp);
	System.out.println("started journey querry--------->"  +sqltrp);
	if(rstrp.next())
	{
		strtplace=rstrp.getString("StartPlace");
		endplace=rstrp.getString("EndPlace");
		strtcode=rstrp.getString("StartCode");
		endcode=rstrp.getString("EndCode");
		dcode = rstrp.getString("drivercode");
	}
} 
String fwUser = (String) session.getAttribute("user");
	String savedCoordiantes = "";
	if(fwUser.equalsIgnoreCase("Shramik"))
	{		
				 getCordiantesSql = "Select * from t_warehousedata where Owner='"+ fwUser+"' and MarkerType='Poly'";
				 getCordiantesSql1 = "Select * from t_warehousedata where Owner='"+ fwUser+"'";
			
				System.out.println("getCordiantesSql"+getCordiantesSql);
				 rs2 = st2.executeQuery(getCordiantesSql);
				 rs22 = st3.executeQuery(getCordiantesSql1);
	}	
	if(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Zauri Indian Oil tanking Ltd"))
	  {	  
		  System.out.println("Hi3");
	  %>
<script>
	  loadKML("KMLJRM/ZIOL61761.kml");	//  loadKML("KML/test.kml");
</script>
<%
	  } %>
			<div class="content-body">
				<div class="row mt-2">
					<div class="col-md-3">
						<ul class="list-group ">
							<li class="list-group-item"><img src="images/redloc.png" width="20px" height="20px">&nbsp;&nbsp;GeoFence</li>
							<li class="list-group-item"><img src="images/mm_20_green.png">&nbsp;&nbsp;Last </li>
							<li class="list-group-item"><img src="images/mm_20_black.png">&nbsp;&nbsp;Start </li>
							<li class="list-group-item"><img src="images/mm_20_red.png">&nbsp;&nbsp;OverSpeed&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#OSModal"><span id="os"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_blue.png">&nbsp;&nbsp;Rapid Accelaration&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#RAModal" ><span id="ra"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_yellow.png">&nbsp;&nbsp;Rapid Decelaration&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#RDModal" ><span id="rda"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_white.png">&nbsp;&nbsp;Stop &nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#StopModal" ><span id="st"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_grey.png">&nbsp;&nbsp;Disconnection &nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#DisconnModal" ><span id="Disconn"></span></a></li>
						</ul>
						<div class="row  mt-2">
							<div id="showT">
								<table class="table table-bordered table-striped  table-sm "
									style="width: 100%;">
<%
try{
String stamp;
if("0".equalsIgnoreCase(vehcode)){
		%>
		<tr style="width: 20px;">
			<th>UnitId::</th>
			<td><%=unitid%></td>
		</tr>
		<tr style="width: 20px;">
			<th>Journey Start date :</th>
			<td><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time1))%></td>
		</tr>
			
		<%-- <script>
		side_bar_html += "<br><table id='customers'><tr><td><font color='#20086C'>UnitId:</font></td><td><font color='#20086C'><b> <%=unitid%></b></font></td></tr><tr><td><font color='#20086C'>Journey Start date :</font></td><td><font color='#20086C'><b><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time1))%></b></font></td></tr><td></tr><tr><td><font color='#20086C'>Journey End date :</font></td><td><font color='#20086C'><b><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time2))%></b></font></td></tr>";
		</script> --%>
		<%
	}
	else{
		sql="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
		System.out.println("get vehicle dataquery rstx==>"+sql);
		ResultSet rstx=st.executeQuery(sql);
		if(rstx.next())
		{
			
		vehRegNo=rstx.getString("VehicleRegNumber");
		Format NewFormatter3 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
		if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)))
		{
		%>
		<tr style="width: 20px;">
			<th>Trip ID :</th>
			<td><%=tripid%></td>
			</tr>
			<tr style="width: 20px;">
					<th>Vehicle Reg.No:</th>
					<td><%=rstx.getString("VehicleRegNumber")%></td>
			</tr>
			<tr style="width: 20px;">
				<th>Transporter :</th>
				<td><%=rstx.getString("OwnerName")%></td>
			</tr>
		<%-- <script>
			side_bar_html += "<br><table id='customers'><tr><td><font color='#20086C'>Trip ID :</font></td><td><font color='#20086C'><b><%=tripid%></b></font></td></tr><tr><td><font color='#20086C'>Vehicle Reg.No.:</font></td><td><font color='#20086C'><b> <%=rstx.getString("VehicleRegNumber")%></b></font></td></tr><tr><td><font color='#20086C'>Transporter :</font></td><td><font color='#20086C'><b><%=rstx.getString("OwnerName")%></b></font></td></tr>";
		</script> --%>
		<%
		}
		else
		{
			%>
			<tr style="width: 20px;">
					<th>Vehicle Reg.No:</th>
					<td><%=rstx.getString("VehicleRegNumber")%></td>
			</tr>
			<tr style="width: 20px;">
				<th>Transporter:</th>
				<td><%=rstx.getString("OwnerName")%></td>
			</tr>	
			<%-- <script>
			side_bar_html += "<br><table id='customers'><tr><td><font color='#20086C'>Vehicle Reg.No.:</font></td><td><font color='#20086C'><b> <%=rstx.getString("VehicleRegNumber")%></b></font></td></tr><tr><td><font color='#20086C'>Transporter :</font></td><td><font color='#20086C'><b><%=rstx.getString("OwnerName")%></font></td></tr>";
			</script> --%>
			<%
		}
		 	 	
	
		session.setAttribute("hvrno",rstx.getString("VehicleRegNumber"));
		}
	}
if("0".equalsIgnoreCase(vehcode)){
	sql="SELECT Min(Distance) as startdist,Max(Distance) as enddist,TheFiledTextFileName as stamp from t_veh"+vehcode+" where unitid= '"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN ('SI','OF','ST','SP')";
}
else{
	sql="SELECT Min(Distance) as startdist,Max(Distance) as enddist,TheFiledTextFileName as stamp from t_veh"+vehcode+" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN ('SI','OF','ST','SP')";
}
System.out.println("Journey Distance Query:----->"+sql);
ResultSet rst2=st3.executeQuery(sql);
if(rst2.next())
{
int startDist=0;
int endDist=0;
startDist=rst2.getInt("startdist");
endDist=rst2.getInt("enddist");
dist=endDist-startDist;
System.out.println("Distance Travelled:"+dist);
stamp=rst2.getString("stamp");
if(dist > 0)
{
%>
<tr style="width: 20px;">
<th>Total Distance Travelled:</th>
<td><%=dist%> km.</td>
</tr>
<%-- <script>side_bar_html += "<tr><td><font color='#20086C'>Total Distance Travelled:</b></font></td><td><font color='#20086C'><b><%=dist%> km.</b></font></td></tr></table>";
</script> --%>
<%
} 
else
{
%>
<tr style="width: 20px;">
<th>Total Distance Travelled:</th>
<td>-</td>
</tr>
<!-- <script>side_bar_html +="<tr><td><font color='#20086'></font></td></tr></table>";</script> -->
<%
}
}

%>
</table>
</div>
</div>

<div class="row mt-2" id="side_bar1">
</div>
					</div>
					<div class="col-md-9 ">
						<div class="card">
							<div id="map"></div>
							<div id="popup" class="ol-popup">
								<!-- <a href="#" id="popup-closer" class="ol-popup-closer"></a> -->
								<div id="popup-content"></div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
</div>
<%
String color="000000";//(black)
        	
        	// String color="#E60000";
			HashMap<String, String> coordinateMap = null;
		    HashMap<String, String> coordinateMapStart = null;
		    HashMap<String, String> coordinateMapEnd = null;
		    List<HashMap<String, String>> coordinateList = null;
		  
		    coordinateList=new ArrayList<HashMap<String, String>>();
		    String sql12 = "";
		    
		    if("0".equalsIgnoreCase(vehcode))
		         sql12="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime asc";
		    else
		    	sql12="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime asc";
				
			System.out.println("sql start loc 1====>"+sql12);
			ResultSet rst12=st.executeQuery(sql12);
if(rst12.next())
			{
				System.out.println("Name:"+rst12.getString("TheFieldSubject")+" -------------------");
		        coordinateMapStart =  new java.util.HashMap<String, String>();
		        coordinateMapStart.put("name",rst12.getString("TheFieldSubject"));
		        coordinateMapStart.put("desc", rst12.getString("TheFieldSubject"));
		        coordinateMapStart.put("lat",rst12.getString("LatinDec")); 
		        coordinateMapStart.put("longi",rst12.getString("LonginDec"));  
			}
         
			if("0".equalsIgnoreCase(vehcode))
	 		sql1="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"'  and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime asc";
			else
			sql1="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"'  and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime asc";

System.out.println("Coordinate Map Query:===>"+sql1);
ResultSet rst=st.executeQuery(sql1);
boolean flag1=true;
int l=1;
while(rst.next())
{ /**********record is added for- if no data then it will not come in while loop and willnot get ++ then not to show start point*************/
	if(rst.getInt("Speed")==0)
	{
		if(flag1)
		{
	 coordinateMap =  new java.util.HashMap<String, String>();
    coordinateMap.put("name",rst.getString("TheFieldSubject"));
    coordinateMap.put("desc", rst.getString("TheFieldSubject"));
    coordinateMap.put("lat",rst.getString("LatinDec")); 
    coordinateMap.put("longi",rst.getString("LonginDec"));                         
    coordinateList.add(coordinateMap);
//      System.out.println("Coordlist----------"+coordinateMap.get("lat")+","+coordinateMap.get("longi"));
     }
	}
	else
	{
		flag1=true;
		
		    coordinateMap =  new java.util.HashMap<String, String>();
		    coordinateMap.put("name",rst.getString("TheFieldSubject"));
		    coordinateMap.put("desc", rst.getString("TheFieldSubject"));
		    coordinateMap.put("lat",rst.getString("LatinDec")); 
		    coordinateMap.put("longi",rst.getString("LonginDec"));                         
		    coordinateList.add(coordinateMap);
		
		
	}
}
String sql11="";	

if("0".equalsIgnoreCase(vehcode))
	sql11="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime desc";
else
	sql11="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN('AC','DC','OS','SI','ON','OF','ST','SP','PF','PO') order by TheFieldDataDateTime desc";
System.out.println("sql before kml generation ====>"+sql11);
ResultSet rst11=st.executeQuery(sql11);
String latitude="",longitude="";
if(rst11.next())
{
	System.out.println("Name:"+rst11.getString("TheFieldSubject")+"--------------------");
	
    coordinateMapEnd =  new java.util.HashMap<String, String>();
    coordinateMapEnd.put("name",rst11.getString("TheFieldSubject"));
    coordinateMapEnd.put("desc", rst11.getString("TheFieldSubject"));
    coordinateMapEnd.put("lat",rst11.getString("LatinDec")); 
    coordinateMapEnd.put("longi",rst11.getString("LonginDec"));  
    longitude= rst11.getString("LonginDec");
    latitude= rst11.getString("LatinDec");
}


/*-----------------------------generate kml----------------------------*/

String dir=request.getRealPath("/");
 tripid1=tripid;
if(tripid1==null||tripid1.equals("null"))
{
	tripid1=vehcode;
}
else if(tripid1.equals("''"))
{
	tripid1=vehcode;
}
else if("0".equalsIgnoreCase(vehcode)){
	tripid1=vehcode;
}

String kmlfile = "";
if(tripid1 == null || tripid1.equals("")||tripid1.equals("-")||tripid1.equalsIgnoreCase("null"))
{
	
}
else
{
	sql11 = "select kmlfile from db_gps.t_castrolroutes where  startcode ='"+strtcode+"' and endcode ='"+endcode+"'";
   ResultSet rs11 = st.executeQuery(sql11);
   System.out.println("castrolroutes querry---------------->"  +sql11);
   if(rs11.next())
   {
	   kmlfile = rs11.getString("kmlfile");
   }
   
}
System.out.println("KML File: "+kmlfile);

dir=dir+"KML/"+"kml_"+tripid1+".kml";	

System.out.println("dir:"+dir);
KML1 kml = new KML1();

flag1=KML1.generateKMLFORLINE(coordinateList,dir,coordinateMapStart,coordinateMapEnd,color);
System.out.println("flag kml for line: "+flag1);
 %>
<script>
	var kmlfile1 = "<%=kmlfile%>";

    if(kmlfile1 == ""||kmlfile1=="-")
    {     }
    else
    {        
  	  loadKML("KMLJRM/"+kmlfile1);
    }
    
	var filename="<%=tripid1%>";
	var frmPage="<%=fromPage%>";
	if(frmPage=="debrif" || frmPage=="brief")
	{
		
		loadKML("KMLJRM/CastrolAllRoutes.kmz");
		  var url="KML/kml_"+filename+".kml?date="+new Date().getTime();
		  loadKML(url);		
	}
	else
	{
		
		var url="KML/kml_"+filename+".kml?date="+new Date().getTime();
	    loadKML(url);
		
	}
	
	console.log("View center:-->\nLattitude:"+<%=latitude%>);
	console.log("Longitude:"+<%=longitude%>);
	
	setCenter(<%=longitude%>,<%=latitude%>);			//call for focus on journey
	setZoom(12);									//call to setzoom
</script>
<%
int OScount=0,ACcount=0,DCcount=0,STcount=0,DisconnCount=0,GeofenceCount=0;
String file="";

 if(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Zauri Indian Oil tanking Ltd"))
  {	  
		  
 try{
	   String sql="select * from db_gps.t_warehousedata where owner like 'Zauri%'";
	   ResultSet rs=st6.executeQuery(sql);
	   System.out.println("Zauri IOC sql: "+sql);
	   while(rs.next())
	   {
		    lat2=rs.getDouble("Latitude");
		    lon2=rs.getDouble("Longitude");
		    desc11=rs.getString("WareHouse");
		    if(desc11 == null || desc11.equalsIgnoreCase("") || desc11.equalsIgnoreCase("-") || desc11.equalsIgnoreCase(" ") )
		    {
		    	desc11 = "NA";	
		    }
		    html3="<b>Description:</b><br>"+desc11;
		    %>
		    <script>
		    createMarker_zauri("<div class='bodyText'><%= html3%></div>","<div class='bodyText'><%= html3%></div>",<%= lat2%>,<%=lon2%>);
		    </script>
		    <%
	   }
			   
   }catch(Exception e)
   {
	   System.out.println("Exception----->"+e.getMessage());
	   e.printStackTrace();
   }
   
  }
   

sql12="";
Double startdist=0.0,enddist=0.0;
if("0".equalsIgnoreCase(vehcode))
	sql12="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName  IN ('SI','OF','ST','SP') order by TheFieldDataDateTime asc";
else
	//sql12="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','GS') order by TheFieldDataDateTime asc";

	sql12="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName  IN ('SI','OF','ST','SP') order by TheFieldDataDateTime asc";
	
System.out.println("sql start loc 2====>"+sql12);
 rst12=st.executeQuery(sql12);
 
 String LatStar="";
if(rst12.next())
{
	
	System.out.println("Name: "+rst12.getString("TheFieldSubject")+" -------------------");
	startdist=rst12.getDouble("Distance");
  
//   	System.out.println("MapStart----------"+coordinateMapStart.get("lat")+","+coordinateMapStart.get("longi"));
	
	lat=rst12.getDouble("LatinDec");
	lon=rst12.getDouble("LonginDec");
	
//	System.out.println("\n\n start loc lat-->><"+lat);
//	System.out.println("\n\n start loc lon-->><"+lon);
	
	location=rst12.getString("TheFieldSubject");
//	System.out.println(lat+","+lon);
	
	String dt1 = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst12.getString("TheFieldDataDate")));
	html2="<b>Start location:</b><br>"+location+"<br><b>Date Time : </b>"+dt1+" " +rst12.getString("TheFieldDataTime");
	System.out.println("Start label: "+html2);
	System.out.println("Start location Marker....");
	%><script>
	//document.getElementById("strtloc11").innerHTML=< %=location%>;
	createMarker2("<div class='bodyText'><%= html2%></div>","<div class='bodyText'><%= html2%></div>",<%= lat%>,<%= lon%>);
	</script>
	
	<%}

/******************************************************  check start loc is geofenced ************************************************************/

if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode))  && !("drivrating".equalsIgnoreCase(fromPage)) && ("Castrol".equalsIgnoreCase(gpname)))
{
	
//	System.out.println("\n\n GPName-->>"+gpname);
	String sqlware="select * from t_warehousedata where WareHouseCode='"+strtcode+"'";
	System.out.println("sqlware--"+sqlware);
	ResultSet resw=st5.executeQuery(sqlware);
	if(resw.next())
	{
		latw=resw.getDouble("Latitude");
		longw=resw.getDouble("Longitude");
		System.out.println("Lattitude:"+latw+" Longitude "+longw);

		html11="<b>Geofenced Start location:</b><br>"+location;

%>
<script>
createMarker_ware("<%=resw.getString("WareHouse")%>","<div class='bodyText'><%=html2%></div>",<%=latw%>,<%=longw%>);
</script>
<%		}//warehouse if end
	else
	{
		String sqlc="select * from t_castrolroutes where StartCode='"+strtcode+"'";
		System.out.println("Geofence Location query:--->"+sqlc);
		ResultSet rec=st.executeQuery(sqlc);
		if(rec.next())
		{
			html11="<b>Geofenced Start location:</b><br>"+location;
			
		}
	
	%><script>
	createMarker_ware("<%=location%>","<div class='bodyText'><%=html11%></div>",<%=lat%>,<%=lon%>);   
	</script>
<%	}
}//if tripid!=null end
else
{
//	System.out.println("Trip Is Null.............");
}
%>
<%

	//while to drow the line.
	
	/***********Code for find last location***************/
	sql11="";
	/*---------------------------------change:- TheFiledTextFileName IN('SI','OF') removed from query---------------------------*/
	if("0".equalsIgnoreCase(vehcode))
		sql11="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName  IN ('SI','OF','ST','SP') order by TheFieldDataDateTime desc";
    else
		sql11="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName  IN ('SI','OF','ST','SP') order by TheFieldDataDateTime desc";
	System.out.println("sql last loc ====>"+sql11);
	rst11=st.executeQuery(sql11);
	if(rst11.next())
	{
		//System.out.println("1038 Hii");
		enddist=rst11.getDouble("Distance");
       
        System.out.println("MapEnd----Name:"+rst11.getString("TheFieldSubject")+"------Lat:"+coordinateMapEnd.get("lat")+",Long:"+coordinateMapEnd.get("longi"));
		
		lat=rst11.getDouble("LatinDec");
		lon=rst11.getDouble("LonginDec");
	//	System.out.println("\n lat for last->>"+lat);
	//	System.out.println("\n long for last->>"+lon);
		location=rst11.getString("TheFieldSubject");
		
		String dt = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheFieldDataDate")));
		html1="<b>Last location:</b><br>"+location+"<br><b>Date Time : </b>"+dt+" " +rst11.getString("TheFieldDataTime");
	 	System.out.println("html:"+html1);
		System.out.println("stamp based Marker Creation logic follows");
		%>
		<script>
		createMarker("<div class='bodyText'><%= html1%></div>","<div class='bodyText'><%= html1%></div>","SI",<%= rst11.getString("LatinDec")%>,<%= rst11.getString("LonginDec")%>);
		</script>    
		
		<%
		//   System.out.println("1063 Hii");
			}
	
	/****************************************** check last loc is geofence*********************************/
	if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode))  && !("drivrating".equalsIgnoreCase(fromPage)) && ("Castrol".equalsIgnoreCase(gpname)))
	{
		//System.out.println("1069 Hii");
		sqlware="select * from t_warehousedata where WareHouseCode='"+endcode+"' limit 1";
		System.out.println("sqlware end--"+sqlware);
		ResultSet resw1=st5.executeQuery(sqlware);
		if(resw1.next())
		{
			//System.out.println("1075 Hii");
			latw1=resw1.getDouble("Latitude");
			longw1=resw1.getDouble("Longitude");
		//	System.out.println(latw1+","+longw1);
			html22="<b>Geofenced Last location:</b><br>"+location;
		
		%><script>
		createMarker_ware("<%=resw1.getString("WareHouse")%>","<div class='bodyText'><%=html22%></div>",<%=latw1%>,<%=longw1%>);  
		</script><%}
		else
		{
			//System.out.println("1089 Hii");
			String sqlc="select * from t_castrolroutes where EndCode='"+endcode+"'";
			System.out.println("1091 "+sqlc);
			ResultSet rec=st.executeQuery(sqlc);
			if(rec.next())
			{
				//System.out.println("10 Hii");
				html22="<b>Geofenced Last location:</b><br>"+location;	
				System.out.println("Html:"+html22);
				System.out.println("Warehouse Marker logic....");
		%> 
		<script>
		createMarker_ware("<%=location%>","<div class='bodyText'><%=html22%></div>",<%=lat%>,<%=lon%>);   
		</script>
		<%}
		}
	}
	else
	{
		
	}
	
	/******************************  check start loc of trip is geofenced ************************/
	 if(flag1==true)
		    {
		//System.out.println("\n\n in start trip ");
					htmlvis1="<b>Geofenced Trip Start location:</b><br>"+startplace1;
				//	System.out.println("\n\n vishal start lat-->>"+slatitude);
				//	System.out.println("\n\n vishal start long-->>"+slongitude);
		System.out.println("start place:"+startplace1);
		System.out.println("htmlvis1:"+htmlvis1);
		System.out.println("stamp based Marker Creation logic follows  lat:"+slatitude+" long:"+slongitude);
		%><script>
		  createMarker("<div class='bodyText' align='left'><%=startplace1%></div>","<div class='bodyText' align='left'><%=htmlvis1%></div>",'TripStart','<%=slatitude%>','<%=slongitude%>');
		  </script>
		   <%		
		  }//warehouse if end   
		  
		  
	 /******************************  check end loc of trip is geofenced ************************/
	 if(flag2==true)
		    {
			// System.out.println("\n\n in end trip ");
					htmlvis2="<b>Geofenced Trip End location:</b><br>"+endplace1;
				//	System.out.println("\n lat for trip end->>"+elatitude);
				//	System.out.println("\n long for trip end->>"+elongitude);
		System.out.println("htmlvis2:"+htmlvis2);
		System.out.println("geofence trip end Marker creation logic follows:...");
		%><script>
		createMarker("<div class='bodyText' align='left'><%= endplace1%></div>","<div class='bodyText' align='left'><%=htmlvis2%></div>",'TripEnd','<%=elatitude%>','<%=elongitude%>');
		</script>	
		<%		
		}//warehouse if end
%>
<%
if(!("0".equalsIgnoreCase(vehcode))){
	//	System.out.println("1251 Hii");
		 date1=data1+" "+time1;
		 date2=data2+" "+time2;
		//String sqlnew="SELECT os.Duration, os.FromDate, os.FromTime, os.ToDate, os.ToTime,veh.LatinDec, veh.LonginDec, veh.TheFieldSubject, os.Speed, os.Zone FROM db_gpsExceptions.t_veh"+vehcode+"_overspeed os LEFT OUTER JOIN (SELECT TheFieldDataDate, TheFieldDataTime, MAX(LonginDec) AS LonginDec, MAX(LatinDec) AS LatinDec,MAX(TheFieldSubject) AS TheFieldSubject FROM  db_gps.t_veh"+vehcode+"  WHERE TheFiledTextFileName= 'OS' and TheFieldDataDateTime >= '"+data1+" 00:00:00' and TheFieldDataDateTime <= '"+data2+" 23:59:59' GROUP BY TheFieldDataDateTime) veh ON (veh.TheFieldDataDate = os.FromDate AND veh.TheFieldDataTime = os.FromTime) WHERE concat(os.FromDate,' ',os.FromTime) >='"+data1+" 00:00:00' and concat(os.FromDate,' ',os.FromTime) <='"+data2+" 23:59:59' and (veh.TheFieldSubject is not null or veh.LatinDec is not null or veh.LonginDec is not null)  ORDER BY concat(os.FromDate,os.FromTime)";
		String sqlnew="SELECT os.Duration, os.FromDate, os.FromTime, os.ToDate, os.ToTime," +
				" veh.LatinDec, veh.LonginDec, veh.TheFieldSubject, veh.Distance, os.Speed, veh.ZoneColor" +
				" FROM db_gpsExceptions.t_veh"+vehcode+"_overspeed os " +
				" LEFT OUTER JOIN (" +
				" SELECT TheFieldDataDate, TheFieldDataTime,Distance," +
				" MAX(LonginDec) AS LonginDec, MAX(LatinDec) AS LatinDec," +
				" MAX(TheFieldSubject) AS TheFieldSubject, ZoneDesc AS ZoneColor" +
				" FROM  db_gps.t_veh"+vehcode +
				" WHERE  TheFiledTextFileName= 'OS' " +
				"  and  TheFieldDataDateTime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))+"' "+
				" and TheFieldDataDateTime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2))+"' "+
				" GROUP BY TheFieldDataDateTime" +
				" ) veh ON (veh.TheFieldDataDate = os.FromDate" +
				" AND veh.TheFieldDataTime = os.FromTime)" +
				" WHERE 1=1 " +
				" AND concat(os.fromdate,' ',os.fromtime)>='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))+ "'" +
				" AND concat(os.ToDate,' ',os.ToTime)<='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2))+ "'" +
				"and (veh.TheFieldSubject is not null or veh.LatinDec is not null or veh.LonginDec is not null)  ORDER BY concat(os.FromDate,os.FromTime)";
		
		//ResultSet rstos=fleetview.getOSforDateRange(date1,date2,vehcode);
		ResultSet rstos=stquery.executeQuery(sqlnew); 
		
	System.out.println("1251 Hii"+sqlnew);
		while(rstos.next())
		{
				label1="<b>OverSpeed</b><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstos.getDate("FromDate"))+" "+rstos.getString("FromTime")+"<br><b>Speed : </b>" +rstos.getString("Speed")+"(kmph)<br><b>Duration : </b>" + rstos.getDouble("Distance") + " Sec.<br><b>Location : </b>"+rstos.getString("TheFieldSubject");
				%> 
				<script> 
					createMarker("<div class='bodyText'><%=label1%></div>","<div class='bodyText'><%= label1%></div>","OS",<%= rstos.getDouble("LatinDec")%>,<%= rstos.getDouble("LonginDec")%>);
				</script>
				<%
				OScount++;
				System.out.println("New OS Count " +OScount);
		}
%>
<script>document.getElementById("os").innerHTML="<font color=\"blue\">"+<%= OScount%>+"</font>";</script>
<%
sql1="SELECT "+
		" ra.Thedate, ra.TheTime, ra.FromSpeed, ra.ToSpeed , veh.TheFieldDataDate,veh.TheFieldDataTime, " +
		"	       veh.TheFieldSubject ,veh.LatinDec, veh.LonginDec, veh.ZoneColor,veh.Distance " +
		" FROM "+
		"(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
		"		  FROM db_gpsExceptions.t_veh"+vehcode+"_ra" +
		"			 WHERE"+
		"		   concat(TheDate,' ',TheTime)  >= '"+date1+"'" +
		"			 AND" +
		"		   concat(TheDate,' ',TheTime)<= '"+date2+"') ra"+
		" LEFT OUTER JOIN " +
		"   (SELECT LatinDec, LonginDec,Distance, TheFieldSubject,TheFieldDataDate,TheFieldDataTime,ZoneDesc AS ZoneColor " +
		" FROM db_gps.t_veh"+vehcode+"" +
		"	WHERE" +
		"   	TheFieldDataDateTime >= '"+date1+"' " +
		"	AND" +
		"		 TheFieldDataDateTime<= '"+date2+"')veh "+
		" ON(veh.TheFieldDataDate = ra.TheDate AND veh.TheFieldDataTime = ra.TheTime) " +
		" GROUP BY " +
		"	CONCAT( ra.Thedate , ra.TheTime )" +
		"ORDER BY CONCAT( ra.Thedate , ra.TheTime )";
/* ResultSet rstac=fleetview.getACforDateRange(date1,date2,vehcode); */
ResultSet rstac=stquery.executeQuery(sql1);
while(rstac.next())
{
	label1="<b>Rapid Acceleration</b><br><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstac.getDate("TheFieldDataDate"))+" "+rstac.getString("TheFieldDataTime")+"<br><b> Speed : </b>" +rstac.getString("FromSpeed")+" <b>to</b> " + rstac.getString("ToSpeed")+"(kmph)<br><b>Location : </b>"+rstac.getString("TheFieldSubject");
%> 
<script>
createMarker("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","AC",<%= rstac.getDouble("LatinDec")%>,<%= rstac.getDouble("LonginDec")%>);
</script>	
<%
ACcount++;
}
stAC.close();
%>	
<script>
document.getElementById("ra").innerHTML="<font color=\"blue\">"+<%= ACcount%>+"</font>";
</script>
<%
sql1="SELECT "+
		" rd.Thedate, rd.TheTime, rd.FromSpeed, rd.ToSpeed , veh.TheFieldDataDate,veh.TheFieldDataTime, " +
		"	       veh.TheFieldSubject , veh.LatinDec, veh.LonginDec, veh.ZoneColor,veh.Distance " +
		" FROM "+
		"(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
		"		  FROM db_gpsExceptions.t_veh"+vehcode+"_rd " +
		"			 WHERE"+
		"		   concat(TheDate,' ',TheTime)  >= '"+date1+"'" +
		"			 AND" +
		"		   concat(TheDate,' ',TheTime)<= '"+date2+"') rd "+
		" LEFT OUTER JOIN " +
		"   (SELECT LatinDec, LonginDec,Distance, TheFieldSubject, TheFieldDataDate, TheFieldDataTime, ZoneDesc AS ZoneColor " +
		" FROM db_gps.t_veh"+vehcode+"" +
		"	WHERE " +
		"   	TheFieldDataDateTime >= '"+date1+"' " +
		"	AND " +
		"		 TheFieldDataDateTime<= '"+date2+"')veh "+
		" ON(veh.TheFieldDataDate = rd.TheDate AND veh.TheFieldDataTime = rd.TheTime) " +
		" GROUP BY " +
		"	CONCAT( rd.Thedate , rd.TheTime )" +
		"ORDER BY CONCAT( rd.Thedate , rd.TheTime )";

//ResultSet rstdc=fleetview.getDCforDateRange(date1,date2,vehcode);
ResultSet rstdc = stquery.executeQuery(sql1);
while(rstdc.next())
{
	label1="<b>Rapid Deceleration</b><br> <br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstdc.getDate("TheFieldDataDate"))+" "+rstdc.getString("TheFieldDataTime")+"<br><b> Speed : </b>" +rstdc.getString("FromSpeed")+" <b>to</b> " + rstdc.getString("ToSpeed")+"(kmph)<br><b>Location : </b>"+rstdc.getString("TheFieldSubject");
%><script> 
createMarker("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","DC",<%= rstdc.getDouble("LatinDec")%>,<%= rstdc.getDouble("LonginDec")%>);	
 </script>
<%
DCcount++;	
}
%>
<script>
document.getElementById("rda").innerHTML="<font color=\"blue\">"+<%= DCcount%>+"</font>";
/******************code for stops***************/
</script>
<%
System.out.println("code for stop    ");
String stopdatetime="-",startdatetime="-",stopdatetime1="-",startdatetime1="";
int minstopdur = 0;

try
{
minstopdur = Integer.parseInt(session.getAttribute("stop11").toString());
}
catch(Exception  e)
{
sql = "select * from db_gps.t_defaultvals where ownername = 'Castrol' ";
ResultSet rsdefault = st.executeQuery(sql);
if(rsdefault.next())
{
minstopdur = rsdefault.getInt("StoppagesGreaterThanInMins");
}
}
session.setAttribute("stop11",minstopdur);

double stoplat=0,stoplon=0;
String duration="", location="";
//	sql="select * from t_veh"+vehcode+" where concat(TheFieldDataDate,' ',TheFieldDataTime) >='"+data1+" "+time1+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) <='"+data2+" "+time2+"' and TheFiledTextFileName in('SI','ST','SP') order by concat(TheFieldDataDate,TheFieldDataTime) asc ";
	
	sql="select * from db_gpsExceptions.t_veh"+vehcode+"_stsp where concat(Fromdate,' ',FromTime) >='"+data1+" "+time1+"' and concat(Fromdate,' ',FromTime) <='"+data2+" "+time2+"'  order by concat(Fromdate,FromTime) asc ";
ResultSet rstst=st.executeQuery(sql);
//	System.out.println("sql    "+sql);
	
	boolean flag=true;
	int i=1;
	while(rstst.next())
	{
	//	if(rstst.getInt("Speed")==0)
		{
		//	if(flag)
			{
				
				stopdatetime=rstst.getString("Fromdate")+" "+rstst.getString("FromTime");
				stopdatetime1=new SimpleDateFormat("dd-MMM-yyyy").format(rstst.getDate("Fromdate"))+"  "+rstst.getString("FromTime");
				duration=rstst.getString("Duration");	
				location=rstst.getString("Location");
				
				//	stoplat=rstst.getDouble("LatinDec");
			//	stoplon=rstst.getDouble("LonginDec");
				flag=false;
			//	System.out.println("duration"+duration);
			//	System.out.println("location"+location);
			}
		}
	//	else
		{
			flag=true;
			startdatetime=rstst.getString("ToDate")+" "+rstst.getString("ToTime");
			startdatetime1=new SimpleDateFormat("dd-MMM-yyyy").format(rstst.getDate("ToDate"))+"  "+rstst.getString("ToTime");
			if(!(stopdatetime.equals("-")))
			{
				java.util.Date spdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(stopdatetime);
				java.util.Date stdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startdatetime);
				
				String sql="select * from t_veh"+vehcode+" where TheFieldDataDateTime='"+stopdatetime+"'";
			//	System.out.println("Query 2:-"+sql);
				ResultSet rst123=stGPS.executeQuery(sql);
				if(rst123.next())
				{
					stoplat=rst123.getDouble("LatinDec");
					stoplon=rst123.getDouble("LonginDec");
					location=rst123.getString("TheFieldSubject");
				}
				
				String hrs=duration.substring(0,2);
				String min=duration.substring(3,5);
				
			//	System.out.println("Hrs:-"+hrs);
			//	System.out.println("Min:-"+min);
				
	//			long mils=(stdate.getTime()-spdate.getTime());
		//		long mins=mils/1000/60;
				//System.out.println("Fnnbvfgkj    ");
		//		if(mins >= minstopdur)
				{
					//System.out.println("Fnnbvfgkj    ");
				//	String hrs=""+mins/60;
				//	String min="00";
				/*	try{
					 min=""+mins%60;
					}catch(Exception ee)
					{
						min="00";
					}  */
					
					label1="<b>Stop Location</b><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Stop Date Time : </b> "+stopdatetime1+"<br><b>Start Date Time : </b>"+startdatetime1+"<br><b>Stoppage duration : </b> "+hrs+"Hrs "+min+"Min   <br><b>Location : </b>"+location;
					STcount++;
					%> 

<script>						
createMarker("<div class='bodyText' align='left'><%= label1%></div>","<div class='bodyText' align='left'><%=label1%></div>",'ST','<%=stoplat%>','<%=stoplon%>');							
</script>
					<%
					stopdatetime="-";
					stoplat=0;stoplon=0;
				}
			}
		}
	}

%>
<script>
//alert(<%=STcount%>);
document.getElementById("st").innerHTML="<font color=\"blue\">"+<%=STcount%>+"</font>";
</script>
<% 
try{
   sql5 = "Select "+
       "VehRegNo, OffTimeFrom, OffTimeTo, FromLatitude, FromLongitude, FromLocation, Duration, Distance "+
       "FROM "+
       "db_gps.t_disconnectionData "+
       "WHERE "+
       "OffTimeFrom >= '"+date1+"'  "+
       "AND OffTimeTo<='"+date2+"' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30:00'"+
       "AND vehicleCode = '"+vehcode+"' "+
       "ORDER BY OffTimeFrom";
   System.out.println(sql5);
   ResultSet rstdisconn = stDisconn.executeQuery(sql5);
   DisconnCount=0;
   while (rstdisconn.next())
   {
	   label1="<b>Disconnection Location</b><br> <br><b>VehRegNo : </b>"+vehRegNo+"<br><b>From Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(rstdisconn.getDate("OffTimeFrom"))+"<br><b>To Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(rstdisconn.getDate("OffTimeTo"))+"<br><b> Duration : </b>" +rstdisconn.getString("Duration")+"<br><b> Distance : </b>" +rstdisconn.getDouble("Distance")+"<br><b>Location : </b>"+rstdisconn.getString("FromLocation");
	   DisconnCount++;
 %> <script>
		createMarker("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>",'Disconn',<%= rstdisconn.getDouble("FromLatitude")%>,<%= rstdisconn.getDouble("FromLongitude")%>);
	</script>	
<%
   }
   System.out.println("Discc  Count :- "+DisconnCount);
%><script>
document.getElementById("Disconn").innerHTML="<font color=\"blue\">"+<%=DisconnCount%>+"</font>";
</script>
<%



}
catch(Exception e)
{
e.printStackTrace();
System.out.println("Exception ------767687----> "+   e);
}

try{
   sql6 = "select *  from db_gps.t_warehousedata where owner='"+session.getAttribute("usertypevalue")+"' "
		   +"and Latitude !='0' and Longitude !='0' and  Status='Active';";
  System.out.println("SQL 6:-"+sql6);
   ResultSet rstdisconn = stDisconn.executeQuery(sql6);
   
   while (rstdisconn.next())
   {
	   float LatGeo = rstdisconn.getFloat("Latitude");
	   float LongGeo = rstdisconn.getFloat("Longitude");
	   int InnerLimit = rstdisconn.getInt("InnerLimit");
	   int OuterLimit = rstdisconn.getInt("OuterLimit");
	  String WareName = rstdisconn.getString("WareHouse");
	  System.out.println("location:-"+WareName);
	  System.out.println("Latitude:-"+LatGeo);
	  System.out.println("Longitude:-"+LongGeo);
	   label1="<b>Geofence Location</b><br> <br><b>Location : </b>"+WareName+"<br><b>InnerLimit : </b>"+InnerLimit+"<br><b>OuterLimit : </b>"+OuterLimit+"<br><b>Lattitude : </b>"+LatGeo+"<br><b>Longitude : </b>"+LongGeo+"<br>";
 %> 
<script>		
createMarkerGeo("<div class='bodyText' ><%= label1%></div>","<div class='bodyText'><%= label1%></div>",<%= LatGeo%>,<%= LongGeo%>);
</script>
<%
	   
GeofenceCount++;	  
   }

%>

<script>
document.getElementById("Disconn").innerHTML="<font color=\"blue\">"+<%=DisconnCount%>+"</font>"; 
</script>
<%

}
catch(Exception e)
{
e.printStackTrace();
System.out.println("Exception ------767687----> "+   e);
}
}
}

catch(Exception ex)
{
	System.out.println("Exception ------------>  "+ex);
	ex.printStackTrace();

}
/* finally
{
	try
	{
		conn.close();	
	}catch(Exception e)
	{}
	try
	{
		conn1.close();	
	}catch(Exception e)
	{}
	try
	{
		con.close();	
	}catch(Exception e)
	{}
	try
	{
		//fleetview.closeConnection();
	}catch(Exception e)
	{}
} */
%>
<div class="modal" id="OSModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Over Speed Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_os" class="table bordered">
					<thead>
						<tr>
						<th>Sr.No.</th>
						<th>Date </th>
						<th>Time</th>
						<th>Speed</th>
						<th>Duration(Sec)</th>
						<th>Location</th>
						</tr>
					</thead>
					<tbody>
					<%
					Statement osquery= conn.createStatement();
					String sqlos="SELECT os.Duration, os.FromDate, os.FromTime, os.ToDate, os.ToTime," +
							" veh.LatinDec, veh.LonginDec, veh.TheFieldSubject, veh.Distance, os.Speed, veh.ZoneColor" +
							" FROM db_gpsExceptions.t_veh"+vehcode+"_overspeed os " +
							" LEFT OUTER JOIN (" +
							" SELECT TheFieldDataDate, TheFieldDataTime,Distance," +
							" MAX(LonginDec) AS LonginDec, MAX(LatinDec) AS LatinDec," +
							" MAX(TheFieldSubject) AS TheFieldSubject, ZoneDesc AS ZoneColor" +
							" FROM  db_gps.t_veh"+vehcode +
							" WHERE  TheFiledTextFileName= 'OS' " +
							"  and  TheFieldDataDateTime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))+"' "+
							" and TheFieldDataDateTime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2))+"' "+
							" GROUP BY TheFieldDataDateTime" +
							" ) veh ON (veh.TheFieldDataDate = os.FromDate" +
							" AND veh.TheFieldDataTime = os.FromTime)" +
							" WHERE 1=1 " +
							" AND concat(os.fromdate,' ',os.fromtime)>='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))+ "'" +
							" AND concat(os.ToDate,' ',os.ToTime)<='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2))+ "'" +
							"and (veh.TheFieldSubject is not null or veh.LatinDec is not null or veh.LonginDec is not null)  ORDER BY concat(os.FromDate,os.FromTime)";
					int i_os = 1;
					ResultSet rst_os = osquery.executeQuery(sqlos);
					while(rst_os.next()){ %>
					<tr>
					<td align="right"><%=i_os++%></td>
					<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst_os.getString("FromDate")))%></td>
					<td align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rst_os.getString("FromTime")))%></td>	
					<td align="right"><%=rst_os.getString("Speed")%></td>
					<td align="right"><%=rst_os.getString("Duration") %></td>
					<%
					String Lat=rst_os.getString("LatinDec");
				    String Lon=rst_os.getString("LonginDec");
					%>
					<td align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_os.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_os.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst_os.getString("TheFieldSubject") %></a></td>
					</tr>
					<%}%>
					</tbody>
					<tfoot>
					<tr>
						<th>Sr.No.</th>
						<th>Date </th>
						<th>Time</th>
						<th>Speed</th>
						<th>Duration(Sec)</th>
						<th>Location</th>
						</tr>
					</tfoot>
					</table>
					
					</section>
					</div>
					<div class="modal-footer">
					</div>
					</div>
					</div>
					</div>
					
					
<div class="modal" id="RAModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Rapid Acceleration Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_ra" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>Date </th>
					<th>Time</th>
					<th>From Speed</th>
					<th>To Speed</th>
					<th>Location</th>
					</tr>
					</thead>
					<tbody>
					<%
					int i_ra = 1;
					Statement stra = conn.createStatement();
					String sqlra = "SELECT "+
							" ra.Thedate, ra.TheTime, ra.FromSpeed, ra.ToSpeed , veh.TheFieldDataDate,veh.TheFieldDataTime, " +
							"	       veh.TheFieldSubject ,veh.LatinDec, veh.LonginDec, veh.ZoneColor,veh.Distance " +
							" FROM "+
							"(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
							"		  FROM db_gpsExceptions.t_veh"+vehcode+"_ra" +
							"			 WHERE"+
							"		   concat(TheDate,' ',TheTime)  >= '"+date1+"'" +
							"			 AND" +
							"		   concat(TheDate,' ',TheTime)<= '"+date2+"') ra"+
							" LEFT OUTER JOIN " +
							"   (SELECT LatinDec, LonginDec,Distance, TheFieldSubject,TheFieldDataDate,TheFieldDataTime,ZoneDesc AS ZoneColor " +
							" FROM db_gps.t_veh"+vehcode+"" +
							"	WHERE" +
							"   	TheFieldDataDateTime >= '"+date1+"' " +
							"	AND" +
							"		 TheFieldDataDateTime<= '"+date2+"')veh "+
							" ON(veh.TheFieldDataDate = ra.TheDate AND veh.TheFieldDataTime = ra.TheTime) " +
							" GROUP BY " +
							"	CONCAT( ra.Thedate , ra.TheTime )" +
							"ORDER BY CONCAT( ra.Thedate , ra.TheTime )";
								
						ResultSet rst_ra = 	stra.executeQuery(sqlra);
						while(rst_ra.next()){%>
							<tr>
							<td align="right"><%=i_ra++%></td>
							<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst_ra.getString("TheDate")))%></td>
							<td align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rst_ra.getString("TheTime"))) %></td>
							<td align="right"><%=rst_ra.getString("FromSpeed")%></td>
							<td align="right"><%=rst_ra.getString("ToSpeed")%></td>
							<%
							String Lat=rst_ra.getString("LatinDec");
						    String Lon=rst_ra.getString("LonginDec"); 
							%>
							<td align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_ra.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_ra.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst_ra.getString("TheFieldSubject") %></a>
							</tr>
						<%}
					%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>Date </th>
					<th>Time</th>
					<th>From Speed</th>
					<th>To Speed</th>
					<th>Location</th>
					</tr>
					</tfoot>
					</table>
					</section>
					</div>
		</div>
		</div>
		</div>	
		
<div class="modal" id="RDModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Rapid De-Acceleration Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_rd" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>Date </th>
					<th>Time</th>
					<th>From Speed</th>
					<th>To Speed</th>
					<th>Location</th>
					</tr>
					</thead>
					<tbody>
					<%
					int i_rd = 1;
					Statement strd = conn.createStatement();
					String sqlrd = "SELECT "+
							" rd.Thedate, rd.TheTime, rd.FromSpeed, rd.ToSpeed , veh.TheFieldDataDate,veh.TheFieldDataTime, " +
							"	       veh.TheFieldSubject , veh.LatinDec, veh.LonginDec, veh.ZoneColor,veh.Distance " +
							" FROM "+
							"(SELECT Thedate, TheTime, FromSpeed, ToSpeed"+
							"		  FROM db_gpsExceptions.t_veh"+vehcode+"_rd " +
							"			 WHERE"+
							"		   concat(TheDate,' ',TheTime)  >= '"+date1+"'" +
							"			 AND" +
							"		   concat(TheDate,' ',TheTime)<= '"+date2+"') rd "+
							" LEFT OUTER JOIN " +
							"   (SELECT LatinDec, LonginDec,Distance, TheFieldSubject, TheFieldDataDate, TheFieldDataTime, ZoneDesc AS ZoneColor " +
							" FROM db_gps.t_veh"+vehcode+"" +
							"	WHERE " +
							"   	TheFieldDataDateTime >= '"+date1+"' " +
							"	AND " +
							"		 TheFieldDataDateTime<= '"+date2+"')veh "+
							" ON(veh.TheFieldDataDate = rd.TheDate AND veh.TheFieldDataTime = rd.TheTime) " +
							" GROUP BY " +
							"	CONCAT( rd.Thedate , rd.TheTime )" +
							"ORDER BY CONCAT( rd.Thedate , rd.TheTime )";
								
						ResultSet rst_rd = 	strd.executeQuery(sqlrd);
						while(rst_rd.next()){%>
							<tr>
							<td align="right"><%=i_rd++%></td>
							<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst_rd.getString("TheDate")))%></td>
							<td align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rst_rd.getString("TheTime"))) %></td>
							<td align="right"><%=rst_rd.getString("FromSpeed")%></td>
							<td align="right"><%=rst_rd.getString("ToSpeed")%></td>
							<%
							String Lat=rst_rd.getString("LatinDec");
						    String Lon=rst_rd.getString("LonginDec"); 
							%>
							<td align="left"><a href="shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_rd.getString("TheFieldSubject")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat%>&long=<%=Lon%>&discription=<%=rst_rd.getString("TheFieldSubject")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst_rd.getString("TheFieldSubject") %></a>
							</tr>
						<%}
					%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>Date </th>
					<th>Time</th>
					<th>From Speed</th>
					<th>To Speed</th>
					<th>Location</th>
					</tr>
					</tfoot>
					</table>
					</section>
					</div>
		</div>
		</div>
		</div>	

<div class="modal" id="StopModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Stop Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_stp" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>From Date time </th>
					<th>To Date time</th>
					<th>Duration</th>
					<th>Location</th>
					</tr>
					</thead>
					<tbody>
					<%
					int i_stp = 1;
					Statement stp = conn.createStatement();
					String stopdatefrom="-",stopdateto="-";
					String duration="";
					
					
					
					java.util.Date spdate=null,stdate=null;
					String sqlstp = "select * from db_gpsExceptions.t_veh"+vehcode+"_stsp where  CONCAT( Fromdate,' ',FromTime ) >='"+date1+"' and CONCAT( Fromdate,' ',FromTime ) <='"+date2+"' order by Fromdate, FromTime asc";
						ResultSet rst_stp = 	stp.executeQuery(sqlstp);
						while(rst_stp.next()){
							double lat1=0;
							double lon1=0;
							String disc="";
							
							stopdatefrom=rst_stp.getString("Fromdate")+" "+rst_stp.getString("FromTime");
							stopdateto=rst_stp.getString("ToDate")+" "+rst_stp.getString("ToTime");
							duration=rst_stp.getString("Duration");
							String location=rst_stp.getString("Location");
						
							if(!(stopdatefrom.equals("-")))
							{
								spdate=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(stopdatefrom);//stopd/t
								 stdate=new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(stopdateto);//startd/t
								 
								 String sqlstop="select * from t_veh"+vehcode+" where TheFieldDataDateTime='"+stopdatefrom+"'";
									System.out.println("Query 2:-"+sqlstop);
									ResultSet rst=stGPS.executeQuery(sqlstop);
									if(rst.next())
									{
										lat1=rst.getDouble("LatinDec");
										lon1=rst.getDouble("LonginDec");
										disc=rst.getString("TheFieldSubject");
									}
									
									DecimalFormat twoDForm1 = new DecimalFormat("00");
									String spdate1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(spdate);
									String stdate1 =new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(stdate);
									
						
						%>
						
						
							<tr>
							<td align="right"><%=i_stp++%></td>
							<td align="right"><%=spdate1%></td>
							<td align="right"><%=stdate1%></td>
							<td align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(duration)) %></td>
							<td align="left"><a href="shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=disc%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=disc%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=disc%></a></td>
							</tr>
						<%}
						}
					%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>From Date time </th>
					<th>To Date time</th>
					<th>Duration</th>
					<th>Location</th>
					</tr>
					</tfoot>
					</table>
					</section>
					</div>
		</div>
		</div>
		</div>	

<div class="modal" id="DisconnModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Disconnection Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_disconn" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
					<th>Duration</th>
					<th>Distance</th>
					<th>Location</th>
					</tr>
					</thead>
					<tbody>
					<%
					int i_disc = 1;
					Statement st_disc = conn.createStatement();
					String sql_disc = "Select VehRegNo, OffTimeFrom, OffTimeTo, FromLatitude, FromLongitude, FromLocation, time_to_sec(Duration) Duration, Distance FROM db_gps.t_disconnectionData WHERE OffTimeFrom between '"+date1+"' and '"+date2+"'  and Reason = 'Disconnection' AND vehicleCode ='"+vehcode+"' and ignoredstamp='No' and Duration >= '0:30:00' ORDER BY OffTimeFrom";				
						ResultSet rst_disc = 	strd.executeQuery(sql_disc);
						while(rst_disc.next()){
							String disconnectionFromdatetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst_disc.getString("OffTimeFrom")));
							String disconnectionTodatetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst_disc.getString("OffTimeTo")));
							Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
							
							String dura = rst_disc.getString("Duration");
							
							int seconds = Integer.parseInt(dura);
							int hr = seconds/3600;
							  int rem = seconds%3600;
							  int mn = rem/60;
							  int sec = rem%60;
							  String hrStr = (hr<10 ? "0" : "")+hr;
							  String mnStr = (mn<10 ? "0" : "")+mn;
							  String secStr = (sec<10 ? "0" : "")+sec; 
							  System.out.println(hrStr+":"+mnStr+":"+secStr);
							  String dur = hrStr+":"+mnStr+":"+secStr;
							int distance = rst_disc.getInt("Distance");
							String discr="";
								 lat1=rst_disc.getDouble("FromLatitude");
								 lon1=rst_disc.getDouble("FromLongitude");
								 discr=rst_disc.getString("FromLocation");
							
							%>
							<tr>
							<td align="right"><%=i_disc++%></td>
							<td align="right"><%=disconnectionFromdatetime%></td>
							<td align="right"><%=disconnectionTodatetime%></td>
							<td align="right"><%=dur%></td>
							<td align="right"><%=distance%></td>
							<td align="left"><a href="shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=discr%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=discr%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=discr%></a></td>							</tr>
						<%}
					%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
					<th>Duration</th>
					<th>Distance</th>
					<th>Location</th>
					</tr>
					</tfoot>
					</table>
					</section>
					</div>
		</div>
		</div>
		</div>	

			
					
<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example_os').DataTable({
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
								title: 'OS Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'OS Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'OS Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'OS Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'OS Report for <%=vehRegNo%>',
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
            dt_basic = $('#example_ra').DataTable({
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
								title: 'RA Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'RA Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'RA Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'RA Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'RA Report for <%=vehRegNo%>',
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
            dt_basic = $('#example_rd').DataTable({
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
								title: 'RD Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'RD Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'RD Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'RD Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'RD Report for <%=vehRegNo%>',
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
            dt_basic = $('#example_stp').DataTable({
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
								title: 'Stop Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Stop Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Stop Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Stop Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Stop Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
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
            dt_basic = $('#example_disconn').DataTable({
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
								title: 'Disconnection Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Disconnection Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Disconnection Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Disconnection Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4,5] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Disconnection Report for <%=vehRegNo%>',
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