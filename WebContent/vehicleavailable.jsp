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
		alert("in ajax call.."+(nodes.length/2));
		
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}
</script>
</head>
<body onload="ondemand()">
<%
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;
%>
<%
if(session.getAttribute("vehlistnew").toString().equals("-"))
{%>
	<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Vehicle Available Report</h3>
						</div>
						</div>
						</div>
						<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
			              <div class="mb-1 breadcrumb-right">
				             <div class="demo-inline-spacing mb-1" >
								<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal"> Register Complaint</button>
								<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" ><span id="kt_engage_demos_label">Help</span></button>
				 			</div>
						</div>
					</div>
				<h4>Please select the location first.</h4>
				</div>
				</div>
				</div>
<%}
else
{
%>  
<%
	Connection conn=null,conn1=null;
	Statement st=null,st1=null,st2=null,st3=null,st4=null,st5=null,st6=null,stx=null,stp=null,st20=null,st21=null;
	String sql,vehlist,enddate,location,locationcode,mainuser;
	String aa,tbname,sql1,sql2,sql3,transporter,vehregno,sdate,edate,stime,etime,ssdate,eedate,locationlist;
	double Lat1,Lon1,Lat2,Lon2;
	int oscount, account,dccount,stcount,oo;
	long time1,time2,time3,time4,timex;
	int startdist,stopdist;
	
	

%>
<%
		java.util.Date ddd=new java.util.Date();
		long dateMillis2 = ddd.getTime();
		long dayInMillis2 = 1000 * 60 * 60 *24;
		dateMillis2 = dateMillis2 - dayInMillis2;
		ddd.setTime(dateMillis2);
		Format NewFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String data1 = NewFormatter1.format(ddd);
		
		java.util.Date today=new java.util.Date();
		Format xxx = new SimpleDateFormat("yyyy-MM-dd");
		enddate = xxx.format(today);
		vehlist=session.getAttribute("vehlistnew").toString();
		location=session.getAttribute("Location").toString();
		locationcode=session.getAttribute("LocationCode").toString();
		mainuser=session.getAttribute("usertypevaluemain").toString();
		locationlist=session.getAttribute("locationlist").toString();
		oo=1;
		try{
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		stp=conn.createStatement();
		stx=conn.createStatement();
		st1=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st4=conn.createStatement();
		st5=conn.createStatement();
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st6=conn1.createStatement();
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


<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 

Format fmt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
String sdt = fmt.format(new java.util.Date());
%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Vehicles available 
						<% if(session.getAttribute("Location").toString().equals("All")){
							
						} else{
							out.print(" at "+session.getAttribute("Location").toString()); 
							}  
							%> with last 24 hours exception report
						</h3>
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
											<tr><th>Veh. </th>
											<th> Transporter </th>
											<th>Updated </th>
											<th>Waiting Time</th>
											<th>OS</th>
											<th>AC</th>
											<th>DC</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>ND</th>
									  </tr>
										
									</thead>
									<tbody>
                                           <%
											sql="select distinct(SubLocationCode) from t_masterlocation where mainlocationcode='"+locationcode+"'";
                                           System.out.println("sql: "+sql);

                                           ResultSet spl=stp.executeQuery(sql);
											while(spl.next())
											{
											sql="select * from t_warehousedata where WareHouseCode ='"+spl.getString("SubLocationCode")+"' and Owner='"+mainuser+"'";
											System.out.println("inside while sql: "+sql);

											ResultSet rs=stx.executeQuery(sql);
											if(rs.next())
											{
												Lat1=rs.getDouble("Latitude");
												Lon1=rs.getDouble("Longitude");
											//out.print(Lat1+" "+Lon1+"<br>");
											%>
											<tr><th colspan="11"><%=rs.getString("WareHouse")%></th></tr>
											<%
											java.util.Date NewDatex =new java.util.Date();
											//java.util.Date NewDate1 =new java.util.Date();
											long dateMillisx1 = NewDatex.getTime();
											long dayInMillisx1 = 10000 * 60 * 60 *24;
											dateMillisx1 = dateMillisx1 - dayInMillisx1;
											NewDatex.setTime(dateMillisx1);
											
											Format NewFormatter11 = new SimpleDateFormat("yyyy-MM-dd");
											String data2 = NewFormatter11.format(NewDatex);
											
											sql="select v.* from t_onlinedata v,t_group g where g.GPname='"+mainuser+"' and v.VehicleCode=g.VehCode and v.TheDate >='"+data1+"' and v.VehicleCode not in (select distinct(Vehid) from t_startedjourney where StartDate >='"+data2+"' and vehid in "+vehlist+" and jstatus='Running' order by StartCode asc) order by v.TheDate desc";
											System.out.println("inside iff...sql:"+sql);

											ResultSet rst=st.executeQuery(sql);
											while(rst.next())
											{
												Lat2=rst.getDouble("LatitudePosition");
												Lon2=rst.getDouble("LongitudePosition");
												double theta = Lon1 - Lon2;
												double dist = Math.sin(Lat1* Math.PI / 180.0) * Math.sin(Lat2* Math.PI / 180.0) + Math.cos(Lat1* Math.PI / 180.0) * Math.cos(Lat2* Math.PI / 180.0) * Math.cos(theta* Math.PI / 180.0);
												dist = Math.acos(dist);
												dist = (dist* 180 / Math.PI);
												dist = dist * 60 * 1.1515;
												long dist1 = Math.round(dist * 1.609344);
												if(dist1<= oo)
												{
											%>
											
											<tr>
													<td class="bodyText"><div align="left">
													<a href="last24hoursexception.jsp?date=<%=rst.getString("TheDate")%>&time=<%=rst.getString("TheTime")%>&vehcode=<%=rst.getString("VehicleCode")%>&transporter=<%=rst.getString("Transporter")%>&vehregno=<%=rst.getString("VehicleRegNo")%>"><%=rst.getString("VehicleRegNo")%></a>
													</div></td>
													<td class="bodyText"><div align="left"><%=rst.getString("Transporter")%></div></td>
													<td class="bodyText"><div align="left"></div><%
													Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy");
													String sh1 = fmt1.format(rst.getDate("TheDate"));
													out.print(sh1);
													%> <%=rst.getString("TheTime")%></td>
													<td class="bodyText"><div align="left">
													<%
													/********start code for waiting time ***********/
													sql1="select concat(TheFieldDataDate,TheFieldDataTime) as dt,Distance from t_veh"+rst.getString("VehicleCode")+" where TheFiledTextFileName='SI' order by concat(TheFieldDataDate,TheFieldDataTime) desc limit 1";
													System.out.println("sql1:"+sql1);
													ResultSet rst1=st1.executeQuery(sql1);
													if(rst1.next())
													{
													sql2="select concat(TheFieldDataDate,TheFieldDataTime) as dt,Distance from t_veh"+rst.getString("VehicleCode")+" where TheFiledTextFileName='SI' and "+rst1.getInt("Distance")+"- Distance >=2 order by concat(TheFieldDataDate,TheFieldDataTime) desc limit 1";
													System.out.println("sql2: "+sql2);
													ResultSet rst2=st2.executeQuery(sql2);
													if(rst2.next())
													{
													java.util.Date NewDate = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss").parse(rst1.getString("dt"));
													long dateMillis = NewDate.getTime();
													
													java.util.Date NewDate1 = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss").parse(rst2.getString("dt"));
													long dateMillis1 = NewDate1.getTime();
													//out.print(rst1.getString("dt")+"<br>"+rst2.getString("dt")+"<br>");
													
													long temptime=dateMillis-dateMillis1;
													temptime=temptime/1000;
													long hours=(temptime /60)/60;
													long minutes=((temptime /60)%60);
													out.print(hours+" hrs "+minutes+" Min ");
													
													
													}
													}
													
													/********end code for waiting time ***********/
													%>
													</div></td>
													<%
													/********start code for OS, AC, DC count time ***********/
													edate=rst.getString("TheDate");
													etime=rst.getString("TheTime");
													stime=etime;
													java.util.Date NewDate = new SimpleDateFormat("yyyy-MM-dd").parse(edate);
													long dateMillisx = NewDate.getTime();
													long dayInMillisx = 1000 * 60 * 60 *24;
													dateMillisx = dateMillisx - dayInMillisx;
													NewDate.setTime(dateMillisx);
													Format formatter5 = new SimpleDateFormat("yyyy-MM-dd");
													sdate = formatter5.format(NewDate);
													ssdate=sdate;
													eedate=edate;
													
													sdate=sdate+stime;
													edate=edate+etime;
													sql3="select * from t_veh"+rst.getString("VehicleCode")+" where concat(TheFieldDataDate,TheFieldDataTime) >='"+sdate+"' and concat(TheFieldDataDate,TheFieldDataTime)<='"+edate+"' ";
													System.out.println("sql3: "+sql3);
													ResultSet rst3=st3.executeQuery(sql3);
													int cn=1,dis=0,d1=0,d2=0;
													oscount=0;
													account=0;
													dccount=0;
													stcount=0;
													while(rst3.next())
													{
													
													
													String stamp=rst3.getString("TheFiledTextFileName");
													
													if(stamp.equals("OS"))
													{
														oscount++;
													}
													
													if(stamp.equals("AC"))
													{
														if (rst3.getInt("Distance")>5)
														{
														account++;
														
														}
													
													}
													
													if(stamp.equals("DC"))
													{
														if (rst3.getInt("Distance")<120)
														{
													
														dccount++;
														}
													}
													
													if(stamp.equals("SI"))
													{
														if(cn==1)
														{
															 d1=rst3.getInt("Distance");
															 cn++;
														}
														else
														{
															 d2=rst3.getInt("Distance");
														}
													}
													dis=d2-d1;
													}
													%>
													<td class="bodyText"><div align="right"></div><%=oscount%></td>
													<td class="bodyText"><div align="right"></div><%=account%></td>
													<td class="bodyText"><div align="right"></div><%=dccount%></td>
													<td class="bodyText"><div align="right"></div>0</td>
													<td class="bodyText"><div align="right"></div><%=dis%></td>
													<% 
													/********End code for OS, AC, DC count time ***********/
													%>
													<td class="bodyText"><div align="left"></div>
													<%
													/******************code for stops***************/
													
													sql1="select *, (HOUR(TheFieldDataTime)*60+MINUTE(TheFieldDataTime)+SECOND(TheFieldDataTime)/60) as time1 from t_veh"+rst.getString("VehicleCode")+" where TheFiledTextFileName='SP' and concat(TheFieldDataDate,TheFieldDataTime) >='"+sdate+"' and concat(TheFieldDataDate,TheFieldDataTime)<='"+ edate+"' order by concat(TheFieldDataDate,TheFieldDataTime) asc";
													System.out.println("sql1:"+sql1);
													ResultSet rst4= st4.executeQuery(sql1);
													stcount=0;
													while(rst4.next())
													{
													System.out.println("in rst4...");
													sql2="select *,(HOUR(TheFieldDataTime)*60+MINUTE(TheFieldDataTime)+SECOND(TheFieldDataTime)/60) as time2 from t_veh"+rst.getString("VehicleCode")+" where TheFiledTextFileName='ST' and concat(TheFieldDataDate,TheFieldDataTime) >='"+sdate+"' and concat(TheFieldDataDate,TheFieldDataTime)<='"+edate+"' and TheFieldDataDate='"+rst4.getString("TheFieldDataDate")+"' and (HOUR(TheFieldDataTime)*60+MINUTE(TheFieldDataTime)+SECOND(TheFieldDataTime)/60) > "+Double.parseDouble(rst4.getString("time1"))+" and abs(LatinDec - "+rst4.getString("LatinDec")+") <=0.5 order by concat(TheFieldDataDate,TheFieldDataTime) asc limit 1"; 
													System.out.println("sql2:"+sql2);
													ResultSet rst5= st5.executeQuery(sql2);
													if(rst5.next())
													{
													if(rst5.getDouble("time2")-rst4.getDouble("time1") >=Integer.parseInt(session.getAttribute("stop11").toString()))
													{
													double duration=(Double.parseDouble(rst5.getString("time2"))-Double.parseDouble(rst4.getString("time1")));
													int hrs=(int)duration/60;
													int min=(int)duration%60;
													String html2="ST "+rst4.getString("TheFieldDataDate")+"  "+rst4.getString("TheFieldDataTime")+"<br> "+hrs+"hrs "+min+"min  "+rst4.getString("TheFieldSubject");
													stcount++;
													}
													}
													}
													out.print(stcount);
													
													/******************code for stops***************/
													%>
													
													</td>
													<td class="bodyText"><div align="left"></div>
													<%
													/**************** code for Night Driving ***************/
													sql="select * from t_veh"+rst.getString("VehicleCode")+"_nd where concat(FromDate,FromTime) >='"+sdate+"' and concat(FromDate,FromTime)<='"+edate+"' order by concat(FromDate,FromTime) asc";
													ResultSet rst6=st6.executeQuery(sql);
													if(rst6.next())
													{
													out.print("Yes");
													}
													else
													{
													out.print("No");
													}
													/***********end of Code for Night Driving ************/
													
													%>
													</td>
													
													</tr>
													<%
													}
													
													
													}
													
													}//end of while rs
													}//end of main while spl
													%>
											
											</tbody>
									<tfoot>
										<tr>
											<tr><th>Veh. </th>
											<th> Transporter </th>
											<th>Updated </th>
											<th>Waiting Time</th>
											<th>OS</th>
											<th>AC</th>
											<th>DC</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>ND</th>
											</tr>
									</tfoot>
							</table>
							<%
							}catch(Exception e)
							{
								out.print("Exception --->"+e);
							}
							finally
							{
							
							}
							
							%>
							</div>
							</div>
							</div>
							</section>
							</div>
							</div>
							</div>
						<%
						}
						%>	

<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Vehicle Available Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0;  
			String showList=""+ColumnList;    
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSetDemo.jsp">  <!-- change this to ReSet.jsp for conversion  -->
			<div class="modal-body">
			
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk &nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody>
							<%
							StringTokenizer stcol = new StringTokenizer(showList,","); 
							while(stcol.hasMoreTokens()){
							%>
							<tr>
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
								title: 'Vehicle available Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Vehicle available Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Vehicle available Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Vehicle available Report',
                                exportOptions: { columns: [<%=setSequence%> ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Vehicle available Report',
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