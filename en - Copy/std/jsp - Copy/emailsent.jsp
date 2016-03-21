<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
</head>

<body class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="../includes/header.htm"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" --> 
      <span class="PageName"> !! -- emailsent.jsp</span>
	  <form method="post" action="WebBaseMain.do" name="EmailPassword"> 
        <table width="400" border="0" align="center" cellpadding="1" cellspacing="0"> 
          <tr>
            <td align="center" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
            <webbase:errorData dataType='ErrorURL' nextURL='/jsp/emailsent.jsp'/></td>
          </tr>
          <tr> 
            <td width="250" class="heading">Forgot
              Password:</td> 
          </tr> 
          <tr> 
            <td align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td height="26" align="center">You
                should recieve an email shortly with your password.
              </p>
              <p>Thank you.</p></td> 
          </tr> 
          <tr> 
            <td align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td align="center"><a href="WebBaseMain.do?NextURL=/jsp/login.jsp"><img src="../../../images/navigation/continue.gif" width="70" height="17" border="0"></a> </td> 
          </tr> 
        </table> 
      </form>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
