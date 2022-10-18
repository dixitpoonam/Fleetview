<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>
    <%@include file="Connections/conn.jsp" %>



<%@page import="java.util.Date"%>


<%
		
 		System.out.println("--------------in ReSet---------------");
		int k=0;
 		String comm="";
 		String Query="",call="";
 		String checkedlist="";  //for recording the checked column numbers
 		
		StringBuffer buffer=new StringBuffer(","); 
		int j=0;
		
		String outputList="",inputList="",setDefFlag="";        
 		String reportNo = request.getParameter("reportno");
 		String pagename= "";
 		/* String pageName = request.getParameter("pagename"); */
 		/* setDefFlag=request.getParameter("setDefFlag");
 		
 		System.out.println("setDefFlag  :-"+setDefFlag); */ 
 		
 		
 		call= request.getParameter("call");
 
 		System.out.println("Report No:-"+reportNo);
 		
 		String tableheaders = request.getParameter("tableheaders");
 		String tableheaderslength="";
 		if(call.equalsIgnoreCase("SetDefault"))
 		{
 		 tableheaderslength= request.getParameter("tableheaderslength");
 		}else{
 			tableheaderslength=request.getParameter("checkedNumber").toString();
 		}
 		System.out.println("tableheaders:-"+tableheaders);
 		System.out.println("tableheaderslength:-"+tableheaderslength);
 		System.out.println("call from:-"+call);
 		//System.out.println("call from:-"+pageName); 
 		int t=0;
 		if(call.equalsIgnoreCase("SetDefault"))
 		{
 			
 			while(t < Integer.parseInt(tableheaderslength)){
 				if(t==0){
 					comm = comm + t;
 				}
 				else{
 				comm = comm +","+t ;
 				}
 				t++;
 			}
 			System.out.println("Set Default:"+comm);
 			
 			
 			
 		}else{
 		
 		int len=Integer.parseInt(request.getParameter("checkedNumber").toString());
 		System.out.println("len::"+len);
 		
 		
 		while( j!=(Integer.parseInt(request.getParameter("checkedNumber").toString())))
 		{
 		if(request.getParameter("check"+j)!=null)
 		buffer.append(j+",");
 		
 		String s=request.getParameter("check"+j);
 		System.out.println("s::"+s);

 			j++;
 		}
 		
 		System.out.println("buffer::"+buffer);
 		
 		for(int h=0;h <= len;h++)
 		{


 		if(buffer.toString().contains(","+k+","))
 		{

 			String first=request.getParameter("net_id1"+k) ;
 			String cols = request.getParameter("clname"+k);
 			
 			System.out.println("first::"+first);
 			
 			comm=comm+","+first;
 			checkedlist=checkedlist+","+cols;
 		
 		}
 		k++;
 		}
 		System.out.println("omm::"+comm.substring(1));
 		System.out.println("checkedlist::"+checkedlist.substring(1));
%>

<%	//new code


ArrayList<Integer> list=new ArrayList<Integer>();
for(int i=0; i < len; i++)
{
list.add(i);
if(inputList=="")
{ inputList=""+i; }
else {
inputList = inputList+","+i;
}}
System.out.println("main list :- "+list);

System.out.println("default  list :- "+inputList);

//String inputline="1,3,5,17,16,0,38,40,42";
//String inputline="0,1,2,3,4,5,6,7,8";
//String inputline=null;

String inputline = comm;  //dynamic input from table
if(inputline!=null )
{
ArrayList<Integer> inputlist=new ArrayList<Integer>();
StringTokenizer inp=new StringTokenizer(inputline,",");
while(inp.hasMoreTokens())
{


inputlist.add(Integer.parseInt(inp.nextToken()));

}
System.out.println("inputline :- "+inputlist);


int a=0,b=0,c=0;

for(int i=0; i < list.size(); i++)
{
	//System.out.println("List "+list.get(i));
	a=list.get(i);
	
	//System.out.println("AAA "+a);
	
	for(int s=0; s < inputlist.size(); s++)  //new code changed here replace s by j
{
		b=inputlist.get(s);
		//System.out.println("BBBBB  "+b);
		if(a==b)
		{//System.out.println("BBBBB  "+b);
			a=77777;
			c=777;
			//System.out.println("INNNN "+a);
			break;
		}else {
			c=a;
			//System.out.println("output "+a);
			//break;
		}
		
		
}
if(c==777)
{
	
}else {
	
	if(outputList=="")
    { outputList=""+c; }
    else {
    outputList = outputList+","+c;
    } 
			
	
}

}
System.out.println("outputList "+outputList);
//System.out.println("INNNN "+a);

}
else {
	System.out.println("esle");
	outputList=inputList;
	
	System.out.println("outputList "+outputList);
}
 		}
 %>
 
