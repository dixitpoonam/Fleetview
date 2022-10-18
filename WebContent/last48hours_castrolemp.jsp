<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="headernew1.jsp"%>
 <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> 
<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Tracking System</title>
<!-- Included our css file start-->
<link rel="stylesheet" type="text/css"
	href="css/table/dataTables.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/responsive.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/buttons.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="css/table/rowGroup.bootstrap5.min.css">
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
		//alert("in ajax call.."+(nodes.length/2));
		/* ajaxRequest.open("GET", "ReSetDemo.jsp?call=SetDefault&reportno=000&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true); */
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}


</script>
<script type="text/javascript">
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
 
</script>

</head>

<body onload="ondemand()">
	<input type="hidden" id="PageName" name="PageName"
		value="<%=PageName%>" />

	<%
int colcount=0;   //special code for detailed view
String setSequence ="";

String detailViewSequence = "";
		
String ColumnList="";
boolean setDefFlag=false;
				
Connection conn=null, conn1=null;
Statement st2,st,st3,st4,st5;
int cntos,cntra,cntrda,cntdt,cntst,cntrh,cntcd,cntnd,cntfc,cntft,cntfa;
Double cntavg=0.00;
String vehregno="",transporter="",empname="",empcode="";

String datex1, datex2;
Statement st20 = null;
Statement st21 = null;

%>
	<%
cntos=0;
cntra=0;
cntrda=0;
cntdt=0;
cntst=0;
cntrh=0;
cntcd=0;
cntnd=0;
cntfa=0;
cntft=0;
cntfc=0;


//code to get system date as data2 and yesterdays date as a data1.

java.util.Date NewDate =new java.util.Date();
long dateMillis = NewDate.getTime();
long dayInMillis = 1000 * 60 * 60 *24;
dateMillis = dateMillis - dayInMillis;
NewDate.setTime(dateMillis);
Format NewFormatter = new SimpleDateFormat("yyyy-MM-dd");
Format NewFormatter1 = new SimpleDateFormat("dd-MMM-yyyy");

