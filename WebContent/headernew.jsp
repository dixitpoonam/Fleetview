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
<link href="css/css.css" rel="StyleSheet" type="text/css"></link> 
<link href="css/erratic.css" rel="StyleSheet" type="text/css"></link>
<script src="js/elabel.js" type="text/javascript"></script>
<script src="js/sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="js/searchhi.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/cpanel_002.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">

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
</head>
<body  onLoad="JavaScript:initRotator(),loadSearchHighlight();" id="mainbody" >
<table border="0" width="100%" align="center">
<tr>
<td colspan="2">
<div id="header">
<table border="0" width="100%" align="center">
<tr>
<td width="90" align="left">
<div id="logo" ><img src="images/TW-MobileEyeLogo1.PNG" alt="Google Apps" height="70" width="100"></img></div>
</td>
<% if(session.getValue("usertypevaluemain").toString().equals("Monsanto India Ltd"))
				{%>
	
<td width="90" align="center">

<div id="logo" ><img src="images/Coastal_IMG_20210927_122225.jpg" alt="Google Apps" height="70" width="100"></img></div>
</td>
<%} %>
<td>
<%if(targetvalue1.equalsIgnoreCase("Indian Navy")){  //userid.equalsIgnoreCase("Indian Navy")) %>
<td>
<div id="navylogo"><img src="images/navy_logo.png" height="68" width="55" style="margin:5px; border:1px solid black"></img></div>
</td>
<%}%>
<td>

<script src="js/dw_rotator.js" type="text/javascript"></script>
<script type="text/javascript">
function initRotator() {

    // arguments: image name, rotation speed, (optional) path to images
    var rotator1 = new dw_Rotator('img1', 1000, "images/");
    // add the images to rotate into that image object  
    var ImgName = document.getElementById("UsrType").value;
    //alert("Castrol User 12 "+ImgName);
    if(ImgName=="Castrol")
    	{ 
  
    	rotator1.addImages("l6.jpg");
    	}
    else{
   
    	rotator1.addImages("l1.jpg","l2.jpg", "l3.jpg", "l4.jpg", "l5.jpg", "l6.jpg", "l7.jpg","l8.jpg","demo.png","foodland.png","FirstFlight.bmp","ndtv.png","darcl.png","DHL.jpg","rpa.jpg","casby.jpg","safeNsecure.png","Monsanto_Logo.jpeg","Pepsico_Logo.png");
    	   	}
   // rotator1.addImages("l1.jpg","l2.jpg", "l3.jpg", "l4.jpg", "l5.jpg", "l6.jpg", "l7.jpg","l8.jpg","demo.png","foodland.png","FirstFlight.bmp","ndtv.png","darcl.png","DHL.jpg","rpa.jpg","casby.jpg","safeNsecure.png");
	
    rotator1.rotate(); // sometimes may want to call rotate here
    dw_Rotator.start();
}
</script>
<div id="logo1"><img name="img1" src="images/l6.jpg" width="100" height="70" alt="Customer Logo" ></div>
</td>
</tr>
</table>
</div>
<!-- sa  -->
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
<!-- RR -->





