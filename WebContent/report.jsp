
<%@ include file="headernew1.jsp"%>
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
</jsp:useBean>
<%
	fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
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

</head>

<%
	String username="";
	username=(String)session.getAttribute("usertypevalue");
	
	int colcount=0;   //special code for detailed view
	String setSequence ="";
	String detailViewSequence = "",ColumnList="";
	boolean setDefFlag=false;
	
	System.out.println("Session name----------------->:"+username); 
	int cntos=0, cntra=0, cntrda=0, cntdt=0, cntst=0, cntcd=0, cntnd=0,cntndk=0,datadaystotal=0,disk=0, cntfc=0, cntdisconn=0,
	cntft = 0, cntfa = 0,counter=0;
	double cntrh=0.0;
	double cntavg=0.00;
	double cntosdur,cntavgos=0.0;
	double tot_dur=0.0;
	double stopdur=0, totstopdur=0, cntrating=0,cntavgra=0.0,cntavgrd=0.0,timevikram=0.0;
	String str_os = "("; 
	String str_os1= "("; 
	String str_os2= "("; 
	String str_os3= "("; 
	int temp = 1;
	int temp1= 1 ;
	int temp2= 1;
	int temp3= 1;
	int nd_pri=0;
	int cntndpost=0;
	datadaystotal=0;
	int i=1;
	cntos=0;
	int cntdv=0;

	cntra=0;
	cntrda=0;
	cntdt=0;
	cntst=0;
	cntrh=0.0;
	cntcd=0;
	cntnd=0;
	cntfc=0;
	cntosdur = 0.0;
	Format formatter = new SimpleDateFormat("dd-MMM-yyyy");
	
	String datex1, datex2, data1, data2;
	
	
%>


<%
	String ddx = request.getQueryString();
	String bt=request.getParameter("button");
	System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) 
	{
		
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());
		data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new java.util.Date());
	
		Calendar c = Calendar.getInstance();   // this takes current date
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
	    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	
	
	} 
	else 
	{
		
		System.out.println("Inside ELSSSSSSSSS ");
		
				
		data1 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data")));
		data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data1")));

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

	System.out.println(" datex1 "+datex1+" datex2 "+datex2);
	
	String ddd = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(datex1));
	
	String dddd = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(datex2));
	session.setAttribute("data1",ddd);session.setAttribute("data2",dddd);

	
%>
<body onload="ondemand()">


<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Custom Report for Full Fleet From <%=datex1 %>
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

<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />

<form name="formreport" id="formreport" method="post">
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

<%
	Connection conn=null,conn1=null;
	Statement st1=null, st2=null, st=null, st3=null, st4=null, st5=null, st15=null,stmain11=null,st21=null,st22=null,stt=null,st7=null,stmain1=null,stmt=null;
	Statement st23=null,st24=null;
%>
<%
	try
	{
		conn = fleetview.ReturnConnection();
		conn1 = fleetview.ReturnConnection1();
		st=conn.createStatement();
		st1=conn.createStatement();
		st2=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st4=conn.createStatement();
		st5=conn.createStatement();
		st21=conn.createStatement();
		st22=conn.createStatement();
		st15=conn.createStatement();
		st23 = conn.createStatement();
		st24 = conn.createStatement();
		stmain11 = conn.createStatement();
		stt = conn.createStatement();
		st7= conn.createStatement();
		stmain1= conn.createStatement();
		stmt= conn.createStatement();
		
	}
	catch(Exception e)
	{
		
	}
	
