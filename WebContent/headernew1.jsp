<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>*Vehicle Tracking System*</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19595446-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript">
var plstart = new Date();
window.onload=function() {
var plend = new Date();
var plload = plend.getTime() - plstart.getTime();

// determine the thresholds

if(plload<2000)
lc = "Very Fast";
else if (plload<5000)
lc = "Fast";
else if (plload<10000)
lc = "Medium";
else if (plload<30000)
lc = "Sluggish";
else if (plload<45000)
lc = "Slow";
else
lc="Very Slow";
var fn = document.location.pathname;
if( document.location.search)
fn += document.location.search;

try
{
pageTracker._trackEvent("Page Load",lc +
" Loading Pages", fn, Math.round(plload/1000));
}
catch(err)
{
 
}
}
</script>
<script src="searchhi.js" type="text/javascript"></script>
<script src="sorttable.js" type="text/javascript"></script>
<link href="css/erratic.css" rel="StyleSheet" type="text/css"></link>
<script src="js/elabel.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="js/searchhi.js" type="text/javascript"></script>
<link href="css/table/vertical-menu.css" rel="stylesheet">
<link href="css/table/bootstrap-extended.css" rel="stylesheet">
<link href="css/table/bootstrap.css" rel="stylesheet">
<link href="css/table/style.css" rel="stylesheet">
<link href="css/table/components.css" rel="stylesheet">
<link href="css/table/vendors.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

	




<script language="JavaScript1.2">
function regcomplaint(PageName)
{
	try{
		 //alert(e);
		// var PageName = document.getElementById("PageName").value;
		// PageName = "bcndsjh";
	window.open('RegisterComplaint.jsp?PageName='+PageName,'Win','width=710,height=600,top=200,left=200,scrollbars=yes');	 
	 }catch(e)
	 {
		 alert(e);
	 }
}
</script>

<%@ include file="Connections/conn.jsp" %>
<%
Connection sessionconn=null;
Statement sessionst1=null;
Statement sessionst=null; 
String PageName=this.getClass().getName();


String reportno = "";

System.out.println("pagename that we got in here is :- "+PageName);

PageName=PageName.substring(PageName.lastIndexOf(".")+1,PageName.length());
System.out.println(PageName);
PageName=PageName.replace("_",".");
PageName=PageName.replace(".005f","_");
System.out.println(PageName);

if(PageName.equalsIgnoreCase("headernew.jsp"))
{
	
	PageName = request.getParameter("reportname");
	System.out.println("reportname WWWWWOOOWWWOOWOWOWO  :- "+PageName);
	 
}


