<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ include file="headernew1.jsp"%>
    
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
 
 <script>	
 	function chk()
 {

 	
 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	
 	
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("data1").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }

         return true;
 	
 }
 
</script>
</head>
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<%
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 


String datex1, datex2, data1, data2;
%>
<%
	Connection conn=null;
	Statement st=null, st1=null,st2=null, st3=null, st4=null,st20=null,st21=null;
%>
<%
	try
	{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st1=conn.createStatement();
		st=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st4=conn.createStatement();
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


<%
String fromDate = "", toDate = "";
String chkbx="";
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

String Selection1 = request.getParameter("routeid");
System.out.println("selection1:"+Selection1);

String Selection2 = request.getParameter("vehicle");
System.out.println("selection2:"+Selection2);

String Selection3 = request.getParameter("location");
System.out.println("selection3:"+Selection3);

String Selection4 = request.getParameter("status");
System.out.println("selection4:"+Selection4);

String user =session.getAttribute("usertypevalue").toString();
String UserID=session.getAttribute("UserID").toString();
%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Geo-fence EntryExit Report</h3>
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
			
	<form name="formreport" id="formreport" method="get">
		<div class="row">  <!-- row main start -->  
		   <div class="row col-11">  <!--  row 1 -->
			    <div class="col-md-2"> <!-- col 1 -->
					  <label for="from">From:</label>
							<div class="input-group input-group-merge" >
								<input type="text" name="data" id="data"  class="form-control" value="<%=datex1%>">  								<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg></span>
 							</div>
						   <script>
								    $(document).ready(function() {
									$( function() {
		   				            $( "#data" ).datepicker({
								    dateFormat: 'dd-M-yy',
									changeMonth: true,
						            changeYear: true  });  } );
										});
						   </script>
						  
			     </div>  <!-- col 1 -->
			     
			    <div class="col-md-2"> <!-- col 2 -->
				   <label for="to">To:</label>
						<div class="input-group input-group-merge" >
							<input type="text" id="data1" name="data1"  
							class="form-control" value="<%=datex2%>"/> 
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
								maxDate:7 */}); } );
			
									});
			           </script>
		     </div>  <!-- col 2 -->
		      
		    <div class="col-md-2">  <!-- col 3-->
		         <label for="basicSelect">Route ID</label>
					<div class="input-group input-group-merge">
							<select class="form-select" id="routeid" name="routeid">
								<%if(request.getParameter("routeid")!=null){ %>
						<option><%=request.getParameter("routeid")%></option>
						<%}%>
						<option value="All" selected>All</option>

