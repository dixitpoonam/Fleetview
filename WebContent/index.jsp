<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" language="java" import="java.sql.*" import="java.util.*" import="java.io.*" import=" java.text.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css" href="css/table/index_new.css">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.css"
  rel="stylesheet"
/>
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min.js"
></script>




<script type="text/javascript">

function validate()
{
	if(document.loginform.user.value=="")
	{
		alert("Please Enter User Name");
		return false;
	}
	if(document.loginform.password.value=="")
	{
		alert("Please Enter Password");
		return false;
	}
	return showmsg();
	return true;
}

function validate1(){
	
	alert("hi");
	if(document.loginform.user.value=="")
	{
		alert("Please Enter User Name");
		return false;
	}
	if(document.loginform.password.value=="")
	{
		alert("Please Enter Password");
		return false;
	}
	return showmsg();
	return true;
}
</script>




</head>

<body>

<div class="split1 left">
  <div class="centered">
    <img src="images/logo-white13.png"><br><br>
    <h2 style="color: white;font-family: sans-serif;font-weight: bold;"><i>Welcome to MyFleetView</i></h2>   
  </div>
</div>


<div class="split right" style="background-color: #e3e1e1">

<div class="row">
<div class="col-3"></div>
 <div class="col-lg-6 mb-5 mb-lg-0"><br><br><br><br><br>
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form name="loginform" action="userinfo.jsp" method="post" onsubmit="return validate();">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                
                <!-- Email input -->
                <div class="form-outline mb-4">
                  <!-- <input type="email" name="user" id="form3Example3" class="form-control" /> -->
                  <label class="form-label" style="color: black"><b>User Name<b/></label>
                  <input name="user" id="username" type="text" value="" class="form-control" style="border: 2px solid grey;" />
                  
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                <label class="form-label" style="color: black"><b>Password<b/></label>
                 <input name="Password" id="password" type="password"  value="" class="form-control" style="border: 2px solid grey;"/>
                  
                </div>

				<br>
                <!-- Submit button -->
                <input name="submit" id="submit" type="submit" value="submit" class="btn btn-primary btn-block mb-4" style="background-color:#10163a;width: 30%;">                  
				
                
              </form>
              
              <%
								String err=request.getParameter("err");
								if(null==err)
								{
								}
								else
								{
								if(err.equals("err2"))
								{
								out.print("<center><blink><font color='blue' size='3'>Session expired, please login again.</font></blink>");
								}
								else
								{
								out.print("<center><blink><font color='blue' size='3'>Incorrect Username or Password!!!</font></blink>");
								
								}
								}
				%>
              
              
              
            </div>
          </div>
        </div>
        <div class="col-3"></div>
      </div>
</div>



</body>
</html>