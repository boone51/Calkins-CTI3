<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<head>
<title>Webbase Rep Login</title>
</head>
<body bgcolor="#FFFFFF">
  <form method="post" action="<%= response.encodeURL("../App/WebBaseMain.do") %>" name="LoginUser">    
  <p align="left"><font size="2">Please Enter Your Mactive System Login and Password.</font></p>
    
  <p align=left><font size="2"><b>Name</b></font>
    <webbase:userLogin dataType="userIsRep"/> <webbase:userLogin dataType="userName"/> 
  </p>
  <p align=left><font size="2"><b>Password</b></font>
    <webbase:userLogin dataType="userPassword"/> 
  </p>
    <input type=submit name="LoginBtn" value="Click To Log In">
    <input type="hidden" name="FormType" value="LoginUser">
  </form>
</body>
</html>
