<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp" %>
 <%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%
//fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FleetView</title>

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
<script>
function allSelected(allVal)
{
	alert("check/uncheck: "+document.customdetail.extAll.checked);
	 
	if(document.customdetail.extAll.checked) 
	{
		document.getElementById("fromdate").style.display='none';
    	document.getElementById("todate").style.display='none';
    }
	else 
	{
		document.getElementById("fromdate").style.display="";
    	document.getElementById("todate").style.display="";
	} 
}
function getFTPImage(ftpFile)
{    // var wbsite="";
	try
	{
		//alert(escape(ftpFile));
		//alert(ftpFile);
		window.open('showComplaintFTP.jsp?ftpFile='+ftpFile+'','mywindow','width=500, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	}
	catch(e)
	{
		alert(e);
	}
}
</script>
</head>
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="">
    <%

		String fname=(String)session.getAttribute("fname");
		 String lname=(String)session.getAttribute("lname");
		 String Name=fname+" "+lname;
		 String UserTypeValue=(String)session.getAttribute("usertypevalue1");
		
String datenew1="";
String datenew2="";
String statVal = "";
String chbxAll = "";
String catval = "";
String Report_Header="";
String exportList="";
String detailViewList ="";

if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
  
   statVal = request.getParameter("incidentDrp");
   chbxAll = request.getParameter("extAll");
   catval = request.getParameter("category");
   System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>"+chbxAll);
}
else
{
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}

		 DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2)); 
		

		if(request.getQueryString() != null){   
			
			String Status = "";
			if(statVal.equals("Solved") || statVal == "Solved")
			{
				Status = "Closed";
			}else if(statVal.equals("All") || statVal == "All")
			{
				Status = "All";
			}else
			{
				Status = "Open";
			}
			
			System.out.println("Status ===>"+Status);
			System.out.println("chbxAll ===>"+chbxAll);
			if(chbxAll != null)
			{
				System.out.println("==in if=");
				
				
					Report_Header= Status+ " Complaints Report" ;
				
				
				
			}else{
				System.out.println("==in else=");
				
				
					Report_Header= Status+" Complaints Report for "+datenew1+
							" to "+datenew2;
				
				
			}
			
			
		}else{
			
			
				Report_Header="Complaint Report";
			
			
		}
	
	System.out.println("Report Header:"+Report_Header);
	
		%>
        <div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title  mb-0"><%=Report_Header%></h2>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
	 
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
                <form id="customdetail" name="customdetail" method="get">
                <div class="row col-12">
                    <div class="col-md-2">
                        <p> <span style="color:red">Pending</span>&nbsp;&nbsp;
                            <span style="color: green;">Solved</span>&nbsp;&nbsp;
                            
                        </p>
                    </div>
                    
                    <div class="col-md-2">
                    <label for="from">Complaints</label>
                    <div class="input-group input-group-merge">
							<select class="form-select" id="incidentDrp" name="incidentDrp">                       
                    <%if(statVal != null) { 	
				%><option value="All">All</option><%
			}else{
				 %><option value="All" selected>All</option><%
				 %><option value="Pending">Pending</option><%
				 %><option value="Solved">Solved</option><%
				
			}
			if(statVal != null)
			{
				if(statVal.equals("Pending") || statVal == "Pending") {	
					 %><option value="Pending" selected>Pending</option><%
					}else{System.out.println("in else s");
						 %><option value="Pending">Pending</option><%
					}
				
				if(statVal.equals("Solved")) {		
					 %><option value="Solved" selected>Solved</option><%
					}else{
						 %><option value="Solved">Solved</option><%
					}
			}	
		     %>
		     </select>
		     </div>
		     </div>
              <div class="col-md-2"> 
                        <label for="priority">Priority</label>
                        <div class="input-group input-group-merge">
