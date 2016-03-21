<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
<script language="javascript">
</script>
<script language="javascript">
function disableBack(){
history.go(1);
}
disableBack();
</script>
</head>
<body onLoad="disableBack()" class="standard">

    <div class="container">
    <div class="col-md-12">
        <form name="LoginUser" method="post" action="WebBaseMain.do">
<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SignIn.jsp'/>
Sign In
<br>
User Name:
<webbase:userLogin dataType="userName"/>
Password
<webbase:userLogin dataType="userPassword"/>
<webbase:userLogin dataType="lateLogin"/>
<br>
<webbase:formHelper dataType="submitButton" label="Login" name="lateLogin" nextURL="/jsp/ReviewOrder.jsp">
<img src="../../../images/navigation/login.gif" width="49" height="17" border="0" alt="Back">
</webbase:formHelper>
<webbase:formHelper dataType="formList"/>
<webbase:formHelper dataType="FormValidate"/>
<br>
Or create a <a href="WebBaseMain.do?cmd=NewCustomerLL">new account</a>
Forget your password? Use our <a href="WebBaseMain.do?NextURL=/jsp/emailpasswordLL.jsp" class="mainlinks">Password Lookup</a>.
</form>
        </div>
    
    </div>
    
</body>
</html>