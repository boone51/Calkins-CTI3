<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
</head>

<body class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" -->
	  <span class="PageName"> !! -- changePassword.jsp</span>
      <form name="login" method="post" action="WebBaseMain.do">
	    <table width="400" border="0" align="center" cellpadding="2" cellspacing="0"> 
                <tr align="center">
                  <td colspan="3" class="errormsg" ><webbase:errorData dataType='ErrorMsg'/>
                  <webbase:errorData dataType='ErrorURL' nextURL='/jsp/changePassword.jsp'/></td>
          </tr>
                <tr>
                  <td colspan="3" class="heading" >Change Password: (optional) </td>
                </tr>
                <tr>
                  <td colspan="3" >&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3" >You are offered the chance
                    to change your password by typing it twice in the following
                    boxes. This is optional, so both &quot;Cancel&quot; and &quot;Accept&quot; buttons
                    will take you to your home page.<br> 
                    <br></td> 
                </tr> 
                <tr >
                  <td nowrap class="mattrlabeltext">New Password : </td>
                  <td colspan="2"><webbase:customerData dataType="WebPassword" editMode="1" dataSource="L"/></td>
                </tr>
                <tr > 
                  <td nowrap class="mattrlabeltext"> Confirm Password: </td> 
                  <td colspan="2"><webbase:customerData dataType="WebPasswordC" editMode="1" dataSource="L"/></td> 
                </tr> 
                <tr> 
                  <td>&nbsp; </td> 
                  <td width="111"> 
                      <webbase:formHelper dataType="CancelNewCustomerBtn" label="Cancel Customer"> 
                    	<img src="../../../images/navigation/ignore.gif" width="80" height="17" border="0"> 
                      </webbase:formHelper> 
                  </td> 
                  <td width="150">
                    <webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer"> 
                  	  <img src="../../../images/navigation/continue.gif" width="70" height="17" border="0"> 
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
    <td><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