%>
<%
String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st23.executeQuery(setdefault);
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

	ResultSet rssetdefault1=st24.executeQuery(setdefault1);
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
					<th>Vehicle No.</th>
					<th>Vehicle Type</th>
					<th>UserName</th>
					<th>UserCode</th>
					<th>Transporter</th>
					<th>Group</th>
					<th>Current Trip</th>
					<th>Date</th>
					<th>Location</th>
					<th>Data Days</th>
					<th>OS</th>
					<th>OS Dur</th>
					<th>RA</th>
					<th>RD</th>
					<th>CD</th>
					<th>DV</th>
					<th>DT</th>
					<th colspan="1">Rating</th>
					<th id="taa" style="display: none;">Avg OS Dur/100km</th>
					<th id="tbb" style="display: none;">Avg RA/100km</th>
					<th id="tcc" style="display: none;">Avg RD/100km</th>
					<th>FT</th>
					<th>FA</th>
					<th>FC</th>
					<th>AVG</th>
					<th>Stops</th>
					<th>Run Hrs.</th>
					<th>AVG Speed</th>
					<th>ND</th>
					<th>ND Dur(Hrs)</th>
					<th>ND Km</th>
					<th>ND Int</th>
					<th>ND Reason</th>
					<th>DayStop <br>(Hrs)</th>
					<th>DC</th>
					<th>Total DC Km</th>
					<th>Distance Violations</th>

		</tr>
	</thead>
<tbody>


