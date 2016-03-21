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
      <form method="post" action="WebBaseMain.do" name="AdOrderData"> 
        <webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetPackage.jsp'/><br />
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr align="center"> 
            <td width="200%" colspan="4" class="mgroupheadercell">Choose A Package </td> 
          </tr> 
           
          <tr align="center"> 
            <td colspan="4"><webbase:orderData dataType="PackageSelector" editMode="1" numColumns="1"  packageButtonImageSrc="../../../images/apply.gif" nextURL="/jsp/isPackageInfoReq.jsp" /></td> 
          </tr> 
          <tr> 
            <td colspan="4"><br /></td>
          </tr> 
          <tr> 
            <td colspan="4">&nbsp;</td> 
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
