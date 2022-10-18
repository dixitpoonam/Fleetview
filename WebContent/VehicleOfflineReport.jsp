<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="headernew1.jsp"%>
    
    <%@ page language="java" 
	import=" java.text.*"  errorPage=""%>   <!-- import="moreservlets.listeners.*"  -->
	
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
		System.out.println("on load");
		
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


String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

String dt1time=""+dt1+" 23:59:59";


System.out.println("Query pass date params:  from:"+dt+" to: "+dt1);

	
System.out.println("Query pass date time  params:  from:"+dttime+" to: "+dt1time);

%>
<body>
   <div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Vehicle Offline Report From <%=datex1 %>
							To <%=datex2 %> Of <%=username %></h3>
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

                                  <!--  Form Comes Here -->
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
  String btn = request.getParameter("button");
  System.out.println("button:"+btn);
  %>
  <!-- Table  app content div-->
<div class="content-body">
			<!-- Basic table -->
			<section id="">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<table id="example1" class="table table-bordered">
                            
                            <%
Connection conn=null;
Statement st=null, st1=null,st2=null;
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
	
}
catch(Exception e)
{
	
}
	
%> 

<thead>
		<tr>

			<th width="4%" align="center">Sr No</th>
			
            	<th align="center">Vehicle</th>
            	
                <th align="center">Transporter</th>
                <th align="center">Alert Status</th>
                <th align="center">Alert Date</th>
                
                <th align="center">User</th>
                <th align="center">User Mobile</th>
                <th align="center">User Location</th>
                <th align="center">User EMail</th>
                <th align="center">Manager</th>
                                <th align="center">Manager MobNo</th>
                
               
                <th align="center">RSM</th>
                <th align="center">RSM MobNo</th>
               
                

		</tr>
	</thead>
	<tbody>

		<%
 

		PreparedStatement ps = null;
		String Location="";

		String vehList=session.getAttribute("VehList").toString();
		System.out.println("vehicle list:"+vehList);
		  ResultSet rs5 = null;

	      String sql12="select H.VehCode,D.VehicleRegNumber as VehicleRegNo, H.VehIdleAlertStatus as AlertStatus, DATE_FORMAT(H.updatedDateTime,'%d/%m/%Y') as UpdatedDateTime from db_gps.t_VehicleIdleAlertHistory H, db_gps.t_vehicledetails D where H.VehCode in "+vehList+" and H.updatedDateTime>='"+dt+" 00:00:00' and H.updatedDateTime<='"+dt1+" 23:59:59' and H.VehCode=D.VehicleCode order by H.updatedDateTime,H.VehIdleAlertStatus ";
		  System.out.println("Query is : "+sql12);
		  ps = conn.prepareStatement(sql12);
		  rs5 = ps.executeQuery();
	      int i=1;

		  String vehid="",AlertStatus="",UpdatedDateTime="";

