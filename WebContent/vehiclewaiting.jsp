
<%@ include file="headernew1.jsp" %>
  <%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%> 
<%
	//fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>
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

<script>
 list=""
	 nodes=[];

	 	function ondemand(){
	 	//	alert("in method...")
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
  };

function callfun()
{
	var aa=document.vehwaiting.waithrs.value;
	if(!(aa=="SELECT"))
	{	
		
		document.vehwaiting.submit();
		document.vehwaiting.waithrs.selected=aa;
		//document.getElementById("VehWaiting").value = aa;  //new code for setting changed value in set custom
	}
	else{
		//alert("Please select a value");
	}
}

 function myclick(val)
{
	if(val=="default")	
	{
		//out.println("in myclick");
		var wait="4hrs";
		document.vehwaiting.waithrs.value=wait;
		//alert(document.vehwaiting.waithrs.value);
		//alert("waithrs value="+ document.vehwaiting.waithrs.value);
		
	}
}
</script>
</head>
<!-- <body onload="myclick('default')"> -->
<body onload="ondemand()">
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-7 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h3 class="content-header-title  mb-0">Vehicle Waiting Report</h3>
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
		
<%
//out.println("dropdown");
String waithrs=request.getParameter("waithrs");
%>
<form name="vehwaiting" action="" method="get">
<div class="row col-12">
	<div class="col-md-4"></div>
					<div class="col-md-2">
		<label for="WaitHours">Wait Hrs:</label>
						<div class="input-group input-group-merge">
		<select class="form-select" name="waithrs" id ="waithrs" onchange="callfun();" >
			<!--<option value="SELECT" < %if(waithrs.equalsIgnoreCase("SELECT")){ %> selected < %} %>>SELECT</option>-->
		    <option value="2hrs" <%if(waithrs.equalsIgnoreCase("2hrs")){ %> selected <%} %>> 2 hrs </option>
		    <option value="4hrs" <%if(waithrs.equalsIgnoreCase("4hrs")){ %> selected <%} %>>4 hrs</option>
			<option value="8hrs" <%if(waithrs.equalsIgnoreCase("8hrs")){ %> selected <%} %>> 8 hrs</option>
			<option value="12hrs" <%if(waithrs.equalsIgnoreCase("12hrs")){ %> selected <%} %>>12 hrs</option>
			<option value="16hrs" <%if(waithrs.equalsIgnoreCase("16hrs")){ %> selected <%} %>>16 hrs</option>
			<option value="18hrs" <%if(waithrs.equalsIgnoreCase("18hrs")){ %> selected <%} %>>18 hrs</option>
			<option value="22hrs" <%if(waithrs.equalsIgnoreCase("22hrs")){ %> selected <%} %>>22 hrs</option>
			<option value="24hrs" <%if(waithrs.equalsIgnoreCase("24hrs")){ %> selected <%} %>>Greater than 24 hrs</option>
		 </select>
		</div>
		</div>
		<% 
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..");
		waithrs=request.getParameter("waithrs");
		System.out.println(">>>>>>>>>>>>>>>>>>>"+waithrs+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..");
		%>
	
<%-- <a href="#" onclick="javascript:window.open('printvehiclewaiting.jsp?waithrs=<%=waithrs%>');" title="Print Report">
<img src="images/print.jpg" width="15px" height="15px">
</a>&nbsp; &nbsp; 
<a href="excelvehiclewaiting.jsp?waithrs=<%=waithrs%>"  title="Export to Excel">
<img src="images/excel.jpg" width="15px" height="15px">
</a>
<%=fleetview.PrintDate() %> --%>
</div>
</form>
<br>
<%!
Connection conn;
Statement st,st1,st2,st3,st20,st21;
String sql,sql1,vehlist,thedate;
String dist,dist1;

int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;
%>
<%
try
{		
	
		//out.println("in code");
		java.util.Date today=new java.util.Date();
		//long milisecond=today.getTime();
		//milisecond=milisecond-1000*60*60*24;
		//today.setTime(milisecond);
		thedate=new SimpleDateFormat("yyyy-MM-dd").format(today);
		//out.print(thedate);
		vehlist=session.getAttribute("VehList").toString();
		//out.print(vehlist);
		//conn = fleetview.ReturnConnection();
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		st1=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st20=conn.createStatement();
		st21=conn.createStatement();
		%>
<%


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
		<th>Vehicle.</th>
		<th>Transporter</th>
		<th>Updated</th>
		<th>FromDate</th>
		<th>Todate</th>
		<th>Waiting (HH:mm)</th>
		<th>Location</th>
		</tr>
		</thead>
		<tbody>		
		<%
		sql="select VehicleCode,VehicleRegNo,LatitudePosition,LongitudePosition,Location,TheDate,TheTime,TheDistance,Transporter from t_onlinedata where VehicleCode in "+vehlist+" and TheDate ='"+thedate+"' and TheSpeed=0 order by TheDate desc,TheTime desc";
		System.out.println("sql--->"+sql);
		ResultSet rst=st.executeQuery(sql);
		String loc="";
		String date3="",time3=""	;
		int j=1,x=1;
		java.util.Date date33=null;
		while(rst.next())
		{
			String transporter=rst.getString("Transporter");
			String vehregno=rst.getString("VehicleRegNo");
			String latpos=rst.getString("LatitudePosition");
			String longpos=rst.getString("LongitudePosition");
			loc=rst.getString("Location");
			date33=rst.getDate("TheDate"); 
			date3=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TheDate"));
			time3=rst.getString("TheTime");
			String DateTime=date33+" "+time3;
			System.out.println("DateTime======>"+DateTime);
			
			String vehcode=rst.getString("VehicleCode");
			java.util.Date date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DateTime);


				String waitdate="",fielddate="",fielddatetime="",todate="";
				sql="Select thefielddatadate,thefielddatatime,TheFieldSubject,Thefielddatadatetime,Distance,((ACOS(SIN(" +rst.getDouble("LatitudePosition")+ " * PI() / 180) * SIN(latindec * PI() / 180) + COS(" +rst.getDouble("LatitudePosition")+ " * PI() / 180) * COS(latindec * PI() / 180) * COS((" +rst.getDouble("LongitudePosition")+ " - longindec) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance1  from t_veh" + vehcode+ "  where TheFieldDataDateTime<='"+date33+ " "+time3+"'  and  TheFiledTextFileName in ('SI','OF','ON')  and ((ACOS(SIN("+rst.getDouble("LatitudePosition")+" * PI() / 180) * SIN(latindec * PI() / 180) + COS("+rst.getDouble("LatitudePosition")+ " * PI() / 180) * COS(latindec * PI() / 180) * COS(("+rst.getDouble("LongitudePosition")+" - longindec) * PI() / 180)) * 180 / PI()) * 60 * 1.1515)>0.5 order by thefielddatadate desc,thefielddatatime desc limit 1 ";
				
               
				ResultSet rst1=st1.executeQuery(sql);
				System.out.println("sql======>"+sql);
				if(rst1.next())
				{
					dist=rst1.getString("Distance");
					System.out.print("dist===>"+dist);
					System.out.println("Date TIme  New "+rst1.getString("TheFieldDataDateTime"));
					
					fielddate=rst1.getString("TheFieldDataDate")+" "+rst1.getString("TheFieldDataTime");
					
					//waitdate=rst1.getString("TheFieldDataDateTime");
					System.out.println("Updates date >>>>>>>>>>>>>>>"+date1);

					//sql="select Distance, TheFieldDataDateTime as date2,TheFieldDataDate,TheFieldDataTime from t_veh"+vehcode+" where TheFieldDataDateTime<='"+date33+ " "+time3+"' and TheFiledTextFileName='SI' and Distance="+dist+"  and  TheFieldDataDate>= DATE_SUB(CURDATE(),INTERVAL 30 DAY) order by TheFieldDataDate Asc,TheFieldDataTime Asc limit 1";
					//sql="select Distance, TheFieldDataDateTime,TheFieldDataDate,TheFieldDataTime from t_veh"+vehcode+" where TheFieldDataDateTime<='"+waitdate+"' and TheFiledTextFileName in('SI','ON','OF') and ("+dist+"> Distance)  order by TheFieldDataDate desc,TheFieldDataTime desc limit 1";
					sql="select Distance, TheFieldDataDateTime ,TheFieldDataDate,TheFieldDataTime,latindec,longindec from t_veh"+vehcode+" where TheFieldDataDateTime>'"+fielddate+"' and TheFiledTextFileName in('SI','ON','OF') order by TheFieldDataDate asc,TheFieldDataTime asc limit 1";
					System.out.println("sql1=====>"+sql);
					ResultSet rst2=st2.executeQuery(sql);
				//out.print("SQL2::"+sql);
			if(rst2.next())
			{
				fielddatetime=rst2.getString("TheFieldDataDate")+" "+rst2.getString("TheFieldDataTime");
				
				System.out.println("Date1:::"+fielddatetime);				
				
				java.util.Date date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(fielddatetime);
				
				System.out.println("Date2:::"+date2);
				
				 todate=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(date2);
				 System.out.println("todate:::"+date1);			
				 
				System.out.println("todate:::"+date2);			
				
				long mils=date1.getTime()-date2.getTime();
				System.out.println("Time after sub:::"+mils+"<br>");
				mils=mils/(1000*60);	
				
				
				//System.out.println("Time:::"+mils+"<br>");
			
		// ****************************Modfications Done************************ -->
		//****************************Each of the fields printed on the page are first taken in variables********************
		int hr=240;
		//String waithrs= "4hrs";
			
		
		{
			System.out.println("waithrs--->"+waithrs);
			if(waithrs.equalsIgnoreCase("2hrs"))
				hr=120;
			else if(waithrs.equalsIgnoreCase("4hrs"))
				hr=240;
			else if(waithrs.equalsIgnoreCase("8hrs"))
				hr=480;
			else if(waithrs.equalsIgnoreCase("12hrs"))
				hr=720;
			else if(waithrs.equalsIgnoreCase("16hrs"))
				hr=960;
			else if(waithrs.equalsIgnoreCase("18hrs"))
				hr=1200;
			else if(waithrs.equalsIgnoreCase("22hrs"))
				hr=1440;
			else if(waithrs.equalsIgnoreCase("24hrs"))
				hr=1680;
		}
		System.out.println("Time :::"+mils+"-----hr"+hr);
		if(mils>hr)
			 {
				 %>
				 <tr>
					<td style="text-align: right"><%=x%></td>
					<%
				
					long mils1=mils/60;
					long mils2=mils%60;
					%>
					
					<td><div align="left"><%=vehregno%></div></td>
					<td><div align="left"><%=transporter%></div></td>
					<td style="text-align: left"><%=date3%> <%=time3%></td>
					<td style="text-align: left"><%=todate%></td>
					<td style="text-align: left"><%=date3%> <%=time3%></td>
					<td><div align="right">
					<%
					
					out.print(mils1+":"+mils2);
					
					%>
					</div>
					</td>
					<td>
					<div align="left"><a href="shownewmap.jsp?lat=<%=latpos%>&long=<%=longpos%>&discription=<%=loc%>" onclick="popWin=open('shownewmap.jsp?lat=<%=latpos%>&long=<%=longpos%>&discription=<%=loc%>', 'myWin','width=500, height=500'); popWin.focus(); return false">&nbsp;&nbsp;<%=loc %></a>
					<%-- <%=fleetview.showNewMap(latpos,longpos,loc) %> --%>
					</div></td>		
					</tr>	
					<!-- ***************End of the Modifications done********************************* -->
					<%	
				
				x++;
				//milsort=milsort+mils+',';
			 }	
			}
		}		
				
				
	
		
		j++;
		}
				%>
			</tbody>
				<tfoot>
		<tr>
		<th>Sr.</th>
		<th>Vehicle.</th>
		<th>Transporter</th>
		<th>Updated</th>
		<th>FromDate</th>
		<th>Todate</th>
		<th>Waiting (HH:mm)</th>
		<th>Location</th>
		</tr></tfoot>
			</table>
			</div>
			</div>
			</div>
			</section>
			</div>
			</div>
			</div>
			
				
		<%

}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	try
	{
	conn.close();
	}
	catch(Exception e){}
	
	try
	{
		//fleetview.closeConnection();
	}
	catch(Exception e){}
}

%>


<div class="modal" id="SetCustomModal">
<div class="modal-dialog" >
        <div class="modal-content">
        
				<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Custom Column Selection for Vehicle Waiting Report</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int i=0; 
			//String showList="Sr.,Vehicle.,Transporter,Updated,FromDate,Todate,Waiting (HH:mm),Location"; 
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
						<input type="hidden" name="paramflag" id="paramflag" value="true">
						<input type="hidden" name="parameters" id="parameters" value="<%=request.getQueryString()%>">
						
				
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

</body>
</html>
<!--New Script code added For table Start -->

<script>
    $(function () {
        $(document).ready(function () {
            dt_basic = $('#example1').DataTable({
               /*  order: [[2, 'desc']], */
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
								title: 'Vehicle Waiting Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Vehicle Waiting Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Vehicle Waiting Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Vehicle Waiting Report',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Vehicle Waiting Report',
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
</html>

	<%-- </jsp:useBean> --%>
	






