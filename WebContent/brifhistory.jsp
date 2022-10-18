<%@ include file="headernew1.jsp" %>
<%!
Connection con1, con2;
String driveridjsp="";

%>
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
		alert("flag is false..");
		
		ajaxRequest = new XMLHttpRequest();
		
		
		var ajaxRequest;
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				
			} 
		};
		alert("in ajax call.."+(nodes.length/2));
				
		ajaxRequest.open("GET", "ReSet.jsp?call=SetDefault&reportno="+<%=reportno%>+"&tableheaders="+list+"&tableheaderslength="+(nodes.length/2), true);
		ajaxRequest.send(); 
		}
	}
</script>  
    
<body onload="ondemand()">
<% 
int colcount=0;   //special code for detailed view
String setSequence ="";
String detailViewSequence = "",ColumnList="";
boolean setDefFlag=false;

 try { 

 Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();
ResultSet rs2=null;
String sql2="";
String msg = (String)request.getParameter("msg");
String briefid = (String)request.getParameter("briefId");

%>
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left mb-1 col-md-3 col-12">
				<div class="row breadcrumbs-top">
					
					<div class="col-12">
						<h2 class="content-header-title  mb-0">Driver History</h2>
					</div>
				</div>
			</div>
			<div class="content-header-right text-md-end col-md-9 col-12 d-md-block d-none">
				<div class="mb-1 breadcrumb-right">
					<div class="demo-inline-spacing mb-1" >
						<!-- <a href="#" class="engage-purchase-link btn  btn-success h-35px  btn-color-gray-700 btn-active-color-gray-900  shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#myModal">#code</a> -->
	
		<button id="detailedView" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" >
			Detailed View</button>
			
			
		<button id="SetCustom" class="engage-help-toggle btn  btn-primary h-35px  btn-color-gray-700 btn-active-color-gray-900 shadow-sm rounded-top-0" data-bs-toggle="modal" data-bs-target="#SetCustomModal">
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
	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}	
	else
	{ %>
		<table border="0" width="100%" class="stats">
			<tr>
				<td align="center"> <font color="maroon"> Successfully Saved</font> 
                                <font color="maroon"> And the brief Id is : <%= briefid %> </font> </td>
			</tr>
 		</table>
<%	}
%>	

