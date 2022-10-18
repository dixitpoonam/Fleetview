<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
 <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
 <%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
fleetview.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
<%//System.out.println("-check "); %>
   
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
}
</script>
</head>
<body onload="ondemand()">
<%!
Connection conn=null;
Statement st=null,st1=null,st12=null,st13=null, st2=null,st3=null,stmt4=null,stmt41=null,stmt1=null,stmt2=null,st121=null,st131=null,st20=null,st21=null;

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
<%
	
try{	
	
		
	Class.forName(MM_dbConn_DRIVER); 
	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	st=conn.createStatement();
	st1 = conn.createStatement();
	
	st12 = conn.createStatement();
	st13 = conn.createStatement();
	st121 = conn.createStatement();
	st131 = conn.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	stmt4=conn.createStatement();
	stmt41=conn.createStatement();
	stmt1=conn.createStatement();
	stmt2=conn.createStatement();
	int UType=0;
	final String UserTypeValue =(String) session.getAttribute("usertypevalue");
	System.out.println("UserTypeValue : "+UserTypeValue);
	String Pdate1="";
	int i=0;
	
	String vehfit="";
	String TrainerNm = "TrainerNm";
	//System.out.printf(date1+" : "+date2+" : "+TrainerNm);
	String ChType = "ChType",sql1="",DriverId="";
	String datenew1,datenew2, vehcode, vehregno,tbname,sql11="",owner,km,rating,from,to,ndcount,FrDate,ToDate;
	int os,ra,rd,cd,nd;
	String oscount,racount,osdur,rdcount,cdcount,FrDate2,ToDate2;
	String sql="",sql2="",sql3="",Transpo="",VehRegNo="";
		int i1=0,i2=0;
	 Calendar cal1=Calendar.getInstance();
	 String RejectStatus="",BrifingStatus="",Debrifstatus="",brifstatus="",DebriefingStatus="",BriefidN="",tripid="",brifdate="",startplace="",VehType="",endplace="",probenddate="",CleanerName="",CleanerId="",Transporter="",StatDrv="";
	 String S1= "";
	 
	 String TripStartDate="",TripEndDate="";
	 
		String DriverIdList="";	
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
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		data1 = data2 = session.getAttribute("CurrentMonthFirst").toString();   //yyyy-mm-dd
		datex2 = session.getAttribute("today").toString();
	} else {
		
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

String dt = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex1));

String dttime=""+dt+" 00:00:00";


String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));

String dt1time=""+dt1+" 23:59:59";

System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);
	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title  mb-0">	Driver Briefing</h2>
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
				    <div class="col-md-2"></div>				
				    <div class="col-md-2">
				    <label for="search">Search:</label>
				    	<div class="input-group input-group-merge">
		                     <input type="text" id="srchbx" class="form-control" name="srchbx" />
		               </div>
		            </div>
		
					<div class="col-md-2">
						<button type="submit" class="btn btn-primary" style="margin-top: 20px;" name="btnSearch" value="Submit">Submit</button>
					</div>
				    </div>
				    <br>
				    <div class="row col-12">
				        <div>
		                    <p style="color:black"> Please enter Driver Name or Driver Id. Matching values would come below in the table automatically.
		                     If you want to see all pending Briefing \ De-briefing <a href= "driver_briefing_open.jsp" target="_blank" >click here</a>
		                     </p>
		                </div>
				    </div>
			</form>
			
			