<%
            String route="";
       	String sqlroute = "select distinct RouteId from db_gps.t_warehousedata where Owner like '%"+user+"%' and RouteId not in ('-')  order by RouteId";
		System.out.println("*******"+sqlroute);
        ResultSet rs2 = st1.executeQuery(sqlroute);
		while(rs2.next())
		{
			 route= rs2.getString("RouteID");            //getting route ID from query
			 
			
%>
						<option value="<%=route%>"><%=route%></option>
						<%
			
      }
		%>
							</select>
							
							<script>
			                         const mySel = document.getElementById("routeid"); 
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
		          </div>
		    </div>  <!-- col 3 -->
		    
		    <div class="col-md-2"> <!-- col 4 -->
		         <label for="basicSelect">Vehicle</label>
					<div class="input-group input-group-merge">
							<select class="form-select" id="vehicle" name="vehicle">
								<%if(request.getParameter("vehicle")!=null){ 
            String sql="select VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode='"+request.getParameter("vehicle")+"' limit 1";
            ResultSet rsch=st.executeQuery(sql);
           if(rsch.next()){%>
						<option><%=rsch.getString("VehicleRegNumber")%></option>
						<%}  //end of if block
           				} //end of if block%>  

						<option value="All" selected>All</option>

						<%
            String vehiclecode="";
						String VehRegNo = "";
       	String sqlregno = "select VehicleRegNumber,vehiclecode from db_gps.t_vehicledetails where vehiclecode in "+session.getAttribute("VehList").toString()+" order by VehicleRegNumber";
		System.out.println("*******"+sqlregno);
        ResultSet rsregno = st.executeQuery(sqlregno);
		while(rsregno.next())
		{
			 vehiclecode= rsregno.getString("vehiclecode");
			 VehRegNo=rsregno.getString("VehicleRegNumber");
			 
			// System.out.println("VehicleRegNo-->"+VehRegNo);
			
	         
			String vehicles="";
			vehicles=vehicles.replace("(","");
			vehicles=vehicles.replace(")","");
			
			if(vehicles==rsregno.getString("vehiclecode") || vehicles.equalsIgnoreCase(rsregno.getString("vehiclecode")))
			{
			%>
						<option value="<%=rsregno.getString("vehiclecode")%>"
							selected="selected"><%=rsregno.getString("VehicleRegNumber")%></option>
						<%
			}
			else
			{%>
						<option value="<%=rsregno.getString("vehiclecode")%>"><%=rsregno.getString("VehicleRegNumber")%></option>
						<%	
			}
      }
		%>
							</select>
							<script>
			                         const mySel = document.getElementById("vehicle"); 
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
		          </div>
		    </div>   <!-- col 4 -->
		    
		      <div class="col-md-2"> <!-- col 5 -->
		         <label for="basicSelect">Location</label>
					<div class="input-group input-group-merge">
							<select class="form-select" id="location" name="location">
								<%if(request.getParameter("location")!=null){ %>
						<option><%=request.getParameter("location")%></option>
						<%} %>
						<option value="All" selected>All</option>

						<%
            String location="";
       	String sqlloc = "select distinct WareHouse from db_gps.t_warehousedata where Owner like '%"+user+"%'  order by WareHouse";
		System.out.println("*******"+sqlloc);
        ResultSet rs = st1.executeQuery(sqlloc);
		while(rs.next())
		{
			 location= rs.getString("WareHouse");
			
			
			%>
						<option value="<%=location%>"><%=location%></option>
						<%
			
      }
		%>
							</select>
							<script>
			                         const mySel = document.getElementById("location"); 
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
		          </div>
		    </div>   <!-- col 5 -->
		    
		      <div class="col-md-2"> <!-- col 6 -->
		         <label for="basicSelect">Status</label>
					<div class="input-group input-group-merge">
							<select class="form-select" id="status" name="status">
								<%if(request.getParameter("status")!=null){ %>
						<option><%=request.getParameter("status")%></option>
						<%}%>
						<option value="All">All</option>
						<option value="Entry">Entry</option>
						<option value="Exit">Exit</option>
							</select>
							<script>
			                         const mySel = document.getElementById("status"); 
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
		          </div>
		    </div>   <!-- col 6 -->
          </div>
            <div class="row col-1">
					<div class="col-md-2">  <!-- col 5 -->
						<input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" onclick="return chk()"  value="Submit">
					</div> <!-- col 5 -->
					
		        </div>
		   
	   </div> <!-- row main end -->  
		   <br>
			</form>
			<%
	
		String data = "";
		data1 = "" ; 
		String vehicleCode = ""; 
		String vehicleRegistrationNumber = "",sumOfDist="",intripCount="";
		
		/* data1 = request.getParameter("data");

		fromDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
		data2 = request.getParameter("data1");

		toDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data2)); */
						
			String vehicle=request.getParameter("vehicle");   //receive vehicle from form
			if(vehicle==null){
				vehicle="All";
			}
			
			System.out.println("Vehicle is->"+vehicle);	
					String status=request.getParameter("status");   //receive status from form
					if(status==null){
						status="All";
					}
					
					System.out.println("Status is->"+status);
					
					if(!vehicle.equals("All")){
						System.out.println("In vehicle");
						//vehicle="('"+vehicle+"')";
						vehicle=""+vehicle+"";
					}else{
						vehicle=session.getAttribute("VehList").toString();  //vehicle now holds a list of vehicles
						vehicle=vehicle.replace("(", "");
						vehicle=vehicle.replace(")", "");
					}
					 chkbx="No";
					if(request.getParameter("extAll")=="Yes"){             
						chkbx=request.getParameter("extAll");
						
					}
					
					System.out.println("Checke box is->"+chkbx);
					String  dt2 = "", chdt1 = "", chdt2 = "";
					if(status=="All" || status.equals("All"))
					{
					    //status="('Entry','Exit','-')";
						status="'Entry','Exit','-'";	
					}

						if(status=="Entry" || status.equals("Entry"))
						{
							
							//status="('Entry')";
							status="'Entry'";
						}

						if(status=="Exit" || status.equals("Exit"))
						{   //status="('Exit')";
							status="'Exit'";
						}
						location=request.getParameter("location");     //location value get from form
						System.out.println("Location--"+location);
						if(location==null){
							location="All";
						}
						
						String location1="''",loc="";
						String warehousecode1="''",warehousecode="";
						if(location.equals("All"))
						{
					       	String sql12 = "select distinct WareHouse,WareHouseCode from db_gps.t_warehousedata where Owner like '%"+user+"%' order by WareHouse ";
							System.out.println("*******"+sql12);
					        ResultSet rsregno12 = st2.executeQuery(sql12);
							while(rsregno12.next())
							{
								 loc=rsregno12.getString("WareHouse");
								 loc="'"+loc+"'";
								warehousecode=rsregno12.getString("WareHouseCode");
								warehousecode="'"+warehousecode+"'";
								 location1=location1+","+loc;
								 warehousecode1=warehousecode1+","+warehousecode;
								
					      }
					   }else{
						location="'"+location+"'";
						//cust1=cust1+","+cust;
						location1=location;
						String sql12 = "select WareHouseCode from db_gps.t_warehousedata where WareHouse in ("+location1+") and Owner like '%"+user+"%' order by WareHouse ";
						System.out.println("*******"+sql12);
						ResultSet rsregno12 = st2.executeQuery(sql12);
						if(rsregno12.next()){
							warehousecode=rsregno12.getString("WareHouseCode");
							
						}
						warehousecode="'"+warehousecode+"'";
						warehousecode1=warehousecode;
					}
						
					route=request.getParameter("routeid");   //receive routeid from  input form
					if(route==null){
						route="All";
					}
					
					System.out.println("RouteID"+route);
					String routeid1="''",rute="";
					
					if(route.equals("All")){
						String sql3="select distinct routeid from db_gps.t_warehousedata where Owner like '%"+user+"%' order by RouteId ";
						System.out.println("routeid query-"+sql3);
						ResultSet rs3=st3.executeQuery(sql3);
						while(rs3.next())
						{
							rute=rs3.getString("RouteId");
							rute="'"+rute+"'";
							routeid1=routeid1+","+rute;
						}
					}else{
						route="'"+route+"'";
						routeid1=route;
					}
					System.out.println("RouteId->"+routeid1);
						
					/* String fromDateTime = fromDate + " " + "00:00:00";
					String toDateTime = toDate + " " + "23:59:59"; */
					
					System.out.println("user=" + user);
					String transporter="", warehouse="", entryexitstatus="", datetime="",lat="", lon="";
					String commaSeparatedVehicleList = session.getAttribute(
							"VehList").toString();
					
					System.out.println("");
