<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>*Vehicle Tracking System*</title>
<link rel="apple-touch-icon" href="app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon" href="favicon-one.png">

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
    .slide{
        height: 55px!important;
    }
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

        #loader {
            border: 12px solid #f3f3f3;
            border-radius: 50%;
			z-index: 999999;
            border-top: 12px solid #444444;
            width: 200px;
            height: 200px;
            animation: spin 1s linear infinite;
			
        }
          
        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }
          
        .center {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
        }
    </style>
<!-- style for loader ends -->

</head>
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">
	<!-- loader start -->
	<div id="loader" class="center"></div>
	<!-- loader ends -->



<!-- menu comes here --->
  <!-- BEGIN: Header-->
  <nav class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl" style="width:100% !important; left:0px!important;margin: 0px;">
	<div class="navbar-container d-grid content" style="height:65px !important;">
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
				<div class="container">
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





		<%
		
		
}catch(Exception e)
{
	System.out.println("exception in tryyyyy block"+e.getMessage());
}
		%>

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
					  "#loader").style.visibility = "visible";
				} else {
					document.querySelector(
					  "#loader").style.display = "none";
					document.querySelector(
					  "body").style.visibility = "visible";
				}
			};
			//script for loader end 

			$(document).ready(function(){
				
				$('.fade').slick({
		  dots: true,
		  infinite: true,
		  speed: 500,
		  fade: true,
		  slide: '> div',
		  cssEase: 'linear'
		});
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