<select class="form-select" name="category" id="category">
                    <%if(catval != null) { 	
				%><option value="All">All</option><%
			}else{
				 %><option value="All" selected>All</option><%
				 %><option value="High">High</option><%
				 %><option value="Low">Low</option><%
				
			}
			if(catval != null)
			{
				if(catval.equals("High") || catval == "High") {	
					 %><option value="High" selected>High</option><%
					}else{System.out.println("in else s");
						 %><option value="High">High</option><%
					}
				
				if(catval.equals("Low")) {		
					 %><option value="Low" selected>Low</option><%
					}else{
						 %><option value="Low">Low</option><%
					}
			}%>
			</select>
			</div>
			</div>
			<div class="col-md-1">
                        <div class="form-group form-check">
                            <label class="form-check-label" for="exampleCheck1">All</label><br>&nbsp;&nbsp;<input type="checkbox" class="form-check-input" id="extAll" name="extAll" value="yes" onclick="allSelected(this.value);"> 
                        	   
                        </div>
                        
                    </div>
     <div class="col-md-2" id="fromdate">
					<label for="from">From:</label>
				<div class="input-group input-group-merge" >
					<input type="text" name="data" id="data"  class="form-control" value="<%=datenew1%>"> 
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
			<div class="col-md-2" id="todate">
				<label for="to">To:</label>
				<div class="input-group input-group-merge" >
					<input type="text" id="data1" name="data1"  
					class="form-control" value="<%=datenew2%>"/> 
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
			maxDate:7 */
});
} );
			
});

			   </script>
		</div>               
			   
			   

                    <div class="col-md-1">
                        <button class="btn btn-primary" style="margin-top: 20px;" type="submit">Go</button>
                    </div>
			
                  </div>
                </form>
                <br>
                
                <!-- Table div Comes here -->
                <%! Connection conn=null;%>
				<%
 try
{
    
		//conn = fleetview.ReturnConnection();
		Statement st=null,st1=null;
		String sql=null;
		ResultSet rst=null;
		st=conn.createStatement();
		st1=conn.createStatement();
%>
<%
        int i=0;
		String sqlData="",DD="";
		
		
        String pri = "";
        
        if(request.getQueryString()!=null){
        
        System.out.println("from Date:"+dataDate1);
        System.out.println("to Date:"+dataDate2);
        
        if(catval == null || catval.equalsIgnoreCase("null") || catval == "All" || catval.equals("All"))
        {
        	pri = " and Priority in ('High','Low')";
        }
        else
        {
        	pri = " and Priority ='"+catval+"'";
        }

        
        
        
		if(chbxAll!=null && chbxAll!="")
		{
			if(statVal=="All" || statVal.equals("All"))
			{
        		if(UserTypeValue.equalsIgnoreCase("ALL"))
        		{
        			sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where Website = 'FleetView' "+pri+" order by ComplaintDateTime";
        		}
     		   else
       		   {
        			sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where Name='"+Name+"' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
        	   }
		   }
			else
			{
				if(UserTypeValue.equalsIgnoreCase("ALL"))
		        {
					System.out.println(UserTypeValue);
					if(statVal=="Solved" || statVal.equals("Solved"))
					{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where  Status = 'Closed'  and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        		
					}else
					{
						sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where  Status <> 'Closed'  and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
					}
		        }
		        else
		        {
		        	System.out.println(UserTypeValue);
		        	if(statVal=="Solved" || statVal.equals("Solved"))
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where Name='"+Name+"' and Status = 'Closed' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}else
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where Name='"+Name+"' and Status <> 'Closed' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}
		        }
			}
		}
		
		
		else if(statVal!=null && statVal!="")
		{
			System.out.println("**************************>>"+statVal);
			if(statVal=="All" || statVal.equals("All"))
			{
				if(UserTypeValue.equalsIgnoreCase("ALL"))
		        {
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59'  and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        }
		        else
		        {
		        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Name='"+Name+"' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        }
			}
			else 
			{
				if(UserTypeValue.equalsIgnoreCase("ALL"))
		        {
					System.out.println(UserTypeValue);
					if(statVal=="Solved" || statVal.equals("Solved"))
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Status = 'Closed' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}else
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail  where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Status <> 'Closed' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}
		        }
		        else
		        {
		        	if(statVal=="Solved" || statVal.equals("Solved"))
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Name='"+Name+"' and Status = 'Closed'  and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}else
		        	{
		        		sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Name='"+Name+"' and Status <> 'Closed'  and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
		        	}
		        }
			}
		}
		else
		{
			if(UserTypeValue.equalsIgnoreCase("ALL"))
	        {
	        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
	        }
	        else
	        {
	        	sql="select ComplaintID,ComplaintDateTime,Description,Website,ReportName,Category,Priority,Transporter,Status,ClosingComment,ClosedBy,EntBy,Email1,ContactNumber,Closeddatetime,FileName from db_gps.t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' and '"+dataDate2+" 23:59:59' and Name='"+Name+"' and Website = 'FleetView' "+pri+" order by ComplaintDateTime";
	        }
		}
		
		
	
        System.out.println("Table Query :===>"+sql);
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
                                    <%
		if(statVal=="All" || statVal.equals("All") || statVal=="Solved" || statVal.equals("Solved"))
		{
			exportList = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16";
			detailViewList="9,10,11,12,13,14,15,16";
		%>
		<th>Sr. No.</th>
		<th>Complaint ID</th>
		<th>Complaint Date Time</th>
		<th>Description</th>
		<th>Website</th>
		<th>Report Name</th>
		<th>Category</th>
		<th>Priority</th>
		<th>Transporter</th>
		<th>Email ID</th>
		<th>Contact Number</th>
		<th>Entered By</th>
		<th>Status</th>
		<th>Closed Date Time</th>
		<th>Closing Comments</th>
		<th>Closed By</th>
		<th>FileName</th>
		<%
		}
		else
		{
			exportList = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15";
			detailViewList="9,10,11,12,13,14,15";
			%>
		<th>Sr. No.</th>
		<th>Complaint ID</th>
		<th>Complaint Date Time</th>
		<th>Description</th>
		<th>Website</th>
		<th>Report Name</th>
		<th>Category</th>
		<th>Priority</th>
		<th>Transporter</th>
		<th>Email ID</th>
		<th>Contact Number</th>
		<th>Entered By</th>
		<th>Status</th>
		<th>Closing Comments</th>
		<th>Closed By</th>
		<th>FileName</th>			
		<%
		}
		%>
         </tr>
         </thead>
        <tbody>
        <!-- Table related Business logic here -->   
        <%
        rst=st.executeQuery(sql);
        while(rst.next())
        {
        	
        	if(rst.getString("Status").equalsIgnoreCase("Closed"))
			{
        		i++;
        		//System.out.println("Solved "+rst.getString("Status"));
					%><tr style="background-color: #AEF8B1;">
					 <td align="right"><%= i%></td>
          			<td align="right"><%= rst.getString("ComplaintID")%></td>
          			<%
          			if(rst.getString("ComplaintDateTime") == null || rst.getString("ComplaintDateTime").equalsIgnoreCase("null"))
          			{
          				%>
          					<td align="right">-</td>
          				
          				<%
          			}
          			else
          			{
          				%>
          				 <td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("ComplaintDateTime")))%></td>
          				
          				<%
          			}
          			%>
          			
		 			 <td align="left"><%= rst.getString("Description")%></td>
		  			<td align="left"><%= rst.getString("Website")%></td>
		  			<td align="left"><%= rst.getString("ReportName")%></td>
		  			<td align="left"><%= rst.getString("Category")%></td>
		  			<td align="left"><%= rst.getString("Priority")%></td>
		  		   <td align="left"><%= rst.getString("Transporter")%></td>
		  			<td align="left"><%= rst.getString("Email1")%></td>
		  			<td align="left"><%= rst.getString("ContactNumber")%></td>
		  			<td align="left"><%= rst.getString("EntBy")%></td>
		  			<td align="left">Closed</td>
		  			<%
		  			if(rst.getString("Closeddatetime")==null)
		  			{
		  			%>
		  			<td align="left">-</td>
		  			<%
		  			}
		  			else
		  			{
		  			%>
		  			<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("Closeddatetime")))%></td>
		   			<%} %>
		   			<td align="left"><%=rst.getString("ClosingComment")%></td>
		  			<td align="left"><%=rst.getString("ClosedBy")%></td>
		  			<td align="left">
						 
						<%
						String File = rst.getString("FileName");
						String wbsite = rst.getString("Website");
						File = File+",";
						String  File1=File.substring(File.lastIndexOf("/")+1,File.length());
						String[] token=File1.split(",");
                        String[] token1=File.split(",");
						 for(int k=0; k<token.length; k++)
                		{    
			
                		%>
							 <div align="left" style="overflow: auto;width: 150px;"><font size="2" >				        
					        	<a href="#" style="white-space: normal;" onclick="getFTPImage('<%=token[k]+","+wbsite%>')"><%=token[k]%></a>
							</font></div>					
						<%	
                		}					
						%>
					
			</td>
		  </tr>				
					<%					
			}
			else 
			{
				i++;
				//System.out.println("Pending " +rst.getString("Status"));
				%><tr style="background-color: #F9966B;">
				<td align="right"><%= i%></td>
          		<td align="right"><%= rst.getString("ComplaintID")%></td>
          		
          		<%
          			if(rst.getString("ComplaintDateTime") == null || rst.getString("ComplaintDateTime").equalsIgnoreCase("null"))
          			{
          				%>
          					<td align="right">-</td>
          				
          				<%
          			}
          			else
          			{
          				%>
          				 <td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString("ComplaintDateTime")))%></td>
          				
          				<%
          			}
          			%>
          		
          		
          		
		  		
		 		<td align="left"><%= rst.getString("Description")%></td>
		  		<td align="left"><%= rst.getString("Website")%></td>
		  		<td align="left"><%= rst.getString("ReportName")%></td>
		  		<td align="left"><%= rst.getString("Category")%></td>
		  		<td align="left"><%= rst.getString("Priority")%></td>
		  		<td align="left"><%= rst.getString("Transporter")%></td>
		  		<td align="left"><%= rst.getString("Email1")%></td>
		  		<td align="left"><%= rst.getString("ContactNumber")%></td>
		  		<td align="left"><%= rst.getString("EntBy")%></td>
		  		<td align="left">Open</td>
		  		<%
		  		if(statVal=="All" || statVal.equals("All"))
		  		{
		  			%>
		  			<td align="left">-</td>
		  			<%
		  		}
		  		%>
		   		<td align="left"><%= rst.getString("ClosingComment")%></td>
		  		<td align="left"><%= rst.getString("ClosedBy")%></td>
		  	
		  		<td align="left"  style="background-color: #F9966B;width: 20px;">
						 
						<%
						String File = rst.getString("FileName");
						String wbsite = rst.getString("Website");
						File = File+",";
						String  File1=File.substring(File.lastIndexOf("/")+1,File.length());
						String[] token=File1.split(",");
                        String[] token1=File.split(",");
						 for(int k=0; k<token.length; k++)
                		{    
			
                		%>
							 				        
					        	<a href="#" onclick="getFTPImage('<%=token[k]+","+wbsite%>')"><%=token[k]%></a>
												
						<%	
                		}					
						%>
				</td>
					
			
		  	</tr>
				<%
			}
       
          %>
         
        <% }%> 
                                         
        </tbody>
                                    <tfoot>
                                    <!-- content same as table head -->
                                   <tr>
                                   <%
		if(statVal=="All" || statVal.equals("All") || statVal=="Solved" || statVal.equals("Solved"))
		{
		%>
		<th>Sr. No.</th>
		<th>Complaint ID</th>
		<th>Complaint Date Time</th>
		<th>Description</th>
		<th>Website</th>
		<th>Report Name</th>
		<th>Category</th>
		<th>Priority</th>
		<th>Transporter</th>
		<th>Email ID</th>
		<th>Contact Number</th>
		<th>Entered By</th>
		<th>Status</th>
		<th>Closed Date Time</th>
		<th>Closing Comments</th>
		<th>Closed By</th>
		<th>FileName</th>
		<%
		}
		else
		{
			%>
		<th>Sr. No.</th>
		<th>Complaint ID</th>
		<th>Complaint Date Time</th>
		<th>Description</th>
		<th>Website</th>
		<th>Report Name</th>
		<th>Category</th>
		<th>Priority</th>
		<th>Transporter</th>
		<th>Email ID</th>
		<th>Contact Number</th>
		<th>Entered By</th>
		<th>Status</th>
		<th>Closing Comments</th>
		<th>Closed By</th>
		<th>FileName</th>			
		<%
		}
		%>
                                   </tr>                                                             
                                   </tfoot>
                                    </table>
<%
}
}
catch(Exception e)
{
	//out.print("Exception "+e);
	e.printStackTrace();
}
finally
{
	try
	{
		conn.close();
	}catch(Exception e)
	{e.printStackTrace();}
	try
	{
		//fleetview.closeConnection();
	}catch(Exception e)
	{e.printStackTrace();}
}
%>
</div>
</div>
</div>
</section>
</div>
</div>
</div>

                

</body>
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
								title: 'Complaint Report',
                                exportOptions: { columns: [<%=exportList%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Complaint Report',
                                exportOptions: { columns: [<%=exportList%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Complaint Report',
                                exportOptions: { columns: [<%=exportList%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Complaint Report',
                                exportOptions: { columns: [<%=exportList%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Complaint Report',
                                exportOptions: { columns: [<%=exportList%>] }
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

            dt_basic.columns([<%=detailViewList%>]).visible(false) ,

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

            dt_basic.columns([<%=detailViewList%>]).visible(true),

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

</html>
<%-- </jsp:useBean> --%>