<%
Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st = conn.createStatement();
Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();
Statement st3 = conn.createStatement();
Statement strno = conn.createStatement();

System.out.println(" TypeofUser :- "+session.getAttribute("TypeofUser").toString());
System.out.println("main user:-"+session.getAttribute("mainuser").toString());
System.out.println("main user ID:-"+session.getAttribute("UserID").toString());
System.out.println("value of usertypevaluemain in headrnew"+session.getAttribute("usertypevaluemain").toString());
System.out.println("type of user:"+session.getAttribute("TypeofUser").toString());



if(call.equalsIgnoreCase("SetDefault"))
	{
		
//check if default data is present
String setdefault1="select * from db_gps.ColumnDisplayMaster where userid='default' and reportno='"+reportNo+"'";
System.out.println("set custom query1:"+setdefault1);

ResultSet rssetdefault1=st3.executeQuery(setdefault1);
if(rssetdefault1.next())
{
	//do nothing if default data is present
}else{
	
	//insert default data
	String defaultinsert = "insert into db_gps.ColumnDisplayMaster (userid,EmailId,TypeValue,TypeOfUser,ReportNo,ColumnCount,SetSequence,DetailViewSequence,ColumnList,EntryDate) values ('default','"+session.getAttribute("mainuser").toString()+"','"+session.getAttribute("usertypevaluemain").toString()+"','"+session.getAttribute("TypeofUser").toString()+"','"+reportNo+"','"+tableheaderslength+"','"+comm+"','"+outputList+"','"+tableheaders+"',now())";
	System.out.println("insert query:"+defaultinsert);
	st2.executeUpdate(defaultinsert);
}
	
//out.println(tableheaders);
}else{
		String setdefault="select * from db_gps.ColumnDisplayMaster where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportNo+"'";

		//String setdefault="select * from db_gps.ColumnDisplayMaster where userid='123' and reportno='"+reportNo+"'";

		System.out.println("set custom query:"+setdefault);
		ResultSet rssetdefault=st.executeQuery(setdefault);
		if(rssetdefault.next())
		{
			//update current record if custom set record is present 
			String defaultupdate = "update db_gps.ColumnDisplayMaster set SetSequence='"+comm.substring(1)+"' , DetailViewSequence='"+outputList+"' where userid='"+session.getAttribute("UserID").toString()+"' and reportno='"+reportNo+"' ";
			System.out.println("update query:"+defaultupdate);
			st1.executeUpdate(defaultupdate);
		}
		else
		{
			//insert a new record if no previous custom set is present
			String defaultinsert = "insert into db_gps.ColumnDisplayMaster (userid,EmailId,TypeValue,TypeOfUser,ReportNo,ColumnCount,SetSequence,DetailViewSequence,ColumnList,EntryDate) values ('"+session.getAttribute("UserID").toString()+"','"+session.getAttribute("mainuser").toString()+"','"+session.getAttribute("usertypevaluemain").toString()+"','"+session.getAttribute("TypeofUser").toString()+"','"+reportNo+"','"+tableheaderslength+"','"+comm.substring(1)+"','"+outputList+"','"+tableheaders+"',now())";
			System.out.println("insert query:"+defaultinsert);
			st2.executeUpdate(defaultinsert);

		}
		
	}
   
    String sql = "select PageName,ReportName from db_gps.t_reportnumber where ReportNo = '"+reportNo+"'";
	System.out.println("this is the page name query :- "+sql);
	ResultSet rs = strno.executeQuery(sql);
	if(rs.next())
	{
		pagename = rs.getString("PageName");
		
	}
	
	
	/* String waithrs = request.getParameter("waithrs");
	System.out.println("wait hours:"+waithrs);
	
	if(waithrs==null || waithrs.equalsIgnoreCase("null")|| waithrs.equalsIgnoreCase("")){
	    System.out.println("waithours null condn");
		response.sendRedirect(pagename);	
	
}

else{
	response.sendRedirect(pagename+"?waithrs="+waithrs);
} */
	
	String pageflag = request.getParameter("paramflag");  //true in case of drill down/detail report only
	
	System.out.println("pageflag value:" +pageflag);
	
	if(pageflag==null){
		System.out.println("pageflag null condn");
		response.sendRedirect(pagename);
	}
	else{
		System.out.println("pageflag true condn");
		String parameters = request.getParameter("parameters");
		response.sendRedirect(pagename+"?"+parameters);
	}

    
%>
