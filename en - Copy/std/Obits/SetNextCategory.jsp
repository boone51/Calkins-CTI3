
<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/ObitsleftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
<span class="PageName"> !! -- SetNextCategory.jsp</span>
      <form method="post" action="WebBaseMain.do" name="merchattributes"> 
        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr align="center">
            <td colspan="4" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
			  <webbase:errorData dataType='ErrorURL' nextURL='/Obits/SetMerchandiseAttributes.jsp'/>			</td>
          </tr>
          <tr> 
            <td colspan="4" class="heading">Choose Sub Category</td> 
          </tr> 
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" colspan="4" align="center">Your selected Ad Category is:<br> 
              
              <span class="chosencategory">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
              </span></td> 
          </tr> 
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="4"><table width="350" border="0" cellpadding="2" cellspacing="2" align="center"> 
                <tr> 
                  <td width="50%" align="right" class="mattrlabeltext">Sub
                      Category: &nbsp;</td> 
                  <td width="50%" ><webbase:AdCategoryTag dataType="AdCategories" useSelectedParent="true" showItemNames="false" showItemDescriptions="true"/></td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td colspan="4">&nbsp; </td> 
          </tr> 
          <tr> 
            <td width="50%" align="center"><webbase:formHelper dataType="formList"/> 
              <webbase:formHelper dataType="FormValidate"/> 
              <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/SetAdType.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper></td> 
            <td width="53%" colspan="3" align="center"><webbase:AdCategoryTag dataType="SubmitAdCategoryBtn" label="Continue" nextCategoryURL="/Obits/SetNextCategory.jsp" nextURL="/Obits/SetLayout.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:AdCategoryTag></td> 
          </tr> 
          <tr> 
            <td colspan="4">&nbsp;</td> 
          </tr> 
        </table> 
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