String data2 = NewFormatter.format(NewDate);
String data4 = NewFormatter1.format(NewDate);
long dayInMills1=1000*60*60*24;
NewDate.setTime(dateMillis-dayInMills1);
String data1 = NewFormatter.format(NewDate);
String data3 = NewFormatter1.format(NewDate);
session.setAttribute("data1",data1);
session.setAttribute("data2",data2);
session.setAttribute("data3",data3);
session.setAttribute("data4",data4);
String user,usertypevalue;
user=session.getAttribute("user").toString();
usertypevalue=session.getAttribute("usertypevalue").toString();
//database connectivity to get the transporter wise report.

 try
{ 
	
	 conn = fleetview.ReturnConnection();
	conn1 = fleetview.ReturnConnection1(); 
	
	st = conn.createStatement();
	st2 = conn1.createStatement();
	st3 = conn.createStatement();
	st4 = conn1.createStatement();
	st5 = conn1.createStatement();
	session.setAttribute("reportno","Report No:4.0");
	session.setAttribute("reportname","Last 48 Hours Exception Report For Full Fleet");
%>
	<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


		    
	    st20 = conn.createStatement();
	    st21 = conn.createStatement();
		

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
	<input type="hidden" id="setDefFlag" name="setDefFlag"
		value="<%=setDefFlag%>">
	
	<% 
	String TwoDaysAgo = session.getAttribute("48hrsback").toString().substring(0,11) + " 00:00:00";
	String Today = session.getAttribute("today").toString()+" 23:59:59";
	%>

	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">
								Last 48 Hour Exception Report For Full Fleet <br><br>Exception
								Analysis Report For AVL Mobile Eye 2000 for
								<%=username%>
								For the Period: <%=TwoDaysAgo %>  to
								<%=Today%></h3>
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

			</div>

			<table id="example2" class="table table-bordered">
				<thead>
					<tr>
						<td colspan=3 align=center><b>Parameters considered for
								the Report</b></td>
					</tr>
				</thead>
				<tr>
					<td>1. OverSpeed : 80 kmph/10 Secs</td>
					<td>2. Rapid Acceleration :30 kmph/Secs</td>
					<td>3. Rapid Deceleration :30 kmph/Secs</td>
				</tr>
				<tr>
					<td>4. Night Driving : Beyond 23:00:00 To 05:00:00</td>
					<td>5. Continuous Driving :>> 140 Mins With Stoppages less than 20</td>
					<td>6. Stoppages :> 20Mins</td>

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
											<th>Sr.</th>
											<th>Veh.</th>
											<th>Employee Name</th>
											<th>Employee Code</th>
											<th>transporter</th>
											<th>Date</th>
											<th>Location</th>
											<th>OS</th>
											<th>RA</th>
											<th>RD</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>Run Hrs.</th>
											<th>ND</th>
										</tr>
									</thead>
									<tbody>
<%	
	String ss=session.getAttribute("VehList").toString();
	StringTokenizer s= new StringTokenizer(ss,",");
	String aa,tbname;
	int i=1;
	while(s.hasMoreTokens())
	{
	aa=s.nextElement().toString();
	aa=aa.replace(")","");
	aa=aa.replace("(","");
	tbname="t_veh"+aa+"_ds";
	if(!aa.equals("0"))
	{
	String sql="select * from t_vehicledetails where vehicleCode='"+aa+"'";
	System.out.println("vehicle details query:"+sql);
	ResultSet rst=st.executeQuery(sql);
		if(rst.next())
		{
			vehregno=rst.getString("VehicleRegNumber");
			transporter=rst.getString("OwnerName");
			empname=rst.getString("EmpName");
			empcode=rst.getString("EmpCode");
		}
		if(fleetview.checkUserBlocked(transporter).equals("Yes"))
		{
			%>
			<tr>
			<td align="right"><%=i %></td>
			<td align="left"> <%=vehregno %></td>
			<td align="left"><%=empname %></td>
			<td align="right"><%=empcode %></td>
			<td align="left"> <%=transporter %></td>
			<td align="left">Blocked</td>
			<td align="left">Access denied for <%=transporter%></td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			</tr>
			<%
			i++;	
		}
		else
		{
		sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
		System.out.println("Query:"+sql);
		ResultSet rst1=st2.executeQuery(sql);
		if(rst1.next())
		{
		%>
		<tr>
		<td align="right"><%=i %></td>
		<td align="left"><a href="customreportemp.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
		<td align="left"><%=empname %></td>
		<td align="right"><%=empcode%></td>
		<td align="left"> <%=transporter %></td>
		<td align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate")) %></td>

		<td align="left">
		<%
		String loc=rst1.getString("Location");
		if(loc.equals("-"))
		{
			out.print(loc);
		}
		else
		{
			out.print(fleetview.ShowOnMapOnlyByLocation(loc,aa,rst1.getString("TheDate")));
		}
		
		%>
		</td>
		<%
		ResultSet rstcounts=fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,data1,data2);
		if(rstcounts.next())
		{
		%>
		<td align="right">
		<%
		int os=rstcounts.getInt(1);
		cntos+=os;
		if(os >0)
		{
			%>
			<a href="detail_os.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=os%> </a> 
			<%				
		}
		else
		{
			out.print(os);
		}
		%>
		</td>
		<td align="right">
		<%
		int ra=rstcounts.getInt(2);
		cntra+=ra;
		if(ra>0)
		{
			%>
			<a href="detail_ra.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidAcceleration"> <%=ra%> </a> 
			<%
		}
		else
		{
			out.print(ra);
		}
		
		%>
		</td>
		<td align="right">
		<%
		int rd=rstcounts.getInt(3);
		cntrda+=rd;
		if(rd>0)
		{
			%>
			<a href="detail_rd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=rd%> </a> 
			<%
		}
		else
		{
			out.print(rd);
		}
		
		%>
		</td>
		<td align="right">
		<%
		int cd=rstcounts.getInt(4);
		cntcd+=cd;
		if(cd>0)
		{
			%>
			<a href="detail_cd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=ContinuousDriving"> <%=cd%> </a> 
			<%
		}
		else
		{
			out.print(cd);
		}
		
		%>
		</td>
		<td align="right">
		<%
		int dt=rstcounts.getInt(5);
		cntdt+=dt;
		out.print(dt);
		%>
		</td>
		
		<td align="right">
			<%
		int stsp=rstcounts.getInt(6);
		cntst+=stsp;
		if(stsp>0)
		{
			%>
			<a href="detail_stops.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=stsp%> </a> 
			<%
		}
		else
		{
			out.print(stsp);
		}
		%>
		</td>
		
		<td align="right">
		<%
		
		int rh=rstcounts.getInt(7);
		cntrh+=rh;
		out.print(rh);
		%>
		</td>
		
		<td align="left">
		<%
		if(fleetview.isNightDrivingFormExceptionsForDateRange(aa,data1,data2).equals("Yes"))
		{
			cntnd++;
			%>
			<a href="detail_nd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=NightDriving"> Yes </a> 
			<%
		}
		else
		{
			out.print("No");
		}
		%>
		</td>
		</tr>
		<%
		i++;
		}  //rstcounts
		} //rst1--if block
		else
		{
			%>
			<tr>
			<td align="right"><%=i %></td>
			<td align="left"><%=vehregno %></td>
			<td align="left"><%=empname %></td>
			<td align="right"><%=empcode %></td>
			<td align="left"><%=transporter %></td>
			<td align="left">No DATA</td>
			<td align="left">No DATA</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="right">0</td>
			<td align="left">No</td>
			</tr>
			<%
			i++;
		} //else block inside blocked else part
	}  //user blocked--else part
	}  //if aa=="0"
	}   //while s.hastokens
	}catch(Exception e)
	{
		System.out.println("Exception" +e);
	}
	finally
	{
			conn.close();
			conn1.close();
			try
			{fleetview.closeConnection1();}
			catch(Exception e)
			{}

			try
			{fleetview.closeConnection();}
			catch(Exception e)
			{}
	}
