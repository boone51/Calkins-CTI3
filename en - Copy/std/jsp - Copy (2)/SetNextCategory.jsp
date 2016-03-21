<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
      <span class="PageName"> !! -- SetNextCategory.jsp</span>
	  <form method="post" action="WebBaseMain.do" name="merchattributes"> 
        <webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetMerchandiseAttributes.jsp'/> 
        <br>
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr> 
            <td colspan="2" class="heading">Choose Sub Category</td> 
          </tr> 
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2"><br>
            Your selected Ad Category is:  <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span><br>            </td> 
          </tr> 
		  <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2">
            <table width="385" border="0" cellpadding="2" cellspacing="2" class="mgrouptable" align="center"> 
                <tr> 
                  <td class="mgroupname">
                  Sub Category:                  </td> 
                  <td ><webbase:AdCategoryTag dataType="AdCategories" useSelectedParent="true" showItemNames="false" showItemDescriptions="true"/></td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td colspan="2"><br><br><br></td> 
          </tr> 
          <tr> 
            <td width="50%">
            	<center>
              <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/SetAdType.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper>
              </center></td> 
            <td width="50%" colspan="3"><center>
              <webbase:AdCategoryTag dataType="SubmitAdCategoryBtn" label="Continue" nextCategoryURL="/jsp/SetNextCategory.jsp" nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:AdCategoryTag>
            </center></td> 
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
