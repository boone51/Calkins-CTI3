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
      <span class="PageName"> !! -- emailpassword.jsp</span>
	  <form method="post" action="WebBaseMain.do" name="EmailPassword"> 
        <table width="400" border="0" align="center" cellpadding="2" cellspacing="0"> 
                <tr align="center">
                  <td colspan="3" class="errormsg" ><webbase:errorData dataType='ErrorMsg'/>
                    <webbase:errorData dataType='ErrorURL' nextURL='/jsp/emailpassword.jsp'/></td>
                </tr>
                <tr>
                  <td colspan="3" class="heading" >Forgot
                  Password:</td>
                </tr>
                <tr>
                  <td colspan="3" >&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3" >Enter your email address or
                    username and click the Accept button. Your password will
                    be emailed to you shortly. <br> 
                    <br> 
                    </font> 
                    </p> </td> 
                </tr> 
                <tr > 
                  <td nowrap class="mattrlabeltext"> Email or Username: </td> 
                  <td colspan="2"> 
                    <webbase:userLogin dataType="userEmail"/> 
                  </td> 
                </tr> 
                <tr> 
                  <td>&nbsp; </td> 
                  <td width="111"> 
                      <webbase:formHelper dataType="CancelEmailAddressBtn" label="Cancel Email Address" nextURL="/jsp/login.jsp"> 
                        <img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0"> 
                      </webbase:formHelper> 
                    </td> 
                  <td width="150"> 
                      <webbase:formHelper dataType="SendEmailAddressBtn" label="Send Email Address" nextURL="/jsp/emailsent.jsp"> 
                      <img src="../../../images/navigation/accept.gif" width="49" height="17" border="0"> 
                      </webbase:formHelper> 
                    </td> 
                </tr> 
        </table>
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>  
      </form>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
