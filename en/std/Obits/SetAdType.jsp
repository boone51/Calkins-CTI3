<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/Obitswithmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">


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
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><%@ include file="../includes/ObitsleftSide.htm"%></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" -->
     <span class="PageName"> !! -- SetAdType.jsp</span>
	  <webbase:mactiveAction dataType="NewOrder" dataValue=""/>
	  <webbase:TemplateControls dataType="clear"/> 
	  <webbase:mactiveAction dataType="SetOrderPriceRangeByAdText" dataValue="false" />
      <table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td colspan="2" class="mgroupname"><span class="heading">Choose Category</span>          <webbase:errorData dataType="ErrorMsg"/> </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
		<tr> 
          <td colspan="2" class="mgroupname">Obituaries</td>
        </tr>
		<tr><td colspan="2">
            <form action="WebBaseMain.do" method="post" name="adtype" class="nomargin">
			  <%-- modify parentCategory to equal the category name from product define --%>
              <webbase:AdCategoryTag dataType="AdCategories" useSelectedParent="0" parentCategory="Mactive Classified" showItemDescriptions="true" showItemNames="false" />
			  <webbase:AdCategoryTag dataType="SubmitAdCategoryBtn" nextCategoryURL = "/Obits/SetNextCategory.jsp" nextURL="/Obits/SetLayout.jsp" packageURL="/Obits/SetPackage.jsp"> 
                 <img src="../../../images/navigation/continue.gif" width="70" height="17" border="0">               </webbase:AdCategoryTag> 
               <webbase:errorData dataType="ErrorURL" nextURL="/Obits/SetAdType.jsp"/> 
               <webbase:formHelper dataType="formList"/> 
               <webbase:formHelper dataType="FormValidate"/> 
          </form></td>
        </tr>
		<%-- End Category Code --%>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
