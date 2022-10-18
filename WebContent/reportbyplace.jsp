<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
   <%@page import="com.transworld.fleetview.framework.VehicleDao"
	import="com.transworld.fleetview.framework.WarehouseList"
	import="com.transworld.fleetview.framework.Utilities"
	import="com.transworld.fleetview.framework.OnlineDataList"%>

<jsp:useBean id="vehicleDao"
	type="com.transworld.fleetview.framework.VehicleDao"
	scope="application"></jsp:useBean>
  	<link rel="stylesheet" type="text/css" href="css/form.css" media="all">

<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%> 
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
		//below statement for template functioning only
		ajaxRequest.open("GET", "ReSetDemo.jsp?call=SetDefault&reportno=000&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		//for report conversion uncomment the line below and erase the line above
		<%-- ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true); --%>
		ajaxRequest.send(); 
		}
	}
</script>
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
};

function validate2(){
	alert("sdgshd");
	var query=document.getElementById("query").value;
	if(query==null){
	alert("no data present");
	}
}


function validate(){
	
	var place =document.form1.placename.value;
	if(place=="")
	{
		 alert("Please select the Type");
	         return false;   
	}
}
function getLocation(wtype)
{
//alert(wtype);

	var xmlhttp;
	if (window.XMLHttpRequest)
	  {
	  // code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else if (window.ActiveXObject)
	  {
	  // code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	else
	  {
	  alert("Your browser does not support XMLHTTP!");
	  }
	xmlhttp.onreadystatechange=function()
	{
	if(xmlhttp.readyState==4)
	  {
	  //alert(xmlhttp.responseText);
	  document.getElementById("placename").innerHTML=xmlhttp.responseText;
	  }
	}
	xmlhttp.open("GET","AjxLocationData.jsp?wtype="+wtype,true);
	xmlhttp.send(null);
	
}

</script>
 
</head>
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%

	Connection conn=null,conn1=null;
	Statement st=null, st1=null,st2=null,st20=null,st21=null;
%>
<%
	String user, place1 = null, Dist = null, Pname, sql1, vehlist;
	double Distance;
	double Lat1, Lon1, Lat2, Lon2;
%>
<%
	user = session.getAttribute("usertypevalue").toString();
	vehlist = session.getAttribute("VehList").toString();
	String wType=request.getParameter("wType");
	System.out.println("wType>>>> " +wType);
	try {
		
		conn = fleetview.ReturnConnection();
		//conn1 = fleetview.ReturnConnection1();
		st1=conn.createStatement();
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

//for report conversion use this query
String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st20.executeQuery(setdefault);
if(rssetdefault.next())
{
	//setDefFlag=true;    uncomment this line for report conversion testing
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
		//setDefFlag=true;   uncomment this line for report conversion
		
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
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		System.out.println("Inside On load");
		
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

String Selection1 = request.getParameter("basicSelect1");
System.out.println("selection1:"+Selection1);

String Selection2 = request.getParameter("basicSelect2");
System.out.println("selection2:"+Selection2);

String Selection3 = request.getParameter("basicSelect3");
System.out.println("selection3:"+Selection3);

String Selection4 = request.getParameter("basicSelect4");
System.out.println("selection4:"+Selection4);
%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Vehicles In Geofenced Location</h3>
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
	<!-- ****************************************** -->	
    <div class="row col-12">
		    <div class="col-md-2">  <!-- col 1-->
		         <label for="basicSelect">Type</label>
					<div class="input-group input-group-merge">
							<select name="wType" id="wType" class="form-select" onchange="getLocation(this.value);">
								<option value="Select">Select</option>
						 
							     <option value="All">All</option>
										<%String dde = request.getQueryString();
										String sql2="select distinct(WType) from db_gps.t_warehousedata where WType<>'-' and WType<>''";
										ResultSet rstype=st1.executeQuery(sql2);
															
										while(rstype.next())
														{
															%>
																<option value="<%=rstype.getString("WType")%>"><%=rstype.getString("WType")%>
																</option>					
															<%
														}
										%>
							
						</select>
							<!-- <script>
			                         const mySel = document.getElementById("basicSelect1"); 
			                         mySel.addEventListener("change",function() 
					                     { 
						                       localStorage.setItem("selValue",this.value); // save it 
					                     }); 
			
			                           let val = localStorage.getItem("selValue"); 
										if (val) 
											mySel.value=val; // set the dropdown 
										    // trigger the change in case there are other events on the select 
										mySel.onchange(); 
							</script> -->
		          </div>
		    </div>  <!-- col 1 -->
		    
		    <div class="col-md-2"> <!-- col 2 -->
		         <label for="basicSelect">Location</label>
					<div class="input-group input-group-merge">
					<%
								List<WarehouseList> list = null;
									int numRecords = 0;
									try {
										list = vehicleDao.getWarehouseList(session.getAttribute(
										"usertypevalue").toString());
										
										numRecords = list.size();
									} catch (Exception e) {
										e.printStackTrace();
									}
						     	%>
							<select class="form-select" name="placename"  id="placename">
								

						</select>
							<!-- <script>
			                         const mySel = document.getElementById("basicSelect2"); 
			                         mySel.addEventListener("change",function() 
					                     { 
						                       localStorage.setItem("selValue",this.value); // save it 
					                     }); 
			
			                           let val = localStorage.getItem("selValue"); 
										if (val) 
											mySel.value=val; // set the dropdown 
										    // trigger the change in case there are other events on the select 
										mySel.onchange(); 
							</script> -->
		          </div>
		    </div>   <!-- col 2-->
		    
		      <div class="col-md-2"> <!-- col 3 -->
		         <label for="basicSelect">Distance</label>
					<div class="input-group input-group-merge">
							<option value="200m"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("0.2"))
										out.print("selected='yes'");
								}%>>200
											m.</option>
											<option value="1"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("1"))
										out.print("selected='yes'");
								}%>>1
											km.</option>
				
											<option value="5"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("5"))
										out.print("selected='yes'");
								}%>>5
											km.</option>
											<option value="10"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("10"))
										out.print("selected='yes'");
								}%>>10
											km.</option>
											<option value="15"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("15"))
										out.print("selected='yes'");
								}%>>15
											km.</option>
											<option value="20"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("20"))
										out.print("selected='yes'");
								}%>>20
											km.</option>
											<option value="25"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("25"))
										out.print("selected='yes'");
								}%>>25
											km.</option>
											<option value="30"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("30"))
										out.print("selected='yes'");
								}%>>30
											km.</option>
											<option value="35"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("35"))
										out.print("selected='yes'");
								}%>>35
											km.</option>
											<option value="40"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("40"))
										out.print("selected='yes'");
								}%>>40
											km.</option>
											<option value="45"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("45"))
										out.print("selected='yes'");
								}%>>45
											km.</option>
											<option value="50"
												<%if (request.getQueryString() != null) {
									if (request.getParameter("distance").equals("50"))
										out.print("selected='yes'");
								}%>>50
											km.</option>
							<!-- <script>
			                         const mySel = document.getElementById("basicSelect3"); 
			                         mySel.addEventListener("change",function() 
					                     { 
						                       localStorage.setItem("selValue",this.value); // save it 
					                     }); 
			
			                           let val = localStorage.getItem("selValue"); 
										if (val) 
											mySel.value=val; // set the dropdown 
										    // trigger the change in case there are other events on the select 
										mySel.onchange(); 
							</script>
		     -->      </div>
		    </div>   <!-- col 5 -->
      
                <div class="row col-1">
					<div class="col-md-2">  <!-- col 5 -->
						<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="submit" value="Submit">
					</div> <!-- col 5 -->
					
		        </div>
		        
		          <%
					String dd = request.getQueryString();
						if (dd == null) {
							out
									.println("<font face='arial' size='3'> <center>Please Select the Location and Distance.</center></font>");
						} else {
							session.setAttribute("placename", request
									.getParameter("placename"));
							session.setAttribute("distance", request
									.getParameter("distance"));
							StringTokenizer sk = new StringTokenizer(request
									.getParameter("placename"), ",");
							
							if("200m".equalsIgnoreCase(request
									.getParameter("distance"))){
								Distance = 0.2;
							}
							else{
								Distance = Double.parseDouble(request
										.getParameter("distance"));
							}
							Lat1 = Double.parseDouble(sk.nextToken());
							Lon1 = Double.parseDouble(sk.nextToken());
							Pname = sk.nextToken();
							session.setAttribute("Pname", Pname);
				%>       
		   
	   </div> <!-- row main end -->  
		   <br>
			<table width="100%" align="center" border="0">
					<tr>
						<td align="center"><font size="3"><B>The Vehicle
						 <%=" " + request.getParameter("distance")
									+ " "%>km. Around the
						Place <%=" " + Pname%> </B></font>
						<div align="right"><a href="#"
							onclick="javascript:window.open('printreportbyplace.jsp');"><img
							src="images/print.jpg" width="15px" height="15px"></a>&nbsp;
						&nbsp; <a href="excelreportbyplace.jsp" title="Export to Excel"><img
							src="images/excel.jpg" width="15px" height="15px"></a> <b>
						<%=Utilities.printDate()%> </b></div>
						</td>
					</tr>
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
											<th>Sr.No.</th>
											<th>Veh</th>
											<th>Updated</th>
											<th>Transporter</th>
											<th>Date</th>
											<th>Time</th>
											<th>Distance In KM</th>
											<th>Location</th>
										</tr>
									</thead>
									<tbody>
									  <%
						List<OnlineDataList> dataList = null;
								int recordCount = 0;
								try {
									dataList = vehicleDao.getOnlineDataList(session
											.getAttribute("VehList").toString());
									recordCount = dataList.size();
								} catch (Exception e) {
									e.printStackTrace();
								}
								int i=1;
								for (int counter = 0; counter < recordCount; counter++) {
									OnlineDataList currentRecord = dataList.get(counter);

									Lat2 = Double.valueOf(currentRecord
											.getLatitudePosition());
									Lon2 = Double.valueOf(currentRecord
											.getLongitudePosition());
									double dist2 = Utilities.PointToPointDistance(Lat1,
											Lon1, Lat2, Lon2);
									double dist1 = dist2;
									//out.println(dist2);
									if (dist2 <= Distance) {
					%>
					<%-- <input type="hidden" id="query" name="query" value="<%=currentRecord.getVehicleRegistrationNumber()%>">
					 --%>
					<tr>
						<td>
						<div align="right"><%=i%></div>
						</td>
						<td class="bodyText">
						<div align="left"><%=currentRecord
											.getVehicleRegistrationNumber()%></div>
						</td>
						<td class="bodyText">
						<div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(currentRecord.getTheDate()))%>  <%=currentRecord.getTheTime()%></div>
						</td>
						<td class="bodyText">
						<div align="left"><%=currentRecord.getTransporter()%></div>
						</td>
						<td class="bodyText">
						<div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(currentRecord.getTheDate()))%></div>
						</td>
						<td class="bodyText">
						<div align="right"><%=currentRecord.getTheTime()%></div>
						</td>
						<td class="bodyText">
						<div align="right"><%=dist2%></div>
						</td>
						<td class="bodyText">
						<div align="left"><a
						href="shownewmap.jsp?lat=<%=currentRecord.getLatitudePosition()%>&long=<%=currentRecord.getLongitudePosition()%>
						&discription=<%=currentRecord.getLocation()%> 
						onclick=popWin=open('shownewmap.jsp?lat=<%=currentRecord.getLatitudePosition()%>
						&long=<%=currentRecord.getLongitudePosition()%>
						&discription=<%=currentRecord.getLocation()%>', 'myWin','width=500, height=500'); popWin.focus(); return false;">
					<%=currentRecord.getLocation()%></a>
						</div>
						</td>
					</tr>
					<%
					i++;
						}
					}if(i==1){
						%>
						<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>No Data Found</td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						<%
					}
						%>
						
					</table>

					<%
					}
					%>
						%>			
									</tbody>
									<tfoot>
										<tr>
											<th>Sr.No.</th>
											<th>Veh</th>
											<th>Updated</th>
											<th>Transporter</th>
											<th>Date</th>
											<th>Time</th>
											<th>Distance In KM</th>
											<th>Location</th>
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
						<h4 class="modal-title">Custom Column Selection for ReportTemplateSession </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
			//String showList=""+ColumnList;    uncomment this line for report conversion 
			%>                                  <!-- change this to ReSet.jsp for conversion  -->		
			<form id="customselect" name="customselect" method="get" action="ReSetDemo.jsp">  
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
								title: 'Vehicles In Geofenced Location Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Vehicles In Geofenced Location Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Vehicles In Geofenced Location Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Vehicles In Geofenced Location Report Template',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Vehicles In Geofenced Location Report Template',
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
</script><!--New Script code added for table Start end-->
			
			

<!--New Script code added for table Start end-->
			
</body>
</html>
<%
	} catch (Exception e) {
		out.print("Exception " + e);
	}
	finally
	{
		try
		{
		fleetview.closeConnection();
		}catch(Exception e)
		{
		}	
		
	}
%>