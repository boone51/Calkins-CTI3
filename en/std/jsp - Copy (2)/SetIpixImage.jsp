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
     <span class="PageName"> !! -- SetIpixImage.jsp</span>
      <form method="post" action="WebBaseMain.do" name="ipix">
<!-- IPIX - reset any prior image or URL associated with the wells so they are all part of same mediaset -->
	    <webbase:Ipix dataType="ClearAllWells"></webbase:Ipix>
        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr align="center">
            <td colspan="2" class="errormsg"><webbase:errorData dataType='ErrorMsg'/> 
            <webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetIpixImage.jsp'/></td>
          </tr>
          <tr align="left"> 
            <td colspan="2"><span class="heading" >Upload
                Photo(s)</span></td> 
          </tr> 
          <tr align="center"> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr align="center"> 
            <td colspan="2">Your selected Ad Category is:<br> 
              <span class="chosencategory"> 
              <webbase:adData dataType='AdCategory' showCategoryName='true' showCategoryDescription='false' categoryTextSeparator=':'/> 
              </span></td> 
          </tr> 
          
          <tr> 
            <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="5" class="blue_tables"> 
                <tr> 
                  <td align="center" valign="top">
<!-- IPIX - set the two Ipix materials used for photo charges --> 
                  <%--    <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder ipixBasicMaterial='Ipix Basic' ipixExtraMaterial='Ipix Extra'/>"/> --%>
					  <span class="mgroupname">Dress
                                Up Your Ad!</span><br>                                <br> 
                              To help you get more attention to your ad, we offer
                              image uploading powered by iPIX.					  
                      <br> 
                      <br>
                      <table width="100%"  border="0" cellspacing="0" cellpadding="2"> 
			<tr align="center">
<!-- IPIX - include the placeholder for iPIX AdBuilder -->
			  <td align="center"><img src="sp.gif?pa=ipixads/mactiveadstest&emailconfirmation=0&commitenabled=0&commerceflag=0" width="506" height="600" name="_insert_AdBuilder_" border=0 alt="AdBuilder placeholder image"></td>
			</tr>
                      </table></td> 
                  </tr>
			    </table></td> 
          </tr>	  
		            <tr align="center"> 
            <td width="51%"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/SetMerchandiseAttributes.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper></td> 
            <td width="49%">
			<webbase:showIf expression="adIsPartOfPackage">
			<a href="WebBaseMain.do?NextURL=/jsp/AnswerQuestions.jsp"><img src="../../../images/navigation/skip.gif" width="49" height="17" border="0"></a>
			</webbase:showIf>
			
			<webbase:showIf expression="!adIsPartOfPackage">
			<a href="WebBaseMain.do?NextURL=/jsp/AllOnePage.jsp"><img src="../../../images/navigation/skip.gif" width="49" height="17" border="0"></a>
			</webbase:showIf>
			
			</td> 
          </tr> 
          <tr> 
            <td colspan="2">
<!-- IPIX - include the script to initialize iPIX AdBuilder -->			
				<script type="text/javascript" src="http://apps-preprod.admission.net/admission/classified/js/adbuilder.js?admission_type=classified"></script>
<!-- IPIX - include completion handler for iPIX AdBuilder -->				
				<script type="text/javascript">
				function AdBuilderSubmissionComplete(results)
				{
					var urlList = "";
					for (var i=0; i < results.uploadResults.length; i++)
					{
					    var imageURL = results.uploadResults[i].imageResult;
					    urlList += ";";
					    urlList += imageURL;
					
					}
					if (results.uploadResults.length > 0)
					{
					    document.ipix.AdBuilderAuthentication.value = results.uploadResults[0].authenticationToken;
					}
					document.ipix.AdBuilderImages.value = urlList;
					document.ipix.submit();
				} 
				gAdBuilder.setHandler("onComplete", "AdBuilderSubmissionComplete");
				gAdBuilder.setUMParm("lockCropAspect", ".86:1.14,0"); 
				</script>
<!-- IPIX - include tag for AdBuilder parms that are to be set dynamically, and specify next URL after submit -->				
				<webbase:showIf expression="!adIsPartOfPackage">
				<webbase:IpixAdmission dataType="GenerateAdmissionClassifiedScript" nextURL="/jsp/AllOnePage.jsp" />
				</webbase:showIf>
				
				<webbase:showIf expression="adIsPartOfPackage">
				<webbase:IpixAdmission dataType="GenerateAdmissionClassifiedScript" nextURL="/jsp/AnswerQuestions.jsp" />
				</webbase:showIf>
				
				<webbase:formHelper dataType="formList"/> 
				<webbase:formHelper dataType="FormValidate"/> </td> 
          </tr> 
        </table> 
      </form>
      <br> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
