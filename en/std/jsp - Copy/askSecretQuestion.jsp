<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="../../../includes/header.htm"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" --> 
      <form method="post" action="WebBaseMain.do" name="EmailPassword"> 
        <table width="400" border="0" align="center" cellpadding="2" cellspacing="0"> 
                <tr>
                  <td nowrap class="mattrlabeltext"> Secret Question: </td> 
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"> 
                    <webbase:userLogin dataType="userQuestion"/> 
                    </font></td>  
                </tr>
                <tr>
                  <td colspan="3" class="bgcolor">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3" class="bgcolor">Enter Secret Answer. Your password will
                    be emailed to you shortly. <br> 
                    <br> 
                    </font> 
                    </p> </td> 
                </tr> 
                <tr class="bgcolor"> 
                  <td nowrap class="mattrlabeltext"> Secret Answer: </td> 
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"> 
                    <webbase:userLogin dataType="userAnswer"/> 
                    </font></td> 
                </tr> 
                <tr> 
                  <td>&nbsp; </td> 
                  <td width="111"><div align="center"> 
                      <webbase:formHelper dataType="CancelPasswordSecretAnswerBtn" label="Cancel sending account password" nextURL="/jsp/login.jsp"> 
                      <img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0"> 
                      </webbase:formHelper> 
                    </div></td> 
                  <td width="150"><div align="center"> 
                      <webbase:formHelper dataType="SendPasswordSecretAnswerBtn" label="Send account password" nextURL="/jsp/emailsent.jsp"> 
                      <img src="../../../images/navigation/accept.gif" width="49" height="17" border="0"> 
                      </webbase:formHelper> 
                    </div></td> 
                </tr> 
            </table>
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>  
      </form>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="../../../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