%>
			
			
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
				<th>Vehicle</th>
				<th>Transporter</th>
				<th>Location</th>
				<th>Route Id</th>
				<th>Latitude</th>
				<th>Longitude</th>
				<th>Status</th>
				<th>Date Time</th>
										</tr>
									</thead>
									<tbody>
										<%
		String sql = "SELECT VehRegNo,Transporter,WareHouse, EntryExitStatus, TheDateTime, Lat, Lon FROM  db_gps.t_geofenceentryexit WHERE VehCode in ('"+vehicle+"') and warehouse in ("+location1+") and TheDateTime>='"+dttime+ "' and TheDateTime<='"+dt1time+"' and EntryExitStatus in ("+status+") and WareHouseCode in (select warehousecode from db_gps.t_warehousedata where warehousecode in ("+warehousecode1+") and routeid in ("+routeid1+") ) order by TheDateTime desc";
						
					System.out.println("sql=" + sql);
					
					ResultSet rs1 = st.executeQuery(sql);
					int j = 1; 
					while (rs1.next()) 
					{
						vehicleRegistrationNumber = rs1.getString("VehRegNo");
						transporter = rs1.getString("Transporter");
						warehouse = rs1.getString("WareHouse");
						entryexitstatus= rs1.getString("EntryExitStatus");
						datetime= rs1.getString("TheDateTime");
						lat= rs1.getString("Lat");
						lon= rs1.getString("Lon");
						
						String sql4="select RouteId from db_gps.t_warehousedata where RouteId in ("+routeid1+")  and Owner like '%"+user+"%' and Warehouse='"+warehouse+"'  ";
						System.out.println("Sql 4->"+sql4);
						String ruteid="";
						ResultSet rs4=st4.executeQuery(sql4);
						if(rs4.next())
						{
							ruteid=rs4.getString("RouteId");
						}
						
						System.out.println("regstn:"+vehicleRegistrationNumber);
						System.out.println("trans:"+transporter);
						System.out.println("wh:"+warehouse);
						System.out.println("ruteid:"+ruteid);
						System.out.println("lat"+lat);
						System.out.println("long:"+lon);
						System.out.println("ee_status:"+entryexitstatus);
%>
		
			<tr>
				<td><%=j%></td>
				<td><%=vehicleRegistrationNumber%></td>
				<td><%=transporter%></td>
				<td><%=warehouse%></td>
				<td><%=ruteid%></td>
				<td><%=lat%></td>
				<td><%=lon%></td>
				<td><%=entryexitstatus%></td>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(datetime))%></td>
			</tr>
		<% 
		j++;  
		} 					
		 %>
									<tfoot>
										<tr>
											<th>Sr.</th>
				<th>Vehicle</th>
				<th>Transporter</th>
				<th>Location</th>
				<th>Route Id</th>
				<th>Latitude</th>
				<th>Longitude</th>
				<th>Status</th>
				<th>Date Time</th>
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
						<h4 class="modal-title">Custom Column Selection for Geofence Entry Exit Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			//String showList= "Sr.No.,VehRegNo,Transporter,VehicleType,Total Distance,Total RunHrs";   //for Template Only 
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
								title: 'Geofence Entry Exit Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Geofence Entry Exit Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Geofence Entry Exit Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Geofence Entry Exit Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Geofence Entry Exit Report',
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
