    <%@ include file="headernew1.jsp" %>
<%@ page language="java" import="java.sql.*" import="java.util.*"
	import=" java.text.*"  errorPage=""%>   <!-- import="moreservlets.listeners.*"  -->
    
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

<script>
list=""
nodes=[];

	function ondemand(){
		alert("in method...")
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
				
		//for report conversion uncomment the line below and erase the line above
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

<script>
function update(v,s) {
    var txt="Edit The Details of Warehouse-"+v;
   	  
 
    
    if (confirm(txt)) {
    	
    	
    	location.assign("geoFenceUpdateAction.jsp?warehouse="+v+"&owner="+s);
    	
    	
    	//location.assign("AdvanceApprovalAction.jsp?id="+id+"&Action="+v+"&Reason="+c);
     
    }        
 else {
       
        return false;
    }
}

</script>




<script>
function delete1(v,s) {
    var txt="Delete The WareHouse -"+v;
   	  
 
    
    if (confirm(txt)) {
    	
    	
    	location.assign("geoFenceDeleteAction.jsp?warehouse="+v+"&owner="+s);
    	
    	
    	//location.assign("AdvanceApprovalAction.jsp?id="+id+"&Action="+v+"&Reason="+c);
     
    }        
 else {
       
        return false;
    }
}

</script>





</head>
<body onload="ondemand()">
<%
Connection conn=null;
Statement st=null,st1=null,st2=null,st3=null,st4=null,st20=null,st21=null;

%>
<%
try
{
	/* String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
	String MM_dbConn_USERNAME="fleetview";
	String MM_dbConn_PASSWORD="1@flv";
	String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/db_gps"; */
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	

    st=conn.createStatement();
    st1=conn.createStatement();
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

//for report conversion use this query
String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
System.out.println("set custom query:"+setdefault);
ResultSet rssetdefault=st20.executeQuery(setdefault);
if(rssetdefault.next())
{
	setDefFlag=true;    //uncomment this line for report conversion testing
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
		setDefFlag=true;   //uncomment this line for report conversion
		
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
String username="";
username=(String)session.getAttribute("usertypevalue");

System.out.println("Session name----------------->:"+username); 
String selected=request.getParameter("status");

System.out.println("--------"+selected);

String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
ResultSet rs4=null;
ResultSet rs3=null;
	//pritam rajput
%>
<input type="hidden" id="PageName" name="PageName"
				value="<%=PageName%>" />
<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">Geofence Report of <%=username%></h3>
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
								
							<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
			                       Set Custom</button>	

							<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0"
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
			 <!--  Form Comes Here -->
			<form name="formreport" id="formreport" method="post">
				<div class="row col-12">
					<div class="col-md-4"></div>
					<div class="col-md-2">
						<label for="basicSelect">Alert Status</label>
						<div class="input-group input-group-merge">
						
							<select class="form-select" id="basicSelect" name="status">


                               

<%-- <form name="formreport" id="formreport" method="post">
	<input type="hidden" id="username" name="username" value=<%=username %>>

	<div align="center" style="font-size: 13px;">
		<font><b> Geofence Report Of <%=username %></b></font>

 --%>
														<%
									if(selected==null)
									{
									%>
									<option value="All" selected >All</option>
									<%
					            	String query1 = "Select distinct(AlertStatus) from db_gps.t_warehousedata where Owner='"+username+"'";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("AlertStatus") %>" ><%=rs1.getString("AlertStatus")%></option>
									<%} 
									}else{
										%>
										<option value="All" selected >All</option><%
										String query1 ="Select distinct(AlertStatus) from db_gps.t_warehousedata where  (Owner='"+username+"' or Transporter='"+username+"' )";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("AlertStatus").equals(selected))
											{
												%><option value="<%=rs1.getString("AlertStatus") %>" selected><%=rs1.getString("AlertStatus")%></option><%
											}else{
												%><option value="<%=rs1.getString("AlertStatus") %>" ><%=rs1.getString("AlertStatus")%></option><%
											}
									    } 
									}
									%>
															
								
							</select>
							<script>
