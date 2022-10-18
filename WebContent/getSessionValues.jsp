<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println(" TypeofUser:"+session.getAttribute("TypeofUser").toString());


System.out.println("usertypevaluemain:"+session.getAttribute("usertypevaluemain").toString());

String userid=session.getAttribute("user").toString();
System.out.println("value of user in headrnew userid "+userid);

String mainusr=session.getAttribute("mainuser").toString();
System.out.println("value of mainuser in headrnew"+mainusr);

System.out.println("rfname:"+session.getAttribute("rfname"));		

String mainusr2=session.getAttribute("rlname").toString();
System.out.println("rlname:" +mainusr2);		


String mainusr3=session.getAttribute("fname").toString();
System.out.println("fname:" +mainusr3);		


String mainusr4=session.getAttribute("lname").toString();
System.out.println("lname:" +mainusr4);

System.out.println("Last Month first day: "+session.getAttribute("LastMonthFirst")); 
System.out.println("Last Month last day: "+session.getAttribute("LastMonthLast")); 
System.out.println("Today: "+session.getAttribute("Today"));
System.out.println("Yesterday: "+session.getAttribute("Yesterday")); 
System.out.println("Yesterday Date Time: "+session.getAttribute("YesterdayDateTime"));
System.out.println("A month back: "+session.getAttribute("OneMonthBack"));
System.out.println("Current month first day: "+session.getAttribute("CurrentMonthFirst"));
System.out.println("Current month last day: "+session.getAttribute("CurrentMonthLast"));
System.out.println("7 days back: "+session.getAttribute("7DaysBack"));
System.out.println("15 days back: "+session.getAttribute("15DaysBack"));
System.out.println("24 hours back: "+session.getAttribute("24hoursBack"));
System.out.println("48 hours back: "+session.getAttribute("48hoursBack"));

System.out.println("==============DD-MMM-YYYY==============================");
System.out.println("Last Month first day: "+session.getAttribute("PrevMonthFirst")); 
System.out.println("Last Month last day: "+session.getAttribute("PrevMonthLast")); 
System.out.println("Today: "+session.getAttribute("today"));
System.out.println("Yesterday: "+session.getAttribute("yesterday")); 
System.out.println("Yesterday Date Time: "+session.getAttribute("yesterdaydttime"));
System.out.println("A month back: "+session.getAttribute("onemonthback"));
System.out.println("Current month first day: "+session.getAttribute("PresentMonthFirst"));
System.out.println("Current month last day: "+session.getAttribute("PresentMonthLast"));
System.out.println("7 days back: "+session.getAttribute("7daysback"));
System.out.println("15 days back: "+session.getAttribute("15daysback"));
System.out.println("24 hours back: "+session.getAttribute("24hrsback"));
System.out.println("48 hours back: "+session.getAttribute("48hrsback"));


/* String PrevMonthFirst = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("LastMonthFirst").toString()));
System.out.println("previous month first is:"+PrevMonthFirst);

String PrevMonthLast = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("LastMonthLast").toString()));
System.out.println("previous month first is:"+PrevMonthLast);

String Today = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("Today").toString()));
System.out.println("Today is:"+Today);

String Yesterday = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("Yesterday").toString()));
System.out.println("Yesterday is:"+Yesterday);


String YesterdayDateTime = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(session.getAttribute("YesterdayDateTime").toString()));
System.out.println("Yesterday date time is:"+YesterdayDateTime);

String PresentMonthFirst = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("CurrentMonthFirst").toString()));
System.out.println(" present month first:"+PresentMonthFirst);

String PresentMonthLast = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(session.getAttribute("CurrentMonthLast").toString()));
System.out.println("Present month last date:"+PresentMonthLast);

String SevenDaysBack = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(session.getAttribute("7DaysBack").toString()));
System.out.println("7days:" +SevenDaysBack);

String FifteenDaysBack = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(session.getAttribute("15DaysBack").toString()));
System.out.println("15days:" +FifteenDaysBack);


String Hrs24 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(session.getAttribute("24hoursBack").toString()));
System.out.println("24hrs:" +Hrs24);

String Hrs48 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(session.getAttribute("48hoursBack").toString()));
System.out.println("48hrs:" +Hrs48);
 */


%>
</body>
</html>