<form name="formreport" id="formreport" method="get">
				    <div class="row col-12">
				    <div class="col-md-4"></div>
				    <div class="col-md-2">
				    <label for="search">Search:</label>
				    	<div class="input-group input-group-merge">
		                     <input type="text" id="srchbx" class="form-control" name="srchbx" />
		               </div>
		            </div>
		
					<div class="col-md-2">
						<button type="submit" class="btn btn-primary" style="margin-top: 20px;" name="btnSearch" value="Submit">Submit</button>
					</div>
				    </div>
				    <br>
				    <div class="row col-12">
				        <div>
		                    <p style="color:black"> Please enter Driver Name or Driver Id. Matching values would come below in the table automatically.</p>
		                </div>
				    </div>
			</form>
			<%
			if(request.getQueryString()!=null)
			{
			System.out.println("\n\n in submit button");
			try {
			Class.forName(MM_dbConn_DRIVER);
			con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
			 
			 Statement st20= con1.createStatement();
			 Statement st21= con1.createStatement();
			
			 ResultSet rs1=null;
			String sql1="";
			sql2 ="";
			String srchval=request.getParameter("srchbx");
			System.out.println("\n\n driver"+srchval);
			srchval = srchval.replace(" ", "");
			int i=1;
			String drivname="", driverid="", trans="";
			String briefId = "";

			//sql1="select * from t_drivers where Owner in(select distinct(VehRegNo) from t_group where GPName='Castrol') and (DriverName like '"+srchval+"%' or DriverID like '"+srchval+"%' )  order by  DriverName asc";
			//sql1="select * from t_drivers where Owner in(select distinct(VehRegNo) from t_group where GPName='Castrol') and (DriverName like 'ram pra%' or DriverID like '"+srchval+"%' )  order by  DriverName asc";
			//sql1="select *  from t_drivers where Owner in(select distinct(VehRegNo) from t_group where GPName='Castrol') and (replace(driverName,' ','' ) like '%"+srchval+"%' or DriverID like '%"+srchval+"%') order by  DriverName asc";
			if(session.getValue("usertypevaluemain").toString().equals("Castrol"))
			{
			//sql1="select *  from t_drivers where Owner in(select distinct(VehRegNo) from t_group where GPName='Castrol') and (replace(driverName,' ','' ) like '%"+srchval+"%' or DriverID like '%"+srchval+"%') and GPNAME<>'BS' order by  DriverName asc";
			sql1="select a.* from db_gps.t_drivers a inner JOIN (select distinct(VehRegNo) ownername from db_gps.t_group where GPName='Castrol') b  ON a.Owner = b.ownername and (replace(a.driverName,' ','') like '%"+srchval+"%' or a.DriverID like '%"+srchval+"%') and a.GPNAME<>'BS'  order by a.DriverName";
			}
			else
				if(session.getValue("usertypevaluemain").toString().equals("BS"))
				{
				sql1="select *  from t_drivers where GPName='BS' and (replace(driverName,' ','' ) like '%"+srchval+"%' or DriverID like '%"+srchval+"%') order by  DriverName asc";
				}	
				else
					if(session.getValue("usertypevaluemain").toString().equals("ALL"))
					{
					sql1="select *  from t_drivers where Owner in(select distinct(VehRegNo) from t_group where GPName='BS' or GPName='Castrol') and (replace(driverName,' ','' ) like '%"+srchval+"%' or DriverID like '%"+srchval+"%') and (GPNAME='BS' or GPName='Castrol') order by  DriverName asc";
					}
					else
					{
					sql1="select *  from t_drivers where Owner='"+session.getValue("usertypevaluemain").toString()+"' and (replace(driverName,' ','' ) like '%"+srchval+"%' or DriverID like '%"+srchval+"%') order by  DriverName asc";
					}
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
							<th> Sr.No.</th> 
							<th> Driver Name</th> 
							<th> Driver Id </th> 
							<th> Transporter </th> 
							</tr>
							</thead>
							<tbody>
<%
			System.out.println(sql1);
			rs1=stmt1.executeQuery(sql1);
			while(rs1.next()){
			    //System.out.println("in while");
				drivname=rs1.getString("DriverName");
				driverid=rs1.getString("DriverID");
				//trans=rs3.getString("Owner");
				trans="-";
				sql2="select * from t_startedjourney where DriverCode='"+driverid+"' order by StartDate Desc limit 1";
				 rs2=stmt2.executeQuery(sql2);
				if(rs2.next())
				{
					trans=rs2.getString("OwnerName");
				}
			//System.out.println(driverid+"in while"+drivname);
			%>
			<input type="hidden" name="drivid"<%=i %> id="drivid"<%=i %> value=<%=driverid%>></input>
			<input type="hidden" name="drvrname"<%=i %> id="drvrname"<%=i %> value=<%=drivname%>></input>
					
				<tr> <td  style="text-align:right"><%=i %></td> 
			  <%      
				
			      /*  sql2 = "select * from t_driverbriefingquest where DriverId ="+driverid+"  ";
			        ResultSet rs2=stmt2.executeQuery(sql2);
			        if(rs2.next()){
			            briefId = rs2.getString("SrNo");
			        
			        }
			        */
			        //checkc this ok..
			        //out.print(i+"</td> <td> <a href='driverbriefhistory.jsp?briefId="+briefId+"&driverid="+driverid+"&drivername="+drivname+"&trans="+trans+"'> "+drivname+"</a> </td> <td>"+driverid+"</td> <td>"+trans+"</td> </tr>");
			       %>
			        
			       <td  style="text-align:left"> <a href="driverbriefhistory.jsp?driverid=<%=driverid%>&drivername=<%=drivname%>&trans=<%=trans%>"> <%=drivname%></a> </td>
			       <td  style="text-align:right"><%=driverid%></td> 
			       <td  style="text-align:left"><%=trans%></td> 
			       </tr>
				<%
				i++;
				}%></tbody>
				<tfoot>
 <tr> 
 <th> Sr.No.</th> 
 <th> Driver Name</th> 
 <th> Driver Id </th> 
 <th> Transporter </th> 
 </tr>
 </tfoot>
 </table><%
 } catch(Exception e) { }
finally
{
  con1.close();
}
			}	
		} catch(Exception e) { }
		finally
		{
		con1.close();
		}
%>
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
						<h4 class="modal-title">Driver History</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
			<%
			int kk=0; 
			 
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
							<div align="left"><input type="text" id="net_id1<%=kk %>" name="net_id1<%=kk %>" style="width:70px;padding: 4px 5px 2px 5px;
							border:none; text-align:right;		font: normal 11px Arial, Helvetica, sans-serif; " value="<%=kk %>" readonly/>                  
						</div>
						<input type="checkbox" name="check<%=kk %>"   id="check<%=kk %>"  /></td>
						<td><input type="text" name="clname<%=kk %>"   id="clname<%=kk %>"  value="<%=stcol.nextToken()%>" readonly="readonly" style="border:none" /></td>
							</tr>
							<%kk++;}%></tbody>
						</table>
						
						<input type="hidden" name="checkedNumber" id="checkedNumber" value="<%=kk %>"/>
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
								title: 'Driver History',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'csv',
                                text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
                                className: 'dropdown-item',
								title: 'Driver History',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'excel',
                                text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
                                className: 'dropdown-item',
								title: 'Driver History',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'pdf',
                                text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
                                className: 'dropdown-item',
								title: 'Driver History',
                                exportOptions: { columns: [<%=setSequence%>] }
                            },
                            {
                                extend: 'copy',
                                text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
                                className: 'dropdown-item',
								title: 'Driver History',
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