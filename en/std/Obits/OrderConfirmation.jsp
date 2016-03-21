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
<span class="PageName"> !! -- OrderConfirmation.jsp</span>
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
      <form name="ReviewOrder" method="post" action="WebBaseMain.do"> 
          <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr align="center">
            <td colspan="2" class="errormsg"><webbase:errorData dataType='ErrorMsg'/><webbase:errorData dataType='ErrorURL' nextURL='/Obits/OrderConfirmation.jsp'/></td>
          </tr>
          <tr> 
            <td colspan="2" class="heading">Order Confirmation </td> 
          </tr> 
          <tr> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr align="center"> 
            <td height="30" colspan="2" valign="top">Your selected Ad Category
              is:<br> 
              <span class="chosencategory"><webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></span></td> 
          </tr> 
          <tr>
            <td colspan="2" align="right">&nbsp;</td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td> 
            <td align="center"><webbase:orderData dataType="CloseOrderBtn" label="Continue" nextURL="/Obits/SetAdType.jsp"> 
              <img src="../../../images/navigation/placeanotherad.gif" width="115" height="17"> 
            </webbase:orderData></td> 
          </tr> 
          <tr> 
            <td colspan="2" valign="top">&nbsp;</td> 
          </tr> 
          <tr> 
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="2"> 
                <tr> 
                  <td class="mattrlabeltext">Order Confirmation Number: <webbase:orderData dataType="Order Number"/></td> 
                </tr> 
                <tr> 
                  <td class="mattrlabeltext">Ad Type: <webbase:adData dataType="AdType"/></td> 
                </tr> 
                <tr> 
                  <td class="mattrlabeltext">Number of Lines: <webbase:adData dataType="AdDepthInUnits"/></td> 
                </tr> 
                <tr> 
                  <td align="left" class="mattrlabeltext">Ad Run Schedule(s): <webbase:runScheduleIt> 
                    <webbase:RSDetail dataType="NumInserts"/> 
                    day(s) starting <webbase:RSDetail dataType="Fday"/> in <webbase:RSDetail dataType="Product"/> </webbase:runScheduleIt></td> 
                </tr> 
                <tr> 
                  <td class="mattrlabeltext">Total Price: <webbase:orderData dataType="Total Price"/></td> 
                </tr> 
            </table></td>
	      </tr>
		<tr>
            <td valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                <tr> 
                  <td width="10"> <img src="../../../images/spacer.gif" width="10" height="8"> </td> 
                  <td align="center"> <span class="mattrlabeltext"><strong>Ad Preview</strong> </span>                    <table width="20" border="1" align="center" cellpadding="2" cellspacing="2"> 
                      <tr> 
                        <td><webbase:adData dataType="ImagePreview"/></td> 
                      </tr> 
                    </table></td> 
                  <td width="10"><img src="../../../images/spacer.gif" width="10" height="8"></td> 
                </tr> 
            </table></td> 
          </tr> 
        </table> 
        <webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