const mySel = document.getElementById("basicSelect"); 
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
							</div>
				
				
				<div class="col-md-2">
				<input class="btn btn-primary" style="margin-top: 20px; justify-content: center;"
					type="submit" name="button" onclick="return chk()"   value="Submit">
			    </div>
				

			
	</div>
</form>
<br>
<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
<table id="example1" class="table table-bordered"> 

	<thead>
		<tr>

			<th width="4%" align="center">Sr No</th>
            	<th  align="center">Delete</th>
                <th  align="center">WareHouse</th>
                <th  align="center">Owner</th>
                <th  align="center">Alert Status</th>
        		<th  align="center">Latitude</th>
                <th  align="center">Longitude</th>
                <th  align="center">Inner Limit</th>
                <th  align="center">Outer Limit</th>
                <th  align="center">To Id</th>
                <th  align="center">To Cc</th>
                <th  align="center">Entry By</th>
                <th  align="center">Insert Date</th>
                <th  align="center">Updated Date</th>
                <th  align="center">Category</th> 
		</tr>
	</thead>
	<tbody>

		<%
 

	
String ven;
String vehlist = session.getAttribute("VehList").toString();
String query="";
String branch="";
String warehouse="";
String mailid="";
String tocc="";

String alertStatus=request.getParameter("alertStatus");


String alertStatus1=alertStatus;
if(alertStatus==null)                               //((type==null)&&(alertStatus==null))
{
	//  type="All";
	  alertStatus="All";    
	}

 
System.out.println("AlertStatus:"+alertStatus);
%>

