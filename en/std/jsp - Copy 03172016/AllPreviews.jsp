<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
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
      <form method="post" action="WebBaseMain.do" name="merchattributes"> 
        <webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/AllPreviews.jsp'/>        <br />
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr align="center"> 
            <td colspan="2" class="mgroupheadercell">Choose a Style </td> 
          </tr> 
          <tr> 
            <td height="30" colspan="2" style="padding: 8px;"><br />
            Your selected Ad Category is:  
              <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span>
            </td> 
          </tr> 
          <tr align="center"> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr> 
            <td width="51%" align="center"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/EditAd.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper></td> 
            <td width="49%" align="center">
			
			    <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/jsp/EditAd.jsp">
                    <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
                </webbase:formHelper>
          
          </tr> 
          <tr> 
            <td colspan="2">&nbsp;</td> 
          </tr>
          <tr>
            <td colspan="2"><webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="1" cellBorderWidth="0"/></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
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