while(rs5.next())
{
	  vehid=rs5.getString("VehCode");
	  System.out.println("vehid is : "+vehid);

	  AlertStatus=rs5.getString("AlertStatus");
	  if(AlertStatus.equals("-"))
	  {
		  AlertStatus="Online";
	  }
	  System.out.println("AlertStatus is : "+AlertStatus);

	  UpdatedDateTime=rs5.getString("UpdatedDateTime");
	  System.out.println("UpdatedDateTime is : "+UpdatedDateTime);

	  
	
//String sql="select vehiclecode,vehicleregnumber,ownername,concat(b.firstname,b.lastname) as User,concat(c.firstname,c.lastname) as Manager,concat(d.firstname,d.lastname) as RSM from db_gps.t_vehicledetails a left join db_gps.t_userdetails b on a.vehiclecode=b.vehid  left join db_gps.t_userdetails c on b.hodid=c.srno left join db_gps.t_userdetails d on c.hodid=d.srno where status='-' and vehiclecode in "+vehList+" order by ownername asc";
String sql="select b.vehid,vehiclecode,vehicleregnumber,ownername,b.SrNo,b.location,b.UserName as User,concat(b.firstname,b.lastname) as UserName,b.MobNo,b.Email,c.vehid,c.UserName as Manager,c.SrNo,concat(c.firstname,c.lastname) as ManagerName,c.MobNo,c.Email,d.UserName as RSM,d.vehid,d.SrNo,concat(d.firstname,d.lastname) as RSMName,d.MobNo,d.Email from db_gps.t_vehicledetails a left join db_gps.t_userdetails b on a.vehiclecode=b.vehid  left join db_gps.t_userdetails c on b.hodid=c.srno left join db_gps.t_userdetails d on c.hodid=d.srno where status='-' and vehiclecode= '"+vehid+"' order by ownername asc";
System.out.println("Query is : "+sql);
ps = conn.prepareStatement(sql);
ResultSet rs4 = ps.executeQuery();

if(rs4.next()){
	   
	  String vehicleregnumber=rs4.getString("vehicleregnumber");
	  if(vehicleregnumber==null)
	  {
		  vehicleregnumber="-";
	  }
 	String ownername=rs4.getString("ownername");
 	if(ownername==null)
 	{
 		ownername="-";
 	}
 	String User=rs4.getString("User");
 	if(User==null)
 	{
 		User="-";
 				
 	}
 	String UserName=rs4.getString("UserName");
 	if(UserName==null)
 	{
 		UserName="-";
 				
 	}
 	String UserMobNo=rs4.getString("b.MobNo");
 	if(UserMobNo==null)
 	{
 		UserMobNo="-";
 				
 	}
 	String UserEmail=rs4.getString("b.Email");
 	if(UserEmail==null)
 	{
 		UserEmail="-";
 				
 	}
 	
 	String Manager=rs4.getString("Manager");
 	if(Manager==null)
 	{
 		Manager="-";
 	}
 	String ManagerName=rs4.getString("ManagerName");
 	if(ManagerName==null)
 	{
 		ManagerName="-";
 				
 	}
 	String ManagerMobNo=rs4.getString("c.MobNo");
 	if(ManagerMobNo==null)
 	{
 		ManagerMobNo="-";
 				
 	}
 	String ManagerEmail=rs4.getString("c.Email");
 	if(ManagerEmail==null)
 	{
 		ManagerEmail="-";
 				
 	}
 	  
 	String RSM=rs4.getString("RSM");
 	if(RSM==null)
 	{
 		RSM="-";
 	}
 	String RSMName=rs4.getString("RSMName");
 	if(RSMName==null)
 	{
 		RSMName="-";
 				
 	}
 	String RSMMobNo=rs4.getString("d.MobNo");
 	if(RSMMobNo==null)
 	{
 		RSMMobNo="-";
 				
 	}
 	String RSMEmail=rs4.getString("d.Email");
 	if(RSMEmail==null)
 	{
 		RSMEmail="-";
 				
 	}
 	Location=rs4.getString("b.location");
 	if(Location==null)
 	{
 		Location="-";
 				
 	}

%>   	
		<tr>		          
		<td align="right"><%=i %></td>
		<td align="left"><%=vehicleregnumber %></td>
		                <td align="left"><%=ownername %></td>
		
					<td align="left"><%=AlertStatus %></td>
		
					<td align="left"><%=UpdatedDateTime %></td>
		
		<td align="left"><%=UserName %></td>
          
         
         <td align="left"><%=UserMobNo %></td>
         <td align="left"><%=Location %></td>
         <td align="left"><%=UserEmail %></td>
         <td align="left"><%=Manager %></td>
         
         
         	<td align="left"><%=ManagerMobNo %></td>
			<td align="left"><%=RSM %></td>
			
         
         <td align="left"><%=RSMMobNo %></td>
         
         
     </tr>
        
        
           <%
}
i++;            

}
       %>
      
	<tfoot>
		<tr>
			
			<th width="4%" align="center">Sr No</th>
			
            	<th align="center">Vehicle</th>
            	
                <th align="center">Transporter</th>
                <th align="center">Alert Status</th>
                <th align="center">Alert Date</th>
                
                <th align="center">User</th>
                <th align="center">User Mobile</th>
                <th align="center">User Location</th>
                <th align="center">User EMail</th>
                <th align="center">Manager</th>
                                <th align="center">Manager MobNo</th>
                
               
                <th align="center">RSM</th>
                <th align="center">RSM MobNo</th>
                
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
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'New Report Template',
                                exportOptions: { columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] }
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

            /* dt_basic.columns([8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26,27,28,29,30,31,32,33,34]).visible(false) ,*/

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


        /* $("#detailedView").on("click", function () {

            dt_basic.columns([8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26,27,28,29,30,31,32,33,34]).visible(true),

                $('#example1').addClass('table-responsive');

        }); */


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

	
	
	
    