<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="headernew1.jsp" %>
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
	$(window).on('load', function () {
		if (feather) {
			feather.replace({
				width: 14,
				height: 14
			});
		}
	})
</script>

</head>
<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">
<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>



<%!
	Connection conn;
	Statement st, st1,st2,st3;
	String sql,qd,sql1,sql2,location,locationcode,vehlist;
	int ds;
	double Lat1,Lat2,Lon1, Lon2;
%>
<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper container-xxl p-0">
			<div class="content-header row">
				<div class="content-header-left col-md-7 col-12 mb-2">
					<div class="row breadcrumbs-top">
						<div class="col-12">
							<h3 class="content-header-title  mb-0">Select Location</h3>
						</div>
					</div>
				</div>
				<div
					class="content-header-right text-md-end col-md-5 col-12 d-md-block d-none">
					<div class="mb-1 breadcrumb-right">
						<div class="demo-inline-spacing mb-1">
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
	<%
						java.util.Date NewDate=new java.util.Date();
						long dateMillis = NewDate.getTime();
						long dayInMillis = 1000 * 60 * 60 *24;
						dateMillis = dateMillis - dayInMillis;
						NewDate.setTime(dateMillis);
						Format NewFormatter = new SimpleDateFormat("yyyy-MM-dd");
						String data1 = NewFormatter.format(NewDate);
						try
						{
						Class.forName(MM_dbConn_DRIVER);
						conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
						st=conn.createStatement();
						st1=conn.createStatement();
						st2=conn.createStatement();
						%>
                 <div class="content-body">
                 <section id="">
                    <div class="row col-12" style="--bs-gutter-x:0px">
                            <div class="card" style="height: 400px;">
                                <div class="col-md-9">
							
                                <div class="card-header">
                                    <h4 class="card-title">Please select the location to show the journey details.
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <form class="form form-horizontal" action="sellocation.jsp" method="get">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="mb-1 row">
                                                    <div class="col-sm-2">
                                                        <%
													sql="select distinct(wareHouse),wareHouseCode from t_warehousedata where Owner='"+session.getAttribute("user").toString()+"' and WareHouse <>'-'  order by WareHouse asc";
													//out.print(sql);
													//sql="select distinct(MainLocationCode) as wareHouseCode, MainLocationName as WareHouse from t_masterlocation where OwnerName='"+session.getAttribute("usertypevaluemain").toString()+"' order by WareHouse";
													ResultSet rst=st.executeQuery(sql);
													%>
													<select name="location" class="form-select">
													<%
													int i=0;
													while(rst.next())
													{
													i++;
													%>
													<option value="<%=rst.getString("WareHouseCode")%>,<%=rst.getString("WareHouse")%>"><%=rst.getString("WareHouse")%></option>
													<%
													
													}
													%>
													</select>
													<%
													if(i == 0)
													{
														out.print("<br><font color='red' size='2'>No Location Geo-Fenced !!</font>");
													}
													
													%>
                                                    </div>
                                                    <div class="col-sm-2">
                                                    <input type="submit" name="submit" class="btn btn-primary" value="Submit" class="formElement">
                                                    </div>
                                             
                                            </div>
                                       		</div>                                      
                                       </div>
                                    </form>
                                    
                                    <%

									}catch(Exception e)
									{
										out.print("Exception "+e);
									}
									finally
									{
										conn.close();
									}
									%>
                                </div>
                                
                            </div>
                        </div>
                       
                    </div>
                </section>
            
                
            </div>
        </div>
    </div>
    <!-- END: Content-->
     <!-- Included new footer file -->
<%@ include file="footernew1.jsp"%>
<!-- Included new footer file -->
</body>
<!-- END: Body-->

</html>