<!-- menu comes here --->
<div id="navigation"><ul><div id="navigationBlank" style="visibility: visible;">

	<%
			String userID = "";
			userID = session.getAttribute("user").toString();
			if (null == userID || userID=="") 
			{
			%>
				<li class=""><a href="http://www.twtech1.com/" title="About Us" ><img src="images/aboutus.jpeg" border="0"></a></li>
				<li class=""><a href="http://www.mobile-eye.in/contact.html" title="Contact Us"><img src="images/contactus.jpeg" border="0"></a></li>
				<li class=""><a href="http://www.blog.transworld-compressor.com" title="Blog"><img src="images/blog.jpeg" border="0"></a></li>
				<li class=""><a href="index.html" title="Login"><img src="images/login.jpeg" border="0"></a></li>
			<%
			}
			else
			{
				
				if(session.getAttribute("role").toString().equalsIgnoreCase("SecurityDept"))
				{
					System.out.println("******  405   not castrol");
					%>
					
					<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu41, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Report</a> </li>
					<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu42, '150px')" onMouseout="delayhidemenu()" title="Data Entry">Data Entry</a> </li>
					<%
				}else{ 	
				
			if(useType11.equalsIgnoreCase("Admin") || "Admin".equalsIgnoreCase(useType11)){
				System.out.println("$$$$$$$$$$$$$$$$$$4KETKI$$$$$$$$$$$$$$$$$$$$$$$$$$$4");
			%>
				<li class=""> <a href="createnewid.jsp" title="Home">Home </a> </li>
				<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu16, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">Entry Forms</a> </li>
				<li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li>
				<li class="">WelCome</li>
				<li class=""><%=session.getAttribute("dispalyname").toString() %></li>
				
		  		<li class=""></li>
			<%
			}else if(targetvalue1.equalsIgnoreCase("Ferrero India Pvt Ltd_Demo Group") || targetvalue1.equalsIgnoreCase("Ferrero India Pvt Ltd_Demo") || targetvalue1.equalsIgnoreCase("Ferrero_East") || targetvalue1.equalsIgnoreCase("Ferrero_West") || targetvalue1.equalsIgnoreCase("Ferrero_North") || targetvalue1.equalsIgnoreCase("Ferrero_South"))
			
			{
			
					
				%>
				
				<li class=""> <a href="home1.jsp" title="Home">Home</a> </li>
				<%
			
				
				
				
				//------------------------- reports tab --------------------------------------
				
					%>
					<li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu10, '150px')" onMouseout="delayhidemenu()" title="Reports">Reports</a></li>
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
 	 			
 	 			<li class=""><a href="selectuser.jsp" title="Select User">Select User</a></li>
				<%
				}
				
				//------------------------- mylocation & journey tab----------------------------
				
					
						%>
  						
  						<li class=""> <a href="location.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu3, '150px')" onMouseout="delayhidemenu()" title="Location"> MyLocation </a></li>
						<li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Journey">Journey </a></li>
						<%
					
					
					
				
				if(session.getAttribute("usertypevalue").toString().equals("Foodland") || session.getAttribute("usertypevalue").toString().equals("Test"))
				{
					%>
					
					<li class=""> <a href="foodlandreport.jsp" title="Temperature Report">Temp Report </a></li>
					
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("futurelogistics"))
				{
					%>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a></li>
					<%
				}
				
				if(session.getAttribute("usertypevalue").toString().equals("FUELFLOW"))
				{
					%>
					<li class=""> <a href="fuelflow.jsp" title="Fuel Report">Fuel Report</a> </li>
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("IBTEST"))
				{
					%>
					<li class=""> <a href="getlatlong.jsp" title="Find Lat. & Long.">Get Lat. Long</a> </li>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a> </li>
					
					<%
				}%>
			
				

								<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu15, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Dashboard </a></li>
<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu50, '150px')" onMouseout="delayhidemenu()" title="Dash Board">PSW Dashboard</a></li>
 -->				
		<%	
				
		%>
				
		<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu9, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">DataEntry</a> </li>

			
					
<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu28, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">Notifications</a> </li>


						<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu29, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">Fuel</a> </li>

<!--
Newly added for notification
-->


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu43, '150px')" onMouseout="delayhidemenu()" title="Journey Plans">Planning & Scheduling</a> </li>


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu100, '150px')" onMouseout="delayhidemenu()" title="Map Report">Peripheral</a> </li>


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu45, '150px')" onMouseout="delayhidemenu()" title="Map Report ">Map Report </a> </li>

 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu46, '150px')" onMouseout="delayhidemenu()" title="Map Report ">Additional Report </a> </li>

