<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="headernew1.jsp" %> 

<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
	

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

<script language="javascript">
	function fun1()
	{	
		document.lastfullfleet.submit();
	}	
	function s1(){ alert("Last 1 day");
	}
	function s2(){ alert("Last 2 day");
	}
	function s3(){ alert("Last 7 day");
	}
	function s4(){ alert("Last 15 day");
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


function showhide1()
{
	  //alert("In Fun");
	  var counter=document.getElementById("countermore").value;
	  //alert(counter);
	  var tdx=document.getElementById("tdx").value;
	  var ta,tb,tc,td,te,tf,tg,th,ti,tj,tk,tl,taa,tbb,tcc;
	  if(tdx=="More Info")
	  {
	    taa=document.getElementById("taa");
		taa.style.display="";
		tbb=document.getElementById("tbb");
		tbb.style.display="";
		tcc=document.getElementById("tcc");
		tcc.style.display="";
	    for(i=1;i<=counter;i++)
		{	
		    document.getElementById("ta"+i).style.display="";
		    document.getElementById("tb"+i).style.display="";
		    document.getElementById("tc"+i).style.display="";
		    document.getElementById("type").value="More Info";
			document.getElementById("tdx").value="Hide Info";
		}
	  }
	  else
	  {
		  //alert("in else");
		    taa=document.getElementById("taa");
			taa.style.display="none";
			tbb=document.getElementById("tbb");
			tbb.style.display="none";
			tcc=document.getElementById("tcc");
			tcc.style.display="none";
		    for(i=1;i<=counter;i++)
			{	
			    document.getElementById("ta"+i).style.display="none";
			    document.getElementById("tb"+i).style.display="none";
			    document.getElementById("tc"+i).style.display="none";
				document.getElementById("tdx").value="More Info";
				 document.getElementById("type").value="Hide Info";
			}
		  
	  }
}

</script>
 
</head>
<body> 
<%
	fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	String detailViewSequence="";
	String setSequence ="";
	
	String usertypevalue=session.getAttribute("usertypevalue").toString();
	String radioButton= request.getParameter("radio1");
	 System.out.println("radioButton ::"+radioButton);
	 	if(null==radioButton)
		{
		   radioButton="Last 1 Day";
		}
	 Format formatter = new SimpleDateFormat("dd-MMM-yyyy");
%>
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0"><%=usertypevalue %> Exception Report For Full Fleet</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">

							<!-- <button id="detailedView"
								class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0">
								Detailed View</button> -->
								
							

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
			<form name="lastfullfleet" id="lastfullfleet" method="post">
				<div class="row col-12">
				<div class="col-md-3">
				    <input type="radio" name="radio1" value="Last 1 Day" <% if(radioButton.equals("Last 1 Day")) { out.print("CHECKED"); } %> onclick="fun1();" >Last 1 Day
				</div>
				<div class="col-md-3">
					<input type="radio" name="radio1" value="Last 2 Days" <% if(radioButton.equals("Last 2 Days")) { out.print("CHECKED"); } %> onclick="fun1();" >Last 2 Days
				</div>	
				<div class="col-md-3">
					<input type="radio" name="radio1" value="Last 7 Days"  <% if(radioButton.equals("Last 7 Days")) { out.print("CHECKED"); } %> onclick="fun1();" >Last 7 Days
				</div>	
				<div class="col-md-3">
				    <input type="radio" name="radio1" value="Last 15 Days" <% if(radioButton.equals("Last 15 Days")) { out.print("CHECKED"); } %> onclick="fun1();" >Last 15 Days
				</div>
				</div>
				<br>
			</form>
			<%
		    System.out.println("button:"+request.getParameter("button"));
		    if(request.getParameter("button")!=null){
		    	String Selection = request.getParameter("basicSelect");
		    	System.out.println("selection:"+Selection);
		    }
		    %>
		    <div align="center">
			<table id="example2" class="table table-bordered">
			<tr>
				<th colspan="25">
				<div align="center">Parameters considered for the Report</div>
				</th>
			</tr>
			<tr>
				<td>
				<div align="center">1. OverSpeed : <%=session.getAttribute("overspeed").toString() %>
				</div>
				</td>
				<td>
				<div align="center">2. Rapid Acceleration :<%=session.getAttribute("racc").toString()%></div>
				</td>
				<td>
				<div align="center">3. Rapid Deceleration :<%=session.getAttribute("rdcc").toString()%></div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="center">4. Night Driving : <%=session.getAttribute("ndri").toString() %>
				</div>
				</td>
				<td>
				<div align="center">5. Continuous Driving :><%=session.getAttribute("cdri").toString() %></div>
				</td>
				<td>
				<div align="center">6. Stoppages :<%=session.getAttribute("stop").toString() %></div>
				</td>
			</tr>
		</table></div>
<br>
		                   <b>Note:'Yes' in Average Speed Considered Column indicates Average speed is considered in calculation of Run hrs</b><br>
		                   <br> 
		    <% 	if(radioButton.equals("Last 1 Day"))	
		     	{
		    	
		    	/* out.println("<script>  s1();</script>"); */%>
	        <%-- <h4 align="center"><%=usertypevalue %>Last 1 Day Exception Report For Full Fleet</h4> --%>
		    	<%Connection conn=null, conn1=null;
		      	  Statement st1, st2, st, st3, st4, st5, st15,stmain11,stt,st7,st6;
		          int cntos,cntra,cntrda,cntdt,cntst,cntcd,cntnd,cntfc,cntdisconn,cntft=0,cntfa=0,cntndpre,cntndpost,cntndk=0,disk=0;
		          double cntrh,cntavgos,cntavgra,cntavgrd,cntosdur;
		          double stopdur,totstopdur,cntrating;
		          Double cntavg=0.00;
		          String vehregno="-",transporter="-";
		          
		          setSequence = "0,1,2,3,4,5,6,7,8";
		          detailViewSequence = "9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26";
		          
		          int temp=1;
		     	 int temp1=1;
		     	 int temp2=1;
		     	 int temp3=1;
		     	 int nd_pri=0;
		     	String str_os="("; 
		    	String str_os1="("; 
		    	String str_os2="("; 
		    	String str_os3="("; 
		     	// int cntndpost=0;
		     	 double timevikram=0.0,tot_dur=0.0;
		          %>
		          <%
		          cntdisconn=0;
		          cntrating=0;
		          cntos=0;
		          cntra=0;
		          cntrda=0;
		          cntdt=0;
		          cntst=0;
		          cntrh=0.0;
		          cntcd=0;
		          cntnd=0;
		          cntfc=0;
		          cntosdur=0;
		          stopdur=0.0;
		          totstopdur=0.0;
		          cntavgos=0.0;
		          cntavgra=0.0;
		          cntavgrd =0.0; //code to get system date as data2 and yesterdays date as a data1.
		          cntft=0;
		          cntfa=0;
		          cntavg=0.0;
		          cntndpre=0; 
		          cntndpost=0;
		          
		          //code to get system date as data2 and yesterdays date as a data1.

		          java.util.Date NewDate =new java.util.Date();
		          long dateMillis = NewDate.getTime();
		          long dayInMillis = 1000* 60 *60 *24;
		          dateMillis = dateMillis - dayInMillis;
		          NewDate.setTime(dateMillis);
		          System.out.println("Dataaaaaaaaaaaa Here New Date>>>>>>"+NewDate);
		          Format NewFormatter = new SimpleDateFormat("yyyy-MM-dd");
		          Format NewFormatter1 = new SimpleDateFormat("dd-MMM-yyyy");
		          String data1 = NewFormatter.format(NewDate);
		          String data2 = NewFormatter.format(NewDate);
		          String data3 = NewFormatter1.format(NewDate);
		          String data4 = NewFormatter1.format(NewDate);
		          session.setAttribute("data1",data1);
		          session.setAttribute("data2",data2);
		          session.setAttribute("data3",data3);
		          session.setAttribute("data4",data4);
		          String user;
		          user=session.getAttribute("user").toString();
		          usertypevalue=session.getAttribute("usertypevalue").toString();
		          //database connectivity to get the transporter wise report.
		         try
		         {
			         conn = fleetview.ReturnConnection();
			         conn1 = fleetview.ReturnConnection1();
			         st=conn.createStatement();
			         st=conn.createStatement();
			         st2=conn1.createStatement();
			         st3=conn1.createStatement();
			         st4=conn1.createStatement();
			         st5=conn.createStatement();
			         st6=conn1.createStatement();
			         st7=conn1.createStatement();
			     	 st15=conn1.createStatement();
			     	 stmain11 = conn1.createStatement();
			     	 stt = conn1.createStatement();
			         //st15=conn1.createStatement();
			         session.setAttribute("reportno","Report No:3.0");
			         session.setAttribute("reportname","Last 1 Day Exception Report For Full Fleet");
			        
		             %>
		
			<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table id="example1" class="table table-bordered">
								<thead>
			              <tr>
							<th align="center">Sr.</th>
							<th align="center">Vehicle Reg no.</th>
							<th align="center">Transporter</th>
							<th align="center">Date</th>
							<th align="center">Location</th>
							<th align="center">OS</th>
							<th align="center">OS Dur</th>
							<th align="center">RA</th>
							<th align="center">RD</th>
							<th align="center">CD</th>
							<th align="center">DT</th>
							<th align="center" colspan="1">Rating</th>
							<th align="center" id="taa" style="display: none;">Avg OS Dur/100km</th>
							<th align="center" id="tbb" style="display: none;">Avg RA/100km</th>
							<th align="center" id="tcc" style="display: none;">Avg RD/100km</th>
							<th align="center">FT</th>
							<th align="center">FA</th>
							<th align="center">FC</th>
							<th align="center">AVG</th>
							<th align="center">Stops</th>
							<th align="center">Run Hrs.</th>
							<th align="center">AVG Speed</th>
							<th align="center">ND</th>
							<th align="center">ND Dur(Hrs)</th>
							<th align="center">ND Km</th>
							<th align="center">ND Int</th>
							<th align="center">ND Reason</th>
							<th align="center">DayStop <br>(Hrs)</th>
							<th align="center">DC</th>
							<th align="center">Total DC Km</th>

						</tr></thead><tbody>
						<!-- Get The Data From the Database and show it -->

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
			String sql="select * from t_vehicledetails where vehicleCode='"+aa+"' ";
			ResultSet rst=st.executeQuery(sql);
				if(rst.next())
				{
					vehregno=rst.getString("VehicleRegNumber");
					transporter=rst.getString("OwnerName");
				}
				if(fleetview.checkUserBlocked(transporter).equals("Yes"))
				{
					%>
						<tr>
							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><%=vehregno %></td>
							<td style="text-align: left"><%=transporter%></td>
							<td style="text-align: left">Blocked</td>
							<td style="text-align: left">Access denied for <%=transporter%></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td id="ta<%=i %>" style="display: none;">-</td>
							<td id="tb<%=i %>" style="display: none;">-</td>
							<td id="tc<%=i %>" style="display: none;">-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
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
					String dttime="",location="",loc="";
					sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
				//	 System.out.println("Location query sql===>"+sql);
					ResultSet rst1=st2.executeQuery(sql);
				if(rst1.next())
				{
					
					 loc=rst1.getString("Location");
				//	 System.out.println("loc===>"+loc);
					if(!loc.equalsIgnoreCase("No data") && !("-".equalsIgnoreCase(loc)))
					{
						 dttime=loc.substring(0,19);
					//	 System.out.println("dttime===>"+dttime);
						 location=loc.substring(19);
					//	 System.out.println("location===>"+location);
					}
					else{
					//	 System.out.println("IN Else Location ===>");
						location=loc;
						
						dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
						
						/*System.out.println("location"+location);
						String sqldate="Select * from db_gps.t_veh"+aa+" where thefielddatadate='"+data2+"' order by thefielddatatime desc limit 1";
						ResultSet rstdate=st2.executeQuery(sqldate);
						if(rstdate.next())
						{
							dttime=rstdate.getString("thefielddatadatetime");
							System.out.println("dttime"+dttime);
						}
						else{
							dttime=data2;
							System.out.println("dttime"+dttime);
						}*/
						
					}
				%>
						<tr>

							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><a
								href="customreport.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
							<td style="text-align: left"><%=transporter %></td>
							<td style="text-align: left"><%=dttime %></td>
							<td>
							<div align="left">
							<%
			
				
				if(location.equalsIgnoreCase("No data"))
				{
				//	System.out.println("Final location==>"+location);
					out.print(location);
				}
				else
				{
					out.print(fleetview.ShowOnMapOnlyByLocation(location,aa,rst1.getString("TheDate")));
				}
			
				%>
							</div>
							</td>
							<%
				ResultSet rstcounts=fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,data1,data2);
				if(rstcounts.next())
				{
				%>
							<td>
							<div align="right">
							<%
				int os=rstcounts.getInt(1);
				cntos+=os;
				if(os >0)
				{
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>"> <%=os%>
							</a> <%				
				}
				else
				{ 
					out.print(os);
				}
				%>
							</div>
							</td>
							<%
				double osavg =0.0;
				double osduration=0.0;
				String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and concat(ToDate,' ',ToTime) <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
			//	System.out.println("sqlos--->"+sqlos);
				ResultSet rstos=st4.executeQuery(sqlos);
				if(rstos.next())
				{
					osduration=rstos.getDouble("Duration");
			//		System.out.println(" OS Duration--->"+osduration);
				}
				cntosdur= cntosdur + osduration;
				%>
							<td>
							<div align="right"><%=osduration%></div>
							</td>
							<td>
							<div align="right">
							<%
				int ra=rstcounts.getInt(2);
				cntra+=ra;
				if(ra>0)
				{ 
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=ra%> </a> <%
				}
				else
				{
					out.print(ra);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				int rd=rstcounts.getInt(3);
				cntrda+=rd;
				if(rd>0)
				{
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=rd%> </a> <%
				}
				else
				{
					out.print(rd);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				int cd=rstcounts.getInt(4);
				cntcd+=cd;
				if(cd>0)
				{
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=cd%> </a> <%
				}
				else
				{
					out.print(cd);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				double dt=rstcounts.getDouble(5);
				cntdt+=dt;
				out.print(dt);
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
							NumberFormat nfrating=NumberFormat.getInstance();
							nfrating.setMaximumFractionDigits(2);
							nfrating.setMinimumFractionDigits(2);			
				double rating=0.0;
			  	if(dt>0.0)
			  	{
			  	double RD=((rd/dt)*100);
			  	double RA=((ra/dt)*100);	
			  	double OS=((osduration/10/dt)*100);
			  	rating=RA+RD+OS;
			  	
			  	out.print(nfrating.format(rating));
			  	}
			  	else{
			  		out.print(0.0);
			  	}
			  	cntrating=rating+cntrating;
			  	%>
							</div>
							</td>

							<td  id="ta<%=i %>" style="display: none;" >
							<div align="right">
							<%
					System.out.println("IN OS Avg");
					NumberFormat nfos=NumberFormat.getInstance();
					nfos.setMaximumFractionDigits(2);
					nfos.setMinimumFractionDigits(2);
					
					//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);
					
						if(osduration> 0.0 && dt >0.0)
						{
							System.out.println("distance --->"+dt);
							osavg=(osduration*10)/dt;
							System.out.println("OS avg--->"+osavg);
							out.print(nfos.format(osavg));
							//out.print(osavg);
							//out.print(osavg);
						}
						else{
							osavg=0.0;
							out.print(nfos.format(osavg));
							//out.print(osavg);
						}
						cntavgos+=osavg;
					
					
					%>
							</div>
							</td>
							<td  id="tb<%=i %>" style="display: none;">
							<div align="right">
							<% 
				NumberFormat nfra=NumberFormat.getInstance();
				nfra.setMaximumFractionDigits(2);
				nfra.setMinimumFractionDigits(2);
				double raavg =0.0;
				if(ra>0 && dt>0.0 )
				{
					System.out.println("RA --->"+ra);
					raavg= (ra/dt)*100;
					System.out.println("RA avg--->"+raavg);
					out.print(nfra.format(raavg));
					//out.print(raavg);
				}
				else  //if(dt==0.0 && ra>0 ||ra==0) 
				{ 
					raavg= 0.0;
					out.print(nfra.format(raavg));
				}
				cntavgra+=raavg;
				%>
							</div>
							</td>
							<td id="tc<%=i %>" style="display: none;">
							<div align="right">
							<% 
				NumberFormat nfrd=NumberFormat.getInstance();
				nfrd.setMaximumFractionDigits(2);
				nfrd.setMinimumFractionDigits(2);
				double rdavg =0.0;
				
				if(rd>0 && dt>0.0)
				{
					System.out.println("RD -->"+rd);
					rdavg= (rd/dt)*100;
					System.out.println("RD avg--->"+rdavg);
					out.print(nfrd.format(rdavg));
					//out.print(rdavg);
					
				}
				else //if(dt==0.0 && rd>0 ||rd==0 )
				{
					rdavg= 0.0;
					out.print(nfrd.format(rdavg));
					//cntavgrd+=rdavg;
				}
				cntavgrd+=rdavg;
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
				int ft=0;
				try{
					String sql4="select count(*) as fcnt from t_vehft where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
					ResultSet rs4= st2.executeQuery(sql4);
					if(rs4.next())
					{  
						ft=rs4.getInt("fcnt");
					}
					}catch (Exception e) {
						System.out.print("Exception--->"+e);
					}
				//int ft=rstcounts.getInt(9);
				cntft+=ft;
				if(ft >0)
				{
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=ft%> </a> <%				
				}
				else
				{
					out.print(ft);
				}
				%>
							</div>
							</td>


							<td>
							<div align="right">
							<%
				int fa=0;
				try{
					String sql4="select count(*) as fcnt from t_vehfa where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
					ResultSet rs4= st2.executeQuery(sql4);
					if(rs4.next())
					{  
						fa=rs4.getInt("fcnt");
					}
					else{
						out.print(0);
					}
					}catch (Exception e) {
						System.out.print("Exception--->"+e);
					}
				//int fa=rstcounts.getInt(8);
				cntfa+=fa;
				if(fa >0)
				{
					%> <a
								href="showfueladd.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=fa%> </a> <%				
				}
				else
				{
					out.print(0);
				}
				%>
							</div>
							</td>

							<%
				if(fleetview.getUnitDescription(aa).equals("FUELFLOW"))
				{
					%>
							<td>
							<div align="right">
							<%
						
						int fcval=fleetview.getFuelConsumptionForDateRange(aa,data1,data2);
						cntfc=cntfc+fcval;
						out.print(fcval);
					%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
					NumberFormat nf=NumberFormat.getInstance();
					nf.setMaximumFractionDigits(2);
					nf.setMinimumFractionDigits(2);
					Double favgval=fleetview.getFuelAVGForDateRange(aa,data1,data2);
					cntavg=cntavg+favgval;
					out.print(nf.format(favgval));
					
					
					
					%>
							</div>
							</td>
							<%
				}
				else
				{
					%>
							<td>
							<div align="right">-</div>
							</td>
							<td>
							<div align="right">-</div>
							</td>
							<%
				}
				%>
							<td>
							<div align="right">
							<%
					System.out.println("IN stop");
				int stsp=rstcounts.getInt(6);
				cntst+=stsp;
				if(stsp>0)
				{
					if(temp3==1)
					 {
						 str_os3=aa;
						 temp3++;
					 }
						 else
				    str_os3=str_os3+","+aa; 
					
					
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>"> <%=stsp%>
							</a> <%
				}
				else
				{
					out.print(stsp);
				}
				
				
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
							NumberFormat nf = DecimalFormat.getNumberInstance();
							nf.setMaximumFractionDigits(2);
							nf.setMinimumFractionDigits(2);	
							nf.setGroupingUsed(false);
							double d=0.0;
							d=rstcounts.getDouble(11);
							 
								String runhrs =  nf.format(d);
								cntrh+= d;
								out.print(runhrs);
				%>
							</div>
							</td>
							<td>
							<div align="left">
							<%
				 
				try{
								
								
								String avgspeed="Select * from db_gpsExceptions.t_vehall_ds where vehcode='"+aa+"' and TheDate <='"+data2+"'  and  TheDate >='"+data1+"' and AvgSpeedConsidered='Yes' ";
								System.out.println("avgspeed==>"+avgspeed);
								ResultSet rstavg=st3.executeQuery(avgspeed);
								if(rstavg.next())
								{
									/*System.out.println("in avg speed");
									avgsped=rst1.getString("AvgSpeedConsidered");
									if(avgsped.equalsIgnoreCase("Yes"))
									{
										System.out.println("in Yes");*/
										out.print("Yes");
								}
									else{
										System.out.println("in NO");
										out.print("No");
									}
								//}
								//else{
									//out.print("No");
								// }
								}catch(Exception ea){
									System.out.println("Avg speed exception"+ea);
								}
								//System.out.println("out of avgspeed");
				//cntdisconn=cntdisconn+rstdisconn.getInt("cnt"); 
				%>
							</div>
							</td>
							<td style="text-align: right;">
							<%
							String time1 ="00:00:00";
							String time2="23:59:59";
					int cntnd11=fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
					if(cntnd11>0)
				{
					cntnd+=cntnd11;
					%> <a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=cntnd11%> </a> <%
				}
				else
				{
					out.print(0);
				}
				%>
							</td>
							<td style="text-align: right;">
							<%
							
							int count1=0;
							String Time="00:00:00";
							try
							{
								String sql1="select Sec_To_Time(SUM(Time_To_Sec(Duration))),SUM(Time_To_Sec(Duration)) from t_veh"+aa+"_nd where  FromDate between '"+data1+"' and '"+data2+"' order by fromdate asc";
								System.out.println(">>>>>>>>>>>>>>>>sql1:"+sql1);
								ResultSet rst11=stmain11.executeQuery(sql1);
								if(rst11.next())
								{
									
										//count=rst11.getInt("cnt");
										Time=rst11.getString(1);
									    System.out.println(">>>>>>>>>>>>>>>>Time:"+Time);
									    tot_dur=tot_dur+rst11.getDouble(2);
									    System.out.println(">>>>>>>>>>>>>>>>tot_dur:"+tot_dur);
								}
							}catch (Exception e) {
								System.out.println("Exception-->"+e);
								
							}
							if(Time==null||Time==" ")
							{
								Time="00:00:00";
							}
							try
							{
								StringTokenizer str=new StringTokenizer(Time,":");
			                     while(str.hasMoreTokens())
			                     {
			                    	 String test=str.nextToken();
			                    	 String test1=str.nextToken();
			                    	 Time=test+"."+test1;
			                    	 String test2=str.nextToken();
			                     }
			                     
			                     timevikram=timevikram+Double.valueOf(Time.trim()).doubleValue();

							}
							catch(Exception e)
							{
								System.out.println(">>>>>>>exception:"+e);
							}
							%>
							<%=Time %>
							</td>
							
				<% 			
				int cntnd12=fleetview.NightDrivingFormExceptionsForDateRange1(aa,data1,data2);
				%>
				<td style="text-align: right;">
				<%
				if(cntnd12>0)
				{
					cntndk+=cntnd12;
				%>			
					<%=cntnd12 %>
				<%
				}else
				{
					out.print(0);
				}
				%>
						
							</td>
							<td style="text-align: right;">
							<%
							
							int count=0;
							try
							{
								String sql1="select count(*) as cnt from db_gpsExceptions.t_veh"+aa+"_nd where  NDPreAuthorised='Yes' and FromDate>='"+data1+"' and FromDate <='"+data2+"' order by fromdate asc";
								ResultSet rst11=stmain11.executeQuery(sql1);
								if(rst11.next())
								{
									if(rst11.getInt("cnt")>0)
									{
										count=rst11.getInt("cnt");
										nd_pri=nd_pri+count;
									}
								}
							}catch (Exception e) {
								//System.out.println("Exception-->"+e);
								
							}
							
							%>
							<%=count %>
							</td>
						 <td>
		                                <div align="right">
		                                <% 
		                                try{
		                                        
		                                //      String sqlpost="select count(*) as Reason from db_gpsExceptions.t_ndpostintimation where NdStartDateTime >='"+data1+" "+time1+"' and NdEndDateTime <='"+data2+" "+time2+"' and VehRegNo='"+vehregno+"' ";
		                   
		                                        String sqlpost="select count(*) as Reason from db_gpsExceptions.t_ndpostintimation where NdStartDateTime between '"+data1+" "+time1+"' and '"+data2+" "+time2+"' and VehRegNo='"+vehregno+"'";
		                                
		                                ResultSet rsndpost=st7.executeQuery(sqlpost);
		                    
		                    if(rsndpost.next())
		                        {
		                                if(rsndpost.getInt("Reason")>0)
		                                {
		                                        %>
		                                                
		                        <!--    <a href="detail_nd.jsp?vid=< %=aa%>&vehno=< %=vehregno%>&data1=< %=data1+' '+time1 %>&data2=< %=data2+' '+time2 %>&pageType=NightDriving"> < %=rsndpost.getInt("Reason")%> </a> -->
		                            
		                            
		                         <!--    <a href="reason_details.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&data1=<%=data1+' '+time1 %>&data2=<%=data2+' '+time2 %>" > </a> --><%=rsndpost.getInt("Reason")%> 
		                                        <%
		                                }
		                                else{
		                                        out.print(0);
		                                }
		                        }
		                        else
		                        {
		                                out.print(0);
		                        }
		                        
		                    cntndpost=cntndpost+rsndpost.getInt("Reason");
		                                }catch(Exception ee)
		                                {
		                                 System.out.println("Exception in ND post intimation"+ee);
		                                }
		                                
		                                %>
		                         </div>
		                                </td>
						
							
							<td>
							<div align="right">
							<%
				
				String sqlstop="select sum(DayStopDurationinHrs) as stopduration from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
				ResultSet rststop=st3.executeQuery(sqlstop);
				
				if(rststop.next())
				{
					stopdur=rststop.getDouble("stopduration");
					totstopdur=totstopdur+rststop.getDouble("stopduration");
					%> <%=stopdur%> <%
				}
				else
				{
					out.print("0");
					
				}
				
				%>
							</div>
							</td>
		<%
							
					try{
					
				//String time1 ="00:00:00";
				//String time2="23:59:59";
				
				String sqldisconn="Select count(*) as cnt from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeFrom >='"+data1+" 00:00:00' and  OffTimeTo <='"+data2+" 23:59:59' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
				//System.out.println("sqldisconn==>"+sqldisconn);
				ResultSet rstdisconn=st5.executeQuery(sqldisconn);
				%>
				<td>
							<div align="right">
				<%
				if(rstdisconn.next())
				{
					if(rstdisconn.getInt("cnt")>0)
					{
						%>
						<!--  <a href="disconnectedDetailsReport.jsp?vehicleCode=<%=aa%>&VehicleRegNo=<%=vehregno%>&ownerName=<%=transporter%>&fromDateTime=<%=data1+" "+time1%>&toDateTime=<%=data2+" "+time2%>"> -->
						<a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>"><%=rstdisconn.getInt("cnt")%> </a> 
						<%
					}
					else{
						out.print(0);
					}
					
				}
				else
				{
					out.print(0);
				}
				
				cntdisconn=cntdisconn+rstdisconn.getInt("cnt");
				%>
				</div></td>
				<%

				// count total km of diss
				sqldisconn="Select Distance from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeFrom >='"+data1+" 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
				
				ResultSet rstdis=st5.executeQuery(sqldisconn);
				int diskm=0;
				while(rstdis.next())
				{
				  diskm=diskm+rstdis.getInt("Distance");
				}
				%>
				<td>
							<div align="right">
				<%
				
				if(diskm>0)
				{
					disk+=diskm;
					%>
				<a href="CustomReportDrillDown.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">	<%=diskm %></a>
				<%
				}
				else
				{
					out.print(0);
				}
				
				//... end of total km
				
				%>
				</div>
				</td>
				<%
				
				
				}catch(Exception ee)
				{
					System.out.println("Exception disconnection "+ee);
				}
				%>
						</tr>
						<%
				i++;
					//	System.out.println("value of i"+i);	
				}
			//	System.out.println("While");	
				}
				else
				{
					%>
						<tr>
							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><%=vehregno %></td>
							<td style="text-align: left">No DATA</td>
							<td style="text-align: left">No DATA</td>
							<td><div align="left">No DATA</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td id="ta<%=i %>" style="display: none;"><div align="right">0</div></td>
							<td id="tb<%=i %>" style="display: none;"><div align="right">0</div></td>
							<td id="tc<%=i %>" style="display: none;"><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td style="text-align: left">No</td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="left">No</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">00.00</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
							<td><div align="right">0</div></td>
						</tr>
						<%
					i++;
				}
			}
			}
			}
			

		NumberFormat nf1=NumberFormat.getInstance();
		nf1.setMaximumFractionDigits(2);
		nf1.setMinimumFractionDigits(2);
		%>
		</tbody><tbody><tr>				<td colspan="5"  align="right">Total</td>
							<td >
							<div align="right"><%=cntos %></div>
							</td>
							<td >
							<div align="right"><%=cntosdur %></div>
							</td>
							<td >
							<div align="right"><%=cntra %></div>
							</td>
							<td >
							<div align="right"><%=cntrda %></div>
							</td>
							<td >
							<div align="right"><%=cntcd %></div>
							</td>
							<td >
							<div align="right"><%=cntdt %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntrating)%></div>
							</td>
							<td  id="ta<%=i %>" style="display: none;">
							<div align="right"><%=nf1.format(cntavgos) %></div>
							</td>
							<td  id="tb<%=i %>" style="display: none;">
							<div align="right"><%=nf1.format(cntavgra) %></div>
							</td>
							<td  id="tc<%=i %>" style="display: none;">
							<div align="right"><%=nf1.format(cntavgrd) %></div>
							</td>
							<td  >
							<div align="right"><%=cntft %></div>
							</td>
							<td  >
							<div align="right"><%=cntfa %></div>
							</td>
							<td  >
							<div align="right"><%=cntfc %></div>
							</td>
							<td  >
							<div align="right"><%=nf1.format(cntavg) %></div>
							</td>
							<%if(cntst>0){ %>	
							<td >									
							<div align="right"><a href="#" onclick="javascript:window.open('total_stops.jsp?count=<%=cntst%>');"><%=cntst %></a></div>
							</td>
							<%}else {%>
							<td >
							<div align="right"><%=cntst %></div>
							</td>
							<%} %>
							<td >
							<div align="right"><%=nf1.format(cntrh) %></div>
							</td>
							<td >
							<div align="right"><b>-</b></div>
							</td>
							<td >
							<div align="right"><%=cntnd %></div>
							</td>
							<td >
							<%
							/*try
							{
								long millis = (long)tot_dur*1000;
								java.util.Date time = new java.util.Date(millis);
								String time1 = new SimpleDateFormat("HH:mm").format(time);
								
								System.out.println("******  "+tot_dur);
								System.out.println("******  "+millis);
								System.out.println("******  "+time1);
								
								String Sqltt="Select Sec_To_Time('"+tot_dur+"')";
								ResultSet rst=stt.executeQuery(Sqltt);
								System.out.println(">>>>>>>>>>>>>Sqltt:"+Sqltt);
								if(rst.next())
								{
								  tt=rst.getString(1);
								}
								else
								{
									tt="00:00:00";
								}
							}
							catch(Exception e)
							{
								System.out.println(">>>>>>>>>>>>>>>Exception:"+e);
							}
							try
							{
								StringTokenizer str=new StringTokenizer(tt,":");
			                     while(str.hasMoreTokens())
			                     {
			                    	 String test=str.nextToken();
			                    	 String test1=str.nextToken();
			                    	 tt=test+":"+test1;
			                    	 String test2=str.nextToken();
			                     }

							}
							catch(Exception e)
							{
								System.out.println(">>>>>>>exception:"+e);
							}*/
							%>
							<div align="right"><%=nf1.format(timevikram) %></div>
							</td>
							<td >
							<div align="right"><%=cntndk %></div>
							</td>
							<td >
							<div align="right"><%=nd_pri %></div>
							</td>
								
							<td >
							<div align="right"><%=cntndpost %></div>
							</td>			
							<td >
							<div align="right"><%=nf1.format(totstopdur) %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntdisconn)%></div>
							</td>
							<td >
							<div align="right"><%=disk %></div>
							
							<% System.out.println(">>>>>>>>>>>>>>>>>disk:"+disk); %>
							</td>
						</tr>
			</tbody>
			<tfoot>
			<tr>
							<th align="center">Sr.</th>
							<th align="center">Vehicle Reg no.</th>
							<th align="center">Transporter</th>
							<th align="center">Date</th>
							<th align="center">Location</th>
							<th align="center">OS</th>
							<th align="center">OS Dur</th>
							<th align="center">RA</th>
							<th align="center">RD</th>
							<th align="center">CD</th>
							<th align="center">DT</th>
							<th align="center" colspan="1">Rating</th>
							<th align="center" id="taa" style="display: none;">Avg OS Dur/100km</th>
							<th align="center" id="tbb" style="display: none;">Avg RA/100km</th>
							<th align="center" id="tcc" style="display: none;">Avg RD/100km</th>
							<th align="center">FT</th>
							<th align="center">FA</th>
							<th align="center">FC</th>
							<th align="center">AVG</th>
							<th align="center">Stops</th>
							<th align="center">Run Hrs.</th>
							<th align="center">AVG Speed</th>
							<th align="center">ND</th>
							<th align="center">ND Dur(Hrs)</th>
							<th align="center">ND Km</th>
							<th align="center">ND Int</th>
							<th align="center">ND Reason</th>
							<th align="center">DayStop <br>(Hrs)</th>
							<th align="center">DC</th>
							<th align="center">Total DC Km</th>
						</tr></tfoot>
								</table>
								</div>
						</div>
					</div>
				</section>
			</div>
								<input type="hidden" name="countermore" id="countermore" value="<%=i %>"/>
					<%

		}catch(Exception e)
		{
			System.out.println("Main Exception");
			e.printStackTrace();
			
		}
					
		         System.out.println("Last 1 day");
				}	
		
		%>
		<%if(radioButton.equals("Last 2 Days"))	
		     	{	 
			/* <%--  out.println("<script>  s2();</script>"); */%> 
			    <%-- <h4 align="center"><%=usertypevalue %>Last 2 Days Exception Report For Full Fleet</h4> --%>
		        <% Connection conn, conn1;
		        Statement st1,st2,st,st3,st4,st5;
		        int cntos,cntra,cntrda,cntdt,cntst,cntcd,cntnd,cntfc,cntdisconn,cntft=0,cntfa=0;
		        double cntrh,cntavgos,cntavgra,cntavgrd,cntosdur;
		        double stopdur,totstopdur,cntrating;
		        Double cntavg=0.00;
		        String vehregno="-",transporter="-";
		        %>
		        <%
		        
		        setSequence = "0,1,2,3,4,5,6,7,8";
		        detailViewSequence = "9,10,11,12,13,14,15,16,17,18,19,20,21,22,23";
		        
		        cntdisconn=0;
		        cntrating=0;
		        cntos=0;
		        cntra=0;
		        cntrda=0;
		        cntdt=0;
		        cntst=0;
		        cntrh=0.0;
		        cntcd=0;
		        cntnd=0;
		        cntfc=0;
		        cntosdur=0;
		        stopdur=0.0;
		        totstopdur=0.0;
		        cntavgos=0.0;
		        cntavgra=0.0;
		        cntavgrd =0.0; //code to get system date as data2 and yesterdays date as a data1.
		        cntft=0;
		        cntfa=0;
		        cntavg=0.0;
		     

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
		        String user;
		        user=session.getAttribute("user").toString();
		        usertypevalue=session.getAttribute("usertypevalue").toString();
		        //database connectivity to get the transporter wise report.
		        try
		        {
			        conn = fleetview.ReturnConnection();
			        conn1 = fleetview.ReturnConnection1();
			        st=conn.createStatement();
			        st=conn.createStatement();
			        st2=conn1.createStatement();
			        st3=conn1.createStatement();
			        st4=conn1.createStatement();
			        st5=conn.createStatement();
			        //st15=conn1.createStatement();
			        session.setAttribute("reportno","Report No:4.0");
			        session.setAttribute("reportname","Last 2 Days Exception Report For Full Fleet");
		            %>

		            <%
		            String exportFileName=session.getAttribute("user").toString()+"_last_2_Days_report.xls";  
		            %>
					<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table id="example1" class="table table-bordered">
								<thead><tr>
							<th align="center">Sr.</th>
							<th align="center">Vehicle Reg no.</th>
							<th align="center">Transporter</th>
							<th align="center">Date</th>
							<th align="center">Location</th>
							<th align="center">OS</th>
							<th align="center">OS Dur</th>
							<th align="center">RA</th>
							<th align="center">RD</th>
							<th align="center">CD</th>
							<th align="center">DT</th>
							<th colspan="1">Rating</th>
							<th align="center">Avg OS Dur/100km</th>
							<th align="center">Avg RA/100km</th>
							<th align="center">Avg RD/100km</th>
							<th align="center">FT</th>
							<th align="center">FA</th>
							<th align="center">FC</th>
							<th align="center">AVG</th>
							<th align="center">Stops</th>
							<th align="center">Run Hrs.</th>
							<th align="center">ND</th>
							<th align="center">DayStop(Hrs)</th>
							<th align="center">Disconnection</th>
							<th align="center">Average speed Considered</th>

						</tr></thead><tbody>
						<!-- Get The Data From the Database and show it -->

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
			ResultSet rst=st.executeQuery(sql);
				if(rst.next())
				{
					vehregno=rst.getString("VehicleRegNumber");
					transporter=rst.getString("OwnerName");
				}
				if(fleetview.checkUserBlocked(transporter).equals("Yes"))
				{
					%>
						<tr>
							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><%=vehregno %></td>
							<td style="text-align: left"><%=transporter%></td>
							<td style="text-align: left">Blocked</td>
							<td style="text-align: left">Access denied for <%=transporter%></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
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
					String dttime="",location="",loc="";
					sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
					ResultSet rst1=st2.executeQuery(sql);
				if(rst1.next())
				{
					
					 loc=rst1.getString("Location");
					 if(!loc.equalsIgnoreCase("No data") && !("-").equals(loc))
					{
						 dttime=loc.substring(0,19);
						 location=loc.substring(19);
					}
					else{
						
						location=loc;
						dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
						/*System.out.println("location"+location);
						String sqldate="Select * from db_gps.t_veh"+aa+" where thefielddatadate='"+data2+"' order by thefielddatatime desc limit 1";
						ResultSet rstdate=st2.executeQuery(sqldate);
						if(rstdate.next())
						{
							dttime=rstdate.getString("thefielddatadatetime");
							System.out.println("dttime"+dttime);
						}
						else{
							dttime=data2;
							System.out.println("dttime"+dttime);
						}*/
						
					}
				%>
						<tr>

							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><a
								href="customreport.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
							<td style="text-align: left"><%=transporter %></td>
							<td style="text-align: left"><%=dttime %></td>
							<td>
							<div align="left">
							<%
			
				
				if(location.equalsIgnoreCase("No data"))
				{
					out.print(location);
				}
				else
				{
					out.print(fleetview.ShowOnMapOnlyByLocation(location,aa,rst1.getString("TheDate")));
				}
			
				%>
							</div>
							</td>
							<%
				ResultSet rstcounts=fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,data1,data2);
				if(rstcounts.next())
				{
				%>
							<td>
							<div align="right">
							<%
				int os=rstcounts.getInt(1);
				cntos+=os;
				if(os >0)
				{
					%> <a href="detail_os.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=os%>
							</a> <%				
				}
				else
				{
					out.print(os);
				}
				%>
							</div>
							</td>
							<%
				double osavg =0.0;
				double osduration=0.0;
				String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
				System.out.println("sqlos--->"+sqlos);
				ResultSet rstos=st4.executeQuery(sqlos);
				if(rstos.next())
				{
					osduration=rstos.getDouble("Duration");
					System.out.println(" OS Duration--->"+osduration);
				}
				cntosdur= cntosdur + osduration;
				%>
							<td>
							<div align="right"><%=osduration%></div></td>
							<td>
							<div align="right">
							<%
				int ra=rstcounts.getInt(2);
				cntra+=ra;
				if(ra>0)
				{ 
					%> <a
								href="detail_ra.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidAcceleration">
							<%=ra%> </a> <%
				}
				else
				{
					out.print(ra);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				int rd=rstcounts.getInt(3);
				cntrda+=rd;
				if(rd>0)
				{
					%> <a
								href="detail_rd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidDecceleration">
							<%=rd%> </a> <%
				}
				else
				{
					out.print(rd);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				int cd=rstcounts.getInt(4);
				cntcd+=cd;
				if(cd>0)
				{
					%> <a
								href="detail_cd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=ContinuousDriving">
							<%=cd%> </a> <%
				}
				else
				{
					out.print(cd);
				}
				
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
				double dt=rstcounts.getDouble(5);
				cntdt+=dt;
				out.print(dt);
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
							NumberFormat nfrating=NumberFormat.getInstance();
							nfrating.setMaximumFractionDigits(2);
							nfrating.setMinimumFractionDigits(2);			
				double rating=0.0;
			  	if(dt>0.0)
			  	{
			  	double RD=((rd/dt)*100);
			  	double RA=((ra/dt)*100);	
			  	double OS=((osduration/10/dt)*100);
			  	rating=RA+RD+OS;
			  	
			  	out.print(nfrating.format(rating));
			  	}
			  	else{
			  		out.print(0.0);
			  	}
			  	cntrating=rating+cntrating;
			  	%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
					System.out.println("IN OS Avg");
					NumberFormat nfos=NumberFormat.getInstance();
					nfos.setMaximumFractionDigits(2);
					nfos.setMinimumFractionDigits(2);
					
					//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);
					
						if(osduration> 0.0 && dt >0.0)
						{
							System.out.println("distance --->"+dt);
							osavg=(osduration*10)/dt;
							System.out.println("OS avg--->"+osavg);
							out.print(nfos.format(osavg));
							//out.print(osavg);
							//out.print(osavg);
						}
						else{
							osavg=0.0;
							out.print(nfos.format(osavg));
							//out.print(osavg);
						}
						cntavgos+=osavg;
					
					
					%>
							</div>
							</td>
							<td>
							<div align="right">
							<% 
				NumberFormat nfra=NumberFormat.getInstance();
				nfra.setMaximumFractionDigits(2);
				nfra.setMinimumFractionDigits(2);
				double raavg =0.0;
				if(ra>0 && dt>0.0 )
				{
					System.out.println("RA --->"+ra);
					raavg= (ra/dt)*100;
					System.out.println("RA avg--->"+raavg);
					out.print(nfra.format(raavg));
					//out.print(raavg);
				}
				else  //if(dt==0.0 && ra>0 ||ra==0) 
				{ 
					raavg= 0.0;
					out.print(nfra.format(raavg));
				}
				cntavgra+=raavg;
				%>
							</div>
							</td>
							<td>
							<div align="right">
							<% 
				NumberFormat nfrd=NumberFormat.getInstance();
				nfrd.setMaximumFractionDigits(2);
				nfrd.setMinimumFractionDigits(2);
				double rdavg =0.0;
				
				if(rd>0 && dt>0.0)
				{
					System.out.println("RD -->"+rd);
					rdavg= (rd/dt)*100;
					System.out.println("RD avg--->"+rdavg);
					out.print(nfrd.format(rdavg));
					//out.print(rdavg);
					
				}
				else //if(dt==0.0 && rd>0 ||rd==0 )
				{
					rdavg= 0.0;
					out.print(nfrd.format(rdavg));
					//cntavgrd+=rdavg;
				}
				cntavgrd+=rdavg;
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
				int ft=0;
				try{
					String sql4="select count(*) as fcnt from t_vehft where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
					ResultSet rs4= st2.executeQuery(sql4);
					if(rs4.next())
					{  
						ft=rs4.getInt("fcnt");
					}
					}catch (Exception e) {
						System.out.print("Exception--->"+e);
					}
				//int ft=rstcounts.getInt(9);
				cntft+=ft;
				if(ft >0)
				{
					%> <a
								href="showfuelalert.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=ft%> </a> <%				
				}
				else
				{
					out.print(ft);
				}
				%>
							</div>
							</td>


							<td>
							<div align="right">
							<%
				int fa=0;
				try{
					String sql4="select count(*) as fcnt from t_vehfa where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
					ResultSet rs4= st2.executeQuery(sql4);
					if(rs4.next())
					{  
						fa=rs4.getInt("fcnt");
					}
					else{
						out.print(0);
					}
					}catch (Exception e) {
						System.out.print("Exception--->"+e);
					}
				//int fa=rstcounts.getInt(8);
				//cntfa+=fa;
				if(fa >0)
				{
					%> <a
								href="showfueladd.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
							<%=fa%> </a> <%				
				}
				else
				{
					out.print(0);
				}
				%>
							</div>
							</td>

							<%
				if(fleetview.getUnitDescription(aa).equals("FUELFLOW"))
				{
					%>
							<td>
							<div align="right">
							<%
						
						int fcval=fleetview.getFuelConsumptionForDateRange(aa,data1,data2);
						cntfc=cntfc+fcval;
						out.print(fcval);
					%>
							</div>
							</td>
							<td>
							<div align="right">
							<%
					NumberFormat nf=NumberFormat.getInstance();
					nf.setMaximumFractionDigits(2);
					nf.setMinimumFractionDigits(2);
					Double favgval=fleetview.getFuelAVGForDateRange(aa,data1,data2);
					cntavg=cntavg+favgval;
					out.print(nf.format(favgval));
					
					
					
					%>
							</div>
							</td>
							<%
				}
				else
				{
					%>
							<td>
							<div align="right">-</div>
							</td>
							<td>
							<div align="right">-</div>
							</td>
							<%
				}
				%>
							<td>
							<div align="right">
							<%
					System.out.println("IN stop");
				int stsp=rstcounts.getInt(6);
				cntst+=stsp;
				if(stsp>0)
				{
					%> <a href="detail_stops.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=stsp%>
							</a> <%
				}
				else
				{
					out.print(stsp);
				}
				
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
				double d=0.0;
				System.out.println("Runhrs");
				d=rstcounts.getDouble(7);
				cntrh+=d;
				out.print(d);
				%>
							</div>
							</td>
							<td style="text-align: left">
							<%
			
							String time1 ="00:00:00";
							String time2="23:59:59";
					int cntnd1=fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
				if(cntnd1>0)
				{
					cntnd+=cntnd1;
					%> <a
								href="detail_nd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&data1=<%=data1+' '+time1 %>&data2=<%=data2+' '+time2 %>&pageType=NightDriving">
							<%=cntnd1%> </a> <%
				}
				else
				{
					out.print(0);
				}
				%>
							</td>
							<td>
							<div align="right">
							<%
				
				String sqlstop="select sum(DayStopDurationinHrs) as stopduration from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
				ResultSet rststop=st3.executeQuery(sqlstop);
				
				if(rststop.next())
				{
					stopdur=rststop.getDouble("stopduration");
					totstopdur=totstopdur+rststop.getDouble("stopduration");
					%> <%=stopdur%> <%
				}
				else
				{
					out.print("0");
					
				}
				
				%>
							</div>
							</td>

							<td>
							<div align="right">
							<%
				try{
					
					//String time1 ="00:00:00";
					//String time2="23:59:59";
				String sqldisconn="Select count(*) as cnt from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeTo >='"+data1+" 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
				System.out.println("sqldisconn==>"+sqldisconn);
				ResultSet rstdisconn=st5.executeQuery(sqldisconn);
				if(rstdisconn.next())
				{
					if(rstdisconn.getInt("cnt")>0)
					{
						%>
					<a href="disconnectedDetailsReport.jsp?vehicleCode=<%=aa%>&VehicleRegNo=<%=vehregno%>&ownerName=<%=transporter%>&fromDateTime=<%=data1+" "+time1%>&toDateTime=<%=data2+" "+time2%>"> <%=rstdisconn.getInt("cnt")%> </a> 
						<%
					}
					else{
						out.print(0);
					}
				}
				else
				{
					out.print(0);
				}
				
				cntdisconn=cntdisconn+rstdisconn.getInt("cnt");
				}catch(Exception ee)
				{
					System.out.println("Exception disconnection "+ee);
				}
				System.out.println("out of Disconnection");
				%>
							</div>
							</td>
							<td>
							<div align="left">
							<%
				 
							try{
								
								
								String avgspeed="Select * from db_gpsExceptions.t_vehall_ds where vehcode='"+aa+"' and TheDate <='"+data2+"'  and  TheDate >='"+data1+"' and AvgSpeedConsidered='Yes' ";
								System.out.println("avgspeed==>"+avgspeed);
								ResultSet rstavg=st3.executeQuery(avgspeed);
								if(rstavg.next())
								{
									/*System.out.println("in avg speed");
									avgsped=rst1.getString("AvgSpeedConsidered");
									if(avgsped.equalsIgnoreCase("Yes"))
									{
										System.out.println("in Yes");*/
										out.print("Yes");
								}
									else{
										System.out.println("in NO");
										out.print("No");
									}
								//}
								//else{
									//out.print("No");
								// }
								}catch(Exception ea){
									System.out.println("Avg speed exception"+ea);
								}
								System.out.println("out of avgspeed");
				//cntdisconn=cntdisconn+rstdisconn.getInt("cnt"); 
				%>
							</div>
							</td>
						</tr>
						<%
				i++;
						System.out.println("value of i"+i);	
				}
				System.out.println("While");	
				}
				else
				{
					%>
						<tr>
							<td style="text-align: right"><%=i %></td>
							<td style="text-align: left"><%=vehregno %></td>
							<td style="text-align: left">No DATA</td>
							<td style="text-align: left">No DATA</td>
							<td>
							<div align="left">No Data</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td style="text-align: left">No</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="right">0</div>
							</td>
							<td>
							<div align="left">No</div>
							</td>
						</tr>
						<%
					i++;
				}
			}
			}
			}
			

		NumberFormat nf1=NumberFormat.getInstance();
		nf1.setMaximumFractionDigits(2);
		nf1.setMinimumFractionDigits(2);
		%>
	</tbody><tbody><tr>		
							<td colspan="5" align="right" >Total</td>
							<td >
							<div align="right"><%=cntos %></div>
							</td>
							<td >
							<div align="right"><%=cntosdur %></div>
							</td>
							<td >
							<div align="right"><%=cntra %></div>
							</td>
							<td >
							<div align="right"><%=cntrda %></div>
							</td>
							<td >
							<div align="right"><%=cntcd %></div>
							</td>
							<td >
							<div align="right"><%=cntdt %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntrating) %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntavgos) %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntavgra) %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntavgrd) %></div>
							</td>
							<td >
							<div align="right"><%=cntft %></div>
							</td>
							<td >
							<div align="right"><%=cntfa %></div>
							</td>
							<td >
							<div align="right"><%=cntfc %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntavg) %></div>
							</td>
							<td >
							<div align="right"><%=cntst %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntrh) %></div>
							</td>
							<td >
							<div align="right"><%=cntnd %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(totstopdur) %></div>
							</td>
							<td >
							<div align="right"><%=nf1.format(cntdisconn)%></div>
							</td>
							<td >
							<div align="right">-</div>
							</td>
						</tr></tbody>
							<tfoot><tr>
							<th align="center">Sr.</th>
							<th align="center">Vehicle Reg no.</th>
							<th align="center">Transporter</th>
							<th align="center">Date</th>
							<th align="center">Location</th>
							<th align="center">OS</th>
							<th align="center">OS Dur</th>
							<th align="center">RA</th>
							<th align="center">RD</th>
							<th align="center">CD</th>
							<th align="center">DT</th>
							<th colspan="1">Rating</th>
							<th align="center">Avg OS Dur/100km</th>
							<th align="center">Avg RA/100km</th>
							<th align="center">Avg RD/100km</th>
							<th align="center">FT</th>
							<th align="center">FA</th>
							<th align="center">FC</th>
							<th align="center">AVG</th>
							<th align="center">Stops</th>
							<th align="center">Run Hrs.</th>
							<th align="center">ND</th>
							<th align="center">DayStop(Hrs)</th>
							<th align="center">Disconnection</th>
							<th align="center">Average speed Considered</th>

						</tr></tfoot>			
								</table>
								</div>
						</div>
					</div>
				</section>
			</div>
		           <%

		}catch(Exception e)
		{
			System.out.println("Exception" +e);
		}
						}	
				 %>
		           <%if(radioButton.equals("Last 7 Days"))
		           {
						/*  out.println("<script>  s3();</script>"); */%>
					     <%-- <h4 align="center"><%=usertypevalue %>Last 7 Days Exception Report For Full Fleet</h4> --%>
				  <%
				  Connection conn, conn1;
				  Statement st1,st2,st,st3,st4,st5;
				  conn=null; conn1=null;

				  DecimalFormat df = new DecimalFormat("0.00");


				  int cntos,cntra,cntrda,cntdt,cntst,cntcd,cntnd,cntndk,disk,cntfc,cntdisconn,cntft=0,cntfa=0;
				  double cntrh,cntavgos,cntavgra,cntavgrd,cntosdur;
				  double stopdur,totstopdur,cntrating;
				  double cntavg=0.00;
				  String vehregno="-",transporter="-";
				  
				  setSequence = "0,1,2,3,4,5,6,7,8";
		          detailViewSequence = "9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26";
				  
				  cntdisconn=0;
				  cntrating=0;
				  cntos=0;
				  cntra=0;
				  cntrda=0;
				  cntdt=0;
				  cntst=0;
				  cntrh=0.0;
				  cntcd=0;
				  cntnd=0;
				  cntndk=0;
				  disk=0;
				  cntfc=0;
				  cntosdur=0;
				  stopdur=0.0;
				  totstopdur=0.0;
				  cntavgos=0.0;
				  cntavgra=0.0;
				  cntavgrd =0.0; //code to get system date as data2 and yesterdays date as a data1.
				  cntft=0;
				  cntfa=0;
				  cntavg=0.0;

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
				  long dayInMills1=6000*60*60*24;
				  NewDate.setTime(dateMillis-dayInMills1);
				  String data1 = NewFormatter.format(NewDate);
				  String data3 = NewFormatter1.format(NewDate);
				  session.setAttribute("data1",data1);
				  session.setAttribute("data2",data2);
				  session.setAttribute("data3",data3);
				  session.setAttribute("data4",data4);

				  String user;
				  user=session.getAttribute("user").toString();
				  usertypevalue=session.getAttribute("usertypevalue").toString();
				  //database connectivity to get the transporter wise report.
				  try{
				  	
				  	conn = fleetview.ReturnConnection();
				  	conn1 = fleetview.ReturnConnection1();
				  	st=conn.createStatement();
				  	st=conn.createStatement();
				  	st2=conn1.createStatement();
				  	st3=conn1.createStatement();
				  	st4=conn1.createStatement();
				  	st5=conn.createStatement();
				  	//st15=conn1.createStatement();
				  	session.setAttribute("reportno","Report No:5.0");
				  	session.setAttribute("reportname","Last 7 Days Exception Report For Full Fleet");
				  	String  exportFileName=session.getAttribute("user").toString()+"_last7days.xls";


				  %>
				
				
									  	
				  		<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table id="example1" class="table table-bordered">

	<thead>
		<tr>
			
				  				<th align="center">Sr.</th>
				  				<th align="center">Vehicle Reg no.</th>
				  				<th align="center">Transporter</th>
				  				<th align="center">Date</th>
				  				<th align="center">Location</th>
				  				<th align="center">OS</th>
				  				<th align="center">OS Dur</th>
				  				<th align="center">RA</th>
				  				<th align="center">RD</th>
				  				<th align="center">CD</th>
				  				<th align="center">DT</th>
				  				<th colspan="1">Rating</th>
				  				<th align="center">Avg OS Dur/100km</th>
				  				<th align="center">Avg RA/100km</th>
				  				<th align="center">Avg RD/100km</th>
				  				<th align="center">FT</th>
				  				<th align="center">FA</th>
				  				<th align="center">FC</th>
				  				<th align="center">AVG</th>
				  				<th align="center">Stops</th>
				  				<th align="center">Run Hrs.</th>
				  				<th align="center">ND</th>
				  				<th align="center">Total ND Km</th>
				  				<th align="center">DayStop(Hrs)</th>
				  				<th align="center">Disconnection</th>
				  				<th align="center">Total Disconnection Km</th>
				  				<th align="center">Average speed Considered</th>

				  			</tr></thead><tbody>
				  			<!-- Get The Data From the Database and show it -->

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
				  	ResultSet rst=st.executeQuery(sql);
				  		if(rst.next())
				  		{
				  			vehregno=rst.getString("VehicleRegNumber");
				  			transporter=rst.getString("OwnerName");
				  		}
				  		if(fleetview.checkUserBlocked(transporter).equals("Yes"))
				  		{
				  			%>
				  			<tr>
				  				<td style="text-align: right"><%=i %></td>
				  				<td style="text-align: left"><%=vehregno %></td>
				  				<td style="text-align: left"><%=transporter%></td>
				  				<td style="text-align: left">Blocked</td>
				  				<td style="text-align: left">Access denied for <%=transporter%></td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
				  				<td>-</td>
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
				  			String dttime="",location="",loc="";
				  			sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
				  			
				  			System.out.println("query first:"+sql);
				  			
				  			ResultSet rst1=st2.executeQuery(sql);
				  		if(rst1.next())
				  		{
				  			
				  			 loc=rst1.getString("Location");
				  			 if(!loc.equalsIgnoreCase("No data") && !("-").equals(loc))
				  			{
				  				 dttime=loc.substring(0,19);
				  				 location=loc.substring(19);
				  			}
				  			else{
				  				
				  				location=loc;
				  				dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
				  				/*System.out.println("location"+location);
				  				String sqldate="Select * from db_gps.t_veh"+aa+" where thefielddatadate='"+data2+"' order by thefielddatatime desc limit 1";
				  				ResultSet rstdate=st2.executeQuery(sqldate);
				  				if(rstdate.next())
				  				{
				  					dttime=rstdate.getString("thefielddatadatetime");
				  					System.out.println("dttime"+dttime);
				  				}
				  				else{
				  					dttime=data2;
				  					System.out.println("dttime"+dttime);
				  				}*/
				  				
				  			}
				  		%>
				  			<tr>

				  				<td style="text-align: right"><%=i %></td>
				  				<td style="text-align: left"><a
				  					href="customreport.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
				  				<td style="text-align: left"><%=transporter %></td>
				  				<td style="text-align: left"><%=dttime %></td>
				  				<td>
				  				<div align="left">
				  				<%
				  	
				  		
				  		if(location.equalsIgnoreCase("No data"))
				  		{
				  			out.print(location);
				  		}
				  		else
				  		{
				  			out.print(fleetview.ShowOnMapOnlyByLocation(location,aa,rst1.getString("TheDate")));
				  		}
				  	
				  		%>
				  				</div>
				  				</td>
				  				<%
				  		ResultSet rstcounts=fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,data1,data2);
				  		if(rstcounts.next())
				  		{
				  		%>
				  				<td>
				  				<div align="right">
				  				<%
				  		int os=rstcounts.getInt(1);
				  		cntos+=os;
				  		if(os >0)
				  		{
				  			%> <a href="detail_os.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=os%>
				  				</a> <%				
				  		}
				  		else
				  		{
				  			out.print(os);
				  		}
				  		%>
				  				</div>
				  				</td>
				  				<%
				  		double osavg =0.0;
				  		double osduration=0.0;
				  		String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
				  		System.out.println("sqlos--->"+sqlos);
				  		ResultSet rstos=st4.executeQuery(sqlos);
				  		if(rstos.next())
				  		{
				  			osduration=rstos.getDouble("Duration");
				  			System.out.println(" OS Duration--->"+osduration);
				  		}
				  		cntosdur= cntosdur + osduration;
				  		
				  		
				  		%>
				  				<td>
				  				<div align="right"><%=(int)osduration%></div>
				  				<td>
				  				<div align="right">
				  				<%
				  		int ra=rstcounts.getInt(2);
				  		cntra+=ra;
				  		if(ra>0)
				  		{ 
				  			%> <a
				  					href="detail_ra.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidAcceleration">
				  				<%=ra%> </a> <%
				  		}
				  		else
				  		{
				  			out.print(ra);
				  		}
				  		
				  		%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<%
				  		int rd=rstcounts.getInt(3);
				  		cntrda+=rd;
				  		if(rd>0)
				  		{
				  			%> <a
				  					href="detail_rd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidDecceleration">
				  				<%=rd%> </a> <%
				  		}
				  		else
				  		{
				  			out.print(rd);
				  		}
				  		
				  		%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<%
				  		int cd=rstcounts.getInt(4);
				  		cntcd+=cd;
				  		if(cd>0)
				  		{
				  			%> <a
				  					href="detail_cd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=ContinuousDriving">
				  				<%=cd%> </a> <%
				  		}
				  		else
				  		{
				  			out.print(cd);
				  		}
				  		
				  		%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<%
				  		double dt=rstcounts.getDouble(5);
				  		cntdt+=dt;
				  		
				  		
				  		
				  		  out.print((int)dt);  
				  		%>
				  		
				  				</div>
				  				</td>

				  				<td>
				  				<div align="right">
				  				<%
				  					NumberFormat nfrating=NumberFormat.getInstance();
				  					nfrating.setMaximumFractionDigits(2);
				  					nfrating.setMinimumFractionDigits(2);			
				  		double rating=0.0;
				  	  	if(dt>0.0)
				  	  	{
				  	  	double RD=((rd/dt)*100);
				  	  	double RA=((ra/dt)*100);	
				  	  	double OS=((osduration/10/dt)*100);
				  	  	rating=RA+RD+OS;
				  	  	
				  	  	out.print(nfrating.format(rating));
				  	  	}
				  	  	else{
				  	  		out.print(0.0);
				  	  	}
				  	  	cntrating=rating+cntrating;
				  	  	%>
				  				</div>
				  				</td>

				  				<td>
				  				<div align="right">
				  				<%
				  			System.out.println("IN OS Avg");
				  			NumberFormat nfos=NumberFormat.getInstance();
				  			nfos.setMaximumFractionDigits(2);
				  			nfos.setMinimumFractionDigits(2);
				  			
				  			//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);
				  			
				  				if(osduration> 0.0 && dt >0.0)
				  				{
				  					System.out.println("distance --->"+dt);
				  					osavg=(osduration*10)/dt;
				  					System.out.println("OS avg--->"+osavg);
				  					out.print(nfos.format(osavg));
				  					//out.print(osavg);
				  					//out.print(osavg);
				  				}
				  				else{
				  					osavg=0.0;
				  					out.print(nfos.format(osavg));
				  					//out.print(osavg);
				  				}
				  				cntavgos+=osavg;
				  			
				  			
				  			%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<% 
				  		NumberFormat nfra=NumberFormat.getInstance();
				  		nfra.setMaximumFractionDigits(2);
				  		nfra.setMinimumFractionDigits(2);
				  		double raavg =0.0;
				  		if(ra>0 && dt>0.0 )
				  		{
				  			System.out.println("RA --->"+ra);
				  			raavg= (ra/dt)*100;
				  			System.out.println("RA avg--->"+raavg);
				  			out.print(nfra.format(raavg));
				  			//out.print(raavg);
				  		}
				  		else  //if(dt==0.0 && ra>0 ||ra==0) 
				  		{ 
				  			raavg= 0.0;
				  			out.print(nfra.format(raavg));
				  		}
				  		cntavgra+=raavg;
				  		%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<% 
				  		NumberFormat nfrd=NumberFormat.getInstance();
				  		nfrd.setMaximumFractionDigits(2);
				  		nfrd.setMinimumFractionDigits(2);
				  		double rdavg =0.0;
				  		
				  		if(rd>0 && dt>0.0)
				  		{
				  			System.out.println("RD -->"+rd);
				  			rdavg= (rd/dt)*100;
				  			System.out.println("RD avg--->"+rdavg);
				  			out.print(nfrd.format(rdavg));
				  			//out.print(rdavg);
				  			
				  		}
				  		else //if(dt==0.0 && rd>0 ||rd==0 )
				  		{
				  			rdavg= 0.0;
				  			out.print(nfrd.format(rdavg));
				  			//cntavgrd+=rdavg;
				  		}
				  		cntavgrd+=rdavg;
				  		%>
				  				</div>
				  				</td>

				  				<td>
				  				<div align="right">
				  				<%
				  		int ft=0;
				  		try{
				  			String sql4="select count(*) as fcnt from t_vehft where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
				  			ResultSet rs4= st2.executeQuery(sql4);
				  			if(rs4.next())
				  			{  
				  				ft=rs4.getInt("fcnt");
				  			}
				  			}catch (Exception e) {
				  				System.out.print("Exception--->"+e);
				  			}
				  		//int ft=rstcounts.getInt(9);
				  		cntft+=ft;
				  		if(ft >0)
				  		{
				  			%> <a
				  					href="showfuelalert.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
				  				<%=ft%> </a> <%				
				  		}
				  		else
				  		{
				  			out.print(ft);
				  		}
				  		%>
				  				</div>
				  				</td>


				  				<td>
				  				<div align="right">
				  				<%
				  		int fa=0;
				  		try{
				  			String sql4="select count(*) as fcnt from t_vehfa where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
				  			ResultSet rs4= st2.executeQuery(sql4);
				  			if(rs4.next())
				  			{  
				  				fa=rs4.getInt("fcnt");
				  			}
				  			else{
				  				out.print(0);
				  			}
				  			}catch (Exception e) {
				  				System.out.print("Exception--->"+e);
				  			}
				  		//int fa=rstcounts.getInt(8);
				  		//cntfa+=fa;
				  		if(fa >0)
				  		{
				  			%> <a
				  					href="showfueladd.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
				  				<%=fa%> </a> <%				
				  		}
				  		else
				  		{
				  			out.print(0);
				  		}
				  		%>
				  				</div>
				  				</td>

				  				<%
				  		if(fleetview.getUnitDescription(aa).equals("FUELFLOW"))
				  		{
				  			%>
				  				<td>
				  				<div align="right">
				  				<%
				  				
				  				int fcval=fleetview.getFuelConsumptionForDateRange(aa,data1,data2);
				  				cntfc=cntfc+fcval;
				  				out.print(fcval);
				  			%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="right">
				  				<%
				  			NumberFormat nf=NumberFormat.getInstance();
				  			nf.setMaximumFractionDigits(2);
				  			nf.setMinimumFractionDigits(2);
				  			Double favgval=fleetview.getFuelAVGForDateRange(aa,data1,data2);
				  			cntavg=cntavg+favgval;
				  			out.print(nf.format(favgval));
				  			
				  			
				  			
				  			%>
				  				</div>
				  				</td>
				  				<%
				  		}
				  		else
				  		{
				  			%>
				  				<td>
				  				<div align="right">-</div>
				  				</td>
				  				<td>
				  				<div align="right">-</div>
				  				</td>
				  				<%
				  		}
				  		%>
				  				<td>
				  				<div align="right">
				  				<%
				  			System.out.println("IN stop");
				  		int stsp=rstcounts.getInt(6);
				  		cntst+=stsp;
				  		if(stsp>0)
				  		{
				  			%> <a href="detail_stops.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=stsp%>
				  				</a> <%
				  		}
				  		else
				  		{
				  			out.print(stsp);
				  		}
				  		
				  		%>
				  				</div>
				  				</td>

				  				<td>
				  				<div align="right">
				  				<%
				  		double d=0.0;
				  		System.out.println("Runhrs");
				  		d=rstcounts.getDouble(7);
				  		cntrh+=d;
				  		/* out.print(d); */
				  		
				  		
				  		out.print((int)d);
				  		%>
				  				</div>
				  				</td>
				  				<td style="text-align: right">
				  				<%
				  	
				  					String time1 ="00:00:00";
				  					String time2="23:59:59";
				  			int cntnd1=fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
				  		if(cntnd1>0)
				  		{
				  			cntnd+=cntnd1;
				  			%> <a
				  					href="detail_nd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&data1=<%=data1+' '+time1 %>&data2=<%=data2+' '+time2 %>&pageType=NightDriving">
				  				<%=cntnd1%> </a> <%
				  		}
				  		else
				  		{
				  			out.print(0);
				  		}
				  		%>
				  				</td>
				  		<% 			
				  		int cntnd12=fleetview.NightDrivingFormExceptionsForDateRange1(aa,data1,data2);
				  		%>
				  		<td style="text-align: right">
				  		<%
				  		if(cntnd12>0)
				  		{cntndk+=cntnd12;	
				  		%>			
				  			<%=cntnd12 %>
				  		<%
				  		}else
				  		{
				  			out.print(0);
				  		}
				  		%>		
				  					</td>
				  				
				  				
				  				
				  				<td>
				  				<div align="right">
				  				<%
				  		
				  		String sqlstop="select sum(DayStopDurationinHrs) as stopduration from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
				  		ResultSet rststop=st3.executeQuery(sqlstop);
				  		
				  		if(rststop.next())
				  		{
				  			stopdur=rststop.getDouble("stopduration");
				  			totstopdur=totstopdur+rststop.getDouble("stopduration");
				  			%> <%=df.format(stopdur)%> <%
				  		}
				  		else
				  		{
				  			out.print("0");
				  			
				  		}
				  		
				  		%>
				  				</div>
				  				</td>

				  				
				  				<%
				  		try{
				  		//	String time1 ="00:00:00";
				  		//	String time2="23:59:59";
				  		
				  		String sqldisconn="Select count(*) as cnt from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeFrom >='"+data1+" 00:00:00' and  OffTimeTo <='"+data2+" 23:59:59' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
				  		System.out.println("sqldisconn==>"+sqldisconn);
				  		ResultSet rstdisconn=st5.executeQuery(sqldisconn);
				  		%>
				  		<td >
				  					<div align="right">
				  		<%
				  		if(rstdisconn.next())
				  		{
				  			if(rstdisconn.getInt("cnt")>0)
				  			{
				  				%> <a
				  					href="disconnectedDetailsReport.jsp?vehicleCode=<%=aa%>&VehicleRegNo=<%=vehregno%>&ownerName=<%=transporter%>&fromDateTime=<%=data1+" "+time1%>&toDateTime=<%=data2+" "+time2%>">
				  				<%=rstdisconn.getInt("cnt")%> </a> <%
				  			}
				  			else{
				  				out.print(0);
				  			}
				  		}
				  		else
				  		{
				  			out.print(0);
				  		}
				  		
				  		cntdisconn=cntdisconn+rstdisconn.getInt("cnt");
				  		%>
				  		</div></td>
				  		<%
				  		sqldisconn="Select Distance from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeFrom >='"+data1+" 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
				  		
				  		ResultSet rstdis=st5.executeQuery(sqldisconn);
				  		int diskm=0;
				  		while(rstdis.next())
				  		{
				  		  diskm=diskm+rstdis.getInt("Distance");
				  		}
				  		%>
				  		<td >
				  					<div align="right">
				  		<%
				  		
				  		if(diskm>0)
				  		{disk+=diskm;
				  		System.out.println("\n\nkm-->>"+disk);
				  			%>
				  			<%=diskm %>
				  		<%
				  		}
				  		else
				  		{
				  			out.print(0);
				  		}
				  		
				  	
				  		
				  		%>
				  		</div>
				  		</td>
				  		<%
				  		
				  		
				  		}catch(Exception ee)
				  		{
				  			System.out.println("Exception disconnection "+ee);
				  		}
				  		System.out.println("out of Disconnection");
				  		
				  		
				  		%>
				  				</div>
				  				</td>
				  				<td>
				  				<div align="left">
				  				<%
				  		 
				  					try{
				  						
				  						
				  						String avgspeed="Select * from db_gpsExceptions.t_vehall_ds where vehcode='"+aa+"' and TheDate <='"+data2+"'  and  TheDate >='"+data1+"' and AvgSpeedConsidered='Yes' ";
				  						System.out.println("avgspeed==>"+avgspeed);
				  						ResultSet rstavg=st3.executeQuery(avgspeed);
				  						if(rstavg.next())
				  						{
				  							/*System.out.println("in avg speed");
				  							avgsped=rst1.getString("AvgSpeedConsidered");
				  							if(avgsped.equalsIgnoreCase("Yes"))
				  							{
				  								System.out.println("in Yes");*/
				  								out.print("Yes");
				  						}
				  							else{
				  								System.out.println("in NO");
				  								out.print("No");
				  							}
				  						//}
				  						//else{
				  							//out.print("No");
				  						// }
				  						}catch(Exception ea){
				  							System.out.println("Avg speed exception"+ea);
				  						}
				  						System.out.println("out of avgspeed");
				  		%>
				  				</div>
				  				</td>
				  			</tr>
				  			<%
				  		i++;
				  				System.out.println("value of i"+i);	
				  		}
				  		System.out.println("While");	
				  		}
				  		else
				  		{
				  			%>
				  			<tr>
				  				<td style="text-align: right"><%=i %></td>
				  				<td style="text-align: left"><%=vehregno %></td>
				  				<td style="text-align: left">No DATA</td>
				  				<td style="text-align: left">No DATA</td>
				  				<td>
				  				<div align="left">No Data</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td style="text-align: left">No</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="right">0</div>
				  				</td>
				  				<td>
				  				<div align="left">No</div>
				  				</td>
				  			</tr>
				  			<%
				  			i++;
				  		}
				  	}
				  	}
				  	}
				  	

				  NumberFormat nf1=NumberFormat.getInstance();
				  nf1.setMaximumFractionDigits(2);
				  nf1.setMinimumFractionDigits(2);
				  %>
				</tbody><tbody><tr>
				  				<td colspan="5" align="right">Total</td>
				  				<td >
				  				<div align="right"><%=cntos %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=(int)cntosdur %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntra %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntrda %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntcd %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntdt %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntrating) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntavgos) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntavgra) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntavgrd) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntft %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntfa %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntfc %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntavg) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=(int)cntst %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=(int)cntrh %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=cntnd %></div>
				  				</td>
				  				<td >
				  					<div align="right"><%=cntndk %></div>
				  					</td>
				  				<td >
				  				<div align="right"><%=nf1.format(totstopdur) %></div>
				  				</td>
				  				<td >
				  				<div align="right"><%=nf1.format(cntdisconn)%></div>
				  				</td>
				  				<td >
				  					<div align="right"><%=disk %></div>
				  					</td>
				  				<td >
				  				<div align="right">-</div>
				  				</td>
				  			</tr></tbody>
				  				<tfoot>
		<tr>
			
				  				<th align="center">Sr.</th>
				  				<th align="center">Vehicle Reg no.</th>
				  				<th align="center">Transporter</th>
				  				<th align="center">Date</th>
				  				<th align="center">Location</th>
				  				<th align="center">OS</th>
				  				<th align="center">OS Dur</th>
				  				<th align="center">RA</th>
				  				<th align="center">RD</th>
				  				<th align="center">CD</th>
				  				<th align="center">DT</th>
				  				<th colspan="1">Rating</th>
				  				<th align="center">Avg OS Dur/100km</th>
				  				<th align="center">Avg RA/100km</th>
				  				<th align="center">Avg RD/100km</th>
				  				<th align="center">FT</th>
				  				<th align="center">FA</th>
				  				<th align="center">FC</th>
				  				<th align="center">AVG</th>
				  				<th align="center">Stops</th>
				  				<th align="center">Run Hrs.</th>
				  				<th align="center">ND</th>
				  				<th align="center">Total ND Km</th>
				  				<th align="center">DayStop(Hrs)</th>
				  				<th align="center">Disconnection</th>
				  				<th align="center">Total Disconnection Km</th>
				  				<th align="center">Average speed Considered</th>

				  			</tr></tfoot>
				  		</table>
				  		</div>
				  		</div>
				  		</div>
				  		</section>
				  		</div>
				  		<%

				  }catch(Exception e)
				  {
				  	System.out.println("Exception" +e);
				  }
				  
	     	}%>
		     <%if(radioButton.equals("Last 15 Days")) 
	           {
					 
					 //out.println("<script>  s2();</script>");%>
					 
					<%--  <h4 align="center"><%=usertypevalue %>Last 15 Days Exception Report For Full Fleet</h4> --%>
					 
					 <% Connection conn, conn1;
					
					 DecimalFormat df = new DecimalFormat("0.00");

					 conn=null; conn1=null;
					 Statement st1,st2,st,st3,st4,st5;
					 int cntos,cntra,cntrda,cntdt,cntst,cntcd,cntnd,cntndk,disk,cntfc,cntdisconn,cntft=0,cntfa=0;
					 double cntrh,cntavgos,cntavgra,cntavgrd;
					 int cntosdur=0;
					 double stopdur,totstopdur,cntrating;
					 Double cntavg=0.00;
					 String vehregno="-",transporter="-";
					 
					 setSequence = "0,1,2,3,4,5,6,7,8";
			         detailViewSequence = "9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26";
					 
					 cntdisconn=0;
					 cntrating=0;
					 cntos=0;
					 cntra=0;
					 cntrda=0;
					 cntdt=0;
					 cntst=0;
					 cntrh=0.0;
					 cntcd=0;
					 cntnd=0;
					 cntndk=0;
					 disk=0;
					 cntfc=0;
					 stopdur=0.0;
					 totstopdur=0.0;
					 cntavgos=0.0;
					 cntavgra=0.0;
					 cntavgrd =0.0; //code to get system date as data2 and yesterdays date as a data1.
					 cntft=0;
					 cntfa=0;
					 cntavg=0.0;

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
					 long dayInMills1=14000*60*60*24;
					 NewDate.setTime(dateMillis-dayInMills1);
					 String data1 = NewFormatter.format(NewDate);
					 String data3 = NewFormatter1.format(NewDate);
					 session.setAttribute("data1",data1);
					 session.setAttribute("data2",data2);
					 session.setAttribute("data3",data3);
					 session.setAttribute("data4",data4);
					 String user;
					 user=session.getAttribute("user").toString();
					 usertypevalue=session.getAttribute("usertypevalue").toString();
					 //database connectivity to get the transporter wise report.
					 try{
					 	
					 	conn = fleetview.ReturnConnection();
					 	conn1 = fleetview.ReturnConnection1();
					 	st=conn.createStatement();
					 	st=conn.createStatement();
					 	st2=conn1.createStatement();
					 	st3=conn1.createStatement();
					 	st4=conn1.createStatement();
					 	st5=conn.createStatement();
					 	//st15=conn1.createStatement();

					 session.setAttribute("reportno","Report No:6.0");
					 session.setAttribute("reportname","Last 15 Days Exception Report For Full Fleet");
					 String  exportFileName=session.getAttribute("user").toString()+"_last15days.xls";
 %>
 <div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table id="example1" class="table table-bordered">
 								<thead>
			<tr>
				<th align="center">Sr.</th>
				<th align="center">Vehno</th>
				<th align="center">Transporter</th>
				<th align="center">Date</th>
				<th align="center">Location</th>
				<th align="center">OS</th>
				<th align="center">OS Dur</th>
				<th align="center">RA</th>
				<th align="center">RD</th>
				<th align="center">CD</th>
				<th align="center">DT</th>
				<th align="center" colspan="1">Rating</th>
				<th align="center">Avg OS Dur/100km</th>
				<th align="center">Avg RA/100km</th>
				<th align="center">Avg RD/100km</th>
				<th align="center">FT</th>
				<th align="center">FA</th>
				<th align="center">FC</th>
				<th align="center">AVG</th>
				<th align="center">Stops</th>
				<th align="center">Run Hrs.</th>
				<th align="center">ND</th>
				<th align="center">Total ND Km</th>
				<th align="center">DayStop(Hrs)</th>
				<th align="center">Disconnection</th>
				<th align="center">Total Disconnection Km</th>
				<th align="center">Average speed Considered</th>

			</tr></thead><tbody>
			<!-- Get The Data From the Database and show it -->

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
	ResultSet rst=st.executeQuery(sql);
		if(rst.next())
		{
			vehregno=rst.getString("VehicleRegNumber");
			transporter=rst.getString("OwnerName");
		}
		if(fleetview.checkUserBlocked(transporter).equals("Yes"))
		{
			%>
			<tr>
				<td style="text-align: right"><%=i %></td>
				<td style="text-align: left"><%=vehregno %></td>
				<td style="text-align: right"><%=transporter%></td>
				<td style="text-align: left">Blocked</td>
				<td style="text-align: left">Access denied for <%=transporter%></td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
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
			String dttime="",location="",loc="";
			sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
			ResultSet rst1=st2.executeQuery(sql);
			
		if(rst1.next())
		{
			
			 loc=rst1.getString("Location");
			 if(!loc.equalsIgnoreCase("No data") && !("-").equals(loc))
			{
				 dttime=loc.substring(0,15);
				 location=loc.substring(19);
			}
			else{
				
				location=loc;
				dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
				//dttime=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
				/*System.out.println("location"+location);
				String sqldate="Select * from db_gps.t_veh"+aa+" where thefielddatadate='"+data2+"' order by thefielddatatime desc limit 1";
				ResultSet rstdate=st2.executeQuery(sqldate);
				if(rstdate.next())
				{
					dttime=rstdate.getString("thefielddatadatetime");
					System.out.println("dttime"+dttime);
				}
				else{
					dttime=data2;
					System.out.println("dttime"+dttime);
				}*/
				
			}
			 System.out.println("dttime----------------------------> "+dttime);
		%>
			<tr>

				<td style="text-align: right"><%=i %></td>
				<td style="text-align: right"><a
					href="customreport.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
				<td style="text-align: left"><%=transporter %></td>
				<td style="text-align: center"><%=dttime%></td>
				<td>
				<div align="left">
				<%
	
		
		if(location.equalsIgnoreCase("No data"))
		{
			out.print(location);
		}
		else
		{
			out.print(fleetview.ShowOnMapOnlyByLocation(location,aa,rst1.getString("TheDate")));
		}
	
		%>
				</div>
				</td>
				<%
		ResultSet rstcounts=fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,data1,data2);
		if(rstcounts.next())
		{
		%>
				<td>
				<div align="right">
				<%
		int os=rstcounts.getInt(1);
		cntos+=os;
		if(os >0)
		{
			%> <a href="detail_os.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=os%>
				</a> <%				
		}
		else
		{
			out.print(os);
		}
		%>
				</div>
				</td>
				<%
		double osavg =0.0;
		int osduration=0;
		String sqlos="SELECT sum(Duration)as duration FROM t_veh"+aa+"_overspeed  where concat(FromDate,' ',FromTime) >='"+data1+" 00:00:00' and ToDate <='"+data2+" 23:59:59' order by concat(FromDate,' ',FromTime)";
		//System.out.println("sqlos--->"+sqlos);
		ResultSet rstos=st4.executeQuery(sqlos);
		if(rstos.next())
		{
			osduration=rstos.getInt("Duration");
			//System.out.println(" OS Duration--->"+osduration);
		}
		cntosdur= cntosdur + osduration;
		%>
				<td>
				<div align="right"><%=osduration%></div>
				<td>
				<div align="right">
				<%
		int ra=rstcounts.getInt(2);
		cntra+=ra;
		if(ra>0)
		{ 
			%> <a
					href="detail_ra.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidAcceleration">
				<%=ra%> </a> <%
		}
		else
		{
			out.print(ra);
		}
		
		%>
				</div>
				</td>
				<td>
				<div align="right">
				<%
		int rd=rstcounts.getInt(3);
		cntrda+=rd;
		if(rd>0)
		{
			%> <a
					href="detail_rd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=RapidDecceleration">
				<%=rd%> </a> <%
		}
		else
		{
			out.print(rd);
		}
		
		%>
				</div>
				</td>
				<td>
				<div align="right">
				<%
		int cd=rstcounts.getInt(4);
		cntcd+=cd;
		if(cd>0)
		{
			%> <a
					href="detail_cd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&pageType=ContinuousDriving">
				<%=cd%> </a> <%
		}
		else
		{
			out.print(cd);
		}
		
		%>
				</div>
				</td>
				<td>
				<div align="right">
				<%
		double dt=rstcounts.getDouble(5);
		cntdt+=dt;
		/* out.print((int)dt); */
		
		out.print((int)dt);
		%>
				</div>
				</td>

				<td>
				<div align="right">
				<%
					NumberFormat nfrating=NumberFormat.getInstance();
					nfrating.setMaximumFractionDigits(2);
					nfrating.setMinimumFractionDigits(2);			
		double rating=0.0;
	  	if(dt>0.0)
	  	{
	  	double RD=((rd/dt)*100);
	  	double RA=((ra/dt)*100);	
	  	double OS=((osduration/10/dt)*100);
	  	rating=RA+RD+OS;
	  	
	  	out.print(nfrating.format(rating));
	  	}
	  	else{
	  		out.print(0.0);
	  	}
	  	cntrating=rating+cntrating;
	  	%>
				</div>
				</td>

				<td>
				<div align="right">
				<%
			//System.out.println("IN OS Avg");
			NumberFormat nfos=NumberFormat.getInstance();
			nfos.setMaximumFractionDigits(2);
			nfos.setMinimumFractionDigits(2);
			
			//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);
			
				if(osduration> 0.0 && dt >0.0)
				{
					//System.out.println("distance --->"+dt);
					osavg=(osduration*10)/dt;
					//System.out.println("OS avg--->"+osavg);
					out.print(nfos.format(osavg));
					//out.print(osavg);
					//out.print(osavg);
				}
				else{
					osavg=0.0;
					out.print(nfos.format(osavg));
					//out.print(osavg);
				}
				cntavgos+=osavg;
			
			
			%>
				</div>
				</td>
				<td>
				<div align="right">
				<% 
		NumberFormat nfra=NumberFormat.getInstance();
		nfra.setMaximumFractionDigits(2);
		nfra.setMinimumFractionDigits(2);
		double raavg =0.0;
		if(ra>0 && dt>0.0 )
		{
			//System.out.println("RA --->"+ra);
			raavg= (ra/dt)*100;
			//System.out.println("RA avg--->"+raavg);
			out.print(nfra.format(raavg));
			//out.print(raavg);
		}
		else  //if(dt==0.0 && ra>0 ||ra==0) 
		{ 
			raavg= 0.0;
			out.print(nfra.format(raavg));
		}
		cntavgra+=raavg;
		%>
				</div>
				</td>
				<td>
				<div align="right">
				<% 
		NumberFormat nfrd=NumberFormat.getInstance();
		nfrd.setMaximumFractionDigits(2);
		nfrd.setMinimumFractionDigits(2);
		double rdavg =0.0;
		
		if(rd>0 && dt>0.0)
		{
			//System.out.println("RD -->"+rd);
			rdavg= (rd/dt)*100;
			//System.out.println("RD avg--->"+rdavg);
			out.print(nfrd.format(rdavg));
			//out.print(rdavg);
			
		}
		else //if(dt==0.0 && rd>0 ||rd==0 )
		{
			rdavg= 0.0;
			out.print(nfrd.format(rdavg));
			//cntavgrd+=rdavg;
		}
		cntavgrd+=rdavg;
		%>
				</div>
				</td>

				<td>
				<div align="right">
				<%
		int ft=0;
		try{
			String sql4="select count(*) as fcnt from t_vehft where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
			ResultSet rs4= st2.executeQuery(sql4);
			if(rs4.next())
			{  
				ft=rs4.getInt("fcnt");
			}
			}catch (Exception e) {
				//System.out.print("Exception--->"+e);
			}
		//int ft=rstcounts.getInt(9);
		cntft+=ft;
		if(ft >0)
		{
			%> <a
					href="showfuelalert.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
				<%=ft%> </a> <%				
		}
		else
		{
			out.print(ft);
		}
		%>
				</div>
				</td>


				<td>
				<div align="right">
				<%
		int fa=0;
		try{
			String sql4="select count(*) as fcnt from t_vehfa where vehcode like '"+aa+"' and Thedate>='"+data1+"' and TheDate <='"+data2+"' order by concat(TheDate,TheTime) desc";
			ResultSet rs4= st2.executeQuery(sql4);
			if(rs4.next())
			{  
				fa=rs4.getInt("fcnt");
			}
			else{
				out.print(0);
			}
			}catch (Exception e) {
				//System.out.print("Exception--->"+e);
			}
		//int fa=rstcounts.getInt(8);
		//cntfa+=fa;
		if(fa >0)
		{
			%> <a
					href="showfueladd.jsp?data=<%=data1 %>&data1=<%=data2 %>&vehcode=<%=aa%>">
				<%=fa%> </a> <%				
		}
		else
		{
			out.print(0);
		}
		%>
				</div>
				</td>

				<%
		if(fleetview.getUnitDescription(aa).equals("FUELFLOW"))
		{
			%>
				<td>
				<div align="right">
				<%
				
				int fcval=fleetview.getFuelConsumptionForDateRange(aa,data1,data2);
				cntfc=cntfc+fcval;
				out.print(fcval);
			%>
				</div>
				</td>
				<td>
				<div align="right">
				<%
			NumberFormat nf=NumberFormat.getInstance();
			nf.setMaximumFractionDigits(2);
			nf.setMinimumFractionDigits(2);
			Double favgval=fleetview.getFuelAVGForDateRange(aa,data1,data2);
			cntavg=cntavg+favgval;
			out.print(nf.format(favgval));
			
			
			
			%>
				</div>
				</td>
				<%
		}
		else
		{
			%>
				<td>
				<div align="right">-</div>
				</td>
				<td>
				<div align="right">-</div>
				</td>
				<%
		}
		%>
				<td>
				<div align="right">
				<%
			//System.out.println("IN stop");
		int stsp=rstcounts.getInt(6);
		cntst+=stsp;
		if(stsp>0)
		{
			%> <a href="detail_stops.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"> <%=stsp%>
				</a> <%
		}
		else
		{
			out.print(stsp);
		}
		
		%>
				</div>
				</td>

				<td>
				<div align="right">
				<%
		double d=0.0;
		//System.out.println("Runhrs");
		NumberFormat nf1=NumberFormat.getInstance();
       nf1.setMaximumFractionDigits(2);
       nf1.setMinimumFractionDigits(2);
		d=rstcounts.getDouble(7);
		cntrh+=d;
		out.print((int)d);
		%>
				</div>
				</td>
				<td style="text-align: right">
				<%
	
					String time1 ="00:00:00";
					String time2="23:59:59";
			int cntnd1=fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
		if(cntnd1>0)
		{
			cntnd+=cntnd1;
			%> <a
					href="detail_nd.jsp?vid=<%=aa%>&vehno=<%=vehregno%>&data1=<%=data1+' '+time1 %>&data2=<%=data2+' '+time2 %>&pageType=NightDriving">
				<%=cntnd1%> </a> <%
		}
		else
		{
			out.print(0);
		}
		%>
				</td>
		<% 			
		int cntnd12=fleetview.NightDrivingFormExceptionsForDateRange1(aa,data1,data2);
		%>
		
		<td style="text-align: right;">
		<%
		if(cntnd12>0)
		{cntndk+=cntnd12;	
		%>			
			<%=cntnd12 %>
		<%
		}else
		{
			out.print(0);
		}
		%>		
					</td>
				
				
				
				
				<td>
				<div align="right">
				<%
		
		String sqlstop="select sum(DayStopDurationinHrs) as stopduration from "+tbname+" where VehCode='"+aa+"' and TheDate <='"+data2+"' and TheDate >='"+data1+"' order by TheDate desc";
		ResultSet rststop=st3.executeQuery(sqlstop);
		
		if(rststop.next())
		{
			stopdur=rststop.getDouble("stopduration");
			totstopdur=totstopdur+rststop.getDouble("stopduration");
			%> <%=df.format(stopdur)%> <%
		}
		else
		{
			out.print("0");
			
		}
		
		%>
				</div>
				</td>

			
				<%
				//.....
				
				try{
		//	String time1 ="00:00:00";
		//	String time2="23:59:59";
		
		String sqldisconn="Select count(*) as cnt from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeFrom >='"+data1+" 00:00:00' and  OffTimeTo <='"+data2+" 23:59:59' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
		System.out.println("\n\n\nsqldisconn==>"+sqldisconn);
		ResultSet rstdisconn=st5.executeQuery(sqldisconn);
		%>
		<td >
					<div align="right">
		<%
		if(rstdisconn.next())
		{
			if(rstdisconn.getInt("cnt")>0)
			{
				%> <a
					href="disconnectedDetailsReport.jsp?vehicleCode=<%=aa%>&VehicleRegNo=<%=vehregno%>&ownerName=<%=transporter%>&fromDateTime=<%=data1+" "+time1%>&toDateTime=<%=data2+" "+time2%>">
				<%=rstdisconn.getInt("cnt")%> </a> <%
			}
			else{
				out.print(0);
			}
		}
		else
		{
			out.print(0);
		}
		
		cntdisconn=cntdisconn+rstdisconn.getInt("cnt");
		%>
		</div></td>
		<%
		sqldisconn="Select Distance from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeTo <='"+data2+" 23:59:59' and  OffTimeFrom >='"+data1+" 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
		ResultSet rstdis=st5.executeQuery(sqldisconn);
		int diskm=0;
		while(rstdis.next())
		{
		  diskm=diskm+rstdis.getInt("Distance");
		}
		%>
		
		<td >
					<div align="right">		<%
		if(diskm>0)
		{disk+=diskm;
			%>
		<%=diskm %>
		<%
		}
		else
		{
			out.print(0);
		}
		
	
		
		%>
		</div>
		</td>
		<%
		
		
		}catch(Exception ee)
		{
			System.out.println("Exception disconnection "+ee);
		}
		System.out.println("out of Disconnection");
		
				
				//....
	
		%>
				
				<td>
				<div align="left">
				<%
		 
					try{
						
						
						String avgspeed="Select * from db_gpsExceptions.t_vehall_ds where vehcode='"+aa+"' and TheDate <='"+data2+"'  and  TheDate >='"+data1+"' and AvgSpeedConsidered='Yes' ";
						System.out.println("avgspeed==>"+avgspeed);
						ResultSet rstavg=st3.executeQuery(avgspeed);
						if(rstavg.next())
						{
							/*System.out.println("in avg speed");
							avgsped=rst1.getString("AvgSpeedConsidered");
							if(avgsped.equalsIgnoreCase("Yes"))
							{
								System.out.println("in Yes");*/
								out.print("Yes");
						}
							else{
								System.out.println("in NO");
								out.print("No");
							}
						//}
						//else{
							//out.print("No");
						// }
						}catch(Exception ea){
							System.out.println("Avg speed exception"+ea);
						}
						System.out.println("out of avgspeed");
		//System.out.println("out of avgspeed");
		//cntdisconn=cntdisconn+rstdisconn.getInt("cnt"); 
		%>
				</div>
				</td>
			</tr>
			<%
		i++;
				//System.out.println("value of i"+i);	
		}
		//System.out.println("While");	
		}
		else
		{
			dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
            System.out.println("datetime-------------->  " +dttime);
			
			%>
			<tr>
				<td style="text-align: right"><%=i %></td>
				<td style="text-align: left"><%=vehregno %></td>
				<td style="text-align: left">No DATA</td>
				<td style="text-align: left">No DATA</td>
				<td>
				<div align="left">No DATA</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td style="text-align: left">No</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="right">0</div>
				</td>
				<td>
				<div align="left">No</div>
				</td>
			
			<%
			i++;
		}
	}
	}
	}
	

