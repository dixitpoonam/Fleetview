<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.json.JSONObject" %>
<%@page import="com.google.gson.Gson" %>
<%@page import="com.google.gson.GsonBuilder" %>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
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
 	
 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<link href='https://fonts.googleapis.com/css?family=Arial+Web:400,300,600' rel='stylesheet' type='text/css'>
 	<script type="text/javascript" src="css/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />

 	
  	
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
<script type="text/javascript">
$(function () {

$('#cmd').click(function () {
var doc = new jsPDF();
doc.addHTML($('#content')[0], 10, 10, {
'background': '#fff',
'border':'1px solid black',
}, function() {
doc.save('sample-file.pdf');
});
});
});
</script>
</head>
<body onload="ondemand()">
<input type="hidden" id="PageName" name="PageName" value="<%=PageName%>" />
<%
	Connection conn=null,conn1=null;
	Statement st=null, st1=null,st2=null,st3=null,st4=null;
	int cnt1,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
	int cnttotal1=0,cnttotal2=0,cnttotal3=0,cnttotal4=0,cnttotal5=0,cnttotal6=0,cnttotal7=0;
	String username="",sql,sql1,jcode,origin,destination,startdate;
	username=(String)session.getAttribute("usertypevalue");
	String datex1, datex2,vehicle="", data1, data2,date2,date1;
	String RequestId=null,vehiclecode="",VehRegNo="",vehiclecode1="",VehRegNo1="",type="",status="";
	
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st=conn.createStatement();
	st3=conn.createStatement();
	st4=conn.createStatement();
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	ResultSet rs4 = null;
	ResultSet rs41 = null;
	
System.out.println("Session name----------------->:"+username); 
String TypeofUser = session.getAttribute("TypeofUser").toString();
System.out.println(" TypeofUser :- "+session.getAttribute("TypeofUser").toString());



%>
<%
String ddx = request.getQueryString();
String bt=request.getParameter("button");
System.out.println(" buttom :- "+bt);
	
	if (bt== null || bt.equals("null")) {
		
		
		datex1 =  session.getAttribute("PresentMonthFirst").toString();  //dd-MMM-yyyy
		
		datex2 = session.getAttribute("today").toString();
	} else {
		
		System.out.println("Inside ELSSSSSSSSS ");

		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}

System.out.println(" datex1 "+datex1+" datex2 "+datex2);