<!-- Table Starts here -->
	<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
						
							<%
						
						       String searchValue = request.getParameter("srchbx");
							
						       if (null != searchValue)
						       {
				                   searchValue = searchValue.replace(" ", "");
				                   int numRecords = 0;
				                   if(searchValue.length()>0)
				       			   {
				       				 sql="SELECT * FROM db_gps.t_drivers where (Owner='"+UserTypeValue+"' or GPNAME='"+UserTypeValue+"') and Activestatus='Active' and (DriverID like '%"+searchValue+"%' or DriverName like '%"+searchValue+"%') ORDER BY DriverName  ASC";		
				       			   }else
				       			   {
				       			      sql="SELECT * FROM db_gps.t_drivers where (Owner='"+UserTypeValue+"' or GPNAME='"+UserTypeValue+"') and Activestatus='Active' ORDER BY DriverName  ASC";
				       			   }
							       			
							       		ResultSet rst=st.executeQuery(sql);
							       		
							       		System.out.println("Driver Id Query : "+sql);		
							       		int l=0;               
							%>
							
						<table id="example1" class="table table-bordered">
							<thead>
                                        <tr>
                                             <th>Sr.No.</th>
											<th>Driver Name</th>
											<th>Driver Id</th>
											<th>Transporter</th>
											<th>Rejection</th>		
											<th>Status</th>	
												
											<th>Brief DT</th>
											<th>Brief ID</th>
											<th>Brief Trip ID</th>
											<th>Trip Start Date</th>
											<th>Trip End Date</th>			
																
											<th>De-Brief DT</th>
											<th>De-Brief ID</th>
											<th>De-Brief Trip ID</th> 
											<th>Trip Start Date</th>
											<th>Trip End Date</th>	
                                        </tr>
                                    </thead>
                                    <tbody>
                                      
		
		<%
		
		
		
		while(rst.next())
		{
		System.out.println(rst.getString("Owner"));
			%>

			
			<%

			TripStartDate="-";
			TripEndDate="-";
			
			int Msgid = 0;
			String sql31 = "select * from db_gps.t_usermessage where UserTypeValue  = '"+rst.getString("Owner")+"' ";
			System.out.println("sql31 : : "+sql31);
			ResultSet rs3 = stmt2.executeQuery(sql31);
		
			if(rs3.next())
			{
				Msgid = rs3.getInt("MessageID");
			}
			
			System.out.println("Msgid : : "+Msgid);
			 if(Msgid == 4)
			 {i++;
				 
				 %>
				 <tr>
				 <td style='text-align: right'><%=i%></td>
				 <td style='text-align: left'><%=rst.getString("DriverName")%></td>
				 <td style='text-align: right'><%=rst.getString("DriverID")%></td>
				
				  <td style='text-align: left'><%=rst.getString("Owner")%></td>
				  <td style='text-align: left' >Blocked</td>
				  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td >-</td>
			  <td >-</td>
			    <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			
				  </tr>  
				 <%
			 }
			 else
			
			 {
				 
			
			
		sql1="SELECT Briefid,Status,DeBrifingStatus,brifstatus,Debrifstatus,probenddate,tripid,	brifdate,startplace,endplace,VehType,VehRegNo,Transporter,CleanerName,CleanerId FROM db_gps.t_briefing WHERE Driverid ='"+rst.getString("DriverID")+"' order by brifdate desc limit 1";
		ResultSet rst1=st1.executeQuery(sql1);
		System.out.println("sql1 : t_briefing : "+sql1);
		i1 = 1;
		if(rst1.next())
		{			
			i++;
			 S1="-";
				BrifingStatus="Open";
				DebriefingStatus="-";
				
			%>
	<tr>
		<td style='text-align: right'> <%=i%></td>
	
<%		
							try{
							
					BrifingStatus=rst1.getString("Status");
					DebriefingStatus=rst1.getString("DeBrifingStatus");
					brifstatus=rst1.getString("brifstatus");
					Debrifstatus=rst1.getString("Debrifstatus");
					probenddate=rst1.getString("probenddate");
					BriefidN=rst1.getString("Briefid");
					tripid=rst1.getString("tripid");
					brifdate=rst1.getString("brifdate");
					startplace=rst1.getString("startplace");
					endplace=rst1.getString("endplace");
					VehType=rst1.getString("VehType");

					VehRegNo=rst1.getString("VehRegNo");
					Transporter=rst1.getString("Transporter");
					CleanerName=rst1.getString("CleanerName");
					CleanerId=rst1.getString("CleanerId");
					
					
					String sql12="SELECT concat(StartDate,' ',StartTime) as StartDate FROM db_gps.t_startedjourney WHERE TripID='"+tripid+"' and  DriverCode ='"+rst.getString("DriverID")+"'";
					ResultSet rst12=st12.executeQuery(sql12);
					System.out.println("sql1 : t_briefing : "+sql12);
					if(rst12.next())
					{
						TripStartDate=rst12.getString("StartDate");
					}		
					
					String sql13="SELECT EndDate FROM db_gps.t_completedjourney WHERE TripID='"+tripid+"' and  DriverID ='"+rst.getString("DriverID")+"'";
					ResultSet rst13=st13.executeQuery(sql13);
					System.out.println("sql1 : t_briefing : "+sql13);
					if(rst13.next())
					{
						TripEndDate=rst13.getString("EndDate");
					}	
					       
					
					String sql121="SELECT concat(StartDate,' ',StartTime) as StartDate FROM db_gps.t_startedjourney WHERE TripID='"+tripid+"' and  DriverCode ='"+rst.getString("DriverID")+"'";
					ResultSet rst121=st121.executeQuery(sql121);
					System.out.println("sql1 : t_briefing : "+sql121);
					if(rst121.next())
					{
						TripStartDate=rst121.getString("StartDate");
					}		
					
					String sql131="SELECT EndDate FROM db_gps.t_completedjourney WHERE TripID='"+tripid+"' and  DriverID ='"+rst.getString("DriverID")+"'";
					ResultSet rst131=st131.executeQuery(sql131);
					System.out.println("sql1 : t_briefing : "+sql131);
					if(rst131.next())
					{
						TripEndDate=rst131.getString("EndDate");
					}
					
					
					
					
					}
					catch(Exception e)
					{
					e.printStackTrace();
					
					}

		RejectStatus="-";
		String sql41 = "SELECT Status FROM db_gps.t_reasonOfRejectionForDriver WHERE ReasoneForRejection='Driver Rejection'  and DriverId ='"+rst.getString("DriverID")+"' ORDER BY UpdatedDateTime DESC";
		ResultSet rs41= stmt41.executeQuery(sql41);
		System.out.println("Loop 1 :"+sql41);
		if(rs41.next()){
		if(rs41.getString("Status").equalsIgnoreCase("Yes"))
			{RejectStatus="Rejected";				
			}
		else 
			{
				RejectStatus="Pass";					
			}
		
			}else
			{
				RejectStatus="-";	
			}
		
		
		System.out.println("rst.getString(DriverID)"+rst.getString("DriverID"));
		System.out.println("rst.getString(Owner)"+rst.getString("Owner"));
		
		
		if(RejectStatus.equalsIgnoreCase("Rejected"))
		{		System.out.println("Test Reject :");
		%>
		<td style='text-align: left'>		
		<a href="#" onclick="javascript:window.open('driver_briefing_Driver_Reject.jsp?driverid=<%=rst.getString("DriverID")%>','','menubar=1,resizable=1,scrollbars=1,width=800,height=200');"><%=rst.getString("DriverName") %> </a>
		</td>
		
	<%	
		}
		else{
			
			System.out.println("Test Else  :");
		if(("briefed".equals(brifstatus)) && "not debriefed".equalsIgnoreCase(Debrifstatus) && "-".equalsIgnoreCase(DebriefingStatus)  && "-".equalsIgnoreCase(BrifingStatus))
		{		System.out.println("DeBriefed");
	
				%>
			<td style='text-align: left'><a target="_blank" href='BrifReg.jsp?driverid=<%=rst.getString("DriverID")%>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>'>
			<%=rst.getString("DriverName")%> </a></td>
			
		<%	
		S1="DeBriefed";
		%>
<%	
		}else if(("briefed".equals(brifstatus)) && ("not debriefed".equalsIgnoreCase(Debrifstatus)))
		{		System.out.println("Briefed");
			if(DebriefingStatus.equalsIgnoreCase("-") && BrifingStatus.equalsIgnoreCase("Close"))
			{	
%>
		<td style='text-align: left'><a target="_blank"  href="driver_debrifing_Reg_New.jsp?driverid=<%=rst.getString("DriverID")%>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>&briefid=<%=rst1.getString("Briefid") %>">
			<%=rst.getString("DriverName")%></a></td>
<%
			S1="Briefed";
			}
			else if(DebriefingStatus.equalsIgnoreCase("Open") && BrifingStatus.equalsIgnoreCase("Close"))			
			{			System.out.println("Open Debriefing :");		
			%>
			<td style='text-align: left'><a  target="_blank" href= "driver_debriefing_Update.jsp?driverid=<%=rst.getString("DriverID")%>&briefid=<%=BriefidN%>&drivername=<%=rst.getString("DriverName")%>&TripId=<%=tripid %>&PDate=<%=probenddate %>&veh=<%=VehRegNo %>&transporter=<%=Transporter %>" target="_blank" >
					<%=rst.getString("DriverName")%></a></td>
			<%
			S1="Open Debriefing";
			}
			else if(DebriefingStatus.equalsIgnoreCase("-") && BrifingStatus.equalsIgnoreCase("Open"))
			{		System.out.println("Open Briefing :");
				if(i==270)
				{System.out.println("asassas");}
				%>
				<td style='text-align: left'><a  target="_blank" href="briefing_page.jsp?driverid=<%=rst.getString("DriverID")%>&transporter=<%=rst.getString("Owner") %>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>&briefId=<%=BriefidN %>&TripId=<%=tripid %>&BrifDate=<%=brifdate %>&startP=<%=startplace %>&endP11=<%=endplace %>&veh=<%=VehRegNo %>&VehType=<%=VehType %>&CleanerId=<%=CleanerId %>&CleanerName=<%=CleanerName %>">	
						<%=rst.getString("DriverName")%></a></td>
			<%
			S1="Open Briefing";
			
			}else
			{
				System.out.println("Debried 2 :");
			
				%>
				<td style='text-align: left'><a  target="_blank" href='BrifReg.jsp?driverid=<%=rst.getString("DriverID")%>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>'>
				<%=rst.getString("DriverName")%> </a></td>
			<%	
			S1="DeBriefed";
		%>		
	<%}
			%>
			
			<%
			}
		else if(("debriefed".equalsIgnoreCase(Debrifstatus) || ("debrifed".equalsIgnoreCase(Debrifstatus)) ))
	{			System.out.println("Debriefin 3 :"+rst.getString("DriverName"));		%>
				<td style='text-align: left'><a  target="_blank" href='BrifReg.jsp?driverid=<%=rst.getString("DriverID")%>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>' target="_blank" >
				<%=rst.getString("DriverName")%> </a></td>
			<%	
			S1="DeBriefed";
			System.out.println("Debriefin 3 :");			
		%>
	<%
			}
		 }
%>
     <td style='text-align: right'><%=rst.getString("DriverID")%></td>
		<td style='text-align: left'><%=rst.getString("Owner")%></td>
				<td><%=RejectStatus %></td>
		
<%
		
      RejectStatus="-";

%>
				<td style='text-align: left'><%=S1%></td>
			
<%			
			String Date11="",DebriefId11="",DebriTripId="";
			String sql111 = "SELECT Debriefdate,debriefid,tripid from db_gps.t_debriefing where driverid='"+rst.getString("DriverID")+"' order by Debriefdate desc limit 1 ";
			ResultSet rs= stmt1.executeQuery(sql111);
			if(rs.next())
				{
				try{
					Date11=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("Debriefdate")));
					}
					catch(Exception e)
					{
					e.printStackTrace();	
					Date11="-";
					}
				DebriefId11=rs.getString("debriefid");
				DebriTripId=rs.getString("tripid");
				
				}
			
			try{
				brifdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(brifdate));
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				Date11="-";
				}
			
			try{
				TripStartDate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(TripStartDate));
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				TripStartDate="-";
				}
			
			try{
				TripEndDate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(TripEndDate));
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				TripEndDate="-";
				}
			    
			String DeTripStartDate="",DeTripEndDate="";
			
			String sql121="SELECT concat(StartDate,' ',StartTime) as StartDate FROM db_gps.t_startedjourney WHERE TripID='"+DebriTripId+"' and  DriverCode ='"+rst.getString("DriverID")+"'";
			ResultSet rst121=st121.executeQuery(sql121);
			System.out.println("sql1 : t_briefing : "+sql121);
			if(rst121.next())
			{
				DeTripStartDate=rst121.getString("StartDate");
			}		
			
			String sql131="SELECT EndDate FROM db_gps.t_completedjourney WHERE TripID='"+DebriTripId+"' and  DriverID ='"+rst.getString("DriverID")+"'";
			ResultSet rst131=st131.executeQuery(sql131);
			System.out.println("sql1 : t_briefing : "+sql131);
			if(rst131.next())
			{
				DeTripEndDate=rst131.getString("EndDate");
			}
			
			
			try{
				DeTripStartDate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DeTripStartDate));
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				DeTripStartDate="-";
				}
			
			try{
				DeTripEndDate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DeTripEndDate));
				}
				catch(Exception e)
				{
				e.printStackTrace();	
				DeTripEndDate="-";
				}
			%>
			
			<td style='text-align: right;'><%=brifdate%></td>
			<td style='text-align: right;'><%=BriefidN%></td>
			<td style='text-align: right;'><%=tripid%></td>
			<td style='text-align: right;'><%=TripStartDate%></td>
		<td style='text-align: right;'><%=TripEndDate%></td>		
		<td style='text-align: right;'><%=Date11%></td>
			<td style='text-align: right;'><%=DebriefId11%></td>
			<td style='text-align: right;'><%=DebriTripId%></td>	
				
			<td style='text-align: right;'><%=DeTripStartDate%></td>
		<td style='text-align: right;'><%=DeTripEndDate%></td>		
			<%  
		%>
		
	<%