%>
</tbody>
<tr>
<td>Total</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td align="right"><%=cntos %></td>
<td align="right"><%=cntra %></td>
<td align="right"><%=cntrda %></td>
<td align="right"><%=cntcd %></td>
<td align="right"><%=cntdt %></td>

<%
//NumberFormat nf1=NumberFormat.getInstance();
//nf1.setMaximumFractionDigits(2);
//nf1.setMinimumFractionDigits(2);
%>

<td align="right"><%=cntst %></td>
<td align="right"><%=cntrh %></td>
<td align="right"><%=cntnd %></td>
</tr>


<tfoot>
<tr>
<th>Sr.</th>
											<th>Veh.</th>
											<th>Employee Name</th>
											<th>Employee Code</th>
											<th>transporter</th>
											<th>Date</th>
											<th>Location</th>
											<th>OS</th>
											<th>RA</th>
											<th>RD</th>
											<th>CD</th>
											<th>DT</th>
											<th>Stops</th>
											<th>Run Hrs.</th>
											<th>ND</th>
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
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Custom Column Selection for
						Last 48 Hour Exception Report</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<%
			int i=0; 
			 
			String showList=""+ColumnList;     
			%>
				<form id="customselect" name="customselect" method="get"
					action="ReSet.jsp">
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
							%><tr>
									<td>
										<div align="left">
											<input type="text" id="net_id1<%=i %>" name="net_id1<%=i %>"
												style="width: 70px; padding: 4px 5px 2px 5px; border: none; text-align: right; font: normal 11px Arial, Helvetica, sans-serif;"
												value="<%=i %>" readonly />
										</div> <input type="checkbox" name="check<%=i %>" id="check<%=i %>" />
									</td>
									<td><input type="text" name="clname<%=i %>"
										id="clname<%=i %>" value="<%=stcol.nextToken()%>"
										readonly="readonly" style="border: none" /></td>
								</tr>
								<%i++;}%>
							</tbody>
						</table>

						<input type="hidden" name="checkedNumber" id="checkedNumber"
							value="<%=i %>" /> <input type="hidden" name="reportno"
							id="reportno" value="<%=reportno%>"> <input type="hidden"
							id="tableheaders" name="tableheaders" value=""> <input
							type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" name="pagename" id="pagename"
							value="<%=PageName%>">


					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Submit</button>

						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
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
								title: 'Last 48 Hour Exception Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Last 48 Hour Exception Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Last 48 Hour Exception Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Last 48 Hour Exception Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Last 48 Hour Exception Report',
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
</jsp:useBean>