<script>
document.getElementById("alertStatus").value = '<% out.print(alertStatus); %>';
</script>

	<% 
		int j=0;
	 if(alertStatus!=null)						//((type!=null)&&(alertStatus!=null))
	 {
		 if(alertStatus.equals("All"))
		 {
			 alertStatus1="%%";
		 }
		 else
		 {
			 alertStatus1=alertStatus;
		 }
	 }
	 
	 query="Select * from db_gps.t_warehousedata where (Owner='"+username+"' or Transporter='"+username+"' )and  AlertStatus like'"+alertStatus1+"' "; 
	 
	   	System.out.println("Query is:"+query);
	      
	      rs3=st3.executeQuery(query);
 	 

	     while(rs3.next())
	      {
	    	  warehouse=rs3.getString("WareHouse");
	    	  System.out.println("data is:"+warehouse);
	    	 /*  branch="select ownername,branch,toid,tocc from db_gps.t_branchwisemailid where branch like '%"+warehouse+"%'"; */
	    	  
	    	 
	     branch="select ownername,branch,toid,tocc from db_gps.t_branchwisemailid where branch ='"+warehouse+"' and ownername='ETAAlert"+username+"'";	 
	    	  String branch1;
	    	  System.out.println("Query executed of branch1");
	    	  
	    	  
	    	  
	    	  System.out.println("Query is:"+branch);
	    	 rs4=st4.executeQuery(branch);
	    	System.out.println("Query executed of branch");
	    	 String dt1="";
	    	 String dt2="";
	    	 
	    	 
	    

	    	 
	    	 
	    	
	    	 
	    	 
	    	 
	    	 String  date2=rs3.getString("UpdatedDate");
	    	 
	    	 dt2 = new SimpleDateFormat("dd/MM/yyyy")
    		        .format(new SimpleDateFormat("yyyy-MM-dd")
    		                .parse(date2)); 
	    	 
	    	 
	    	 
	    	 
	    	 try
	    	 {
	    		 String date1=rs3.getString("Insertdate");
	    		 dt1 = new SimpleDateFormat("dd/MM/yyyy")
	    		        .format(new SimpleDateFormat("yyyy-MM-dd")
	    		                .parse(date1)); 
	    	
	    	System.out.println("---------Conversion----------->"+dt1);
	    	
	    	
	    	 }
	    	 catch(Exception e)
	    	 {
	    		 dt1="-";
	    	 }
	    	 

	    	 
	    
	    	 j++;
	    	  
	    	  
	    	  
	    	  				if(rs4.next())
	    					{
	   	 						mailid=rs4.getString("toid");
	     						mailid = mailid.replace(",","<br>");
	    					    tocc=rs4.getString("tocc");
	     						tocc=tocc.replace(",","<br>");
	     							
	     						
	     								
	   							System.out.println("Tocc:"+tocc);
	     						System.out.println("Toid:"+mailid);
	   
	  
							}
	    	  
	   	 					else
	    					{
	    
	    						mailid="-";
	    						tocc="-";
	    		
	 						}
	    	  				
	    	  				%>
	    	  				 <tr>		          
	    	    	    		<td  align="right"><%=j %></td>
	    	    	    		
	    	    	    			
	    	    	    		  <td align="left">
	    	    				<a href="#" title="Delete The Location" onclick="return delete1('<%=rs3.getString("WareHouse") %>','<%=rs3.getString("Owner")%>')" style="color:#505050"><img src="images/delete.jpeg" alt="Delete Record" width="18" height="18" border="0"></a><br></br>
	    	    			</td>
	    	    	    		
	    	    	    		
	    	    	    		
	    	    	    		  <td align="left">
	    	    				<a href="#"   title="Update Location Details"  onclick="return update('<%=rs3.getString("WareHouse") %>','<%=rs3.getString("Owner")%>')" style="color:green"><%=rs3.getString("WareHouse") %></a><br></br>
	    	    			</td>
	    	    	    		
	    	    	    		
	    	    	    		
	    	    	            <td   align="left"><%= rs3.getString("Owner")%></td>
	    	    	            <td ><%=rs3.getString("AlertStatus") %></td>
	    	    	            <td  align="right"><%= rs3.getString("Latitude")%></td>
	    	    	            <td  align="right"><%= rs3.getString("Longitude")%></td>    
	    	    	            <td  align="right"><%= rs3.getString("InnerLimit")%></td>
	    	    	            <td  align="right"><%= rs3.getString("OuterLimit")%></td>
	    	    	            <td  align="left">
	    	    				<a href="#" onclick="return result('<%=mailid%>')"><%=mailid%></a><br></br>
	    	    			</td>
	    	    	            
	    	    	        
	    	    	        
	    	    	        <td  align="left">
	    	    				<a href="#" onclick="return result('<%=tocc%>')"><%=tocc%></a><br></br>
	    	    			</td>
	    	    	        
	    	    	        
	    	    	     		 <td ><%= rs3.getString("EntBy")%></td>
	    	    	     		  
	    	    	            <td  align="right"><%=dt1 %></td>
	    	    	             <td  align="right"><%=dt2 %></td>
	    	    	            
	    	    	       
	    	    	            <td  align="left"><%=rs3.getString("WType")%></td>
	    	    	           
	    	    	            
	    	    	             
	    	    	            
	    	    	               
	    	    	            
	    	    	            
	    	    	            
	    	    	          
	    	    	            
	    	    	            
	    	    	        </tr>
	    	    	          <% 
    	    	  
    	    	  
      }
      %>
	    		  
	    	 
	    	  
      
	</tbody>
	
	<tfoot>
		<tr>
			
			<th width="4%" align="center">Sr No</th>
            	<th  align="center">Delete</th>
                <th  align="center">WareHouse</th>
                <th  align="center">Owner</th>
                <th  align="center">Alert Status</th>
        		<th  align="center">Latitude</th>
                <th  align="center">Longitude</th>
                <th  align="center">Inner Limit</th>
                <th  align="center">Outer Limit</th>
                <th  align="center">To Id</th>
                <th  align="center">To Cc</th>
                <th  align="center">Entry By</th>
                <th  align="center">Insert Date</th>
                <th  align="center">Updated Date</th>
                <th  align="center">Category</th> 
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
						<h4 class="modal-title">Custom Column Selection for Geofence Report </h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			//String showList= "Sr No,Name,City,ID,VehNo";   //for Template Only 
			String showList=""+ColumnList;    //uncomment this line for report conversion 
			%>		
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">  <!-- change this to ReSet.jsp for conversion  -->
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

</body>
</html>