%>
	</tr>

<%
	
		 }
		else
		{i++;
			%> <tr>
			 <td style='text-align: right'><%=i%></td>
			 <td style='text-align: left'><a target="_blank"  href='BrifReg.jsp?driverid=<%=rst.getString("DriverID")%>&drivername=<%=rst.getString("DriverName")%>&trans=<%=rst.getString("Owner")%>' target="_blank" >
			<%=rst.getString("DriverName")%> </a></td>
			 <td style='text-align: right'><%=rst.getString("DriverID")%></td>
			
			  <td style='text-align: left'><%=rst.getString("Owner")%></td>
			  <td ><%=RejectStatus%></td>
			  
			  <td style='text-align: left' >No Record</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			  <td  >-</td>
			 
			  
			  
			  </tr>
<%			
		}
	
	
			 }
		}	
		
%>		
                                    </tbody>
                                    <tfoot>
                                     <tr>
                                             <th>Sr.No.</th>
											<th>Driver Name</th>
											<th>Driver Id</th>
											<th>Transporter</th>
											<th>Rejection</th>		
											<th>Status</th>	
												
											<th>Brief DT</th>
											<th>Brief ID</th>
											<th>Brief Trip ID</th>
											<th>Trip Start Date</th>
											<th>Trip End Date</th>			
																
											<th>De-Brief DT</th>
											<th>De-Brief ID</th>
											<th>De-Brief Trip ID</th> 
											<th>Trip Start Date</th>
											<th>Trip End Date</th>	
                                        </tr>
                                    </tfoot> 
							</table>
<%
}
		%>
		 <script type="text/javascript">
	       var txtBox = document.getElementById("srchbx");
	      try{ 
	    	  if (txtBox != null) {txtBox.focus();
	    	  	  }
	      }
	      catch(e)
	      {	    	  }
	    </script><%

}
	
	catch(Exception e)
	{
		out.print("Exception "+e);
	}
	finally
	{
		try
		{
		conn.close();
		} 
		catch(Exception e){}
	
	}	
%>			
							
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
						<h4 class="modal-title">Driver Briefing for ReportTemplateSession </h4>
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
</jsp:useBean>