try{
	
	System.out.println("in the header new and before loading driver ");
	Class.forName(MM_dbConn_DRIVER);
	sessionconn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	System.out.println(" MM_dbConn_STRING:-  "+MM_dbConn_STRING+" ,MM_dbConn_USERNAME:- "+MM_dbConn_USERNAME+" ,MM_dbConn_PASSWORD:-  "+MM_dbConn_PASSWORD);
	//sessionst = sessionconn.createStatement();
	sessionst1 = sessionconn.createStatement();
	
	System.out.println(" MM_dbConn_STRING:-  "+MM_dbConn_STRING+" ,MM_dbConn_USERNAME:- "+MM_dbConn_USERNAME+" ,MM_dbConn_PASSWORD:-  "+MM_dbConn_PASSWORD);
	Statement stqueryy=sessionconn.createStatement();
	Statement strno = sessionconn.createStatement();
	Statement s3 = sessionconn.createStatement();
	
	
	System.out.println(" TypeofUser :- "+session.getAttribute("TypeofUser").toString());
String useType11=session.getAttribute("TypeofUser").toString();
System.out.println("value of TypeofUser in headrnew"+useType11);
String targetvalue=session.getAttribute("usertypevaluemain").toString();
System.out.println("value of usertypevaluemain in headrnew"+targetvalue);
String userid=session.getAttribute("user").toString();
System.out.println("value of user in headrnew userid "+userid);
String mainusr=session.getAttribute("mainuser").toString();
System.out.println("value of mainuser in headrnew"+mainusr);
System.out.println("helll-----ooooooo");
System.out.println("gggggggggh hhhhhhhh     "+session.getAttribute("rfname"));
String mainusr1=session.getAttribute("rfname").toString();
System.out.println("rfname-------------------------------------------------->  " +mainusr1);		

String mainusr2=session.getAttribute("rlname").toString();
//System.out.println("rlname-------------------------------------------------->  " +mainusr2);		


String mainusr3=session.getAttribute("fname").toString();
//System.out.println("fname-------------------------------------------------->  " +mainusr3);		


String mainusr4=session.getAttribute("lname").toString();
String reportname = "";
//System.out.println("lname-------------------------------------------------->  " +mainusr4);		

//System.out.println(userid);
String targetpage="";
String sql5="select * from t_targetpage where typevalue='"+targetvalue+"' or typevalue='"+userid+"' ";
	ResultSet rs5=s3.executeQuery(sql5);
	
	System.out.println(" Target Query :- "+sql5);
	boolean targetflag=false;
	if(rs5.next())
	{
		//targetpage=rs5.getString("targetpage");
		targetpage=""+rs5.getString("targetpage")+"";
		targetflag=true;
	}

String sql = "select ReportNo,ReportName from db_gps.t_reportnumber where PageName = '"+PageName+"'";
System.out.println("this is the rerport number query :- "+sql);
ResultSet rs = strno.executeQuery(sql);
if(rs.next())
{
	reportno = rs.getString("ReportNo");
	reportname = rs.getString("ReportName");
}
System.out.println(reportno);

String targetvalue1=session.getAttribute("usertypevalue").toString();
System.out.println("Targetvalue1::>>>"+targetvalue1);
ArrayList<String> target=(ArrayList<String>)session.getAttribute("TargetList");
System.out.println("target::>>>"+target);
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{
	System.out.println("^^^^^^^^   in header");
	%>
	<%@ include file="Menu.html" %>
	<%
}
else
	if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{
		System.out.println("^^^^^^^^ 1  in header");
		%>
		<%@ include file="Menu.html" %>
		<%
	}
else
{
	System.out.println("****************8   in header");
%>
	<%@ include file="Manu.html" %>
<%
}
%>

<!-- style for loader -->
<style>
    
	.customer-logos {
    opacity: 0;
    visibility: hidden;
    transition: opacity 1s ease;
    -webkit-transition: opacity 1s ease;
}
.customer-logos.slick-initialized {
    visibility: visible;
    opacity: 1;    
}

.loader {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 99;
	background: url(&#39;https://6ed03b3e7ee716b29bc2dee79aafb8179ed53b19-www.googledrive.com/host/0B9VLbslO6g64UnFTUlQzWDVMdXM&#39;) 50% 50% no-repeat rgb(249,249,249);
}
.loader-container {
	width: 600px;
	height: 200px;
	position: absolute;
	top:0;
	bottom: 0;
	left: 0;
	right: 0;
	
	margin: auto;
	text-align: center;
}
    </style>	
<!-- style for loader ends -->


</head>
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">

<div class='loader'>
	<div class='loader-container'>
	  <div class='progress progress-striped active'>
		<div class='progress-bar progress-bar-color' id='bar' role='progressbar' style='width: 0%;'></div>
	  </div>
	</div>
  </div>

<!-- menu comes here --->
  <!-- BEGIN: Header-->
  <nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl">
	<div class="navbar-container d-grid content" style="width:35px !important;">
		<div class="row">
		<div class="col-md-1">

		<ul class="nav navbar-nav d-xl-none">
			<li class="nav-item">
				<a class="nav-link menu-toggle" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu ficon">
					<line x1="3" y1="12" x2="21" y2="12"></line>
					<line x1="3" y1="6" x2="21" y2="6"></line>
					<line x1="3" y1="18" x2="21" y2="18"></line>
				
				</svg>
			</a>
		</li>
		</ul>
		</div>

			<div class="col-md-10">
				<div class="container">  <!-- Ticker -->
					<section class="customer-logos slider">
						<div class="slide"><img  src="images/1.jpg" ></div>
						<div class="slide"><img  src="images/2.png"></div>
						<div class="slide"><img  src="images/3.jpg"></div>
						<div class="slide"><img  src="images/4.jpg"></div>
						<div class="slide"><img  src="images/5.jpg"></div>
						<div class="slide"><img  src="images/6.jpg"></div>
						<div class="slide"><img  src="images/7.jpg"></div>
						<div class="slide"><img  src="images/8.jpg"></div>
						<div class="slide"><img  src="images/9.jpg"></div>
							<div class="slide"><img  src="images/8.jpg"></div>
						<div class="slide"><img  src="images/9.jpg"></div>
					
					 </section>
				  
				  </div>
				</div>

			</div>
		<!-- <ul class="nav navbar-nav  text-end ms-auto">
			
					 
			<li class="nav-item dropdown dropdown-user"><a class="nav-link dropdown-toggle dropdown-user-link" id="dropdown-user" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<!-- <div class="user-nav d-sm-flex d-none"><span class="user-name fw-bolder">Sumit Debnath</span></div> -
					<span class="avatar"><img class="round" src="app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"><span class="avatar-status-online"></span></span>
				</a>

				  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown-user">
					  <a class="dropdown-item" href="#"><i class="me-50" data-feather="user"></i> Profile</a>
					<a class="dropdown-item" href="#"><i class="me-50" data-feather="power"></i> Logout</a>
				</div>
			  
			</li>
		</ul> -->
	</div>
</nav>

<!-- END: Header-->



<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
	<div class="navbar-header">
		<ul class="nav navbar-nav flex-row">
			<li class="nav-item me-auto"><a class="navbar-brand" href="index.html">
					<img src="images/logo-white13.png" width="183" height="58">

				</a></li>
			<li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pe-0" data-bs-toggle="collapse">
					<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-x d-block d-xl-none text-primary toggle-icon font-medium-4">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line>
					</svg>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-disc d-none d-xl-block collapse-toggle-icon primary font-medium-4">
						<circle cx="12" cy="12" r="10"></circle>
						<circle cx="12" cy="12" r="3"></circle>
					</svg>

				</a></li>

		</ul>
	</div>
	<!-- <div class="shadow-bottom"></div> -->
	<div class="main-menu-content">
		<ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation"
			style="margin-top:64px;">
		<%
if(session.getValue("usertypevaluemain").toString().equals("Castrol"))
				{	%>
					<input type="hidden" name="UsrType" id="UsrType" value="Castrol"/>
					<%
				}
			else{
				String sqlchktransporter="Select * from db_gps.t_group where vehregno ='"+session.getAttribute("usertypevaluemain")+"' and GPname='Castrol' ";
					System.out.println("sqlchktransporter===>"+sqlchktransporter);
					ResultSet rstchk=sessionst1.executeQuery(sqlchktransporter);
					if(rstchk.next())
					{
						//castrol transporter login		
							System.out.println("In CASTROL GROUP IF");
							%>
							<input type="hidden" name="UsrType" id="UsrType" value="Castrol"/>
							<%
					}else
					{
						%>
						<input type="hidden" name="UsrType" id="UsrType" value="NonCastrol"/>
						<%
					
					}
				}		
						
%>

	<%
			String userID = "";
			userID = session.getAttribute("user").toString();
			if (null == userID || userID=="") 
			{
			%>
			<li class=" nav-item"><a class="d-flex align-items-center" href="http://www.twtech1.com/" title="About Us"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards"></span></a></li>
							<li class=" nav-item"><a class="d-flex align-items-center" href="http://www.mobile-eye.in/contact.html" title="Contact Us"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards"></span></a></li>
							<li class=" nav-item"><a class="d-flex align-items-center" href="http://www.blog.transworld-compressor.com" title="Blog"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards"></span></a></li>
							<li class=" nav-item"><a class="d-flex align-items-center" href="index.html" title="Login"><img src="images/login.jpeg" border="0"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards"></span></a></li>
				
				<!-- <li class=""><a href="http://www.twtech1.com/" title="About Us" ><img src="images/aboutus.jpeg" border="0"></a></li>
				<li class=""><a href="http://www.mobile-eye.in/contact.html" title="Contact Us"><img src="images/contactus.jpeg" border="0"></a></li>
				<li class=""><a href="http://www.blog.transworld-compressor.com" title="Blog"><img src="images/blog.jpeg" border="0"></a></li>
				<li class=""><a href="index.html" title="Login"><img src="images/login.jpeg" border="0"></a></li> -->
			<%
			}
			else
			{
				
				if(session.getAttribute("role").toString().equalsIgnoreCase("SecurityDept"))
				{
					System.out.println("******  405   not castrol");
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="#"  title="Dash Board"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Report</span></a></li>   <!-- menu41 and menu42 disabled hence no dropdown -->
					<li class=" nav-item"><a class="d-flex align-items-center" href="#"  title="Data Entry"><i data-feather="database"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Data Entry</span></a></li>
					
					<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu41, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Report</a> </li>  menu41 and menu42 disabled
					<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu42, '150px')" onMouseout="delayhidemenu()" title="Data Entry">Data Entry</a> </li> -->
					<%
				}else{ 	
				
			if(useType11.equalsIgnoreCase("Admin") || "Admin".equalsIgnoreCase(useType11)){
				System.out.println("$$$$$$$$$$$$$$$$$$4KETKI$$$$$$$$$$$$$$$$$$$$$$$$$$$4");
			%>
			<li class="nav-item"><a class="d-flex align-items-center" href="createnewid.jsp"  title="Home"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Entry Forms</span></a></li> <!-- menu16disabled hence cannot have dropdown -->
			<li class="nav-item"><a class="d-flex align-items-center" href="#"   title="Entry Forms"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Smart Card Report</span></a>
			<ul class="menu-content"><!-- manu.html menu12 -->
			<li><a class="d-flex align-items-center" href="StudentDetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Student Detail Report</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentDetailsEntry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students details entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentAlertReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students SMS Alert Report</span></a></li>
			<li><a class="d-flex align-items-center" href="inoutstampdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students IN/OUT Details</span></a></li>
			<li><a class="d-flex align-items-center" href="caretakerdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Care taker entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
			
			</ul>
			
			</li>
			<li class="nav-item">Welcome</li>
			<li class="nav-item"><%=session.getAttribute("dispalyname").toString() %></li>
			
				<%-- <li class=""> <a href="createnewid.jsp" title="Home">Home </a> </li>
				<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu16, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">Entry Forms</a> </li>               menu16disabled hence cannot have dropdown
				<li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li> 
				<li class="">WelCome</li>
				<li class=""><%=session.getAttribute("dispalyname").toString() %></li>
				
		  		<li class=""></li> --%>
			<%
			}else if(targetvalue1.equalsIgnoreCase("Ferrero India Pvt Ltd_Demo Group") || targetvalue1.equalsIgnoreCase("Ferrero India Pvt Ltd_Demo") || targetvalue1.equalsIgnoreCase("Ferrero_East") || targetvalue1.equalsIgnoreCase("Ferrero_West") || targetvalue1.equalsIgnoreCase("Ferrero_North") || targetvalue1.equalsIgnoreCase("Ferrero_South"))
			
			{
			
					
				%>
				<li class="nav-item"><a class="d-flex align-items-center" href="home1.jsp"  title="Home"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Home</span></a></li>
				
<%
			
				
				
				
				//------------------------- reports tab --------------------------------------
				
					%>
					<li class="nav-item"><a class="d-flex align-items-center" href="report.jsp" title="Reports"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Reports</span></a>
					<ul class="menu-content">
					<%
					if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
					{	
						%>
						<!-- "Menu.html" menu10 -->
						<li><a class="d-flex align-items-center" href="castrolempmain.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 1 Day</span></a></li>
						<li><a class="d-flex align-items-center" href="last48hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 2 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="last7days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 7 Days</span></a></li>
						
						<li><a class="d-flex align-items-center" href="last15days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 15 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="report_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
						<li><a class="d-flex align-items-center" href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
						<li><a class="d-flex align-items-center" href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
						<%
					}
					else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
						{
							%>
						<!-- "Menu.html" menu10 -->
						<li><a class="d-flex align-items-center" href="castrolempmain.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 1 Day</span></a></li>
						<li><a class="d-flex align-items-center" href="last48hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 2 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="last7days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 7 Days</span></a></li>
						
						<li><a class="d-flex align-items-center" href="last15days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 15 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="report_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
						<li><a class="d-flex align-items-center" href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
						<li><a class="d-flex align-items-center" href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
						
						
						<%
						}
					else
					{
					%>
						<%-- "Manu.html" menu10 --%>
						<li><a class="d-flex align-items-center" href="currentposition2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Report</span></a></li>
						<li><a class="d-flex align-items-center" href="report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="vehiclewaiting.jsp?waithrs=4hrs"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Waiting</span></a></li>
						
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="dailystatusreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Daily Status Report</span></a></li>
						<li><a class="d-flex align-items-center" href="VehicleMentananceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Maintenance Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="VehMasterReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Master Report</span></a></li>
						<li><a class="d-flex align-items-center" href="vehlockunlock.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Audit Report</span></a></li>
						<li><a class="d-flex align-items-center" href="userreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">User Creation Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
					    
					    <li><a class="d-flex align-items-center" href="IncidentReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Incident Report</span></a></li>
						<li><a class="d-flex align-items-center" href="VehicleGroup.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Group Report</span></a></li>
						<li><a class="d-flex align-items-center" href="Fuelinfo.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
						<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
						<li><a class="d-flex align-items-center" href="roundtripsummary.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transit Report</span></a></li>
					<%
					}

					%>					
					</ul>
					
					</li>
 										<%
				
				
				System.out.println("query which m looking for***************");
				if( (session.getAttribute("usertypevaluemain").toString().equals("ALL") || 
						(session.getValue("usertypevaluemain").toString().equals("Castrol") && session.getAttribute("TypeofUserMain").toString().equals("GROUP")) || 
						(session.getValue("usertypevaluemain").toString().equals("DSC") && session.getAttribute("TypeofUserMain").toString().equals("GROUP")) || 
						session.getAttribute("usertypevaluemain").toString().equals("Castrol EMP VEH") || 
						session.getAttribute("usertypevaluemain").toString().equals("DelEx All") || 
						session.getAttribute("usertypevaluemain").toString().equals("Nawany All")||
						session.getAttribute("usertypevaluemain").toString().equals("ACC")|| 
						session.getAttribute("usertypevaluemain").toString().equals("Praxair India Pvt.Ltd")||
						session.getAttribute("usertypevaluemain").toString().equals("NECC ALL")||
						session.getAttribute("usertypevaluemain").toString().equals("Manish Thapar") ||
						session.getAttribute("usertypevaluemain").toString().equals("EMehtha ALL")  || 
						session.getAttribute("usertypevaluemain").toString().equals("IAL_INDIA") || 
						session.getAttribute("usertypevaluemain").toString().equals("North_East_Roadways") ||
						session.getAttribute("usertypevaluemain").toString().equals("ExpressRdys_All")||
						session.getAttribute("usertypevaluemain").toString().equals("Crest Premedia Rakshak"))    )
				{
					System.out.println("****$*$$*$$$$$$$$$$$$$$$@#@!#$@$#@#$***%*#%*#$*%#******************************************************************************:- "+session.getAttribute("TypeofUser").toString());
					
				%>
 	 			<li class="nav-item"><a class="d-flex align-items-center" href="selectuser.jsp"  title="Select User"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Select User</span></a></li>
 	 			
				<%
				}
				
				//------------------------- mylocation & journey tab----------------------------
				
					
						%>
  						<li class=" nav-item"><a class="d-flex align-items-center" href="location.jsp"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">MyLocation</span></a>
  						<ul class="menu-content">
						<%
						if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
						{
							%>
								<!-- Menu.html menu3 -->
								
								<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
								<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
								<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
								<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
							<%
						}
						else
							if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
							{
								
								%>
								<!-- Menu.html menu3 -->
								<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
								<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
								<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
								<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
								<%
							}
						else
						{
							
						%>
							<!-- Manu.html menu3 -->
							<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
							<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
							<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
							<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
							
							<li><a class="d-flex align-items-center" href="reportbyplace.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicles In Geofenced Location</span></a></li>
							<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
							<li><a class="d-flex align-items-center" href="GeoEntryExitReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence EntryExit</span></a></li>
							<li><a class="d-flex align-items-center" href="GeofenceLocation1.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeofenceLocationReport</span></a></li>
						<%
						}

						%>
						</ul>
  						</li>
						<li class=" nav-item"><a class="d-flex align-items-center" href="report.jsp"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Journey</span></a>
						<ul class="menu-content">
								<%
								if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
								{
									
									%>
									<!-- Menu.html menu2-->
									    <li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
										<li><a class="d-flex align-items-center" href="loginhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transporter Login Report</span></a></li>
										<li><a class="d-flex align-items-center" href="vehdisprep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Analysis of Vehicles / Drivers</span></a></li>
										<li><a class="d-flex align-items-center" href="driver_briefing.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing/Debriefing Report</span></a></li>
										<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
										<li><a class="d-flex align-items-center" href="brifhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing History</span></a></li>
										<li><a class="d-flex align-items-center" href="brif_trinerbrifsum.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
										
									<%
								}
								else
									if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
									{
										%>
										<!-- Menu.html menu2 -->
										<li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
										<li><a class="d-flex align-items-center" href="loginhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transporter Login Report</span></a></li>
										<li><a class="d-flex align-items-center" href="vehdisprep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Analysis of Vehicles / Drivers</span></a></li>
										<li><a class="d-flex align-items-center" href="driver_briefing.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing/Debriefing Report</span></a></li>
										<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
										<li><a class="d-flex align-items-center" href="brifhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing History</span></a></li>
										<li><a class="d-flex align-items-center" href="brif_trinerbrifsum.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
										<%
									}
								else
								{
									
								%>
									<!-- Manu.html menu2 -->
									<li><a class="d-flex align-items-center" href="driverrating.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Top/Bottom 20 Drivers</span></a></li>
									<li><a class="d-flex align-items-center" href="drivertrans.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Top/Bottom 20 Transporterwise Drivers</span></a></li>
									<li><a class="d-flex align-items-center" href="trans_driverwiseexceptions.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Wise Exception Report</span></a></li>
									
									<li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
									<li><a class="d-flex align-items-center" href="Driver_briefing_New.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">DMC</span></a></li>
									<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
									
									<li><a class="d-flex align-items-center" href="trainerhistory.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
									<li><a class="d-flex align-items-center" href="driverIncentiveDetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Incentive-Primary & Secondary</span></a></li>
									<li><a class="d-flex align-items-center" href="driverIncentiveDetailsTanker.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Incentive-Tanker</span></a></li>
									
									<li><a class="d-flex align-items-center" href="Tripexpensereport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Expense Report</span></a></li>
									<li><a class="d-flex align-items-center" href="nontrans_trip_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Non Trips Report</span></a></li>
									<li><a class="d-flex align-items-center" href="my_trips.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">My Trips</span></a></li>
								
								    <li><a class="d-flex align-items-center" href="tripReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Trips Report</span></a></li>
								    <li><a class="d-flex align-items-center" href="UploadExcelForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Trip Data</span></a></li>
								    <li><a class="d-flex align-items-center" href="Intervention_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violations Report</span></a></li>
								    <li><a class="d-flex align-items-center" href="TripTransit.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Transit Report</span></a></li>
								<%
								}

								%>
								
								</ul>
						</li>
  						
						<%
					
					
					
				
				if(session.getAttribute("usertypevalue").toString().equals("Foodland") || session.getAttribute("usertypevalue").toString().equals("Test"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="foodlandreport.jsp" title="Temperature Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Temp Report </span></a></li>
										
					<!-- <li class=""> <a href="foodlandreport.jsp" title="Temperature Report">Temp Report </a></li> -->
					
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("futurelogistics"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="demo1.html" title="Find Shortest Route"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Find Route</span></a></li>
<!-- 					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a></li>-->					<%
				}
				
				if(session.getAttribute("usertypevalue").toString().equals("FUELFLOW"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="fuelflow.jsp" title="Fuel Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Fuel Report</span></a></li>
					
					<!-- <li class=""> <a href="fuelflow.jsp" title="Fuel Report">Fuel Report</a> </li> -->
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("IBTEST"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="getlatlong.jsp" title="Find Lat. & Long"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Get Lat. Long</span></a></li>
					<li class=" nav-item"><a class="d-flex align-items-center" href="demo1.html" title="Find Shortest Route"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Find Route</span></a></li>
					
					<!-- <li class=""> <a href="getlatlong.jsp" title="Find Lat. & Long.">Get Lat. Long</a> </li>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a> </li> -->
					
					<%
				}%>
			
				 				    <li class=" nav-item"><a class="d-flex align-items-center" href="#" title="Find Lat. & Long"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Dashboard</span></a>
				 				    <ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{%>
	<!-- Menu.html menu15-->
	<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Stop Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="weeklygraph_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Graph Analysis(Exceptions)</span></a></li>
	
	<li><a class="d-flex align-items-center" href="custfuelfillreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Usertag.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Tagging Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li> 
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>
	
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="VIEWList">Control Tower Live</span></a></li>
		<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu15 -->
		<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Stop Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="weeklygraph_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Graph Analysis(Exceptions)</span></a></li>
	
	<li><a class="d-flex align-items-center" href="custfuelfillreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Usertag.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Tagging Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li> 
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>
	
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="VIEWList">Control Tower Live</span></a></li>
		
		
				<%
	}
else
{

%>
	<!-- Manu.html menu15 -->
	<li><a class="d-flex align-items-center" href="kmanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KM Analysis Report</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis Report</span></a></li>
	<li><a class="d-flex align-items-center" href="LocationWiseStoppageReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Location Wise Stoppage Report</span></a></li>
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>		
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Run Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="runanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Run Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Control Tower Live</span></a></li>
		<%
}
%>

</ul>
</li>
				 

<!-- 								<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu15, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Dashboard </a></li> -->
 <!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu50, '150px')" onMouseout="delayhidemenu()" title="Dash Board">PSW Dashboard</a></li> //inactive tab..dont convert
 -->				
		<%	
				
		%>
		<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">DataEntry</span></a>
		<ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{	%>
	<!-- Menu.html menu9-->
	<li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Locations</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>
	<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu9 -->
		<li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Locations</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>	
		<%
	}
else
{

%>
	<!-- Manu.html menu9 -->
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Location</span></a></li>

	<li><a class="d-flex align-items-center" href="vehmaintenance.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Maintenance</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehMasterEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Master Entry Form</span></a></li>
	<li><a class="d-flex align-items-center" href="createnewuser.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create User</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="Reportforcleaner.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Cleaner Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Standardinput.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Standard Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraPodImageReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera POD Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfordriver.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="UploadTripClosureExcel.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Trip Closure Data</span></a></li>
	<li><a class="d-flex align-items-center" href="UploadShipment.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Shipment</span></a></li>
	<li><a class="d-flex align-items-center" href="customerproffirst.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Customer Profile Settings</span></a></li>
	<%
}
%>
</ul>
		
		</li>
			
<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Notifications</span></a>
<ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{
	
	%>
	<!-- Menu.html menu28 -->
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
	<li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND Intimation Report</span></a></li>
	<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu28 -->
		<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	    <li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
	    <li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND Intimation Report</span></a></li>
		<%
	}
else
{

%>
	<!-- Manu.html menu28 -->
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Idle Report</span></a></li>
    <li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
    <li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND IntimationReport</span></a></li>
    <li><a class="d-flex align-items-center" href="SpecialCommentReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Special Comment Report</span></a></li>
    <li><a class="d-flex align-items-center" href="stampreport1.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Alert Report</span></a></li>
    <li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>	
<%
}
%>
</ul>
</li>					

			<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Fuel Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Fuel</span></a>
					<ul class="menu-content"><!--menu29 (manu.html) -->
					<li><a class="d-flex align-items-center" href="MainRouteProfileMaster.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Profile Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FirstFuelRequest.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Request</span></a></li>
					<li><a class="d-flex align-items-center" href="Ad-hocRequest.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Ad-hoc Request</span></a></li>
					<li><a class="d-flex align-items-center" href="AdditionalExcep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Additional Ad-hoc Request</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelRequestRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">View Fuel Request</span></a></li>
					<li><a class="d-flex align-items-center" href="KMPLFuelReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KMPL Setting</span></a></li>
					<li><a class="d-flex align-items-center" href="Bufferset.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Parameter Setting</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelCardMaster.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Card Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelMasterReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Rate Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelMasterHistoryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">RateHistory Report</span></a></li>
					<li><a class="d-flex align-items-center" href="NewFile2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Forecasting Report</span></a></li>
					</ul>
			</li>


<!--
Newly added for notification
-->

 <li class="nav-item"><a class="d-flex align-items-center" href="#" title="Journey Plans"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Planning & Scheduling</span></a>
 <ul class="menu-content"><!-- menu43 (manu.html)-->
                                     <li><a class="d-flex align-items-center" href="RequesterEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Requester</span></a></li> 
									 <li><a class="d-flex align-items-center" href="RequesterReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Requester Report</span></a></li>
			                         <li><a class="d-flex align-items-center" href="RequestForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Request</span></a></li>
			                         <li><a class="d-flex align-items-center" href="RequestReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Request Report</span></a></li>
									 <li><a class="d-flex align-items-center" href="MakeTripPlanNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create Plan</span></a></li>
									 <li><a class="d-flex align-items-center" a href="PlanReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Plan Report</span></a></li>
									 <li><a class="d-flex align-items-center" a href="CreateSchedule.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create Schedule</span></a></li>
									 <li><a class="d-flex align-items-center" a href="ScheduleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Schedule Report</span></a></li>
</ul>
 </li>

<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Map Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Peripheral</span></a>
<ul class="menu-content"><!-- menu100(manu.html) -->
 <li><a class="d-flex align-items-center" a href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="SensorDetailRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Detail Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="CameraInspectionReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Inspection Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="TempAnalysisReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Temperature Analysis Report</span></a></li>
 </ul>
</li>

<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Map Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Map Report</span></a>
<ul class="menu-content"><!-- menu45(manu.html) -->
<li><a class="d-flex align-items-center" a href="home.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Vehicles on Map</span></a></li>
<li><a class="d-flex align-items-center" a href="journey.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Journey on Map</span></a></li>
<li><a class="d-flex align-items-center" a href="MapSelection.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Map Report</span></a></li>
</ul>
</li>


<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Additional Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Additional Report</span></a>
<ul class="menu-content"><!-- menu46(manu.html) -->
<li><a class="d-flex align-items-center" a href="interventionreport_closed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Closed Violations Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Licenseexpiryreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver License Expiry Report</span></a></li>
<li><a class="d-flex align-items-center" a href="batterytheft.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Battery Theft Report</span></a></li>
<li><a class="d-flex align-items-center" a href="VehicleMaintenanceDueReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Renewal Report</span></a></li>
<li><a class="d-flex align-items-center" a href="DoorSensorReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Door Sensor Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Vehicleftpr.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle FTPR Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
<li><a class="d-flex align-items-center" a href="smsreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">SMS Report</span></a></li>
<li><a class="d-flex align-items-center" a href="doorSensorReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Door Access Report</span></a></li>
<li><a class="d-flex align-items-center" a href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
<li><a class="d-flex align-items-center" a href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
<li><a class="d-flex align-items-center" a href="PMFReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">PMF Report</span></a></li>
<li><a class="d-flex align-items-center" a href="androidCurrentPosition.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Mobile Demo</span></a></li>
<li><a class="d-flex align-items-center" a href="CameraReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">POD Report</span></a></li>
<li><a class="d-flex align-items-center" a href="RakshakReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Rakshak Report</span></a></li>
</ul>
</li> 
<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu46, '150px')" onMouseout="delayhidemenu()" title="Map Report ">Additional Report </a> </li>-->
<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu48, '150px')" onMouseout="delayhidemenu()" title="Control Tower">Control Tower</a> </li> --><!--Tab Not to be shown  -->

			
			<%
			//String selecteduser=session.getAttribute("selecteduser").toString();
			//out.println(session.getAttribute("usertypevalue").toString());
			if((session.getAttribute("usertypevalue").toString().equalsIgnoreCase("VIBGYOR"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("JSPM"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Vikas_Gold Crest"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Prasanna Purple Mobility Solutions Pvt. Ltd.")) ||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Metrozipdemo"))){
				%>
				<li class="nav-item"><a class="d-flex align-items-center" href="report.jsp" title="Student"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Smart Card Report</span></a>
				<ul class="menu-content"><!-- manu.html menu12 -->
			<li><a class="d-flex align-items-center" href="StudentDetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Student Detail Report</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentDetailsEntry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students details entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentAlertReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students SMS Alert Report</span></a></li>
			<li><a class="d-flex align-items-center" href="inoutstampdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students IN/OUT Details</span></a></li>
			<li><a class="d-flex align-items-center" href="caretakerdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Care taker entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
			
			</ul>
				</li>
				<!-- <li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li> --><!--menu12 absent from menu.html and manu.html  -->
			<%
			}
			}
			else{
			
					
				%>
				<li class="nav-item"><a class="d-flex align-items-center" href="home.jsp" title="Student"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Home</span></a></li>
				<!-- <li class=""> <a href="home.jsp" title="Home">Home</a> </li> -->
				<%
			
				
				
				
				//------------------------- reports tab --------------------------------------
				
					%>
					<li class="nav-item"><a class="d-flex align-items-center" href="report.jsp" title="Reports"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Reports</span></a>
					<ul class="menu-content">
					<%
					if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
					{	
						%>
						<!-- "Menu.html" menu10 -->
						<li><a class="d-flex align-items-center" href="castrolempmain.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 1 Day</span></a></li>
						<li><a class="d-flex align-items-center" href="last48hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 2 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="last7days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 7 Days</span></a></li>
						
						<li><a class="d-flex align-items-center" href="last15days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 15 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="report_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
						<li><a class="d-flex align-items-center" href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
						<li><a class="d-flex align-items-center" href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
						<%
					}
					else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
						{
							%>
						<!-- "Menu.html" menu10 -->
						<li><a class="d-flex align-items-center" href="castrolempmain.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 1 Day</span></a></li>
						<li><a class="d-flex align-items-center" href="last48hours_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 2 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="last7days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 7 Days</span></a></li>
						
						<li><a class="d-flex align-items-center" href="last15days_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Report For Last 15 Days</span></a></li>
						<li><a class="d-flex align-items-center" href="report_castrolemp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
						<li><a class="d-flex align-items-center" href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
						<li><a class="d-flex align-items-center" href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
						
						
						<%
						}
					else
					{
					%>
						<%-- "Manu.html" menu10 --%>
						<li><a class="d-flex align-items-center" href="currentposition2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Current Position</span></a></li>
						<li><a class="d-flex align-items-center" href="last24hours.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Report</span></a></li>
						<li><a class="d-flex align-items-center" href="report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Custom Report</span></a></li>
						<li><a class="d-flex align-items-center" href="vehiclewaiting.jsp?waithrs=4hrs"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Waiting</span></a></li>
						
						<li><a class="d-flex align-items-center" href="disconnectReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Disconnection Report</span></a></li>
						<li><a class="d-flex align-items-center" href="dailystatusreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Daily Status Report</span></a></li>
						<li><a class="d-flex align-items-center" href="VehicleMentananceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Maintenance Report</span></a></li>
						<li><a class="d-flex align-items-center" href="ComplaintReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Complaint Report</span></a></li>
						
						<li><a class="d-flex align-items-center" href="VehMasterReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Master Report</span></a></li>
						<li><a class="d-flex align-items-center" href="vehlockunlock.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Audit Report</span></a></li>
						<li><a class="d-flex align-items-center" href="userreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">User Creation Report</span></a></li>
						<li><a class="d-flex align-items-center" href="FleetSummaryErp_All.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fleet Summary Report</span></a></li>
					    
					    <li><a class="d-flex align-items-center" href="IncidentReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Incident Report</span></a></li>
						<li><a class="d-flex align-items-center" href="VehicleGroup.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Group Report</span></a></li>
						<li><a class="d-flex align-items-center" href="Fuelinfo.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
						<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
						<li><a class="d-flex align-items-center" href="roundtripsummary.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transit Report</span></a></li>
					<%
					}

					%>					
					</ul>
					</li>
					
					<!-- <li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu10, '150px')" onMouseout="delayhidemenu()" title="Reports">Reports</a></li> -->
					<%
				
				
				System.out.println("query which m looking for***************");
				if( (session.getAttribute("usertypevaluemain").toString().equals("ALL") || 
						(session.getValue("usertypevaluemain").toString().equals("Castrol") && session.getAttribute("TypeofUserMain").toString().equals("GROUP")) || 
						(session.getValue("usertypevaluemain").toString().equals("DSC") && session.getAttribute("TypeofUserMain").toString().equals("GROUP")) || 
						session.getAttribute("usertypevaluemain").toString().equals("Castrol EMP VEH") || 
						session.getAttribute("usertypevaluemain").toString().equals("DelEx All") || 
						session.getAttribute("usertypevaluemain").toString().equals("Nawany All")||
						session.getAttribute("usertypevaluemain").toString().equals("ACC")|| 
						session.getAttribute("usertypevaluemain").toString().equals("Praxair India Pvt.Ltd")||
						session.getAttribute("usertypevaluemain").toString().equals("NECC ALL")||
						session.getAttribute("usertypevaluemain").toString().equals("Manish Thapar") ||
						session.getAttribute("usertypevaluemain").toString().equals("EMehtha ALL")  || 
						session.getAttribute("usertypevaluemain").toString().equals("IAL_INDIA") || 
						session.getAttribute("usertypevaluemain").toString().equals("North_East_Roadways") ||
						session.getAttribute("usertypevaluemain").toString().equals("ExpressRdys_All")||
						session.getAttribute("usertypevaluemain").toString().equals("Crest Premedia Rakshak"))    )
				{
					System.out.println("****$*$$*$$$$$$$$$$$$$$$@#@!#$@$#@#$***%*#%*#$*%#******************************************************************************:- "+session.getAttribute("TypeofUser").toString());
					
				%>
 	 			 <li class="nav-item"><a class="d-flex align-items-center" href="selectuser.jsp"  title="Select User"><i data-feather="user"></i><span class="menu-title text-truncate" data-i18n="Roles &amp; Permission">Select User</span></a></li>
 	 							<%
				}
				
				//------------------------- mylocation & journey tab----------------------------
				
					
						%>
						<li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="map-pin"></i><span class="menu-title text-truncate" data-i18n="Dashboards">MyLocation</span></a>
						<ul class="menu-content">
						<%
						if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
						{
							%>
								<!-- Menu.html menu3 -->
								
								<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
								<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
								<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
								<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
							<%
						}
						else
							if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
							{
								
								%>
								<!-- Menu.html menu3 -->
								<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
								<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
								<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
								<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
								<%
							}
						else
						{
							
						%>
							<!-- Manu.html menu3 -->
							<li><a class="d-flex align-items-center" href="location.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Select Location</span></a></li>
							<li><a class="d-flex align-items-center" href="departed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Departed</span></a></li>
							<li><a class="d-flex align-items-center" href="arrived.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Arrived</span></a></li>
							<li><a class="d-flex align-items-center" href="vehicleavailable.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Available</span></a></li>
							
							<li><a class="d-flex align-items-center" href="reportbyplace.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicles In Geofenced Location</span></a></li>
							<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
							<li><a class="d-flex align-items-center" href="GeoEntryExitReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence EntryExit</span></a></li>
							<li><a class="d-flex align-items-center" href="GeofenceLocation1.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeofenceLocationReport</span></a></li>
						<%
						}

						%>
						</ul>
					</li>
					  		
					
								<li class=" nav-item"><a class="d-flex align-items-center" href="report.jsp"><i data-feather="truck"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Journey</span></a>
								<ul class="menu-content">
								<%
								if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
								{
									
									%>
									<!-- Menu.html menu2-->
									    <li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
										<li><a class="d-flex align-items-center" href="loginhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transporter Login Report</span></a></li>
										<li><a class="d-flex align-items-center" href="vehdisprep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Analysis of Vehicles / Drivers</span></a></li>
										<li><a class="d-flex align-items-center" href="driver_briefing.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing/Debriefing Report</span></a></li>
										<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
										<li><a class="d-flex align-items-center" href="brifhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing History</span></a></li>
										<li><a class="d-flex align-items-center" href="brif_trinerbrifsum.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
										
									<%
								}
								else
									if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
									{
										%>
										<!-- Menu.html menu2 -->
										<li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
										<li><a class="d-flex align-items-center" href="loginhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Transporter Login Report</span></a></li>
										<li><a class="d-flex align-items-center" href="vehdisprep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Analysis of Vehicles / Drivers</span></a></li>
										<li><a class="d-flex align-items-center" href="driver_briefing.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing/Debriefing Report</span></a></li>
										<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
										<li><a class="d-flex align-items-center" href="brifhistory.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Briefing History</span></a></li>
										<li><a class="d-flex align-items-center" href="brif_trinerbrifsum.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
										<%
									}
								else
								{
									
								%>
									<!-- Manu.html menu2 -->
									<li><a class="d-flex align-items-center" href="driverrating.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Top/Bottom 20 Drivers</span></a></li>
									<li><a class="d-flex align-items-center" href="drivertrans.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Top/Bottom 20 Transporterwise Drivers</span></a></li>
									<li><a class="d-flex align-items-center" href="trans_driverwiseexceptions.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Wise Exception Report</span></a></li>
									
									<li><a class="d-flex align-items-center" href="driverratingbydate.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Rating Report</span></a></li>
									<li><a class="d-flex align-items-center" href="Driver_briefing_New.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">DMC</span></a></li>
									<li><a class="d-flex align-items-center" href="KPIReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KPI Report</span></a></li>
									
									<li><a class="d-flex align-items-center" href="trainerhistory.jsp?trNm=Castrol&pgFrom=brif"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trainer History</span></a></li>
									<li><a class="d-flex align-items-center" href="driverIncentiveDetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Incentive-Primary & Secondary</span></a></li>
									<li><a class="d-flex align-items-center" href="driverIncentiveDetailsTanker.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Incentive-Tanker</span></a></li>
									
									<li><a class="d-flex align-items-center" href="Tripexpensereport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Expense Report</span></a></li>
									<li><a class="d-flex align-items-center" href="nontrans_trip_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Non Trips Report</span></a></li>
									<li><a class="d-flex align-items-center" href="my_trips.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">My Trips</span></a></li>
								
								    <li><a class="d-flex align-items-center" href="tripReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Trips Report</span></a></li>
								    <li><a class="d-flex align-items-center" href="UploadExcelForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Trip Data</span></a></li>
								    <li><a class="d-flex align-items-center" href="Intervention_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violations Report</span></a></li>
								    <li><a class="d-flex align-items-center" href="TripTransit.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Transit Report</span></a></li>
								<%
								}

								%>
								
								</ul>							
  								</li>
						<!-- <li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Journey">Journey </a></li> -->
						<%
					
					
					
				
				if(session.getAttribute("usertypevalue").toString().equals("Foodland") || session.getAttribute("usertypevalue").toString().equals("Test"))
				{
					%>
<li class=" nav-item"><a class="d-flex align-items-center" href="foodlandreport.jsp" title="Temperature Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Temp Report </span></a></li>
					<!-- <li class=""> <a href="foodlandreport.jsp" title="Temperature Report">Temp Report </a></li> -->
					
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("futurelogistics"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="demo1.html" title="Find Shortest Route"><i data-feather="map-pin"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Find Route</span></a></li>
					<!-- <li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a></li> -->
					<%
				}
				
				if(session.getAttribute("usertypevalue").toString().equals("FUELFLOW"))
				{
					%>
	        		<li class=" nav-item"><a class="d-flex align-items-center" href="fuelflow.jsp" title="Fuel Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Fuel Report</span></a></li>
					
					<!-- <li class=""> <a href="fuelflow.jsp" title="Fuel Report">Fuel Report</a> </li> -->
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("IBTEST"))
				{
					%>
					<li class=" nav-item"><a class="d-flex align-items-center" href="getlatlong.jsp" title="Find Lat. & Long"><i data-feather="map-pin"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Get Lat. Long</span></a></li>
					<li class=" nav-item"><a class="d-flex align-items-center" href="demo1.html" title="Find Shortest Route"><i data-feather="map-pin"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Find Route</span></a></li>
					
					<!-- <li class=""> <a href="getlatlong.jsp" title="Find Lat. & Long.">Get Lat. Long</a> </li>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a> </li>-->
					<%
				}%>
			
				
<li class=" nav-item"><a class="d-flex align-items-center" href="#" title="Find Lat. & Long"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Dashboard</span></a>
<ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{
	
	%>
	<!-- Menu.html menu15-->
	<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Stop Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="weeklygraph_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Graph Analysis(Exceptions)</span></a></li>
	
	<li><a class="d-flex align-items-center" href="custfuelfillreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Usertag.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Tagging Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li> 
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>
	
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="VIEWList">Control Tower Live</span></a></li>
		<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu15 -->
		<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Stop Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="weeklygraph_report.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Graph Analysis(Exceptions)</span></a></li>
	
	<li><a class="d-flex align-items-center" href="custfuelfillreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Odometer.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Odometer Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Usertag.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Tagging Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="geoFenceReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">GeoFence Detail Report</span></a></li>
	
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li> 
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>
	
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="VIEWList">Control Tower Live</span></a></li>
		
		
				<%
	}
else
{

%>
	<!-- Manu.html menu15 -->
	<li><a class="d-flex align-items-center" href="kmanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KM Analysis Report</span></a></li>
	<li><a class="d-flex align-items-center" href="speedanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Speed Analysis Report</span></a></li>
	<li><a class="d-flex align-items-center" href="LocationWiseStoppageReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Location Wise Stoppage Report</span></a></li>
	<li><a class="d-flex align-items-center" href="FleetViewDashBoardNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="TripViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Violation Dashboard Report</span></a></li>
	<li><a class="d-flex align-items-center" href="GaugeChartOdometerFleetView.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">FleetView Dashboard</span></a></li>		
	<li><a class="d-flex align-items-center" href="AllViolationDashboard.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Violation Dashboard</span></a></li>
	<li><a class="d-flex align-items-center" href="stopanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Run Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="runanalysis.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Trip Run Analysis</span></a></li>
	<li><a class="d-flex align-items-center" href="Dashlets2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Control Tower Live</span></a></li>
		<%
}
%>

</ul>
</li>
<!-- 								<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu15, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Dashboard </a></li>
 --><!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu50, '150px')" onMouseout="delayhidemenu()" title="Dash Board">PSW Dashboard</a></li>//inactive not to be changed
 -->				
		<%	
				
		%>
		<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Entry Forms"><i data-feather="database"></i><span class="menu-title text-truncate" data-i18n="Dashboards">DataEntry</span></a>
		<ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{
	
	%>
	<!-- Menu.html menu9-->
	<li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Locations</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>
	<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu9 -->
		<li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Locations</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>	
		<%
	}
else
{

%>
	<!-- Manu.html menu9 -->
	<li><a class="d-flex align-items-center" href="changepass.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Personal Details</span></a></li>
	<li><a class="d-flex align-items-center" href="fuelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="GeofenceLocation.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Geofence Location</span></a></li>

	<li><a class="d-flex align-items-center" href="vehmaintenance.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Maintenance</span></a></li>
	<li><a class="d-flex align-items-center" href="EditEmpName.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Add/Edit Employee</span></a></li>
	<li><a class="d-flex align-items-center" href="paymentEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Payment Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="VehMasterEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Master Entry Form</span></a></li>
	<li><a class="d-flex align-items-center" href="createnewuser.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create User</span></a></li>
	<li><a class="d-flex align-items-center" href="sensorlabelentry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Label Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="Reportforcleaner.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Cleaner Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraSummaryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Standardinput.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Standard Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="Reportfornewroute.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Entry</span></a></li>
	<li><a class="d-flex align-items-center" href="CameraPodImageReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera POD Report</span></a></li>
	<li><a class="d-flex align-items-center" href="Reportfordriver.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver Entry</span></a></li>
	
	<li><a class="d-flex align-items-center" href="UploadTripClosureExcel.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Trip Closure Data</span></a></li>
	<li><a class="d-flex align-items-center" href="UploadShipment.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Upload Shipment</span></a></li>
	<li><a class="d-flex align-items-center" href="customerproffirst.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Customer Profile Settings</span></a></li>
	<%
}
%>
</ul>
</li>

<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Notifications</span></a>
<ul class="menu-content">
<%
if(target.contains(targetvalue) || target.contains(mainusr) || targetvalue1.contains("Castrol EMP VEH"))
{
	
	%>
	<!-- Menu.html menu28 -->
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	<li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
	<li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND Intimation Report</span></a></li>
	<%
}
else if(target.contains(targetvalue1)|| target.contains(mainusr)|| targetvalue1.contains("Castrol EMP VEH"))
	{	
		%>
		<!-- Menu.html menu28 -->
		<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Intimation Report</span></a></li>
	    <li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
	    <li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND Intimation Report</span></a></li>
		<%
	}
else
{

%>
	<!-- Manu.html menu28 -->
	<li><a class="d-flex align-items-center" href="VehicleIdleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Idle Report</span></a></li>
    <li><a class="d-flex align-items-center" href="VehicleOfflineReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Offline Report</span></a></li>
    <li><a class="d-flex align-items-center" href="ndintimationreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ND IntimationReport</span></a></li>
    <li><a class="d-flex align-items-center" href="SpecialCommentReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Special Comment Report</span></a></li>
    <li><a class="d-flex align-items-center" href="stampreport1.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Alert Report</span></a></li>
    <li><a class="d-flex align-items-center" href="AlertMasterDetailReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Alert Master</span></a></li>	
<%
}
%>
</ul>
</li>					
<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu28, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">Notifications</a> </li>
 -->
					<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Fuel Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Fuel</span></a>
					<ul class="menu-content"><!--menu29 (manu.html) -->
					<li><a class="d-flex align-items-center" href="MainRouteProfileMaster.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Route Profile Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FirstFuelRequest.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Request</span></a></li>
					<li><a class="d-flex align-items-center" href="Ad-hocRequest.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Exception Ad-hoc Request</span></a></li>
					<li><a class="d-flex align-items-center" href="AdditionalExcep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Additional Ad-hoc Request</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelRequestRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">View Fuel Request</span></a></li>
					<li><a class="d-flex align-items-center" href="KMPLFuelReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">KMPL Setting</span></a></li>
					<li><a class="d-flex align-items-center" href="Bufferset.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Parameter Setting</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelCardMaster.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Card Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelMasterReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Fuel Rate Master</span></a></li>
					<li><a class="d-flex align-items-center" href="FuelMasterHistoryReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">RateHistory Report</span></a></li>
					<li><a class="d-flex align-items-center" href="NewFile2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Forecasting Report</span></a></li>
					</ul>
					</li>

<!-- 						<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu29, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">Fuel</a> </li>
 -->
<!--
Newly added for notification
-->

<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Journey Plans"><i data-feather="calendar"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Planning & Scheduling</span></a>
                                    <ul class="menu-content"><!-- menu43 (manu.html)-->
                                     <li><a class="d-flex align-items-center" href="RequesterEntryForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Requester</span></a></li> 
									 <li><a class="d-flex align-items-center" href="RequesterReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Requester Report</span></a></li>
			                         <li><a class="d-flex align-items-center" href="RequestForm.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Request</span></a></li>
			                         <li><a class="d-flex align-items-center" href="RequestReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Request Report</span></a></li>
									 <li><a class="d-flex align-items-center" href="MakeTripPlanNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create Plan</span></a></li>
									 <li><a class="d-flex align-items-center" a href="PlanReportNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Plan Report</span></a></li>
									 <li><a class="d-flex align-items-center" a href="CreateSchedule.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Create Schedule</span></a></li>
									 <li><a class="d-flex align-items-center" a href="ScheduleReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Schedule Report</span></a></li>
</ul></li>


 <li class="nav-item"><a class="d-flex align-items-center" href="#" title="Map Report"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Peripheral</span></a>
 <ul class="menu-content"><!-- menu100(manu.html) -->
 <li><a class="d-flex align-items-center" a href="sensorRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="SensorDetailRep.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Sensor Detail Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="CameraInspectionReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Camera Inspection Report</span></a></li>
 <li><a class="d-flex align-items-center" a href="TempAnalysisReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Temperature Analysis Report</span></a></li>
 
 </ul></li>

<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Map Report"><i data-feather="map-pin"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Map Report</span></a>
<ul class="menu-content"><!-- menu45(manu.html) -->
<li><a class="d-flex align-items-center" a href="home.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">All Vehicles on Map</span></a></li>
<li><a class="d-flex align-items-center" a href="journey.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Journey on Map</span></a></li>
<li><a class="d-flex align-items-center" a href="MapSelection.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Map Report</span></a></li>
</ul>
</li>
<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Additional Report"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Additional Report</span></a>
<ul class="menu-content"><!-- menu46(manu.html) -->
<li><a class="d-flex align-items-center" a href="interventionreport_closed.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Closed Violations Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Licenseexpiryreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Driver License Expiry Report</span></a></li>
<li><a class="d-flex align-items-center" a href="batterytheft.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Battery Theft Report</span></a></li>
<li><a class="d-flex align-items-center" a href="VehicleMaintenanceDueReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle Renewal Report</span></a></li>
<li><a class="d-flex align-items-center" a href="DoorSensorReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Door Sensor Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Vehicleftpr.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Vehicle FTPR Report</span></a></li>
<li><a class="d-flex align-items-center" a href="Dashboard2.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Variance Report</span></a></li>
<li><a class="d-flex align-items-center" a href="smsreport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">SMS Report</span></a></li>
<li><a class="d-flex align-items-center" a href="doorSensorReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Door Access Report</span></a></li>
<li><a class="d-flex align-items-center" a href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
<li><a class="d-flex align-items-center" a href="tree.htm"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">ORG Chart</span></a></li>
<li><a class="d-flex align-items-center" a href="PMFReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">PMF Report</span></a></li>
<li><a class="d-flex align-items-center" a href="androidCurrentPosition.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Mobile Demo</span></a></li>
<li><a class="d-flex align-items-center" a href="CameraReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">POD Report</span></a></li>
<li><a class="d-flex align-items-center" a href="RakshakReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Rakshak Report</span></a></li>
</ul></li>

<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu48, '150px')" onMouseout="delayhidemenu()" title="Control Tower">Control Tower</a> </li> //inactive menu tab not to be shown -->

			
			<%
			//String selecteduser=session.getAttribute("selecteduser").toString();
			//out.println(session.getAttribute("usertypevalue").toString());
			if((session.getAttribute("usertypevalue").toString().equalsIgnoreCase("VIBGYOR"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("JSPM"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Vikas_Gold Crest"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Prasanna Purple Mobility Solutions Pvt. Ltd.")) ||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Metrozipdemo"))){
				%>
				<li class="nav-item"><a class="d-flex align-items-center" href="report.jsp" title="Student"><i data-feather="pie-chart"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Smart Card Report</span></a>
				<ul class="menu-content"><!-- manu.html menu12 -->
			<li><a class="d-flex align-items-center" href="StudentDetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Student Detail Report</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentDetailsEntry.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students details entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="StudentAlertReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students SMS Alert Report</span></a></li>
			<li><a class="d-flex align-items-center" href="inoutstampdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Students IN/OUT Details</span></a></li>
			<li><a class="d-flex align-items-center" href="caretakerdetails.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">Care taker entry form</span></a></li>
			<li><a class="d-flex align-items-center" href="JRMReport.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">JRM Report</span></a></li>
			</ul>
				</li>
				<!-- <li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li> --><!-- menu12 absent from menu.html and manu.html -->
			<%
			}
			}
			}
		//	String mainusr1=session.getAttribute("mainuser").toString();
			//System.out.println("main user---------->" +mainusr1);		
			
			
			
			
}// finjal else
		%>
		
<%if(session.getAttribute("usertypevaluemain").toString().equals("ALL") || session.getAttribute("TypeofUser").toString().equals("Transporter")) //admin login
{
	if(useType11.equals("Transporter"))
	{
		%>
		
		<%
	System.out.println("For Eway");
	
	%>
		<li class="nav-item"><a class="d-flex align-items-center" href="#" title="Fuel Entry Forms"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">E-Way Bill</span></a>
		<ul class="menu-content"><!-- menu47(manu.html) -->
		<li><a class="d-flex align-items-center" href="EwayHelp.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">E-Way Help</span></a></li>
		<li><a class="d-flex align-items-center" href="EwayNew.jsp"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="List">E-Way Registration</span></a></li>
		</ul>
		</li>
		 <!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu47, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">E-Way Bill</a> </li> --> 
		<%
	}%>
<!--  <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu49, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">FASTag Details</a> </li>
 --><% 	} %>

        <%

     
	sessionst=sessionconn.createStatement();
	String sessionusername=session.getAttribute("user").toString().toUpperCase();
	String sessionsessionid=session.getId().toString();
	String sessionupdated=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	String sessionsql="update t_sessions set Updated='"+sessionupdated+"' where SessionId='"+sessionsessionid+"'";
	
	/*Query to insert query in db_gps.t_sqlquery table*/
	/*String abcd=sessionsql.replace("'","#");
	abcd=abcd.replace(",","$");
	stqueryy.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");*/
	/*****************************/
		sessionst.executeUpdate(sessionsql);
	String sessionlogout="select LoginStatus from t_sessions where Sessionid='"+sessionsessionid+"' ";
	ResultSet logout=sessionst.executeQuery(sessionlogout);
	if(logout.next())
	{
		if(logout.getString("LoginStatus").equals("No"))
		{
			%>
			<form name="f1" action="serverMSG.jsp" method="get">
			</form>
			<script>
					document.f1.submit();
			</script>			
			<%
			
		}
	}

// 	out.print(sessionsql);
}catch(Exception es)
{
	out.println("Session exception--->"+es.getMessage());
	es.printStackTrace();
	
}
finally
{
 sessionst.close();
 sessionconn.close();
}	
System.out.println("***88888");
try{
	

String mainusr1=session.getAttribute("rfname").toString();
System.out.println("rfname**********************(((((((())))))))-------------------------------------------------->  " +mainusr1);		

String mainusr2=session.getAttribute("rlname").toString();
//System.out.println("rlname-------------------------------------------------->  " +mainusr2);		


String mainusr3=session.getAttribute("fname").toString();
//System.out.println("fname-------------------------------------------------->  " +mainusr3);		


String mainusr4=session.getAttribute("lname").toString();
//System.out.println("lname-------------------------------------------------->  " +mainusr4);	ck


%>
	
	
	

		
		<li class="nav-item"><a class="d-flex align-items-center" href="logout.jsp" title="Logout"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Logout</span></a></li>
			<%-- <li class=""><%= mainusr3%>  <%=mainusr4 %><a href="logout.jsp" title="Logout">Log Out</a> </li> --%>
							  
			
			
		
		<%
		
		
}catch(Exception e)
{
	System.out.println("exception in tryyyyy block"+e.getMessage());
}
		%>
		
		
		</ul>
		</div>
</div>
<!-- END: Main Menu-->

		<%-- <%
		
		
}catch(Exception e)
{
	System.out.println("exception in tryyyyy block"+e.getMessage());
}
		%> --%>

		<!-- Upload logo modal -->
