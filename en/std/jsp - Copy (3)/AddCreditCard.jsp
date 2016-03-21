<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html><html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">


<!-- InstanceBeginEditable name="JavaScript" -->
<script language="javascript">

</script>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>

</head>

<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/leftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" -->
            <span class="PageName"> !! -- AddCreditCard.jsp</span>
			<form method="post" action="WebBaseMain.do" name="AddCreditCard">
            <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" >
              <tr align="center">
                <td colspan="2" >
                  <webbase:errorData dataType="ErrorMsg" label="OK"/>
                  <webbase:errorData dataType="ErrorURL" nextURL="/jsp/AddCreditCard.jsp"/></td>
              </tr>
              <tr>
                <td colspan="2" class="heading" >Add a Credit Card</td>
              </tr>
              <tr>
                <td align="center">&nbsp;</td>
                <td align="center">&nbsp;</td>
              </tr>
              <tr>
                <td width="50%" align="center"><webbase:CCardData dataType="BtnCancel" label="Cancel" targetURL="_pop_"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"></webbase:CCardData></td>
                <td width="50%" align="center"><webbase:CCardData dataType="BtnSave" label="Save" targetURL="_pop_"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:CCardData></td>
              </tr>
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="160" class="mattrlabeltext">Credit Card Number:</td>
                    <td colspan="2"><webbase:CCardData dataType="CardNum" maxInputLength="16" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td valign="top" class="mattrlabeltext">Expiration Date:</td>
                    <td width="67" class="mattrlabeltext">Month:
                    <br>                    </td>
                    <td width="223" class="mattrlabeltext"><webbase:CCardData dataType="CardExpMonth" editMode="1"/>                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><span class="mattrlabeltext">Year: </span></td>
                    <td><span class="mattrlabeltext">
                      <webbase:CCardData dataType="CardExpYear" editMode="1"/>
                    </span></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Name as It Appears on the Card:&nbsp;</td>
                    <td colspan="2"><webbase:CCardData dataType="Name" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Phone:</td>
                    <td colspan="2"><webbase:CCardData dataType="Phone" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Billing Address:</td>
                    <td colspan="2"><webbase:CCardData dataType="Addr1" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Address 2:</td>
                    <td colspan="2"><webbase:CCardData dataType="Addr2" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">City:</td>
                    <td colspan="2"><webbase:CCardData dataType="City" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">State:</td>
                    <td colspan="2"><webbase:CCardData dataType="State" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Zip:</td>
                    <td colspan="2"><webbase:CCardData dataType="CardZip1" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Country:</td>
                    <td colspan="2"><webbase:CCardData dataType="Country" editMode="1"/></td>
                  </tr>
                </table></td>
              </tr>
              <tr align="center">
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr align="center">
                <td><webbase:CCardData dataType="BtnCancel" label="Cancel" targetURL="_pop_"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"></webbase:CCardData></td>
                <td><webbase:CCardData dataType="BtnSave" label="Save" targetURL="_pop_"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:CCardData></td>
              </tr>
              <tr align="center">
                <td colspan="2"><img src="../../../images/spacer.gif" width="1" height="3"></td>
              </tr>
            </table>
            <webbase:formHelper dataType="formList"/>
            <webbase:formHelper dataType="FormValidate"/>
            </form>
<!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
		
