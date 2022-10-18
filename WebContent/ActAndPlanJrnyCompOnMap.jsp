<%@ include file="headernew2.jsp" %>
	<%@ page import="kml.KML1" %>
	<%classes fleetview=new classes(); 
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);%>
<%@page import="com.fleetview.beans.classes"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<style type="text/css">
								#map {
									width: 100%;
									height: 800px;
									border: 1px solid black;
									float: left;
								}
</style>

<script src="js/datatable/moment.js"></script>
<link rel="stylesheet" href="css/table/jquery-ui.css">
<script src="js/datatable/jquery-ui.js"></script>

<link rel="stylesheet" href= "OpenLayers-6.9/libs/v6.9.0-dist/ol.css">
<script src="OpenLayers-6.9/libs/v6.9.0-dist/ol.js"></script>

<script src="js/TripMap.js"></script>
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
try
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
	{
		if(ajaxRequest.readyState == 4)
                {
                	var reslt=ajaxRequest.responseText;
                	//alert(reslt);
                	var rsnew = reslt.split("$");
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
	//alert("Veh Code"+p);
ajaxRequest.open("GET", "ViolationReport.jsp?para=RDA&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==4)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
	//alert("Veh Code"+p);
ajaxRequest.open("GET", "ViolationRep_Stop.jsp?&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==5)
{
	var p=document.getElementById("vehcode").value;
	var p1=document.getElementById("vehRegNo1").value;
	//alert("Veh Code"+p);
ajaxRequest.open("GET","ViolationReport.jsp?para=Disconn&vehcode="+p+"&vehRegNo1="+p1, true);
}
if(xx==6)
{
ajaxRequest.open("GET","Plannedreport.jsp?para=Rest",true);
}
if(xx==7)
{
ajaxRequest.open("GET","Plannedreport.jsp?para=NH",true);
}
/*
if(xx==5)
{
ajaxRequest.open("GET", "hrst.jsp", true);
}*/
ajaxRequest.send(null); 
}
catch(e)
{
	alert(e);
}
}
</script>
</head>
<body>
<%! Connection conn,conn1,con;
Statement st,st1,st2,st3,st4,st5,stAC,stDisconn,st00,stnew,stquery;
String htmlvis1,htmlvis2,sql,sql1,sql2,sql3,sql4,sql5,sqlware,data1,data2,date1,date2,vehcode,location,Stamp,label1,html1,html2,html11,html22,d1,d2,t1,t2,time1,time2,fromtime,totime,ftime1,ftime2,ftime3,ttime1,ttime2,ttime3;
String thedate="",thedate1="",startcode="",endcode1="",startplace1="",endplace1="",thetime="",thetime1="",vehregno="",ownername="",lastlocation="",strtcode="",endcode="",startplace="",endplace="",enddate,sdate1,enddate1,stopdatetime, startdatetime,latStart="",longStart="",locationStart="",thedateStart="",thetimeStart="",firstlocation="-",location1="-";
String mydate1="",mydate2="",porigin = "",pdest = "";
String smap="",smap1="";
String gpname="",transporter="",gpname1="",ownername1="",plannedstatus = "",ConsideredLatLon="",Ship_To="", end_code="",trans="";
double lat, lat1, lon, lon1,latw,longw,latw1,longw1,lat11,lon11;
float slatitude=0,slongitude=0,elatitude=0,elongitude=0;
int show,dist,pstop = 0,pnighthalt = 0;
boolean flag1=false,flag2=false;
String tripid = "",briefid = "",driverid = "",routeid = "";
String dates1[] = null,dates2[] = null,dates[] = null;
String day[] = null;
%>
<%
    try
    {
         con = fleetview.ReturnConnection();
        // System.out.println("con   "+con);
    	st=con.createStatement();
    	stnew=con.createStatement();
    	st1 = con.createStatement();
    	st4 = con.createStatement();
    	st2 = con.createStatement();
    	st00 = con.createStatement();
    	stquery=con.createStatement();
    	
    //	System.out.println("st   "+st);
    }
    catch(Exception e)
    {
    	//System.out.println("====>error in connection");
    	e.printStackTrace();
    }
    
    html1 = "";location = "";
    lat = 0.0;lon = 0.0;
    data1 = "";data2 = "";
    tripid = request.getParameter("tripid");
    String unitid = tripid;
    briefid = request.getParameter("brifid");
    driverid=  request.getParameter("driverid");
  //  System.out.println("driverid   "+driverid);
    routeid = request.getParameter("rid");
    String fromPage=request.getParameter("pg");
    vehcode=request.getParameter("vehcode");
    
    %>
    <input type="hidden" id="vehcode" name="vehcode" size="12" value="<%= vehcode%>"/>
<% 
 //   System.out.println("tripid   "+tripid);
  //  System.out.println("briefid   "+briefid);
  //  System.out.println("rid   "+routeid);
  //  System.out.println("fromPage   "+fromPage);
  //  System.out.println("vehcode   "+vehcode);
    
    //tripid = "20100395";
    //briefid = "127667";
   // driverid = "91039626";
   // routeid = "27";
	String sql = "",startdate = "",enddate = "",daylist = "",dayquery = "";
	 plannedstatus = request.getParameter("pstatus");
	data1=request.getParameter("data");
	data2=request.getParameter("data1");
	
	System.out.println("data1--"+data1+" data2--"+data2);
	try{
	data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	data2=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@data1-->"+data1+" data2-->"+data2);
	}catch(Exception e)
	{
		//System.out.println("inside catch");
		e.printStackTrace();
		/*data1=data1;
		data2=data2;*/
	}


	mydate1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));

	mydate2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));

	ftime1=request.getParameter("ftime1");
	ftime1=String.format("%02d",Integer.parseInt(ftime1));
	ftime2=request.getParameter("ftime2");
	ftime2=String.format("%02d",Integer.parseInt(ftime2));
	ftime3=request.getParameter("ftime3");
	ftime3=String.format("%02d",Integer.parseInt(ftime3));
	
	ttime1=request.getParameter("ttime1");
	ttime1=String.format("%02d",Integer.parseInt(ttime1));
	ttime2=request.getParameter("ttime2");
	ttime2=String.format("%02d",Integer.parseInt(ttime2));
	ttime3=request.getParameter("ttime3");
	ttime3=String.format("%02d",Integer.parseInt(ttime3));

	time1=ftime1+":"+ftime2+":"+ftime3;
	//time1=new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("data")));
	time2=ttime1+":"+ttime2+":"+ttime3;

	// set the values in  session-----------------

	//System.out.println("Setting session variables");
	session.setAttribute("hdate1",data1);
	session.setAttribute("hdate2",data2);
	session.setAttribute("fff",time1);
	session.setAttribute("ttt",time2);
	session.setAttribute("hvid",vehcode);
	session.setAttribute("tripid",tripid);
	session.setAttribute("briefid",briefid);
	session.setAttribute("driverid",driverid);
	session.setAttribute("routeid",routeid);

	//---------------------------------------------

	//time1=request.getParameter("fromtime");
	//System.out.println("time1->" +time1);
	//time2=request.getParameter("totime");
	//System.out.println("time2->" +time2);
	try
	{
	     con = fleetview.ReturnConnection();
		st=con.createStatement();
		
	}
	catch(Exception e)
	{
		//System.out.println("====>error in connection");
		e.printStackTrace();
	}
	String vehreg="";
	String sqlvehreg="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
	ResultSet rstveh=st.executeQuery(sqlvehreg);
	if(rstveh.next())
	{
		vehreg=rstveh.getString("VehicleRegNumber");
		//System.out.println("VehicleRegNumber====>");
	}
	%>
	<input type="hidden" id ="vehRegNo1" name="vehRegNo1" size="12" value="<%=vehreg%>"/>
	<% 
	String n="null";

	if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)) && !("drivrating".equalsIgnoreCase(fromPage)))
	{
		String sqltrp="select * from t_startedjourney where TripID='"+tripid+"'";
		ResultSet rstrp=st.executeQuery(sqltrp);
		System.out.println("\n\n started journey query-->>"+sqltrp);
		if(rstrp.next())
		{
			startplace1=rstrp.getString("StartPlace");
		//	System.out.println("\n\n start place-->>"+startplace1);
			endplace1=rstrp.getString("EndPlace");
		//	System.out.println("\n\n end place-->>"+endplace1);
			strtcode=rstrp.getString("StartCode");
			endcode=rstrp.getString("EndCode");
			gpname=rstrp.getString("GPName");
			//System.out.println("\n\n start code-->>"+strtcode);
		//	System.out.println("\n\n end code-->>"+endcode);
			transporter=rstrp.getString("OwnerName");
			System.out.println("\n\n transporter-->>"+transporter);
			ConsideredLatLon =rstrp.getString("ConsideredLatLon");
			 System.out.println("value of ConsideredLatLon---->>"+ConsideredLatLon);
			 Ship_To=rstrp.getString("Ship_To");//EndCode
			 System.out.println("value of Ship_To--> "+Ship_To);
			 end_code=rstrp.getString("EndCode");
			 System.out.println("value of end_code--> "+end_code);
		}
		
		/*sqltrp = "select Placename from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'  order by advancedtrackid asc ,row asc limit 1";
		rstrp = st.executeQuery(sqltrp);
		if(rstrp.next())
		{
			porigin = rstrp.getString("Placename");
		}
		sqltrp = "select Placename from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'  order by advancedtrackid desc ,row desc limit 1";
		rstrp = st.executeQuery(sqltrp);
		if(rstrp.next())
		{
			pdest = rstrp.getString("Placename");
		}*/
		
		 sqltrp="select * from t_warehousedata where WareHouseCode='"+strtcode+"' AND (Owner='"+transporter+"' or Owner='"+gpname+"')";
		 rstrp=st.executeQuery(sqltrp);
	       System.out.println("\n\nwarehouse strtwali query-->>"+sqltrp);
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
		//	 System.out.println("\n\n from warehouse lat strt-->>"+slatitude);
		//	 System.out.println("\n\n from warehouse long strt-->>"+slongitude);
		 }
		 else
		 {
			 String sqlc="select * from t_castrolroutes where StartCode='"+strtcode+"' AND Owner='"+gpname+"'";
				ResultSet rec=st.executeQuery(sqlc);
				 System.out.println("\n\ncastrolroutes strtwali query-->>"+sqlc);
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
		 if(ConsideredLatLon.equalsIgnoreCase("shiptocode"))
		 {
			
			 endcode=Ship_To;
			 System.out.println("value of endcode in if block"+ endcode);
			 System.out.println("value of Ship_To in if block"+ Ship_To);
		 }
		 else
		 {
			 endcode=end_code;
			 System.out.println("value of endcode in else block"+ endcode);
			 System.out.println("value of Ship_To in else block"+ end_code);
		 }	 
		 sqltrp="select * from t_warehousedata where WareHouseCode='"+endcode+"' AND (Owner='"+transporter+"' or Owner='"+gpname+"')";
		  System.out.println("\n\nwarehouse for endcode***********-->>"+sqltrp);
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
			 // System.out.println("\n\n from warehouse lat end-->>"+elatitude);
			 // System.out.println("\n\n from warehouse long end-->>"+elongitude);
		
		 }
		 else
		 {
			 String sqlc="select * from t_castrolroutes where EndCode='"+endcode+"' AND Owner='"+gpname+"'";
				ResultSet rec=st.executeQuery(sqlc);
				 System.out.println("\n\ncastrolroutes for endcode********-->>"+sqlc);
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
				
				
					 // System.out.println("\n\n from castrolroutes lat end-->>"+elatitude);
					 // System.out.println("\n\n from castrolroutes long end-->>"+elongitude);
				}
		 
			 
		 }
		
	}
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
												<%
				if("0".equalsIgnoreCase(vehcode))
				{ %> </div>
					</div>
				<%}//end if
				else  if(!(tripid.equals("null") && null==tripid))
				{	
				%>
					<h4>The Trip Report for Vehicle Reg. No.<%=vehreg %> From Date <%=mydate1 %> To <%=mydate2 %></h4>
					</div>
					</div>
					<%
				}//end if
				
				else
				{ %>
				</div>
				</div> 
					<form name="customdetail" method="get" action="" >
					<input type="hidden" id="vehcode" name="vehcode" size="12" value="<%= vehcode%>"/>
	 						<input type="hidden" id ="tripid" name="tripid" size="12" value="<%=tripid%>"/>
	 						<input type="hidden" id ="briefid" name="briefid" size="12" value="<%=briefid%>"/>
	 						<input type="hidden" id ="drivid" name="drivid" size="12" value="<%=driverid%>"/>
	 						<input type="hidden" id ="rid" name="rid" size="12" value="<%=routeid%>"/>
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
				<%}
				%>
				</div>
				
										<div class="content-header-right text-md-end col-md-3 col-12 d-md-block d-none">
												<div class="mb-1 breadcrumb-right">
													<div class="demo-inline-spacing mb-1" >
														<button class="btn btn-danger" onclick="history.back()">Back</button>
										
													  </div>
												</div>
											</div>
											</div>
											<div class="content-body">
				<div class="row mt-2">
					<div class="col-md-3">
						<ul class="list-group ">
						<%
			if(plannedstatus.equalsIgnoreCase("Yes"))
			{ %>
				<li class="list-group-item"><img src="newimages/Green_Line.png" style="height: 3px;width: 100px;" align="left">Planned Journey</li>
				<li class="list-group-item"><img src="newimages/Blue_Line.png" style="height: 3px;width: 100px;" align="left">Actual Journey</li>
			<%}%>
				<li class="list-group-item"><img src="images/mm_20_green.png">&nbsp;&nbsp;Last </li>
				<li class="list-group-item"><img src="images/mm_20_black.png">&nbsp;&nbsp;Start </li>
				<%
			    if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)) && !("drivrating".equalsIgnoreCase(fromPage)))
			    {
			    if(flag1==true)
			    {
			    %>
			    <li class="list-group-item"><img src="images/mm_20_purple.png">&nbsp;&nbsp;Trip Origin: <span><%=startplace1%></span></li>
			    <%}
			    else
			    { %>
			    <li class="list-group-item"><img src="images/mm_20_purple.png">&nbsp;&nbsp;Trip Origin: <span>Not Geo-fenced</span></li>
			    <%}
			    if(flag2==true)
			    {%>
			    <li class="list-group-item"><img src="images/mm_20_brown.png">&nbsp;&nbsp;Trip Destination: <span><%=endplace1%></span></li>
					<%}else{
					%>
					<li class="list-group-item"><img src="images/mm_20_brown.png">&nbsp;&nbsp;Trip Destination: <span>Not Geo-fenced</span></li>
					<%}
					}
					if(!("0".equalsIgnoreCase(vehcode))){ %>		
							<li class="list-group-item"><img src="images/mm_20_red.png">&nbsp;&nbsp;OverSpeed&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#OSModal"><span id="os"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_blue.png">&nbsp;&nbsp;Rapid Accelaration&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#RAModal" ><span id="ra"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_yellow.png">&nbsp;&nbsp;Rapid Decelaration&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#RDModal" ><span id="rda"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_white.png">&nbsp;&nbsp;Stop &nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#StopModal"><span id="st"></span></a></li>
							<li class="list-group-item"><img src="images/mm_20_grey.png">&nbsp;&nbsp;Disconnection &nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#DisconnModal" ><span id="Disconn"></span></a></li>
						<%}%>
						<%if(plannedstatus.equalsIgnoreCase("Yes")){
				%>
				<li class="list-group-item"><img src="newimages/source.png" style="width: 20px;height: 20px;"  align="left">&nbsp;&nbsp;Planned Trip Origin</li>
				<li class="list-group-item"><img src="newimages/dest.png" style="width: 20px;height: 20px;"  align="left">&nbsp;&nbsp;Planned Trip Destination</li>
				<li class="list-group-item"><img src="newimages/tea.png" style="width: 20px;height: 20px;"  align="left">&nbsp;&nbsp;Planned Stops &nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#PlStopModal" ><span id="pst"></span></a></li>
				<li class="list-group-item"><img src="newimages/moon.png" style="width: 20px;height: 20px;"  align="left">&nbsp;&nbsp;Planned Night Halts&nbsp;&nbsp;<a data-bs-toggle="modal" data-bs-target="#PlNightModal" ><span id="pnh"></span></a></li>
				<%}%>
						</ul>
						    	 <%
    	 try
    	 {
    	 	conn = fleetview.ReturnConnection();
    	 	st=conn.createStatement();
    	 	st1=conn.createStatement();
    	 	st3=conn.createStatement();
    	 	st2=conn.createStatement();
    	 	st5=conn.createStatement();
    	 	stDisconn=conn.createStatement();
    	 	Class.forName(MM_dbConn_DRIVER); 
    	 	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    	 	stAC=conn1.createStatement();
    	 	
    	 	    	 }
    	 catch(Exception e)
    	 {
    	 	out.print("Exception "+e);
    	 }
    	 String wareHouseCode="-",wareHouse="-",owner="-",html1=null,wtype="-",PolygonCoordinates="-";
    	 String rfname=session.getAttribute("rfname").toString(); //user name  //.setAttribute("rfname",fnamelist);
    	 String rlname=session.getAttribute("rlname").toString();
    	 String getCordiantesSql="",getCordiantesSql1="";
    	 ResultSet rs2=null,rs22=null; 
    	 String vehRegNo="";
    	 String strtplace="", endplace="", strtLat="",endLat="",strtLong="",endLong="",strtcode="",endcode="",stCodeList="(",endCodeList="(";
    	 String dcode = "";
    	 String sql11="",sql12 ="";
	  	 ResultSet rst12 = null,rst = null,rst11 = null;
	  	 String color="ff0BA903"; //green
  		 String color1 = "ffF4070B";//red


    	 if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)) && !("drivrating".equalsIgnoreCase(fromPage)))
    	 {
    	 	String sqltrp="select * from t_startedjourney where TripID='"+tripid+"'";
    	 	ResultSet rstrp=st.executeQuery(sqltrp);
    	 	// System.out.println("started journey querry--------->"  +sqltrp);
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
    	 			
    	 				//System.out.println("getCordiantesSql"+getCordiantesSql);
    	 				 rs2 = st2.executeQuery(getCordiantesSql);
    	 				 rs22 = st3.executeQuery(getCordiantesSql1);
    	 	}	
    	 %>
						<div class="row  mt-2">
							<div id="showT">
								<table class="table table-bordered table-striped  table-sm "
									style="width: 100%;">
									<% 
									String stamp;
			  if("0".equalsIgnoreCase(vehcode)){
					%>
					<tr style="width: 20px;">
						<th>UnitId:</th>
						<td><%=unitid%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Journey Start date :</th>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time1))%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Journey End date :</th>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time2))%></td>
					</tr>
					<%
				}
				else{
					sql="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
					System.out.println("vehcode   "+vehcode);
					ResultSet rstx=st.executeQuery(sql);
					if(rstx.next())
					{
						
						vehRegNo=rstx.getString("VehicleRegNumber");
						trans=rstx.getString("OwnerName");
					Format NewFormatter3 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
					if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode)))
					{
					%>
					<tr style="width: 20px;">
						<th>Trip ID :</th>
						<td><%=tripid%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Vehicle Reg. No:</th>
						<td><%=rstx.getString("VehicleRegNumber")%></td>
					</tr>
					<%}else
					{ %>
					<tr style="width: 20px;">
						<th>Vehicle Reg. No:</th>
						<td><%=rstx.getString("VehicleRegNumber")%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Transporter:</th>
						<td><%=rstx.getString("OwnerName")%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Journey Start date :</th>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time1))%></td>
					</tr>
					<tr style="width: 20px;">
						<th>Journey End date :</th>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time2))%></td>
					</tr>
					<%}
					session.setAttribute("hvrno",rstx.getString("VehicleRegNumber"));
					}
					}
					if("0".equalsIgnoreCase(vehcode)){
						sql="SELECT Min(Distance) as startdist,Max(Distance) as enddist,TheFiledTextFileName as stamp from t_veh"+vehcode+" where unitid= '"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN ('SI','OF','ST','SP')";
					}
					else{
						sql="SELECT Min(Distance) as startdist,Max(Distance) as enddist,TheFiledTextFileName as stamp from t_veh"+vehcode+" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName IN ('SI','OF','ST','SP')";
					}
				System.out.println("Distance sql:"+sql);
				ResultSet rst2=st3.executeQuery(sql);
				if(rst2.next())
				{
					int startDist=0;
					int endDist=0;
					startDist=rst2.getInt("startdist");
					endDist=rst2.getInt("enddist");
					dist=endDist-startDist;
					stamp=rst2.getString("stamp");
					if(dist > 0)
					{
					%>
					<tr style="width: 20px;">
						<th>Total Distance Travelled:</th>
						<td><%=dist%> km.</td>
					</tr>
					<%
					} 
					else
					{
						//do nothing
					}
				}%>
			  </table>
			  </div>
			  </div>
			<div class="row mt-2" id="side_bar1"></div></div>
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
					<%
					try{
					try{

			    		HashMap<String, String> coordinateMap = null;
						HashMap<String, String> coordinateMapStart = null;
						HashMap<String, String> coordinateMapEnd = null;
						List<HashMap<String, String>> coordinateList = null;
						  
						HashMap<String, String> actualcoordinateMap = null;
						HashMap<String, String> actualcoordinateMapStart = null;
						HashMap<String, String> actualcoordinateMapEnd = null;
						List<HashMap<String, String>> actualcoordinateList = null;    
						coordinateList=new ArrayList<HashMap<String, String>>();
						actualcoordinateList =new ArrayList<HashMap<String, String>>();
						
						if(plannedstatus.equalsIgnoreCase("Yes"))
						{
						sql12 = "select Placename,latitude,longitude,CumTime from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'   order by advancedtrackid asc ,row asc limit 1";
						rst12=stDisconn.executeQuery(sql12);
					//	System.out.println("sql last loc====>"+sql12);
						if(rst12.next())
						{
							//System.out.println("*****   1st location");
							//mydate1 = rst12.getString("CumTime");
							
						    coordinateMapStart =  new java.util.HashMap<String, String>();
							coordinateMapStart.put("name",rst12.getString("Placename"));
							coordinateMapStart.put("desc", rst12.getString("Placename"));
							coordinateMapStart.put("lat",rst12.getString("latitude")); 
							coordinateMapStart.put("longi",rst12.getString("longitude"));  
						}
						sql1 = "select Placename,latitude,longitude from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'     order by advancedtrackid asc,row asc ";
						rst=stDisconn.executeQuery(sql1);
						while(rst.next())
						{ /**********record is added for- if no data then it will not come in while loop and willnot get ++ then not to show start point*************/
							
							coordinateMap =  new java.util.HashMap<String, String>();
						    coordinateMap.put("name",rst.getString("Placename"));
						    coordinateMap.put("desc", rst.getString("Placename"));
						    coordinateMap.put("lat",rst.getString("latitude")); 
						    coordinateMap.put("longi",rst.getString("longitude"));                         
						    coordinateList.add(coordinateMap);
//						      System.out.println("Coordlist----------"+coordinateMap.get("lat")+","+coordinateMap.get("longi"));
						}
						
						sql11 = "select Placename,latitude,longitude,CumTime from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'   order by advancedtrackid desc ,row desc limit 1";		
						rst11=stDisconn.executeQuery(sql11);
					//	System.out.println("rst11====>"+sql11);
						if(rst11.next())
						{
							//System.out.println("*****   Last location");
							//System.out.println("1038 Hii");
							mydate2 = rst11.getString("CumTime");
						    coordinateMapEnd =  new java.util.HashMap<String, String>();
						    coordinateMapEnd.put("name",rst11.getString("Placename"));
						    coordinateMapEnd.put("desc", rst11.getString("Placename"));
						    coordinateMapEnd.put("lat",rst11.getString("latitude")); 
						    coordinateMapEnd.put("longi",rst11.getString("longitude"));   
						}	
						}
						boolean flag=true;
						boolean flag0=false;
						//sql1 = "select TheFieldSubject,LatinDec,LonginDec  from db_gps.t_veh"+vehcode+" where Thefielddatadatetime >= '"+dates1[i]+"' and Thefielddatadatetime <= '"+dates2[i]+"' and TheFiledTextFileName  NOT IN('AC','DC','OS') and  thefielddatadatetime <> 'NULL'  and TheFieldSubject in (select distinct(TheFieldSubject)  from db_gps.t_veh"+vehcode+" where Thefielddatadatetime >= '"+dates1[i]+"' and Thefielddatadatetime <= '"+dates2[i]+"' and  thefielddatadatetime <> 'NULL'  and TheFiledTextFileName  NOT IN('AC','DC','OS')) order by  Thefielddatadatetime";
						//sql1 = "select TheFieldSubject,LatinDec,LonginDec,Speed  from db_gps.t_veh"+vehcode+" where Thefielddatadatetime >= '"+dates1[i]+"' and Thefielddatadatetime <= '"+dates2[i]+"' and TheFiledTextFileName  NOT IN('AC','DC','OS') and  thefielddatadatetime <> 'NULL'   order by  Thefielddatadatetime";
					
						if("0".equalsIgnoreCase(vehcode))
						{
					 		sql1="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"'  and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD')  and  thefielddatadatetime <> 'NULL' order by TheFieldDataDateTime asc";
						}				
						else
						{
							sql1="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"'  and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD')  and  thefielddatadatetime <> 'NULL' order by TheFieldDataDateTime asc";
						}
						
						rst=stDisconn.executeQuery(sql1);
						 System.out.println("sql1 "+sql1);
						 while(rst.next())
						 {
							 actualcoordinateMap =  new java.util.HashMap<String, String>();
							 if(rst.getInt("Speed")==0)
							{
								 if(flag)
								{
									actualcoordinateMap.put("name",rst.getString("TheFieldSubject"));
									actualcoordinateMap.put("desc", rst.getString("TheFieldSubject"));
									actualcoordinateMap.put("lat",rst.getString("LatinDec")); 
									actualcoordinateMap.put("longi",rst.getString("LonginDec"));   
									actualcoordinateList.add(actualcoordinateMap);
									 flag=false;
									 flag0=true;
								}
								if(flag0){
									 actualcoordinateMap.put("name",rst.getString("TheFieldSubject"));
										actualcoordinateMap.put("desc", rst.getString("TheFieldSubject"));
										actualcoordinateMap.put("lat",rst.getString("LatinDec")); 
										actualcoordinateMap.put("longi",rst.getString("LonginDec"));   
										actualcoordinateList.add(actualcoordinateMap);
									//	 flag=false;
										 flag0=true;
										}
							}
							 else
							 {
								 flag=true;
								 actualcoordinateMap.put("name",rst.getString("TheFieldSubject"));
								 actualcoordinateMap.put("desc", rst.getString("TheFieldSubject"));
								 actualcoordinateMap.put("lat",rst.getString("LatinDec")); 
								 actualcoordinateMap.put("longi",rst.getString("LonginDec"));   
								 actualcoordinateList.add(actualcoordinateMap);
							 }
							 ///System.out.println("****   ");
							
							
						 }
						 
						 if("0".equalsIgnoreCase(vehcode))
						 {
							 sql1="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD')  and  thefielddatadatetime <> 'NULL'  order by TheFieldDataDateTime asc";
						 }   
						else
						{
							sql1="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD')  and  thefielddatadatetime <> 'NULL'  order by TheFieldDataDateTime asc";
						}	
						 rst=stDisconn.executeQuery(sql1);
						 System.out.println("sql1-2:   "+sql1);
						 if(rst.next())
						 {
							 actualcoordinateMapStart =  new java.util.HashMap<String, String>();
							 actualcoordinateMapStart.put("name",rst.getString("TheFieldSubject"));
							 actualcoordinateMapStart.put("desc", rst.getString("TheFieldSubject"));
							 actualcoordinateMapStart.put("lat",rst.getString("LatinDec")); 
							 actualcoordinateMapStart.put("longi",rst.getString("LonginDec"));  
						 }
						 
						 if("0".equalsIgnoreCase(vehcode))
						 {
							 sql1="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime desc";
						 }else{
							sql1="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime desc";
						 }
						rst=stDisconn.executeQuery(sql1);
						 System.out.println("sql1-3   "+sql1);
						 
						 if(rst.next())
						 {
							 actualcoordinateMapEnd =  new java.util.HashMap<String, String>();
							 actualcoordinateMapEnd.put("name",rst.getString("TheFieldSubject"));
							 actualcoordinateMapEnd.put("desc", rst.getString("TheFieldSubject"));
							 actualcoordinateMapEnd.put("lat",rst.getString("LatinDec")); 
							 actualcoordinateMapEnd.put("longi",rst.getString("LonginDec"));  
						 }
						 
						 if(plannedstatus.equalsIgnoreCase("Yes"))
							{
						String dir=request.getRealPath("/");
						dir=dir+"KML/"+"kml_"+tripid+"_"+briefid+".kml";	
						//KML1 kml=new KML1();
						flag1=KML1.generateKMLFORLINE(coordinateList,dir,coordinateMapStart,coordinateMapEnd,color);
						System.out.println("flag1:"+flag1);
						%>
						<script>
						//var date1 = < %=mydate1%>;
						//var date2 = < %=mydate2%>;
						//alert("date1   "+date1);
						//alert("date2   "+date2);
						var filename="<%=tripid%>_<%=briefid%>";
						
						var url="KML/kml_"+filename+".kml?date="+new Date().getTime();
						loadKML(url);	
						</script>
						<%	
							}
						
						 String kmlfile = "";
							if(tripid == null || tripid.equals("")||tripid.equals("-")||tripid.equalsIgnoreCase("null"))
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
							   System.out.println("kmlfile---------------->"  +kmlfile);
							 //  kmlfile = "yes";
							   
							}
						String dir1 = request.getRealPath("/");
						dir1 = dir1+"KML/"+"actkml_"+tripid+"_"+briefid+".kml";
						//KML1 kml1=new KML1();
						flag1 = false;
						try
						{
						flag1=KML1.generateKMLFORLINE(actualcoordinateList,dir1,actualcoordinateMapStart,actualcoordinateMapEnd,color1);
						System.out.println("flag1:"+flag1);
						}
						catch(Exception e)
						{
							System.out.println("Exception-  generating actual KML-->    "+e);
						}
						%>
						<script>
						 var kmlfile1 = "<%=kmlfile%>";

					      if(kmlfile1 == ""||kmlfile1=="-")
					      { }
					      else
					      {
					   	  	 loadKML("KMLJRM/"+kmlfile1);
					   	  /*loadKML("KMLJRM/FullJRMFilenew.kml");
					   		loadKML("KMLJRM/CastrolNorthernRegion1KmStreach.kml");
							loadKML("KMLJRM/Delhi-Patalganga1Zone.kml");
							loadKML("KMLJRM/Bhivandi-Patalganga-BangloreKmStreach.kml");
							loadKML("KMLJRM/Bhivandi-Patalganga-Banglore-Chennai1Zone.kml");
							loadKML("KMLJRM/Bhivandi-Patalganga-Hydrabad1KmStreach.kml");
							loadKML("KMLJRM/Bhivandi-Patalganga-Hydrabad-Chennai1Zone.kml");
							loadKML("KMLJRM/Chennai-Pallakad1Zone.kml");
							loadKML("KMLJRM/Kolkata-Guwahati1KmStreach.kml");
							loadKML("KMLJRM/Kolkata-Kanpur-Lucknow1KmStreach.kml");
							loadKML("KMLJRM/Bhivandi-Dhule1KmStreach.kml");
							loadKML("KMLJRM/Bhivandi-Nagpur1Zone.kml");
							loadKML("KMLJRM/tankerEast.kml");	
							loadKML("KMLJRM/tankerWest.kml");*/
					    	 // loadKML("/usr/share/tomcat6/webapps/images1/kmlfile/"+kmlfile1);
					      }
						var filename1="<%=tripid%>_<%=briefid%>";
						var url1="KML/actkml_"+filename1+".kml?date="+new Date().getTime();
						
						</script>
						<%
						try
						{
							if(flag1 == true)
							{
		%>
		              <script>
						loadKML(url1);	
						</script>
						<%
							}
						}
						catch(Exception e)
						{
							System.out.println("Exception-  loading actual kml-->    "+e);
						}
						 
			    		
					}catch(Exception  e){
						System.out.println("Exception--->    "+e);
					}
					
					}catch(Exception ex){
					
						ex.printStackTrace();
					}
					
					%>
					
					<% 
					if(plannedstatus.equalsIgnoreCase("Yes"))
					{
		    	 	sql12="select Placename,latitude,longitude,CumTime from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'  order by advancedtrackid asc ,row asc limit 1";
		    		 // System.out.println("sql start loc====>"+sql12);
					 rst12=st.executeQuery(sql12);
				 	if(rst12.next())
				 	{
					    lat=rst12.getDouble("latitude");
						lon=rst12.getDouble("longitude");
						location=rst12.getString("Placename");
					    porigin = location;
						String dt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst12.getString("CumTime")));
						html2="<b>Start location:</b><br>"+location+"<br><b>Date Time : </b>"+dt1;
						%>
						<script>
						//document.getElementById("strtloc11").innerHTML=< %=location%>;
						createMarker2("<div class='bodyText'><%= html2%></div>","<div class='bodyText'><%= html2%></div>",<%= lat%>,<%= lon%>); 
					 	</script>
					 	
						<%
					}
				
				 	pstop = 0;pnighthalt = 0;
					sql12="select Placename,latitude,longitude,CumTime,Event from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"' and event in ('Night Halt','Rest')  "+dayquery+"  order by advancedtrackid asc,row asc";
		  			// 	 System.out.println("sql start loc====>"+sql12);
					rst12=st.executeQuery(sql12);
					while(rst12.next())
					{
					   	String dur = "",datetime = "",datetime1 = "";
						String sql13 = "select stopDuration,End  from db_gps.t_jrnyplanning where Tripid = '"+tripid+"'  and brifid = '"+briefid+"' and driverid = '"+driverid+"'  and Destination = '"+rst12.getString("Placename")+"'";
						ResultSet rs13 = st3.executeQuery(sql13);
						if(rs13.next())
						{
							dur =new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rs13.getString("stopDuration")));
							datetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs13.getString("End")));
						}
					
						sql13 = "select AddTime('"+rs13.getString("End")+"','"+rs13.getString("stopDuration")+"') as enddate";
						rs13 = st3.executeQuery(sql13);
						if(rs13.next())
						{
							datetime1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs13.getString("enddate")));
						}
						
						if(rst12.getString("Event").equalsIgnoreCase("Rest"))
						{
							pstop = pstop+1;
						}
						else if(rst12.getString("Event").equalsIgnoreCase("Night Halt"))
						{
							pnighthalt = pnighthalt + 1;
						}
						
						label1="<b>"+rst12.getString("Event")+"</b><br><br><b>Date Time : </b>"+vehregno+"<br><b>Stop Date Time : </b>"+datetime+"<br><b>Start Date Time : </b>"+datetime1+"<br><b>Duration : </b>" +dur+ " <br><b>Location : </b>"+rst12.getString("Placename");
						%>  
						<script>
						createMarker("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","<%=rst12.getString("Event")%>",<%= rst12.getString("latitude")%>,<%= rst12.getString("longitude")%>);
						</script>
						<%
					
					}
				
					sql12="select Placename,latitude,longitude,CumTime from db_gps.t_intermediatejrmroute where advancedrouteid = '"+routeid+"'  and Tripid = '"+tripid+"' and briefid = '"+briefid+"' and driverid = '"+driverid+"'  order by advancedtrackid desc ,row desc limit 1";
			 		 // 	 System.out.println("sql start loc====>"+sql12);
					rst12=st.executeQuery(sql12);
					while(rst12.next())
					{
						lat=rst12.getDouble("latitude");
						lon=rst12.getDouble("longitude");
						location=rst12.getString("Placename");
						pdest = location;
						String dt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst12.getString("CumTime")));
						html2="<b>End location:</b><br>"+location+"<br><b>Date Time : </b>"+dt1;
						%>
						<script>
						//document.getElementById("strtloc11").innerHTML=< %=location%>;
						createMarker1("<div class='bodyText'><%= html2%></div>","<div class='bodyText'><%= html2%></div>",<%= lat%>,<%= lon%>); 
					 	</script>
						<%			
					}
					
					// System.out.println("porigin  "+porigin);
					// System.out.println("pdest  "+pdest);
					// System.out.println("pstop  "+pstop);
					// System.out.println("pnighthalt  "+pnighthalt);
					
					%>
					<script>
					try
					{
						
					//document.getElementById("porigin").innerHTML=< %=porigin%>;
					//document.getElementById("pdest").innerHTML=< %=pdest%>;
					document.getElementById("pst").innerHTML=<%=pstop%>;
					document.getElementById("pnh").innerHTML=<%=pnighthalt%>;
					}
					catch(e)
					{
						alert(e);
				}</script>
					<%} %>
					
					