String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

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
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Trip Dashboard</h2>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
	

		<button class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#registerComplaintModal">
			Register Complaint</button>
		
			<button id="kt_engage_demos_toggle" class="engage-demos-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm fs-6rounded-top-0" >
				<span id="kt_engage_demos_label">Help</span>
			</button>
		
					  </div>
				</div>
			</div>
		</div>
		
		<form name="custreport" id="custreport" method="post">
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
				<input type="submit" class="btn btn-primary" style="margin-top: 10px;" name="button" onclick="return chk()"  value="Submit">
			</div>
		</div><br>
			</form>
			
		<div class="content-body">
				
				<!-- Basic table -->
				<div class="row mt-2">
					<div class="col-12">
						<div class="card">							
						<table id="example1" class="table table-striped table-bordered">
						<thead>
            <tr>
            	<!-- <th style="font-size: 16px;">RequesterId</th> -->
            	<th style="font-size: 14px ; face:san-serif;"><b>SrNo</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Destination</b></th>
            	
            	<%
            	ArrayList<String> ownerList = new ArrayList<String>();
              	ArrayList<String> locationList = new ArrayList<String>();
              	String TotalCountEndPlace="";
              	 int GrossTotal=0;
            	try{
            	String TranspoterName="";
           
            	
          	
            if(TypeofUser.equalsIgnoreCase("Group"))
            {

            	
                
                String sqlGrpName="select distinct(VehRegno),GPName from db_gps.t_group where GPName='"+username+"'  order by VehRegno asc ";
            	  System.out.println("Query of Group Name : "+sqlGrpName);
            	  
            	  ps = conn.prepareStatement(sqlGrpName);
            	  rs4 = ps.executeQuery();
  				
            
                 
                 while(rs4.next()){
                	  TranspoterName= rs4.getString("VehRegno");
                	  ownerList.add(TranspoterName);
                	 // System.out.println("Arr"+ownerList);
                	  
              	%>
              	
                  <th style="font-size: 14px ; face:san-serif;"><b><%=TranspoterName %></b></th>
  				
  				        
       
  				<!-- <th style="font-size: 14px ; face:san-serif;"><b>Total</b></th> -->
                   <%}
               
            	
            }
            else{
            	ownerList.add(username);
            	%>
              	
                <th style="font-size: 14px ; face:san-serif;"><b><%=username %></b></th>
				
            	<%
            } %>
                
              <th style="font-size: 14px ; face:san-serif;"><b>Total</b></th>
                    
            </tr>
        </thead>
        <tbody>
        <%  

      int total=0;
      String option="";
      
    // 
      String sqllocaion="";
    if(TypeofUser.equalsIgnoreCase("Group"))
            {

			  sqllocaion="select Distinct(EndPlace) from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' order by EndPlace ";
            }
    else
    		{
    	sqllocaion="select Distinct(EndPlace) from db_gps.t_completedjourney where ownername = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' order by EndPlace ";	
    		}
      ResultSet rssqllocation=st1.executeQuery(sqllocaion);
      
      System.out.println("Location Query is : "+sqllocaion);
      
      int i=1;
      String EndPlace1="";
      while(rssqllocation.next())
    	  {
    	  
    	  

    	  EndPlace1=rssqllocation.getString("EndPlace");
	  
    	  
    	  if(TypeofUser.equalsIgnoreCase("Group"))
          {

    	 sql="select OwnerName,count(*) from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' and  EndPlace='"+EndPlace1+"' group by OwnerName order by OwnerName ";
          }
    	  else
    	  {
    		  sql="select OwnerName,count(*) from db_gps.t_completedjourney where ownername = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' and  EndPlace='"+EndPlace1+"' group by OwnerName order by OwnerName ";  
    	  }
      System.out.println("Query is : "+sql);
	  ps = conn.prepareStatement(sql);
	  ResultSet rs3 = ps.executeQuery();
	  
	  String TripCount=""; 
 	  String EndPlace = "";
 	  String Owner = "";

 	 %>   	
		<tr>		          
		<td style="font-size: 13px; face:san-serif; color:black" align="right"><%=i %></td>
		<td style="font-size: 13px; face:san-serif; color:black"><%=EndPlace1 %></td>
		
		<%
     int cnt=1;
		int Total=0;
		//rs3.first();
		for(int j = 0; j < ownerList.size(); j++) {
  	         option = (String)ownerList.get(j);
  	       TripCount="0";
  	       //rs3.first();     
  	       //rs3.previous();
  	       rs3.beforeFirst();
      while(rs3.next()){
    	  
 
    	   
    	  
    	  Owner = rs3.getString("OwnerName");
    	  
    	 
    	  
    	  
    	  	  

			
			
   	         
   	          
   	          //System.out.println("TripCount -:"+TripCount);
   	         System.out.println("*****************"+Owner);
   	          try{
   	          if(option.equals(Owner))
   	          {
   	        	System.out.println("***************** INNNNNNNNNNN ");
   	        	
   	        	System.out.println("ArrayData -:"+option);
   	            System.out.println("Owner -:"+Owner);
   	            System.out.println("End Place  -:"+EndPlace1);
   	          
   	            
   	            TripCount=rs3.getString("count(*)");
   	         int result = Integer.parseInt(TripCount);		
   	            Total+=result; 
   	        	/* String sql1="select count(*) from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59'  and  EndPlace='"+EndPlace1+"' and OwnerName='"+option+"'";
				ResultSet rssql1=st.executeQuery(sql1);
				System.out.println("INNNNNNN SQL :- "+sql1);
				if(rssql1.next())
				{
   	        	  TripCount=rssql1.getString("count(*)");
				} */
				//TripCount +=TripCount;
   	         System.out.println("TripCount   -:"+TripCount);
				 
   	          }
   	          /* else
   	          {
   	        	  TripCount="0";
   	          } */
   	          
   	      
   	          }
   	          catch(Exception e)
   	          {
   	        	  e.printStackTrace();
   	          }
   	  
   	          
   	           
   	        	 
   	        	
   	          }
      %>
		 <td  style="font-size: 13px; face:san-serif; color:black" align="right"><%=TripCount %></td> 
    <%
   	          
   	      // rs3.first();
			}
                  
			%>
			
			 <td style="font-size: 13px; face:san-serif; color:black" align="right"><b><%=Total %></b></td> 
			<%
			cnt++;
     
         
      
      //System.out.println(" **************** End Place  :- "+EndPlace);
      //System.out.println(" **************** OwnerName   :- "+Owner);
      //System.out.println(" **************** Trip Count  :- "+TripCount);
      i++;
      System.out.println(" **************** Count  :- "+i);
    	  }
      
   
                  %>     
           
           </tr>
      <!--  <tr><td></td>
   <td style="font-size: 13px; face:san-serif; color:black"><b>Total</b></td>  -->
   
   <% 
   String ToatlOwner="";
   if(TypeofUser.equalsIgnoreCase("Group"))
   {

    ToatlOwner="select OwnerName,count(EndPlace) as CountEndPlace from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' group by ownername ";
   }
   else
   {
	   ToatlOwner="select OwnerName,count(EndPlace) as CountEndPlace from db_gps.t_completedjourney where ownername = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' group by ownername ";  
   }
   System.out.println("Sql Total:-"+ToatlOwner);	

     // Gson gsonObj1 = new Gson();
      ps1 = conn.prepareStatement(ToatlOwner);

      String pqr="";

      ResultSet rs12 = ps1.executeQuery();
  
   int CountTotal=0;

      while(rs12.next()){
      	 
      	  
      	  String OwnerName = rs12.getString("OwnerName");
      	 TotalCountEndPlace = rs12.getString("CountEndPlace");
      	 CountTotal=Integer.parseInt(TotalCountEndPlace);
      	 GrossTotal+=CountTotal;
      	 %>
      	 <%--  <td style="font-size: 13px; face:san-serif; color:black" align="right"><b><%=TotalCountEndPlace %></b></td> --%>
      	 
      	 <% 
      	}
      
      %>
         
      <% 
   	}
            	catch(Exception e)
            	{
            		e.printStackTrace();
            	}
            	%>
            	
     
        <%--   	<td style="font-size: 13px; face:san-serif; color:black" align="right"><b><%=GrossTotal%></b></td>	 --%>
      <!--     		
         </tr>  -->
        
        </tbody>
        <tfoot>
        <tr>
            	<!-- <th style="font-size: 16px;">RequesterId</th> -->
            	<th style="font-size: 14px ; face:san-serif;"><b>SrNo</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Destination</b></th>
            	
            	<%
            	ArrayList<String> ownerList2 = new ArrayList<String>();
              	ArrayList<String> locationList2 = new ArrayList<String>();
              	String TotalCountEndPlace2="";
              	 int GrossTotal2=0;
            	
            	String TranspoterName="";
           
            	
          	
            if(TypeofUser.equalsIgnoreCase("Group"))
            {

            	
                
                String sqlGrpName2="select distinct(VehRegno),GPName from db_gps.t_group where GPName='"+username+"'  order by VehRegno asc ";
            	  System.out.println("Query of Group Name : "+sqlGrpName2);
            	  
            	  ps2 = conn.prepareStatement(sqlGrpName2);
            	  rs41 = ps2.executeQuery();
  				
            
                 
                 while(rs41.next()){
                	  TranspoterName= rs41.getString("VehRegno");
                	  ownerList2.add(TranspoterName);
                	 // System.out.println("Arr"+ownerList2);
                	  
              	%>
              	
                  <th style="font-size: 14px ; face:san-serif;"><b><%=TranspoterName %></b></th>
  				
  				        
       
  				<!-- <th style="font-size: 14px ; face:san-serif;"><b>Total</b></th> -->
                   <%}
               
            	
            }
            else{
            	ownerList2.add(username);
            	%>
              	
                <th style="font-size: 14px ; face:san-serif;"><b><%=username %></b></th>
				
            	<%
            } %>
                
              <th style="font-size: 14px ; face:san-serif;"><b>Total</b></th>
                    
            </tr>
        
        </tfoot>
						</table>
						</div>
						</div>
						</div>
						
						<%