<%
		String ss=session.getAttribute("VehList").toString();
		StringTokenizer s= new StringTokenizer(ss,",");
		String aa,tbname;
		String vehtype="";
		String group="";
		String ctrip="";
		String vehregno="", transporter="", UserCode;
		System.out.println(" s"+ss);
		String bgcolor="";
		int distviototal=0;
		
		while(s.hasMoreTokens())
		{
		aa=s.nextElement().toString();
		aa=aa.replace(")","");
		aa=aa.replace("(","");
		tbname="db_gpsExceptions.t_vehall_ds";
		
		if(!aa.equals("0"))
		{
			String sql="select * from t_vehicledetails where vehicleCode='"+aa+"'";
			String sql1="Select * from  db_gps.t_startedjourney where Vehid='"+aa+"' order by rid desc limit 1";
			String sql2="select * from db_gps.t_group where VehCode='"+aa+"' order by UpdatedDatetime desc limit 1"; 		
			System.out.println("CURRENT TRIP====>>>>>"+sql1+" ,"+sql+" ,"+sql2);
		
			ResultSet rst=st.executeQuery(sql);
			ResultSet rst11=st1.executeQuery(sql1);
			ResultSet rst22=st2.executeQuery(sql2);
				if(rst.next())
				{
					vehregno=rst.getString("VehicleRegNumber");
					transporter=rst.getString("OwnerName");
					UserCode=rst.getString("Empcode");
					vehtype=rst.getString("vehtype");
					
					if(vehtype==null || vehtype.equals("null"))
					{
						vehtype="-";
					}
					if(UserCode.equals("") || UserCode.equals(null)){
						UserCode="-";
		
					}
				}
				else{
					UserCode="-";
				}
				if(rst11.next())
				{
					//group=rst11.getString("Gpname");
					ctrip=rst11.getString("TripID");
				}
				else{
					ctrip="-";
				}
				if(rst22.next())
				{
					group=rst22.getString("GPName");
					//ctrip=rst11.getString("TripID");
				}
				else
				{
					group="-";
					
				}
			
				String UserName="";
				String SqlUserDetail1="Select * from db_gps.t_userdetails where vehid='"+aa+"'";
				ResultSet rstUname1=st22.executeQuery(SqlUserDetail1);
				if(rstUname1.next())
			   	{
				   UserName=rstUname1.getString("FirstName")+" "+rstUname1.getString("LastName");
				  // UserNo=rst1.getString("MobNo");
				  
			   	}
			   	else
			   	{
				   UserName="-";
				   //UserNo="-";
				   
				}
				
				int datadayscount=0;
				if(fleetview.checkUserBlocked(transporter).equals("Yes"))
				{
%>
				<tr>
					<td align="right""><%=i %></td>
					<td align="right""><%=vehregno %></td>
					<td align="right""><%=vehtype %></td>
					<td align="right""><%=UserName %></td>
					<td align="right""><%=UserCode %></td>
					<td align="right""><%=transporter%></td>
					<%
					if(group.equalsIgnoreCase(""))
					{
					%>
					<td>-</td>
					<td>-</td>
					<%
					}
					else
					{
					%>
					<td align="right"><%=group%></td>
					<td align="right"><%=ctrip%></td>
					<%
					}
					%>
					<td align="right">Blocked</td>
					<td align="right">Access denied for <%=transporter%></td>
					<td align="right"><%=datadayscount%></td>
		
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td align="right" id="ta<%=i %>" style="display: none;">-</td>
					<td align="right" id="tb<%=i %>" style="display: none;">-</td>
					<td align="right" id="tc<%=i %>" style="display: none;">-</td>
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
				counter=counter+i;
		}
		
		else
		{

			
			String datadays="select count(*) as count from db_gpsExceptions.t_vehall_ds where VehCode='"+aa+"' and TheDate>='"+ddd+"' and TheDate <= '"+dddd+"' and Location <> 'No Data'";
			ResultSet datadaysrs=st21.executeQuery(datadays);
			if(datadaysrs.next())
			{
				datadayscount=datadaysrs.getInt("count");
				System.out.println("DataDaysCount====>>>>>"+datadayscount);
				datadaystotal=datadaystotal+datadayscount;
			}
			
			String dttime="",location="-",loc="-";
			java.util.Date today=new java.util.Date();
			String todaydt=new SimpleDateFormat("yyyy-MM-dd").format(today);
			java.util.Date today1=new SimpleDateFormat("yyyy-MM-dd").parse(todaydt);
			
			
			
			
			System.out.println("==================>"+sql);

			sql="select * from "+tbname+" where VehCode='"+aa+"' and TheDate >='"+ddd+"' and TheDate <='"+dddd+"' order by TheDate desc";
			
			ResultSet rst1=st2.executeQuery(sql);
			if(rst1.next())
			{
			
			 loc=rst1.getString("Location");
			 System.out.println("loc===>"+loc);
			 
			 
			if(!loc.equalsIgnoreCase("No data") && !("-").equals(loc))
			{
				 dttime=loc.substring(0,15);
				 location=loc.substring(19);
			}
			else
			{
				
				location=loc;
				dttime=formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(dddd));
			}
			
			
			/// ND Count Reamining 
			
			int cntnd1=fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
			if(cntnd1>0){
			String sqlNdcolor="select *  from db_gpsExceptions.t_veh"+aa+"_nd where FromDate>='"+ddd+"' and FromDate <='"+dddd+"' and NDPreAuthorised ='Yes' order by fromdate asc";
			ResultSet rsndcolor = stmain11.executeQuery(sqlNdcolor);
			if(rsndcolor.next())
			{
				bgcolor="background-color:#66CC00";
			}
			else
			{
				bgcolor="background-color:#FFFF66";
			}
			}
			else
			{
				bgcolor="";
			}
			
%>
<tr>
                    <% System.out.println(">>>>>>>>>>>First TR<<<<<<<<<<<<<<<<<<"); %>
                    
					<td style="text-align: right"><%=i %></td>
					<td style="text-align: left"><a
						href="customreport.jsp?vid=<%=aa%>&vehno=<%=vehregno%>"><%=vehregno %></a></td>
					<td style="text-align: left"><%=vehtype %></td>
					<td style="text-align: left"><%=UserName %></td>	
					<td style="text-align: left"><%=UserCode %></td>	
					<td style="text-align: left"><%=transporter %></td>
					<%
					if(group.equalsIgnoreCase(""))
					{
					%>
					<td>-</td>
					<td>-</td>
					<%
					}
					else
					{
					%>
					<td style="text-align: left"><%=group%></td>
					<td style="text-align: left"><%=ctrip%></td>
					<%
					}
					%>
					<%
					
					
					
					String dtt = new SimpleDateFormat("dd/MM/yyyy")
					.format(new SimpleDateFormat("dd-MMM-yyyy")
							.parse(dttime));
					
					
					
					
					
					%>
					<td style="text-align: right"><%=dtt %></td>
					<td>
<div align="left">
<%
	
					System.out.println(">>>>>>>>>>>@@@@@@@@@@<<<<<<<<<<<<<<<<<<");
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
<td style="text-align: right"><%=datadayscount%></td>
		
<%
					
					String sqlcount="select SUM(OSCount),SUM(RACount),SUM(RDCount),SUM(CRCount),SUM(Distance),SUM(StopCount), SUM(RDuration), SUM(FACount),SUM(FTCount),SUM(RDinSec),SUM(RDurationinHrs),sum(Osduration),sum(FTCount),sum(FACount),sum(FC),AVG(FAVG) as FAVG,sum(NDCount),Sec_To_Time(SUM(Time_To_Sec(NDDurationinHrs))),SUM(Time_To_Sec(NDDurationinHrs)),sum(NDKm),sum(NDIntimation),sum(NDReason),sum(DCCount) from db_gpsExceptions.t_vehall_ds where VehCode='"+aa+"' and TheDate >='"+ddd+"' AND TheDate <='"+dddd+"'";
					//17 18
					
		          ResultSet rstcounts=stmain1.executeQuery(sqlcount);
		          System.out.println("sqlcount==>"+sqlcount);
		          
			fleetview.GetOS_RA_RD_CR_DT_ST_DURATION_CountFromExceptionDBForDateRange(aa,ddd,dddd);
			
		if(rstcounts.next())
		{
%>
<td>
	<div align="right">
<%
		int os=rstcounts.getInt(1);
		cntos+=os;
		try
		{
		if(os >0)
		{
			 if(temp==1)
			 {
				 str_os=aa;
				 temp++;
			 }
				 else
		    str_os=str_os+","+aa; 
			
%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>"> <%=os%>
					</a> 
<%				
		}
		else
		{
			out.print(0);
		}
		}
		catch(Exception e)
		{
			System.out.println("OS======>Ecxeption");
			e.printStackTrace();
		}
%>
		</div>
</td>
<%
					
					
					
				//OS Duration calculation 	
					
					
		double osavg =0.00;
		double osduration=0.00;
		int osduration1=0;
		try
		{
		
			osduration=rstcounts.getDouble(12);
			osduration1=rstcounts.getInt(12);
			System.out.println(" OS Duration--->"+osduration);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception>>>>>>>>>>>>>1111:");
		}
		cntosdur= cntosdur + osduration1;
		System.out.println("CNTOSDUR====="+cntosdur);
%>
	<td>
		<div align="right"><%=osduration1%></div>
	</td>
					
					
<td>
		<div align="right">
<%
		int ra=rstcounts.getInt(2);
		int dccount=rstcounts.getInt(23);
		System.out.println("dccount---------"+dccount);
		cntra+=ra;
		System.out.println("CNTRA======"+cntra);
		if(ra>0)
		{ 
			if(temp1==1)
			 {
				 str_os1=aa;
				 temp1++;
			 }
				 else
		    str_os1=str_os1+","+aa; 
			
%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
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
		System.out.println("CNTRDA====="+cntrda);
		if(rd>0)
		{
			if(temp2==1)
			 {
				 str_os2=aa;
				 temp2++;
			 }
				 else
		    str_os2=str_os2+","+aa; 
			
			%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
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
			%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
								<%=cd%> </a> 
			<%
					}
					else
					{
						out.print(cd);
					}
					
			%>
	</div>
</td>
					
<% //logic for DV
	int dv=0;
	String sqldv ="select count(*) as dvcount from db_gpsExceptions.t_vehall_dv where  VehCode='"+aa+"' and FromDateTime >='"+ddd+"' AND ToDateTime <='"+dddd+"'";
			ResultSet rsdv=stmt.executeQuery(sqldv);
			if(rsdv.next()){
				dv=rsdv.getInt(1);
			}
	
%> 				
					
<td>
		<div align="right">
	<%
			 
			cntdv+=dv;
			if(dv>0)
			{
	%> 
	<a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>"><%=dv%> </a> 
	<%
			}
			else
			{
				out.print(dv);
			}
			
	%>
		</div>
</td>
					
<td>
		<div align="right">
<%
		
					System.out.println("dt=prev=>");
					
					double dt=0.00;
					int dt1=0;
					
					try
					{
					 dt=rstcounts.getDouble(5);
					 dt1=rstcounts.getInt(5);
					}
					catch(Exception e)
					{
						e.printStackTrace();
						System.out.println("Exception= in distance=>"+e);	
						dt=0.00;
						dt1=0;
					}
					
					
					System.out.println("dt==>"+dt);
					System.out.println("dt1==>"+dt1);
		cntdt+=dt;
		System.out.println("CNTDT====="+cntdt);
		out.print(dt1);
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
		double RD=0;
		double RA=0;
		double OS=0;
	  	if(dt>0.0)
	  	{
	  		try{	
	  		try
	  		{
	  			RD=((rd/dt)*100);
	  		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  			RD=0;
	  		}
	  		try
	  		{
	  	RA=((ra/dt)*100);
	  		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  			RA=0;
	  		}
	  	try
	  	{
	  	OS=((osduration/10/dt)*100);
	  	}
	  	catch(Exception e)
	  	{
	  		e.printStackTrace();
	  		OS=0;
	  	}
	  	if(dt>0)
	  	{
	  	rating=RA+RD+OS;
	  	}
	  	else
	  	{
	  		out.print("-");
	  	}
	  		}
	  	catch(Exception e)
		{
			System.out.println("RA+RD+OS=====>");
	  		e.printStackTrace();
		}
	  	out.print(nfrating.format(rating));
	  	}
	  	else{
	  		out.print(0.00);
	  	}
	  	cntrating=rating+cntrating;
		
		
		
%>
		</div>
</td>

<td  id="ta<%=i %>" style="display: none;<%=bgcolor%>" >
		<div align="right">
<%
			System.out.println("IN OS Avg");
					
			NumberFormat nfos=NumberFormat.getInstance();
			nfos.setMaximumFractionDigits(2);
			nfos.setMinimumFractionDigits(2);
			
			//int osduration=fleetview.getOSDurationforDateRange(aa,data1,data2);
				
				if(osduration> 0.0 && dt >0.0)
				{
					try
					{
				
					
					System.out.println("distance --->"+dt);
					try
					{
					osavg=(osduration*10)/dt;
					}
					catch(Exception e)
					{
						e.printStackTrace();
						osavg=0;
					}
					System.out.println("OS avg--->"+osavg);
					out.print(nfos.format(osavg));
					//out.print(osavg);
					//out.print(osavg);
					
					}
					catch(Exception e)
					{
						System.out.println("Osduration=====>");
						e.printStackTrace();
					}
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
<td  id="tb<%=i %>" style="display: none;<%=bgcolor%>">
		<div align="right">
<% 
		NumberFormat nfra=NumberFormat.getInstance();
		nfra.setMaximumFractionDigits(2);
		nfra.setMinimumFractionDigits(2);
		double raavg =0.0;
		
		
		if(ra>0 && dt>0.0 )
		{
			try
			{
				
			
			System.out.println("RA --->"+ra);
			System.out.println("dccount---------"+dccount);
			try
			{
			raavg= (ra/dt)*100;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				raavg=0;
			}
			System.out.println("RA avg--->"+raavg);
			out.print(nfra.format(raavg));
			//out.print(raavg);
			}
			catch(Exception e)
			{
				System.out.println("RAavg=====>");
				e.printStackTrace();
				
			}
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
	
	<td id="tc<%=i %>" style="display: none;<%=bgcolor%>">
		<div align="right">
	<% 
		NumberFormat nfrd=NumberFormat.getInstance();
		nfrd.setMaximumFractionDigits(2);
		nfrd.setMinimumFractionDigits(2);
		double rdavg =0.0;
		
		if(rd>0 && dt>0.0)
		{
			
			try
			{
			System.out.println("RD -->"+rd);
			try
			{
				rdavg= (rd/dt)*100;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				rdavg=0;
			}
			System.out.println("RD avg--->"+rdavg);
			out.print(nfrd.format(rdavg));
			//out.print(rdavg);
			}
			catch(Exception e)
			{
				rdavg=0;
				System.out.println("RDavg=====>");
				e.printStackTrace();
			}
			
		}
		else //if(dt==0.0 && rd>0 ||rd==0 )
		{
			rdavg= 0.00;
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
		
				ft=rstcounts.getInt(13);
				if(ft==0)
				{
					ft=0;
				}
			
		cntft+=ft;
		if(ft >0)
		{
			%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
					<%=ft%> </a> <%				
		}
		else
		{
			out.print(0);
		}
%>
	</div>
</td>

<td>
	<div align="right">
<%
		int fa=0;
		
				fa=rstcounts.getInt(14);
				
				if(fa==0)
				{
					fa=0;
				}
			
		cntfa+=fa;
		if(fa >0)
		{
%> 
<a
						href="showfueladd.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
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
					<td >
					<div align="right">
<%
				
				int fcval=rstcounts.getInt(15);
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
						
						Double favgval=0.00;
						String favgval1=Double.toString(favgval);
							if(rstcounts.getDouble("FAVG") >0)
							{
								favgval1=rstcounts.getString("FAVG");
							}
							else
							{
								favgval1="-";
							}
						
						
						cntavg=cntavg+favgval;
						out.print("-");
						
						
						
			%>
		</div>
</td>
<%
		}			
					
		else
		{
%>
					<td >
					<div align="right">-</div>
					</td>
					<td >
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
			
			
%> 
<a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>"> <%=stsp%></a> 
<%
		}
		else
		{
			out.print(0);
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
								double d=0.00;
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
											
											
											String avgspeed="Select * from db_gpsExceptions.t_vehall_ds where vehcode='"+aa+"' and TheDate >='"+ddd+"'  and  TheDate <='"+dddd+"' and AvgSpeedConsidered='Yes' ";
											System.out.println("avgspeed==>"+avgspeed);
											ResultSet rstavg=st3.executeQuery(avgspeed);
											if(rstavg.next())
											{
												
													out.print("Yes");
											}
												else{
													System.out.println("in NO");
													out.print("No");
												}
											
											}
										catch(Exception ea)
										{
												ea.printStackTrace();
												System.out.println("Avg speed exception"+ea);
										}
										
						%>
			</div>
</td>
					
					
					
					
					
<td style="text-align: right">
<%
					
					
					
	//////////////////////////////////////////////////////  Done  /////////////////////////////////////////////////////			
					
					
					
					
					
					
					
					
					
					
					
					String time1 ="00:00";
					String time2="23:59";
			int cntnd11=0;
			if(rstcounts.getInt(17)>0)
			{
				cntnd11=rstcounts.getInt(17);
			}
			
				
				//fleetview.NightDrivingFormExceptionsForDateRange(aa,data1,data2);
			if(cntnd11>0)
		{
			cntnd+=cntnd11;
%> 
	<a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>"><%=cntnd11%> </a> 
<%
		}
		else
		{
			out.print(0);
		}
%>
</td>
					
<td style="text-align: right">
	<%
					int count1=0;
					String Time="00:00:00";
					try
					{
						
								Time=rstcounts.getString(18);
							    tot_dur=tot_dur+rstcounts.getDouble(19);
					
					}
					catch (Exception e) 
					{
						e.printStackTrace();
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
	                     
	                     System.out.println(" Total ND hr time is " +timevikram);
	                     

					}
					catch(Exception e)
					{
						e.printStackTrace();
						System.out.println(">>>>>>>exception:"+e);
					}
					 System.out.println("Last total time is " +Time);

	  %>
		<%=Time %>
</td>
					
		<% 			
			int cntnd12=rstcounts.getInt(20);
		%>
<td style="text-align: right">
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
					
					
					
<td style="text-align: right">
	<%
							
									int count=0;
									try
									{
												count=rstcounts.getInt(21);
												nd_pri=nd_pri+count;
										
									}
									catch (Exception e) 
									{
										
										e.printStackTrace();
										System.out.println("Exception-->>>>>>>>>>>"+e);
										
									}
							
	%>
							<%=count %>
</td>
					
					
					
<td>
            <div align="right">
                   <% 
		                                try{
		                                                           
		                      
		                    	if(rstcounts.getInt(22)>0)
		                                {  
		           %>
		                                                                            
		                            
		           <%
		                                }
		                                else{
		                                        out.print(0);
		                                }
		                       
		                        
		                    cntndpost=cntndpost+rstcounts.getInt(22);
		                       
		                                }catch(Exception ee)
		                                {
		
		                                		ee.printStackTrace();
		                                		System.out.println("Exception in ND post intimation"+ee);
		                                }
		          /////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      
                    %>
                         </div>
   </td>
				
<td>
	<div align="right">
			<%
				
				String sqlstop="select sum(DayStopDurationinHrs) as stopduration from "+tbname+" where VehCode='"+aa+"' and TheDate >='"+ddd+"' and TheDate <='"+dddd+"' order by TheDate desc";
				ResultSet rststop=st3.executeQuery(sqlstop);
				try
				{
				if(rststop.next())
				{
					stopdur=rststop.getDouble("stopduration");
					double d1 = stopdur;
				    DecimalFormat f = new DecimalFormat("##.00");
				   totstopdur=totstopdur+rststop.getDouble("stopduration");
			%> 
				<%=f.format(d1)%> 
			<%
								
						}
						else
						{
							out.print("0.00");
							
						}
						}
						
						catch(Exception e)
						{
							e.printStackTrace();
							System.out.println("stopduration=====>");
						}
			%>
	</div>
</td>
<%
					
			try{		
		
%>
<td>
		<div align="right">
<%
		
			System.out.println("rstcounts.getInt(23)>="+rstcounts.getInt(23));
			if(rstcounts.getInt(23)>0)
			{
				
%>
				<a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>"><%=rstcounts.getInt("sum(DCCount)")%> </a> 
<%
			}
			else{
				out.println(0);
			}
			
		
		cntdisconn=cntdisconn+rstcounts.getInt(23);
		System.out.println("DCcount"+cntdisconn);
%>
		</div>
</td>
<%

		// count total km of diss
		String sqldisconn="Select SUM(Distance) as Distance  from db_gps.t_disconnectionData where vehicleCode='"+aa+"' and  OffTimeTo >='"+ddd+" 23:59:59' and  OffTimeFrom <='"+dddd+" 00:00:00' and Reason = 'Disconnection' and ignoredstamp='No' and Duration >= '0:30'";
		
		ResultSet rstdis=st5.executeQuery(sqldisconn);
		
		System.out.println("Distance of disconnection query is " +sqldisconn);
		
		int diskm=0;
		while(rstdis.next())
		{
		  diskm=diskm+rstdis.getInt("Distance");
		  System.out.println("DISKM====="+diskm);
		}
%>
<td>
	<div align="right">
<%
		
		if(diskm>0)
		{
			disk+=diskm;
			
			System.out.println("DISK========>"+disk);
%>
	<a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">	<%=diskm %></a>
<%
		}
		else
		{
			out.println(0);
		}
		
		//... end of total km
		
%>
	</div>
</td>

<% //logic for DV
		
	
		String TypeValue1=session.getAttribute("usertypevalue").toString();

				int defaultVal=0;
				int dailtdistancecount=0;
				String sqldefaultval1 ="select dailydistancelimit from db_gps.t_defaultvals where ownername='"+TypeValue1+"'";
				ResultSet rsdefaultval1=stmt.executeQuery(sqldefaultval1);
				System.out.println("Default val sqldefaultval1========>"+sqldefaultval1);

				if(rsdefaultval1.next())
				{
					defaultVal=rsdefaultval1.getInt("dailydistancelimit");
				}
				else
				{
				    String sqldefaultval ="select dailydistancelimit from db_gps.t_defaultvals where ownername='default'";
					ResultSet rsdefaultval=stmt.executeQuery(sqldefaultval);
					if(rsdefaultval.next())
					{
						defaultVal=rsdefaultval.getInt("dailydistancelimit");
					}
				}
			System.out.println("Default val========>"+defaultVal);
			String dailydistance ="select count(*) as dailydistvio from db_gpsExceptions.t_vehall_ds where VehCode='"+aa+"' and TheDate>='"+ddd+"' and TheDate <= '"+dddd+"' and Distance>'"+defaultVal+"' and Location <> 'No Data'";
			ResultSet rsdailydistance=stmt.executeQuery(dailydistance);
			System.out.println("dailydistance Query val========>"+dailydistance);

			if(rsdailydistance.next())
			{
				dailtdistancecount=rsdailydistance.getInt("dailydistvio");
			}
			
			System.out.println("dailtdistancecount val========>"+dailtdistancecount);
			distviototal=distviototal+dailtdistancecount;
%> 				
					
<td>
		<div align="right">
<%
		 
		if(dailtdistancecount>0)
		{
%> <a href="CustomReportDrillDown.jsp?data=<%=ddd %>&data1=<%=dddd %>&vehcode=<%=aa%>">
					<%=dailtdistancecount%> </a> 
<%
		}
		else
		{
			out.print(dailtdistancecount);
		}
		
%>
		</div>
</td>
		
<%
		
		
		}
		catch(Exception ee)
		{
			ee.printStackTrace();
			System.out.println("Exception disconnection "+ee);
		}
		System.out.println("out of Disconnection");
		
%>
</tr>
	<%
			i++;
					counter=counter+i;
			}
			System.out.println("While");	
			}
			else
			{
	%>
<tr>
					<td style="text-align: right"><%=i %></td>
					<td style="text-align: left"><%=vehregno %></td>
					<td style="text-align: left"><%=vehtype %></td>
					<td style="text-align: left"><%=UserName %></td>
					<td style="text-align: left"><%=UserCode %></td>
					<td style="text-align: left"><%=transporter %></td>
<%
					if(group.equalsIgnoreCase(""))
					{
%>
						<td>-</td>
						<td>-</td>
<%
					}
					else
					{
%>
					<td style="text-align: left"><%=group%></td>
					<td style="text-align: left"><%=ctrip%></td>
<%
					}
%>
					<td style="text-align: left">No DATA</td>
					<td><div align="right">No DATA</div></td>
					<td style="text-align: right"><%=datadayscount%></td>
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
					<td><div align="right">0.00</div></td>
					<td style="text-align:right">0</td>
					<td><div align="right">0</div></td>
					<td><div align="right">-</div></td>
					<td><div align="right">-</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0.00</div></td>
					<td><div align="left">No</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">00.00</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0.00</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0</div></td>
					<td><div align="right">0</div></td>
					
</tr>
<%
				i++;
					counter=counter+i;
			}
				
				
				
		
			}
					
			
	}
}

%>
	
</tbody>

<tfoot>
		<tr>
					<th>Sr.</th>
					<th>Vehicle No.</th>
					<th>Vehicle Type</th>
					<th>UserName</th>
					<th>UserCode</th>
					<th>Transporter</th>
					<th>Group</th>
					<th>Current Trip</th>
					<th>Date</th>
					<th>Location</th>
					<th>Data Days</th>
					<th>OS</th>
					<th>OS Dur</th>
					<th>RA</th>
					<th>RD</th>
					<th>CD</th>
					<th>DV</th>
					<th>DT</th>
					<th colspan="1">Rating</th>
					<th id="taa" style="display: none;">Avg OS Dur/100km</th>
					<th id="tbb" style="display: none;">Avg RA/100km</th>
					<th id="tcc" style="display: none;">Avg RD/100km</th>
					<th>FT</th>
					<th>FA</th>
					<th>FC</th>
					<th>AVG</th>
					<th>Stops</th>
					<th>Run Hrs.</th>
					<th>AVG Speed</th>
					<th>ND</th>
					<th>ND Dur(Hrs)</th>
					<th>ND Km</th>
					<th>ND Int</th>
					<th>ND Reason</th>
					<th>DayStop <br>(Hrs)</th>
					<th>DC</th>
					<th>Total DC Km</th>
					<th>Distance Violations</th>
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
			int j=0; 
			 
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
							<div align="left"><input type="text" id="net_id1<%=j %>" name="net_id1<%=j %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=j %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=j %>"   id="check<%=j %>"  /></td>
						<td><input type="text" name="clname<%=j %>"   id="clname<%=j %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%j++;}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=j %>"/>
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
								title: 'Custom Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Custom Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Custom Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Custom Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Custom Report',
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