<%
				int OScount=0,ACcount=0,DCcount=0,STcount=0,DisconnCount=0;
				String file="";
				
			   // boolean flag1;
			   
			    
			    Double startdist=0.0,enddist=0.0;
			    if("0".equalsIgnoreCase(vehcode))
			    	sql12="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime asc";
			    else
			    	sql12="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime asc";
					
				 System.out.println("sql start loc====>"+sql12);
				 rst12=st.executeQuery(sql12);
				if(rst12.next())
				{
					startdist=rst12.getDouble("Distance");
			      
			    //   	System.out.println("MapStart----------"+coordinateMapStart.get("lat")+","+coordinateMapStart.get("longi"));
					
					lat=rst12.getDouble("LatinDec");
					lon=rst12.getDouble("LonginDec");
					
					// System.out.println("\n\n start loc lat-->><"+lat);
					// System.out.println("\n\n start loc lon-->><"+lon);
					
					location=rst12.getString("TheFieldSubject");
					// System.out.println(lat+","+lon);
					
					String dt1 = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst12.getString("TheFieldDataDate")));
					html2="<b>Start location:</b><br>"+location+"<br><b>Date Time : </b>"+dt1+" " +rst12.getString("TheFieldDataTime");
					%>
					<script>
					createMarker3("<div class='bodyText'><%= html2%></div>","<div class='bodyText'><%=html2%></div>",<%=lat%>,<%=lon%>);
					</script>
					<%}
				
				/******************************************************  check start loc is geofenced ************************************************************/
			  
				if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode))  && !("drivrating".equalsIgnoreCase(fromPage)) && ("Castrol".equalsIgnoreCase(gpname)))
				{
					
					// System.out.println("\n\n GPName-->>"+gpname);
					String sqlware="select * from t_warehousedata where WareHouseCode='"+strtcode+"'";
				//	System.out.println("sqlware--"+sqlware);
					ResultSet resw=st5.executeQuery(sqlware);
					if(resw.next())
					{
						latw=resw.getDouble("Latitude");
						longw=resw.getDouble("Longitude");
			
						html11="<b>Geofenced Start location:</b><br>"+location;
			
			%>
			<script>
			   createMarker_ware("<%=resw.getString("WareHouse")%>","<div class='bodyText'><%=html2%></div>",<%=latw%>,<%=longw%>);
			</script>
			<%}//warehouse if end
					else
					{
						String sqlc="select * from t_castrolroutes where StartCode='"+strtcode+"'";
						ResultSet rec=st.executeQuery(sqlc);
						if(rec.next())
						{
							html11="<b>Geofenced Start location:</b><br>"+location;
							
						}
		    %>
		    <script>
		    createMarker_ware("<%=location%>","<div class='bodyText'><%=html11%></div>",<%=lat%>,<%=lon%>);
		    </script>
		    <%}
		    }
		    else
				{
					// System.out.println("Trip Is Null.............");
				}
				

				//while to drow the line.
				
				/***********Code for find lasst location***************/
				String etanew="-";
				double remKm=0;
				sql11="";
				/*---------------------------------change:- TheFiledTextFileName IN('SI','OF') removed from query---------------------------*/
				if("0".equalsIgnoreCase(vehcode))
					sql11="select * from t_veh"+ vehcode +" where unitid='"+unitid+"' and TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime desc";
			    else
					sql11="select * from t_veh"+ vehcode +" where TheFieldDataDateTime >='"+data1+" "+time1+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName NOT IN('AC','DC','OS','SI1','AC1','DC1','OS1','OS2','OS3','VC','VD') order by TheFieldDataDateTime desc";
				// System.out.println("sql last loc====>"+sql11);
				rst11=st.executeQuery(sql11);
				if(rst11.next())
				{
					//System.out.println("1038 Hii");
					enddist=rst11.getDouble("Distance");
			       
			     //   System.out.println("MapEnd----------"+coordinateMapEnd.get("lat")+","+coordinateMapEnd.get("longi"));
					
					lat=rst11.getDouble("LatinDec");
					lon=rst11.getDouble("LonginDec");
					// System.out.println("\n lat for last->>"+lat);
					// System.out.println("\n long for last->>"+lon);
					location=rst11.getString("TheFieldSubject");
							String jstatus="",ETADate="",DisDate="",statusj="";
							int kmrun1=0,kmrun2=0,kmrundist=0;
							double totKm=0;long tTime=0;
					
							String sqlnew="select * from db_gps.t_startedjourney where tripid='"+tripid+"'";
							ResultSet rst141=stnew.executeQuery(sqlnew);
							
							if(rst141.next())
							{
								jstatus=rst141.getString("JStatus");
								totKm=rst141.getDouble("FIxedKM");
							      tTime=rst141.getLong("FIxedTime");
							      if(jstatus.equals("Running")||jstatus.equals("tobeclosed")){
							    	  statusj="Running";
							      }else if(jstatus.equals("Cancelled")){
							    	  statusj="Cancelled";
							      }else if(jstatus.equals("closed")||jstatus.equals("Completed")){
							    	  statusj="Completed";
							      }
								if(jstatus.equals("Running")||jstatus.equals("tobeclosed")){
									etanew=rst141.getString("ETA");
									 ETADate=etanew;
									try{
										sql="select Distance from t_veh"+vehcode+" where TheFieldDataDateTime >='"+request.getParameter("data")+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName='SI' order by TheFieldDataDateTime asc limit 1";
										ResultSet rstkmrun1=st1.executeQuery(sql);
										if(rstkmrun1.next())				{
											kmrun1=rstkmrun1.getInt("Distance");	System.out.println("kmrun1-->"+kmrun1); 			}
								  }catch(Exception e)			{				e.printStackTrace();			}
								  try{
										sql="select Distance from t_veh"+vehcode+" where TheFieldDataDateTime >='"+request.getParameter("data")+"' and TheFieldDataDateTime <='"+data2+" "+time2+"' and TheFiledTextFileName='SI' order by TheFieldDataDateTime desc limit 1";
										ResultSet rstkmrun2=st1.executeQuery(sql);
									if(rstkmrun2.next())			{				kmrun2=rstkmrun2.getInt("Distance"); System.out.println("kmrun2-->"+kmrun2); 			}
								}catch(Exception e1)		{			e1.printStackTrace();		}
								  long myMilisec;
								  sql="select * from db_gps.t_startedjourney where StartDate='"+data1+"'and StartTime='"+time1+"' and StartCode='"+strtcode+"' and EndCode='"+endcode+"' and Vehid="+vehcode+"";
									ResultSet rstTotKm=st3.executeQuery(sql);
									System.out.println("sql-->"+sql);
									if(rstTotKm.next())		{
										sql3="select * from db_gps.t_castrolroutes where StartCode='"+strtcode+"' and EndCode='"+endcode+"' || EndPlace = '"+strtcode+"' and StartPlace = '"+endcode+"' limit 1 ";
										ResultSet rst123=st4.executeQuery(sql3);
										System.out.println("sql3-->"+sql3);
										if(totKm==0 && tTime==0 ){
										if(rst123.next())				{
												totKm=rst123.getDouble("Km");System.out.println("totKm-->"+totKm); 
											    tTime=rst123.getLong("TTime");				
											    }		}}
									kmrundist=kmrun2-kmrun1; System.out.println("kmrundist-->"+kmrundist);  //Finding tot run km by vehicle after trip started.
									remKm=Math.abs(totKm-kmrundist);System.out.println("remKm-->"+remKm); 
									myMilisec=(tTime*60*60*1000);
									if(!(null==ETADate))		{
										ETADate=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ETADate));	 
										 DisDate=ETADate;		}
									else		{
									if(myMilisec!=0)		{
							      	java.util.Date resultdate = new java.util.Date();
							      	 SimpleDateFormat sdftimemilli = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							      	 String aaa=request.getParameter("data");
							      	System.out.println("aaa------------------------->"+aaa);
							      	Date startDtTm = sdftimemilli.parse(aaa); 
							    		long start=startDtTm.getTime();
									long totdate= start+myMilisec;
									resultdate.setTime(totdate);
									System.out.println("DisDate------------------------->"+resultdate);
							        DisDate=new SimpleDateFormat("dd-MMM-yyy HH:mm:ss").format(resultdate);	
							        System.out.println("DisDate------------------------->"+DisDate);
							        }
									else{			DisDate="NA";		}
									}}else{
									etanew="0";
									DisDate="NA";
									remKm=00.00;	
								}
							}
					
							DecimalFormat twoDForm1 = new DecimalFormat("0.00");
					String dt = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheFieldDataDate")));
					html1="<b>Last Location:</b><br><b>Trip ID:</b>"+tripid+"<br><b>Vehicle:</b>"+vehreg+"<br><b>Transporter:</b>"+transporter+"<br><b>Speed:</b>"+rst11.getString("Speed")+"<br><b>Last Location:</b>"+location+"<br><b>Date Time : </b>"+dt+" " +rst11.getString("TheFieldDataTime")+"<br><b>Trip Status:</b>"+statusj+"<br><b>ETA:</b>"+DisDate+"<br><b>KM to Run:</b>"+twoDForm1.format(remKm)+"<br>";
				 
					//System.out.println("1055 Hii");
					%>
					<script>
					//alert("kmrundist-->"+kmrundist+"kmrun2-->"+kmrun2+"kmrun1--->"+kmrun1+"remKm-->"+remKm+"totKm-->"+totKm);
					//alert("kmrundist-->"+kmrundist+"kmrun2-->"+kmrun2+"kmrun1--->"+kmrun1);
					//alert("ji");
					createMarker4("<div class='bodyText'><%= html1%></div>","<div class='bodyText'><%= html1%></div>","SI",<%= rst11.getString("LatinDec")%>,<%= rst11.getString("LonginDec")%>);
					    
					 //alert("IIIIII");
					console.log("View center:-->\nLattitude:"+<%=rst11.getString("LatinDec")%>);
					console.log("Longitude:"+<%=rst11.getString("LonginDec")%>);
					setCenter(<%=rst11.getString("LonginDec")%>,<%=rst11.getString("LatinDec")%>);			//call for focus on journey
					setZoom(15);									//call to setzoom
					 </script>
					<%
					   // System.out.println("1063 Hii");
						}
				
				/****************************************** check last loc is geofence*********************************/
				if(!(tripid.equals("null")) && !("0".equalsIgnoreCase(vehcode))  && !("drivrating".equalsIgnoreCase(fromPage)) && ("Castrol".equalsIgnoreCase(gpname)))
				{
					//System.out.println("1069 Hii");
					sqlware="select * from t_warehousedata where WareHouseCode='"+endcode+"' limit 1";
					//System.out.println("sqlware end--"+sqlware);
					ResultSet resw1=st5.executeQuery(sqlware);
					if(resw1.next())
					{
						//System.out.println("1075 Hii");
						latw1=resw1.getDouble("Latitude");
						longw1=resw1.getDouble("Longitude");
						// System.out.println(latw1+","+longw1);
						html22="<b>Geofenced Last location:</b><br>"+location;
					
					%>
					<script>
					createMarker_ware("<%=resw1.getString("WareHouse")%>","<div class='bodyText'><%=html22%></div>",<%=latw1%>,<%=longw1%>);
					</script>   
					<%}
					else
					{
						//System.out.println("1089 Hii");
						String sqlc="select * from t_castrolroutes where EndCode='"+endcode+"'";
						//System.out.println("1091 "+sqlc);
						ResultSet rec=st.executeQuery(sqlc);
						if(rec.next())
						{
							//System.out.println("10 Hii");
							html22="<b>Geofenced Last location:</b><br>"+location;	
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
					
					%>
					<script>
					  createMarker4("<div class='bodyText' align='left'><%=startplace1%></div>","<div class='bodyText' align='left'><%=htmlvis1%></div>",'TripStart','<%=slatitude%>','<%=slongitude%>');
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
					%>
					<script>
					createMarker4("<div class='bodyText' align='left'><%= endplace1%></div>","<div class='bodyText' align='left'><%=htmlvis2%></div>",'TripEnd','<%=elatitude%>','<%=elongitude%>');	
					</script>
					<%		
					}//warehouse if end

				

						
						if(!("0".equalsIgnoreCase(vehcode))){
							// System.out.println("1251 Hii");
							date1=data1+" "+time1;
							date2=data2+" "+time2;
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
							// System.out.println("1251 Hii");
							while(rstos.next())
							{
									label1="<b>OverSpeed</b><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstos.getDate("FromDate"))+" "+rstos.getString("FromTime")+"<br><b>Speed : </b>" +rstos.getString("Speed")+"(kmph)<br><b>Duration : </b>" + rstos.getString("Distance") + " Sec.<br><b>Location : </b>"+rstos.getString("TheFieldSubject");
									%> 
									<script>
									createMarker4("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","OS",<%= rstos.getDouble("LatinDec")%>,<%= rstos.getDouble("LonginDec")%>);
									</script>	
									<%
									OScount++;
									
									System.out.println("New OS Count " +OScount);
							}
							// System.out.println("1251 Hii " +OScount);
					%>
					<script>
							document.getElementById("os").innerHTML="<font color=\"blue\">"+<%= OScount%>+"</font>";
					</script>
					<%
					
					ResultSet rstac=fleetview.getACforDateRange(date1,date2,vehcode);
					while(rstac.next())
					{
						label1="<b>Rapid Acceleration</b><br><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstac.getDate("TheFieldDataDate"))+" "+rstac.getString("TheFieldDataTime")+"<br><b> Speed : </b>" +rstac.getString("FromSpeed")+" <b>to</b> " + rstac.getString("ToSpeed")+"(kmph)<br><b>Location : </b>"+rstac.getString("TheFieldSubject");
					%> 
					<script>
					createMarker4("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","AC",<%= rstac.getDouble("LatinDec")%>,<%= rstac.getDouble("LonginDec")%>); 	
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
					ResultSet rstdc=fleetview.getDCforDateRange(date1,date2,vehcode);
					while(rstdc.next())
					{
						label1="<b>Rapid Deceleration</b><br> <br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstdc.getDate("TheFieldDataDate"))+" "+rstdc.getString("TheFieldDataTime")+"<br><b> Speed : </b>" +rstdc.getString("FromSpeed")+" <b>to</b> " + rstdc.getString("ToSpeed")+"(kmph)<br><b>Location : </b>"+rstdc.getString("TheFieldSubject");
			%> <script>
					createMarker4("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>","DC",<%= rstdc.getDouble("LatinDec")%>,<%= rstdc.getDouble("LonginDec")%>);	
				</script>
			<%
					DCcount++;
							
					}
			%><script>
				document.getElementById("rda").innerHTML="<font color=\"blue\">"+<%= DCcount%>+"</font>";
				
				/******************code for stops***************/
			</script>
			<%
			// System.out.println("code for stop    ");
			String stopdatetime="-",startdatetime="-";//stopdatetime1="-";
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
			STcount=0;
			//java.util.Date stopdatetime1=null;
			String stopdatetime1="";
			String sql00="select * from db_gpsExceptions.t_veh"+vehcode+"_stsp where  CONCAT( Fromdate,' ',FromTime ) >='"+date1+" "+time1+"' and CONCAT( Fromdate,' ',FromTime ) <='"+date2+" "+time2+"' order by Fromdate, FromTime asc";

			System.out.println("Query 1:-"+sql00);
		 	ResultSet rst00= st00.executeQuery(sql00);
			
			while(rst00.next())
			{
		 	
		 	//sql="select * from t_veh"+vehcode+" where concat(TheFieldDataDate,' ',TheFieldDataTime) >='"+data1+" "+time1+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) <='"+data2+" "+time2+"' and TheFiledTextFileName in('SI','ST','SP') order by concat(TheFieldDataDate,TheFieldDataTime) asc ";
		 //	sql="select * from t_veh"+vehcode+" where TheFieldDataDateTime ='"+rst00.getString("Fromdate")+" "+rst00.getString("FromTime")+"'  and TheFiledTextFileName in('SI','ST','SP') order by concat(TheFieldDataDate,TheFieldDataTime) asc ";
		 sql="select * from t_veh"+vehcode+" where TheFieldDataDateTime ='"+rst00.getString("Fromdate")+" "+rst00.getString("FromTime")+"'   ";
						ResultSet rstst=st.executeQuery(sql);
						 System.out.println("sqlstops    "+sql);
						
						boolean flag=true;
						int i=1;
						//while(rstst.next())
						if(rstst.next())
						{
							//if(rstst.getInt("Speed")==0)
							{
								//if(flag)
								{
								//	System.out.println("I m here");
									//stopdatetime=rstst.getString("TheFieldDataDate")+" "+rstst.getString("TheFieldDataTime");
									stopdatetime=rst00.getString("Fromdate")+" "+rst00.getString("FromTime");
									//stopdatetime1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rstst.getString("TheFieldDataDate"))+"  "+rstst.getString("TheFieldDataTime"));
									stopdatetime1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst00.getString("Fromdate")+" "+rst00.getString("FromTime")));
									stoplat=rstst.getDouble("LatinDec");
									stoplon=rstst.getDouble("LonginDec");
									flag=false;
									
								}
							}
							//else
							{
								flag=true;
							//	startdatetime=rstst.getString("TheFieldDataDate")+" "+rstst.getString("TheFieldDataTime");
							System.out.println("herere");
							stopdatetime=rst00.getString("Fromdate")+" "+rst00.getString("FromTime");
							startdatetime=rst00.getString("ToDate")+" "+rst00.getString("ToTime");
							
							//startdatetime=rst00.getString("ToDate")+" "+rst00.getString("ToString");
								if(!(stopdatetime.equals("-")))
								{
									System.out.println("Before date");
									java.util.Date spdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(stopdatetime);
									java.util.Date stdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startdatetime);
									System.out.println("after date");
									long mils=(stdate.getTime()-spdate.getTime());
									long mins=mils/1000/60;
									System.out.println("Fnnbvfgkj    ");
									String hrs="";
									String min="00";
									if(mins >= minstopdur)
									{
										//System.out.println("Fnnbvfgkj    ");
										 hrs=""+mins/60;
										//String min="00";
										try{
										 min=""+mins%60;
										}catch(Exception ee)
										{
											min="00";
										}
									}
									//	label1="<b>Stop Location</b><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Stop Date Time : </b> "+stopdatetime1+"<br><b>Start Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy").format(rstst.getDate("TheFieldDataDate"))+"  "+rstst.getString("TheFieldDataTime")+"<br><b>Stoppage duration : </b> "+hrs+"hrs "+min+"min  <br><b>Location : </b>"+rstst.getString("TheFieldSubject");
									label1="<b>Stop Location</b><br><br><b>VehRegNo : </b>"+vehRegNo+"<br><b>Stop Date Time : </b> "+stopdatetime1+"<br><b>Start Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst00.getString("ToDate")+"  "+rst00.getString("ToTime")))+"<br><b>Stoppage duration : </b> "+hrs+"hrs "+min+"min  <br><b>Location : </b>"+rst00.getString("Location");
									//	STcount++;
									System.out.println("1234");
										%><script>
											  createMarker4("<div class='bodyText' align='left'><%= label1%></div>","<div class='bodyText' align='left'><%=label1%></div>",'ST','<%=stoplat%>','<%=stoplon%>');	
										  </script>
										<%
										stopdatetime="-";
										stoplat=0;stoplon=0;
									//} //if(mins >= minstopdur)
								}
							}
						}
						STcount++;
						}
					
				%>
				<script>
				document.getElementById("st").innerHTML= "<font color=\"blue\">"+<%=STcount%>+"</font>"
				</script>
				<%
				try{
	               sql5="select VehRegNo, OffTimeFrom, OffTimeTo, FromLatitude, FromLongitude, FromLocation,time_to_sec(Duration) Duration, Distance  from db_gps.t_disconnectionData where vehicleCode='"+vehcode+"' and Reason='Disconnection' and ignoredstamp='No' and Duration >= '0:30:00' and OffTimeFrom between '"+date1+"' and  '"+date2+"'";
		           System.out.println(sql5);
		       ResultSet rstdisconn = stDisconn.executeQuery(sql5);
		       
		       while (rstdisconn.next())
		       {
		    	   
		    	   String dura = rstdisconn.getString("Duration");
					
					int sec = Integer.parseInt(dura);//
					java.util.Date	d = new java.util.Date(sec * 1000L);
							SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss"); // HH for 0-23
							df.setTimeZone(TimeZone.getTimeZone("GMT"));
							String duration = df.format(d);
		    	   
		    	   label1="<b>Disconnection Location</b><br> <br><b>VehRegNo : </b>"+vehRegNo+"<br><b>From Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(rstdisconn.getDate("OffTimeFrom"))+"<br><b>To Date Time : </b>"+new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(rstdisconn.getDate("OffTimeTo"))+"<br><b> Duration : </b>" +rstdisconn.getString("Duration")+"<br><b> Distance : </b>" +rstdisconn.getInt("Distance")+"<br><b>Location : </b>"+rstdisconn.getString("FromLocation");
		     %> 
		        <script>
					createMarker4("<div class='bodyText'><%= label1%></div>","<div class='bodyText'><%= label1%></div>",'Disconn',<%= rstdisconn.getDouble("FromLatitude")%>,<%= rstdisconn.getDouble("FromLongitude")%>);
				</script>
			<%
		    	   
		    	   DisconnCount++;	
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
			// System.out.println("Exception ------767687----> "+   e);
		}
				}
				/*	
    	}
    	 catch(Exception e)
    	{
    		e.printStackTrace();
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
					Statement stpgps = conn.createStatement();			
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
									ResultSet rstg=stpgps.executeQuery(sqlstop);
									if(rstg.next())
									{
										lat1=rstg.getDouble("LatinDec");
										lon1=rstg.getDouble("LonginDec");
										disc=rstg.getString("TheFieldSubject");
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


<div class="modal" id="PlStopModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Planned Stop Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_rest" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
					<th>Duration</th>
					<th>Location</th>					
					</tr>
					</thead>
					<tbody>
					<%
					int i_rest = 1;
					String location="";			
					Statement st_rest = conn.createStatement();
					Statement st100 = conn.createStatement();
					String sql_rest = "select * from db_gps.t_jrnyplanning where  Tripid = '"+tripid+"' and brifid = '"+briefid+"' and driverid = '"+driverid+"' and StopReason = 'Rest'    order by Start ";				
						ResultSet rst_rest = 	st_rest.executeQuery(sql_disc);
						while(rst_rest.next()){
							spdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst_rest.getString("End"));
							double lat1 = 0,lon1 = 0;
							String sql200 = "select * from db_gps.t_jrmrouteadvanceddetails where Placename = '"+rst_rest.getString("Destination")+"'  and advancedrouteid = '"+routeid+"'";
							    System.out.println("sql  ****************************************  "+sql1);
							    ResultSet rst200 = st100.executeQuery(sql200);
								   if(rst200.next())
								   {
									   lat1 = rst200.getDouble("latitude");
									   lon1 = rst200.getDouble("longitude");
								   }
							
							  sql200 = "select AddTime('"+rst_rest.getString("End")+"','"+rst_rest.getString("StopDuration")+"') as enddate";
							    System.out.println("sql  ****************************************  "+sql1);
							     rst200 = st100.executeQuery(sql200);
								   if(rst200.next())
								   {
									   stdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst200.getString("enddate"));
								   }
								  
							String spdate1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(spdate);
							String stdate1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(stdate);
							
							%>
							<tr>
							<td align="right"><%=i_rest++%></td>
							<td align="right"><%=spdate1%></td>
							<td align="right"><%=stdate1%></td>
							<td align="right"><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rst_rest.getString("StopDuration")))%></td>
							<td align="left"><a href="shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=rst_rest.getString("location")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=lat1%>&long=<%=lon1%>&discription=<%=rst_rest.getString("location")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=rst_rest.getString("location")%></a></td>
							</tr>
						<%}
					%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
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


<div class="modal" id="PlNightModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:1000px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Planned Night Halt Report for <%=vehRegNo%> between <%=mydate1%> and <%=mydate2%></h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body" id="modal-body">
					<section id="">
				    
					<table id="example_night" class="table bordered">	
					<thead>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
					<th>Duration</th>
					<th>Location</th>					
					</tr>
					</thead>
					<tbody>
					<%
					int i_night=1;
					Statement st_n = conn.createStatement();
					Statement st_n2 = conn.createStatement();
					Statement st2_n2 = conn.createStatement();
					String sqln_200="";
					
					String sql_night = "select * from db_gps.t_jrnyplanning where  Tripid = '"+tripid+"' and brifid = '"+briefid+"' and driverid = '"+driverid+"' and StopReason = 'Night Halt'  order by Start"; //from plannedReport.jsp
					System.out.println("planned night halt query:"+sql_night);
					ResultSet res_night = st_n.executeQuery(sql_night);
					while(res_night.next()){
						spdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(res_night.getString("End"));
						 double Lat1 = 0,Lon1 = 0;
						 sqln_200 = "select * from db_gps.t_jrmrouteadvanceddetails where Placename = '"+res_night.getString("Destination")+"'  and advancedrouteid = '"+routeid+"'";
					     System.out.println("planned night halt query 2.1:"+sqln_200);
						 ResultSet resn_200 = st_n2.executeQuery(sqln_200);
					     if(resn_200.next()){
					    	 Lat1 = resn_200.getDouble("latitude");
							 Lon1 = resn_200.getDouble("longitude");
					     }
					     
					     sqln_200 ="select AddTime('"+res_night.getString("End")+"','"+res_night.getString("StopDuration")+"') as enddate";
					     System.out.println("planned night halt query 2.2:"+sqln_200); 
					     ResultSet resn2_200 = st2_n2.executeQuery(sqln_200);
					     if(resn2_200.next()){
					    	 stdate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(resn2_200.getString("enddate"));
					     }
					     %><tr>
					     <td><%=i_night++%></td>
					     <td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(spdate)%>
					     <td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(stdate)%></td>
					     <td><%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(res_night.getString("StopDuration")))%></td>
					     <td><a href="shownewmap.jsp?lat=<%=Lat1%>&long=<%=Lon1%>&discription=<%=res_night.getString("location")%>" onclick="popWin=open('shownewmap.jsp?lat=<%=Lat1%>&long=<%=Lon1%>&discription=<%=res_night.getString("location")%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=res_night.getString("location")%></a></td>
					     </tr>
					<%}%>
					</tbody>
					<tfoot>
					<tr>
					<th>Sr.No.</th>
					<th>From Date Time</th>
					<th>To Date Time</th>
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

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example_rest').DataTable({
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
								title: 'Planned Rest Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Planned Rest Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Planned Rest Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Planned Rest Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Planned Rest Report for <%=vehRegNo%>',
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
            dt_basic = $('#example_rest').DataTable({
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
								title: 'Planned Night Halt Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Planned Night Halt Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Planned Night Halt Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Planned Night Halt Report for <%=vehRegNo%>',
                                exportOptions: { columns: [0,1,2,3,4] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Planned Night Halt Report for <%=vehRegNo%>',
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
					
					
<!-- <script>
createMarker3("Banglore","Banglore", 12.9716,77.5946);
createMarker_ware("TVC", "TVC", 8.52, 76.93);
createMarker("Lucknow","Lucknow","Rest",26.84, 80.946);
createMarker("Kolkatta","Kolkatta","Night Halt",22.57,88.36);
createMarker2("Bhopal","Bhopal",23.25,77.41);
createMarker1("Ahmedabad","Ahmedabad",23.02,72.6008);

createMarker4("Transworld","Fleetview","SI",18.5676072,73.9191786);  //green
createMarker4("Mumbai","Mumbai","AC",18.93, 72.83);   //blue
/* createMarker4("Delhi","Delhi","ST", 28.69, 76.95)  //white
createMarker4("Chennai","Chennai","DC", 13.0827, 80.2707  )  //yellow
createMarker4("Sangli","Sangli","OS",17.00,74.516);  //red */

createMarker4("Delhi","Delhi","Disconn", 28.69, 76.95)  //gray
createMarker4("Chennai","Chennai","TripStart", 13.0827, 80.2707  )  //purple
createMarker4("Sangli","Sangli","TripEnd",17.00,74.516);  //brown


</script> -->
</body>
</html>