JSONObject responseObj = new JSONObject();
JSONObject empObj = null;
List empdetails1 = new LinkedList();
String  dataPoints="";
String  dataPoints2="";
String SqlPie1Total="";
if(TypeofUser.equalsIgnoreCase("Group"))
{
SqlPie1Total="select OwnerName,count(EndPlace) as CountEndPlace from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' group by ownername ";
System.out.println("Sql Total:-"+SqlPie1Total);	
}
else
{
	SqlPie1Total="select OwnerName,count(EndPlace) as CountEndPlace from db_gps.t_completedjourney where ownername = '"+username+"' and StartDate>= '"+dt+" 00:00:00' and StartDate <= '"+dt1+" 23:59:59' group by ownername ";
	System.out.println("Sql Total:-"+SqlPie1Total);	
}


Gson gsonObj1 = new Gson();
ps1 = conn.prepareStatement(SqlPie1Total);

String pqr="";

ResultSet rs12 = ps1.executeQuery();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

while(rs12.next()){
	 
	  
	  String OwnerName = rs12.getString("OwnerName");
	  String CountEndPlace = rs12.getString("CountEndPlace");
	  
	  
	  pqr+="["+"'"+OwnerName+"',"+CountEndPlace+"],";		  
	 
	} 



System.out.println("Data is:+"+pqr);