<div class="modal" id="uploadLogoModal">
	<div class="modal-dialog">
		<div class="modal-content">
	
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Upload Logo</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
	
			<!-- Modal body -->
			<div class="modal-body">
				<form action="#" class="align-items-center">
					<div class="row col-12">
						<label for="formFile" class="form-label">Choose Your Logo : </label>
						<input class="form-control" type="file" id="formFile">
					</div>
				 
	
				</form>
	
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Submit</button>
	
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
	
		</div>
	</div>
	</div>
	
		<script src="js/datatable/feather.min.js"></script>

			
<script src="js/datatable/vendors.min.js"></script>
		<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
		<script src="js/datatable/jquery.dataTables.min.js"></script>
		<!-- <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
		<script src="js/datatable/slick.js"></script>

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
		 
		<script src="js/datatable/app-menu.js"></script>
		<script src="js/datatable/app.js"></script>
		
		<script>



			// script for loader
		
			document.onreadystatechange = function() {
				if (document.readyState !== "complete") {
					document.querySelector(
					  "body").style.visibility = "hidden";
					document.querySelector(
					  ".loader").style.visibility = "visible";
				} else {
					document.querySelector(
					  ".loader").style.display = "none";
					document.querySelector(
					  "body").style.visibility = "visible";
				}
			};

			var progress = setInterval(function () {
    var $bar = $("#bar");

    if ($bar.width() >= 600) {
        clearInterval(progress);
    } else {
        $bar.width($bar.width() + 60);
    }
    $bar.text($bar.width() / 6 + "%");
    if ($bar.width() / 6 == 100){
      $bar.text("Still working ... " + $bar.width() / 6 + "%");
    }
}, 800);
		
			// script for loader end


			$(document).ready(function(){
			$('.customer-logos').slick({
				slidesToShow: 10,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 1500,
				arrows: false,
				dots: false,
				pauseOnHover: false,
				responsive: [{
					breakpoint: 768,
					settings: {
						slidesToShow: 4
					}
				}, {
					breakpoint: 520,
					settings: {
						slidesToShow: 3
					}
				}]
			});
		});
		
			</script>	
			
</body>