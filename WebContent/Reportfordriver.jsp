<%@ include file="headernew1.jsp" %>

<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%
/* fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<style>
   #table-1 {
   width: "50%" ;
   float: left
   }
   
   #table-2 {
   width: "50%" ;
   float: right
   }
   </style>
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


function gotoPrint(divName)  
{  
	  
    var printContents = document.getElementById(divName).innerHTML; 
    var originalContents = document.body.innerHTML;       
    document.body.innerHTML = printContents;  
    window.print();
    document.body.innerHTML = originalContents;  
}

function confirmDelete()
{
	  //alert("a");
	  var  agree=confirm("Are you sure you want to Deactivate this ?");
	  //alert("B") ;
	  if(agree)
	  {
		 //alert("C") ;	
		 return true ;
	  }	  	   
	  else
	  {
		 //alert("D") ; 
	     return false ;
	  }	  	   
}


function getFTPImage(ftpFile)		
{			
	try			
	{
		window.open('showCleanerDocs.jsp?ftpFile='+ftpFile+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
	}
	catch(e)			
	{
		alert(e);			
	}
}
</script>

 <%! 
Connection conn,conn1;
String data1,sql,sql1,data2,jcode,origin,destination,startdate,ck;
Statement st,st1,st2;
Statement st3,st4;
%>
 
 <% 
 Class.forName(MM_dbConn_DRIVER); 
 conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 String GPName="",Transporter="",mobno="",dobfile="",newdobfile="",addfile="",newaddfile="",licfile="",newlicfile="";
	String[] dobfile1,addfile1,licfile1;
	
	String expirydate="";
	String RejectedBy=session.getAttribute("mainuser").toString();
	System.out.println(" User mainuser " +RejectedBy);

   // String typeofuser="xyz";
	String usertypevalue=session.getAttribute("usertypevalue").toString();//
	System.out.println(" User Suyog-------------- " +usertypevalue);
	
	
	String typeofuser=session.getAttribute("TypeofUser").toString();//Group
	System.out.println(" User Suyog****************** " +typeofuser);

	String SrchTrans="";
	System.out.println(usertypevalue+" User "+typeofuser);
	
	Statement st3=conn.createStatement();
	Statement st4=conn.createStatement();
	
	int colcount=0;   //special code for detailed view
	String setSequence ="";
	String detailViewSequence = "",ColumnList="";
	boolean setDefFlag=false;

	String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportno+"'";
	System.out.println("set custom query:"+setdefault);
	ResultSet rssetdefault=st3.executeQuery(setdefault);
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

		ResultSet rssetdefault1=st4.executeQuery(setdefault1);
		if(rssetdefault1.next())
		{
			setDefFlag=true;
			
			colcount = rssetdefault1.getInt("ColumnCount");
			setSequence = rssetdefault1.getString("SetSequence");
			detailViewSequence = rssetdefault1.getString("DetailViewSequence");
			ColumnList= rssetdefault1.getString("ColumnList");
		}
		
	}

	System.out.println("column count "+colcount);
	System.out.println("set sequence "+setSequence);
	System.out.println("detailed view sequence "+detailViewSequence);
	
	if(typeofuser.equalsIgnoreCase("Group"))
		
	{
		typeofuser="GROUP";
		System.out.println("IN Group ");
		sql="SELECT VehRegno FROM db_gps.t_group WHERE GPName='"+usertypevalue+"' group by VehRegno";
		System.out.println("*****8     "+sql);
		ResultSet rstGrp=st3.executeQuery(sql);
		//SrchTrans="(";
		int k = 0;
		while(rstGrp.next())
		{
			SrchTrans+="'"+rstGrp.getString("VehRegno")+"',";
			k++;
		}
		//SrchTrans+=")";
		SrchTrans=SrchTrans.substring(0,SrchTrans.length()-1);

	}
	else
	{
		//typeofuser="Transporter";
		//System.out.println("IN Else------------- "+typeofuser);
		//usertypevalue=usertypevalue;	
	}           // typeofuser


 String todate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date());

 
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
							<h2 class="content-header-title  mb-0">Driver Master Report</h2>
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
								
							<button id="SetCustom" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
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
		
		<input type="hidden" id="setDefFlag" name="setDefFlag" value="<%=setDefFlag%>">
		
		<!-- <div class="" align="center"> -->
		 <!--  <form name="temp" id="temp" method="post" >
		<font face="Arial" size="2">Status</font>
		
		<select name="statusval">
		<option  value="Active" selected="selected">Active</option>
		<option  value="InActive">InActive</option>
		<option  value="All">All</option>
		</select>
		<input type="button" value="Submit" id="submit">
		</form> -->
		<form name="temp" id="temp" method="post">
				<div class="row col-12">
					<div class="col-md-4"></div>
					<div class="col-md-2">
						<label for="status">Status</label>
						<div class="input-group input-group-merge">
		                 <select class="form-select" id="statusval" name="statusval">
 						<%
String StatusDropDown="";								
String SqlStatus="select distinct(ACTIVESTATUS) as Status from db_gps.t_drivers order by ACTIVESTATUS asc";
System.out.println("SqlStatus :- "+SqlStatus);
ResultSet rst=st3.executeQuery(SqlStatus);
while(rst.next())
{	StatusDropDown=rst.getString("Status") ;
%>
<option value="<%=rst.getString("Status") %>"><%=rst.getString("Status") %></option>
<%} %>
<option value="All">All</option>

  											
  											<%
				if(request.getParameter("statusval") != null){
		
					 %><option value=<%=request.getParameter("statusval")%> selected><%=request.getParameter("statusval") %></option><%
						}
							%>
  											
										</select>
										<!-- <script>
const mySel = document.getElementById("statusval"); 
mySel.addEventListener("change",function() 
		{ 
			localStorage.setItem("selValue",this.value); // save it 
		}); 

let val = localStorage.getItem("selValue"); 
if (val) 
	mySel.value=val; // set the dropdown 
    // trigger the change in case there are other events on the select 
mySel.onchange(); 
</script> -->
										</div>
										</div>
										
										<div class="col-md-4">
						                <input type="submit" class="btn btn-primary" style="margin-top: 20px;" name="button" value="Submit">
										<a href="driverentrynew.jsp"><button class="btn btn-primary" style="margin-top: 20px;" type="button">Add New</button></a>
										</div>
										</div>
                                        
                                      </form>
		<br>
		
		
		
		
		
		
		
 	
 	<div id="reportData1" class="">
 	<%
 	 String status = request.getParameter("statusval");
 	 System.out.println("Status :- "+status);
 	 
 	 if(status==null){
 		 status="and ACTIVESTATUS ='Active'";
 		 System.out.println("Status :- "+status);
 	 }	
 	 else if(!(status.equalsIgnoreCase("All"))) {
 		 
 		String statusnew = request.getParameter("statusval").toString();
 		status="and ACTIVESTATUS ='"+statusnew+"'";
 		 System.out.println("Status :- "+status);
 	 }
 	 else{
 		 status="";
 	 }
 	%>
<input type="hidden" id="usertypevalue" name="usertypevalue" value="<%=usertypevalue%>">

<div class="content-body">
				<!-- Basic table -->
				<section id="">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<table id="example1" class="table table-bordered"> 
<thead>
           <tr>
           	<th>SrNo</th>
           	<th>R ID</th>
           	<th>Driver ID</th>
               <th>Driver Training</th>
               <th>Edit</th>
               <th>Deactivate</th>
       			<th>Name</th>
               <th>Status</th>
               <th>Owner</th>
               <th>Group</th>
               <th>Mobile</th>
               <th>License No.</th>
               <th>License Expiry</th>
               <th>License File</th>
               <th>DOB</th>
               <th>DOB File</th>
               <th>Current Address</th>
               <th>Permanent Address</th>
               <th>Address File</th>
               <th>Induction Date</th>
               <th>Gender</th>
                <th>Marital Status</th>
               <th>Father Name</th>
               <th>Updated</th>
               <th>Entry By</th>
           </tr>
       </thead>
       <tbody>
       <%
       String Transtype="";
       
       if(typeofuser.equalsIgnoreCase("Group"))
   		{
    	   Transtype="in (SELECT VehRegno FROM db_gps.t_group WHERE GPName='"+usertypevalue+"' group by VehRegno)";
       }
       else{
    	   Transtype="= '"+usertypevalue+"'";
       }
       
       Statement stmt=null;
       String DriverID="",DriverName="",ACTIVESTATUS="",Owner="",GroupName="",MobileNo="",licenseno="",LicenseExpiry="";
       String LicenseFile="",DOB="",DOBFile="",CurrentAddress="",PermanentAddress="",AddressFile="",DateOfInduction="";
       String Gender="",MaritalStatus="",FatherName="",Updated="",EntryBy="",DeactReason="",rid="";
       String DriverQuery = " select rid, DriverID as ID,DriverName as Name,ACTIVESTATUS as Status,Owner as Owner,"
       						+"GPName as GroupName,MobileNo as Mobile,licenseno as License,DATE_FORMAT(licenseexpdate,'%d-%b-%Y') as LicenseExpiry,"
       						+"licensefile as LicenseFile,DOB,DOBFile as DOBFile,Address2 as CurrentAddress,"
       						+"Address1 as PermanentAddress,AddressFile as AddressFile,DateOfInduction as InductionDt,"
       						+"Gender,Marital as MaritalStatus,FatherNm as FatherName,"
       						+"DATE_FORMAT(Updated,'%d-%b-%Y %H:%i') as Updated,EntryBy,DeactReason  "
       						+"from db_gps.t_drivers where Owner "+Transtype+"  "+status+"  order by DriverName";
      System.out.println("Sql Query :- "+DriverQuery);
       ResultSet rs12=st3.executeQuery(DriverQuery);
   		int i=1;
   		while(rs12.next())
   		{
   			rid=rs12.getString("rid");
   			DriverID=rs12.getString("ID");
   			DriverName=rs12.getString("Name");
   			ACTIVESTATUS=rs12.getString("Status");
   			Owner=rs12.getString("Owner");
   			GroupName=rs12.getString("GroupName");
   			MobileNo=rs12.getString("Mobile");
   			licenseno=rs12.getString("License"); 
   			
   			LicenseExpiry=rs12.getString("LicenseExpiry");
   			LicenseFile=rs12.getString("LicenseFile");
   			DOB=rs12.getString("DOB");
   			DOBFile=rs12.getString("DOBFile");
   			CurrentAddress=rs12.getString("CurrentAddress");
   			PermanentAddress=rs12.getString("PermanentAddress");
   			AddressFile=rs12.getString("AddressFile");
   			DateOfInduction=rs12.getString("InductionDt");
   			Gender=rs12.getString("Gender");
   			MaritalStatus=rs12.getString("MaritalStatus");
   			FatherName=rs12.getString("FatherName");
   			Updated=rs12.getString("Updated");
   			EntryBy=rs12.getString("EntryBy");
   			DeactReason=rs12.getString("DeactReason");
   			
       %>
       <tr>
       		<td align="right"><%=i%></td>
       		<td align="right"><%=rid%></td>
       		<td align="left"><%=DriverID%></td>
       		 <td align="left"><a href="Drivertrain.jsp?&id=<%=DriverID %>&drivername=<%=DriverName %>&owner=<%=Owner %>&entryby=<%=EntryBy%>">Driver Training</a></u></td>
			 <td align="left"><a href="driveredit.jsp?clean=true&rid=<%=rid %>&id=<%=DriverID %>&name=<%=DriverName %>&add=<%=PermanentAddress %>&Gender=<%=Gender %>&dob=<%=DOB %>&mobno=<%=MobileNo %>&fathernm=<%=FatherName %>&owner=<%=Owner %>&status=<%=ACTIVESTATUS %>&gpname=<%=GroupName %>&entryby=<%=EntryBy %>&Address2=<%=CurrentAddress %>&DOiN=<%=DateOfInduction %>&DProof=<%=DOBFile %>&Aproof=<%=AddressFile %>&LProof=<%=licfile %>&marrid=<%=MaritalStatus %>&licno1=<%=licenseno %>&licexp=<%=LicenseExpiry %>&dreason=<%=DeactReason%>">Edit</a></td>
       		<td align="left"><a href="deactivatedriver.jsp?rid=<%=rid %>&driverid=<%=DriverID %>&name=<%=DriverName %>&add=<%=PermanentAddress %>&Gender=<%=Gender %>&dob=<%=DOB %>&mobno=<%=MobileNo %>&fathernm=<%=FatherName %>&owner=<%=Owner %>&status=<%=ACTIVESTATUS %>&gpname=<%=GroupName %>&entryby=<%=EntryBy %>&Address2=<%=CurrentAddress %>&DOiN=<%=DateOfInduction %>&DProof=<%=DOBFile %>&Aproof=<%=AddressFile %>&marrid=<%=MaritalStatus %>&licno1=<%=licenseno %>&licexp=<%=LicenseExpiry%>">Deactivate</a></td>
       		<td align="left"><%=DriverName%></td>
       		<td align="left"><%=ACTIVESTATUS%></td>
       		<td align="left"><%=Owner%></td>
       		<td align="left"><%=GroupName%></td>
       		<td align="right"><%=MobileNo%></td>
       		<td align="left"><%=licenseno%></td>
       		<td align="right"><%=LicenseExpiry%></td>
       		<td align="left"><a href="showCleanerDocs.jsp?ftpFile=<%=LicenseFile%>"><%=LicenseFile%></a></td>       		
       		<td align="right"><%=DOB%></td>
       		<td align="left"><a href="showCleanerDocs.jsp?ftpFile=<%=DOBFile%>"> <%=DOBFile%></a></td>
       		<td align="left"><%=CurrentAddress%></td>
       		<td align="left"><%=PermanentAddress%></td>
       		<td align="left"><a href="showCleanerDocs.jsp?ftpFile=<%=AddressFile%>"><%=AddressFile%></a></td>
       		<td align="right"><%=DateOfInduction%></td>
       		<td align="left"><%=Gender%></td>
       		<td align="left"><%=MaritalStatus%></td>
       		<td align="left"><%=FatherName%></td>
       		<td align="right"><%=Updated%></td>
       		<td align="left"><%=EntryBy%></td>
       		
			
       
       </tr>
       <%
       i++;	
   		} 
   		%>
       </tbody>
<tfoot>
           <tr>
           	<th>SrNo</th>
           	<th>R ID</th>
           	<th>Driver ID</th>
               <th>Driver Training</th>
               <th>Edit</th>
               <th>Deactivate</th>
       			<th>Name</th>
               <th>Status</th>
               <th>Owner</th>
               <th>Group</th>
               <th>Mobile</th>
               <th>License No.</th>
               <th>License Expiry</th>
               <th>License File</th>
               <th>DOB</th>
               <th>DOB File</th>
               <th>Current Address</th>
               <th>Permanent Address</th>
               <th>Address File</th>
               <th>Induction Date</th>
               <th>Gender</th>
                <th>Marital Status</th>
               <th>Father Name</th>
               <th>Updated</th>
               <th>Entry By</th>
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

<!-- Set Custom  -->
  <div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content" style="width:750px">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Driver Master Report</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int in=0; 
								
			//String showList= "SrNo,R ID,Driver ID,Driver Training,Edit,Deactivate,Name,Status,Owner,Group,Mobile,License No.,License Expiry,License File,DOB,DOB File,Current Address,Permanent Address,Address File,Induction Date,Gender,Marital Status,Father Name,Updated,Entry By";
			String showList=""+ColumnList;
			%>	
			<form id="customselect" name="customselect" method="get" action="ReSet.jsp">
			<div class="modal-body">
			<div id="table-1">
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk &nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><%
							int length=25;
							int val1 = (int)((double)length/2);
							int val2 = length - val1;
							StringTokenizer stcol = new StringTokenizer(showList,","); 
							while(stcol.hasMoreTokens() && in<=val1){
							%><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=in %>" name="net_id1<%=in %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=in %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=in %>"   id="check<%=in %>"  /></td>
						<td><input type="text" name="clname<%=in %>"   id="clname<%=in %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%in++;}%></tbody>
						</table>
				</div>
				
				<div id="table-2" >
				<table class="table table-bordered">
							<thead>
							<tr>
							<th>Chk&nbsp;/&nbsp;UnChk</th>
							<th>Col. Name</th>
							</tr>
							</thead>
							<tbody><% 
							while(stcol.hasMoreTokens()){  %><tr>
							<td>
							<div align="left"><input type="text" id="net_id1<%=in %>" name="net_id1<%=in %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right; font: normal 11px Arial, Helvetica, sans-serif;" value="<%=in %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=in %>"   id="check<%=in %>"  /></td>
						<td><input type="text" name="clname<%=in %>"   id="clname<%=in %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%in++;}
							%></tbody>
						</table>
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=in %>"/>
						<input type="hidden" name="reportno" id="reportno" value="<%=reportno%>">
						<input type="hidden" id="tableheaders" name="tableheaders">
						<input type="hidden" id="tableheaderslength" name="tableheaderslength">
						<input type="hidden" id="call" name="call" value="SetCustom">
						<input type="hidden" id="setDefFlag" name="setDefFlag" value="true">
						<%-- <input type="hidden" name="pagename" id="pagename" value="<%=PageName%>"> --%>
						
				</div>
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


	
<%@ include file="footernew1.jsp" %>

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
								title: 'Driver Master Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Driver Master Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Driver Master Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Driver Master Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Driver Master Report',
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

 	
<%-- <iframe id="myIframe" width="100%" height="850px" src="http:///birttest/frameset?__report=DriverEntry_report.rptdesign&Trans=<%=usertypevalue%>&Typeofuser=<%=typeofuser%>&__showtitle=false"> 
<iframe id="myIframe" width="100%" height="850px" src="http://aps.mobileeye.in:8181/birttest/frameset?__report=DriverEntry_report.rptdesign&Trans=<%=usertypevalue%>&Typeofuser=<%=typeofuser%>&__showtitle=false">
 <iframe id="myIframe" width="100%" height="850px" src=""> --> 
</iframe>  --%>
</div>
<%--  	</jsp:useBean>
 --%> 
<%--  <%@ include file="footernew.jsp" %>	 --%>