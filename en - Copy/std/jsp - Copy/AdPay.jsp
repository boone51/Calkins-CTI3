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
<span class="PageName"> !! -- AdPay.jsp</span>
<!-- AdPay - with packages always position to the first/primary ad for photo upload and do so BEFORE ClearAllWells -->
	<webbase:showIf expression="adIsPartOfPackage">
	  <webbase:mactiveAction dataType="SetAdToFirst" dataValue="" />
	</webbase:showIf>
<!-- AdPay - reset any prior image or URL associated with the wells and replace with the new choices -->
	<webbase:AdPay dataType="ClearAllWells"></webbase:AdPay>

        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr>
            <td colspan="2" align="center" class="errormsg">
			  <webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/jsp/AdPay.jsp'/>

            </td>
          </tr>
          <tr> 
            <td colspan="2" class="heading">Create Ad</td> 
          </tr> 
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td height="30" colspan="2">Your selected Ad Category is:<br>
              <span  class="chosencategory"><webbase:adData dataType='AdCategory' showCategoryName='true' showCategoryDescription='false' categoryTextSeparator=':'/>
              </span></td> 
          </tr> 
          <tr>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
          </tr>
          

<tr>
	    <td colspan="2">
          <!-- Test AdPay tag -->
	      <iframe name="AdPay" id="AdPay" src="http://staging.adpay.com/advancedimages/photowiz.aspx" width="580" height="350" frameborder="0" marginwidth="0" marginheight="0"></iframe>
		<webbase:showIf expression="adIsPartOfPackage">  
		  <webbase:AdPay dataType="GenerateAdPayFrameScript" frameId="AdPay" nextURL="/jsp/AnswerQuestions.jsp" />
		</webbase:showIf>

		<webbase:showIf expression="!adIsPartOfPackage">
		  <webbase:AdPay dataType="GenerateAdPayFrameScript" frameId="AdPay" nextURL="/jsp/AllOnePage.jsp" />
		</webbase:showIf>

          </td>


          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td>&nbsp;</td> 
          </tr> 
          <tr> 
            <td align="center">
		<webbase:showIf expression="!adIsPartOfPackage"> 
              <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AllOnePage.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper>
		</webbase:showIf>


		<webbase:showIf expression="adIsPartOfPackage"> 
              <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AnswerQuestions.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper>
		</webbase:showIf>
	      </td>
 
          </tr> 
          <tr> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
        </table> 
    <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