<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu48, '150px')" onMouseout="delayhidemenu()" title="Control Tower">Control Tower</a> </li> -->

			
			<%
			//String selecteduser=session.getAttribute("selecteduser").toString();
			//out.println(session.getAttribute("usertypevalue").toString());
			if((session.getAttribute("usertypevalue").toString().equalsIgnoreCase("VIBGYOR"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("JSPM"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Vikas_Gold Crest"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Prasanna Purple Mobility Solutions Pvt. Ltd.")) ||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Metrozipdemo"))){
				%>
				<li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li>
			<%
			}
			}
			else{
			
					
				%>
				
				<li class=""> <a href="home.jsp" title="Home">Home</a> </li>
				<%
			
				
				
				
				//------------------------- reports tab --------------------------------------
				
					%>
					<li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu10, '150px')" onMouseout="delayhidemenu()" title="Reports">Reports</a></li>
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
 	 			
 	 			<li class=""><a href="selectuser.jsp" title="Select User">Select User</a></li>
				<%
				}
				
				//------------------------- mylocation & journey tab----------------------------
				
					
						%>
  						
  						<li class=""> <a href="location.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu3, '150px')" onMouseout="delayhidemenu()" title="Location"> MyLocation </a></li>
						<li class=""><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Journey">Journey </a></li>
						<%
					
					
					
				
				if(session.getAttribute("usertypevalue").toString().equals("Foodland") || session.getAttribute("usertypevalue").toString().equals("Test"))
				{
					%>
					
					<li class=""> <a href="foodlandreport.jsp" title="Temperature Report">Temp Report </a></li>
					
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("futurelogistics"))
				{
					%>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a></li>
					<%
				}
				
				if(session.getAttribute("usertypevalue").toString().equals("FUELFLOW"))
				{
					%>
					<li class=""> <a href="fuelflow.jsp" title="Fuel Report">Fuel Report</a> </li>
					<%
				}
				if(session.getAttribute("usertypevalue").toString().equals("IBTEST"))
				{
					%>
					<li class=""> <a href="getlatlong.jsp" title="Find Lat. & Long.">Get Lat. Long</a> </li>
					<li class=""> <a href="demo1.html" title="Find Shortest Route">Find Route </a> </li>
					
					<%
				}%>
			
				

								<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu15, '150px')" onMouseout="delayhidemenu()" title="Dash Board">Dashboard </a></li>
<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu50, '150px')" onMouseout="delayhidemenu()" title="Dash Board">PSW Dashboard</a></li>
 -->				
		<%	
				
		%>
				
		<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu9, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">DataEntry</a> </li>

			
					
<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu28, '150px')" onMouseout="delayhidemenu()" title="Entry Forms">Notifications</a> </li>


						<li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu29, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">Fuel</a> </li>

<!--
Newly added for notification
-->


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu43, '150px')" onMouseout="delayhidemenu()" title="Journey Plans">Planning & Scheduling</a> </li>


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu100, '150px')" onMouseout="delayhidemenu()" title="Map Report">Peripheral</a> </li>


 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu45, '150px')" onMouseout="delayhidemenu()" title="Map Report ">Map Report </a> </li>

 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu46, '150px')" onMouseout="delayhidemenu()" title="Map Report ">Additional Report </a> </li>

<!-- <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu48, '150px')" onMouseout="delayhidemenu()" title="Control Tower">Control Tower</a> </li> -->

			
			<%
			//String selecteduser=session.getAttribute("selecteduser").toString();
			//out.println(session.getAttribute("usertypevalue").toString());
			if((session.getAttribute("usertypevalue").toString().equalsIgnoreCase("VIBGYOR"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("JSPM"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Vikas_Gold Crest"))||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Prasanna Purple Mobility Solutions Pvt. Ltd.")) ||(session.getAttribute("usertypevalue").toString().equalsIgnoreCase("Metrozipdemo"))){
				%>
				<li class=""> <a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Student">Smart Card Report </a> </li>
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
		
		 <li class=""><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu47, '150px')" onMouseout="delayhidemenu()" title="Fuel Entry Forms">E-Way Bill</a> </li> 
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
	
	</div>
	
	

		<div id="navigationRight">
		
			<li class=""><%= mainusr3%>  <%=mainusr4 %><a href="logout.jsp" title="Logout">Log Out</a> </li>
							  
			
			
		</div>
		<%
		
		
}catch(Exception e)
{
	System.out.println("exception in tryyyyy block"+e.getMessage());
}
		%>
		
		</ul>
		
	</div>
		</td>
		</tr>
		<tr>
		<td>
		<div>
		<input type="hidden" name="PageName" id="PageName" value="<%=PageName %>"/>
		 <a href="#" onclick="regcomplaint('<%=PageName %>')" title="Register Complaint">Register Complaint</a>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="black"> Report No.: <%=reportno %></font>
		</div>
		</td>
		<td align="right">
		<div style="text-align: right;margin-right: 10px;">
		 <a href="http://myfleetview.com/CMS/index.php/help/<%=reportno %>" title="Help" target="_blank">Help</a>
		</div>
		</td>
		</tr>
		</table>	<!-- body part come here -->