NumberFormat nf1=NumberFormat.getInstance();

nf1.setMaximumFractionDigits(2);
nf1.setMinimumFractionDigits(2);


%>
</tbody><tbody><tr>			
				<td colspan="5"  align="right">Total</td>
				<td >
				<div align="right"><%=cntos %></div>
				</td>
				<td >
				<div align="right"><%=cntosdur %></div>
				</td>
				<td >
				<div align="right"><%=cntra %></div>
				</td>
				<td >
				<div align="right"><%=cntrda %></div>
				</td>
				<td >
				<div align="right"><%=cntcd %></div>
				</td>
				<td >
				<div align="right"><%=cntdt %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntrating) %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntavgos) %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntavgra) %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntavgrd) %></div>
				</td>
				<td >
				<div align="right"><%=cntft %></div>
				</td>
				<td >
				<div align="right"><%=cntfa %></div>
				</td>
				<td >
				<div align="right"><%=cntfc %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntavg) %></div>
				</td>
				<td >
				<div align="right"><%=(int)cntst %></div>
				</td>
				<td >
				<div align="right"><%=(int)cntrh %></div>
				</td>
				<td >
				<div align="right"><%=cntnd %></div>
				</td>
				<td >
					<div align="right"><%=cntndk %></div>
					</td>
				<td >
				<div align="right"><%=nf1.format(totstopdur) %></div>
				</td>
				<td >
				<div align="right"><%=nf1.format(cntdisconn)%></div>
				</td>
				<td >
					<div align="right"><%=disk %></div>
					</td>
				<td >
				<div align="right">-</div>
				</td>
			</tr>
			</tbody>
			
			<tfoot>
			<tr>
				<th align="center">Sr.</th>
				<th align="center">Vehno</th>
				<th align="center">Transporter</th>
				<th align="center">Date</th>
				<th align="center">Location</th>
				<th align="center">OS</th>
				<th align="center">OS Dur</th>
				<th align="center">RA</th>
				<th align="center">RD</th>
				<th align="center">CD</th>
				<th align="center">DT</th>
				<th align="center" colspan="1">Rating</th>
				<th align="center">Avg OS Dur/100km</th>
				<th align="center">Avg RA/100km</th>
				<th align="center">Avg RD/100km</th>
				<th align="center">FT</th>
				<th align="center">FA</th>
				<th align="center">FC</th>
				<th align="center">AVG</th>
				<th align="center">Stops</th>
				<th align="center">Run Hrs.</th>
				<th align="center">ND</th>
				<th align="center">Total ND Km</th>
				<th align="center">DayStop(Hrs)</th>
				<th align="center">Disconnection</th>
				<th align="center">Total Disconnection Km</th>
				<th align="center">Average speed Considered</th>
			</tr></tfoot>		
		                        </table>
		           </div>
		           </div>
		           </div>
		           </section>
		           </div><%

					 }catch(Exception e)
					 {
					 	System.out.println("Exception" +e);
					 }
					 
	}%>					
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
								title: 'Exception Report'
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Exception Report'
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Exception Report'
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Exception Report'
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Exception Report'
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

              <%-- dt_basic.columns([<%=detailViewSequence%>]).visible(false), --%> 

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


         $('#example1').addClass('table-responsive');
         
         <%-- $("#detailedView").on("click", function () {

            dt_basic.columns([<%=detailViewSequence%>]).visible(true),

                $('#example1').addClass('table-responsive');

        }); --%>


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
</jsp:useBean>