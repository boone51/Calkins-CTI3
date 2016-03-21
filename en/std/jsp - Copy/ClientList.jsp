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
    <td colspan="2"><%@ include file="../includes/header.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/leftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
            <span class="PageName"> !! -- ClientList.jsp</span>
			<form action="WebBaseMain.do" method="post" enctype="multipart/form-data" name="something" class="nomargin">
   <p><webbase:errorData dataType='ErrorMsg'/> 
                  <webbase:errorData dataType='ErrorURL' nextURL='/Jobs/ClientList.jsp'/> &nbsp;&nbsp;</p>
   <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="350" border="0" align="center" cellpadding="0" cellspacing="0" class="theTable">
     <tr>
       <td><div align="center"><strong>Select your client relationship below:<br>
               <webbase:orderCustomersData dataType="Client" editMode="1"/></strong> <webbase:formHelper dataType="SubmitClient" label="Continue" name="SetClient"></webbase:formHelper> 
               
       </div></td>
     </tr>
   </table></td>
  </tr>
</table>

   <webbase:formHelper dataType="formList"/> <webbase:formHelper dataType="FormValidate"/>
 </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