String SqlPie1Total1="";
if(TypeofUser.equalsIgnoreCase("Group"))
{
	SqlPie1Total1="select EndPlace,count(*) as CountEndPlace from db_gps.t_completedjourney where gpname = '"+username+"' and StartDate>=  '"+dttime+"' and StartDate <= '"+dt1time+"' group by endplace";
System.out.println("Sql Total:-"+SqlPie1Total1);	
}
else
{
	SqlPie1Total1="select EndPlace,count(*) as CountEndPlace from db_gps.t_completedjourney where ownername = '"+username+"' and StartDate>=  '"+dttime+"' and StartDate <= '"+dt1time+"' group by endplace";
	System.out.println("Sql Total:-"+SqlPie1Total1);
}


ps2 = conn.prepareStatement(SqlPie1Total1);

String abc="";

ResultSet rs51 = ps2.executeQuery();
 

Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
while(rs51.next()){


String EndPlace = rs51.getString("EndPlace");
String CountEndPlace1 = rs51.getString("CountEndPlace");

System.out.println("EndPlace :-"+EndPlace);

abc+="["+"'"+EndPlace+"',"+CountEndPlace1+"],";



}


System.out.println("Data is:"+abc);

String todate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt));

String fromdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dt1));


System.out.println("Date is:"+todate);


String transporter="Transporterwise Trip Count For ";
		
		transporter+=username;
		
		
		String date=" From "+todate+" To "+fromdate+"";
		
		transporter+=date;
		
		System.out.println("transporter:"+transporter);

String Destination="Destinationwise Trip Count For ";

	Destination+=username;
	
	Destination+=date;
%>
<script type="text/javascript">
google.charts.load('current', {
	  packages: ['controls', 'corechart', 'table']
	}).then(function () {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
	  data.addRows([
		  <%=pqr%>
	  ]);

	  var container = document.getElementById('piechart');
	  var chart = new google.visualization.PieChart(container);
	  var btnSave = document.getElementById('save-pdf');


	  
	  google.visualization.events.addListener(chart, 'ready', function () {
	    btnSave.disabled = false;
	  });

	  
	  btnSave.addEventListener('click', function () {
	    var doc = new jsPDF();
	    doc.addImage(chart.getImageURI(), 0, 0);
	    doc.save('TransporterSummary.pdf');
	  }, false);

	  
	  chart.draw(data, {
	    chartArea: {
	      bottom: 24,
	      left: 36,
	      right: 12,
	      top: 48,
	      width: '50%',
	      height: '50%'
	    },
	    height: 300,
	    title: '<%=transporter%>',
	    width: 600
	  });
	});
</script>


<script type="text/javascript">
	google.charts.load('current', {
		  packages: ['controls', 'corechart', 'table']
		}).then(function () {
		  var data = new google.visualization.DataTable();
		  data.addColumn('string', 'Topping');
		  data.addColumn('number', 'Slices');
		  data.addRows([
			  <%=abc%>
		  ]);
	
		  var container = document.getElementById('piechart1');
		  var chart = new google.visualization.PieChart(container);
		  var btnSave = document.getElementById('save-pdf1');
	
		  google.visualization.events.addListener(chart, 'ready', function () {
			btnSave.disabled = false;
		  });
	
		  btnSave.addEventListener('click', function () {
			var doc = new jsPDF();
			doc.addImage(chart.getImageURI(), 0, 0);
			doc.save('DestinationSummary.pdf');
		  }, false);
	
		  chart.draw(data, {
			chartArea: {
			  bottom: 24,
			  left: 36,
			  right: 12,
			  top: 48,
			  width: '50%',
			  height: '50%'
			},
			height: 300,
			title: '<%=Destination%>',
			width: 600
		  });
		});
	</script>

						<!--Chart  Logic and DIV-->
						<div class="row mt-2">
				<div class="col-md-6">
					<div class="card p-1">
						<button class="btn btn-success" id="save-pdf" style="width:25%">Export</button>
						<div id="piechart" ></div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="card p-1">
						<button class="btn btn-success" id="save-pdf1" style="width:25%">Export</button>
						<div id="piechart1" ></div>

					</div>
				</div>

				
			</div>
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
								title: 'Trip Dashboard'                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Trip Dashboard'                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Trip Dashboard'                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Trip Dashboard'
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Trip Dashboard'
                                
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

           <%--  dt_basic.columns([<%=detailViewSequence%>]).visible(false) , --%>

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