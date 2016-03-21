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
      <span class="PageName"> !! -- spellcheck.jsp</span>
      <script language="javascript" src="../../../scripts/spellcheck.js"></script> 
      <form name="SpellCheck" method="post" action="WebBaseMain.do"> 
        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr>
            <td colspan="2" align="center" >&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" class="heading" >Spell Check - OBITS </td> 
          </tr>
          <tr align="center">
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td height="30" colspan="2">Your selected Ad Category is:<br> 
                
              <span class="chosencategory"><webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></span>
               </td> 
          </tr> 
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td align="center" width="50%"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/AllOnePage.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper></td> 
            <td align="center" width="50%"><img src="../../../images/spacer.gif" width="1" height="10"> 
              <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/Obits/AllOnePage.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:formHelper></td> 
          </tr> 
          <tr align="center">
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td colspan="2">
              <webbase:spellCheck dataType="SpellText" width="400" depth="100"> 
                             Your browser does not support inline frames.<br> 
                            Click <a href="spellcheckNIF.jsp">here</a> for form
                            that doesn't use inline frames.
                            </webbase:spellCheck> </td>
          </tr> 
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" class="mattrlabeltext">Correction</td>
          </tr> 
          <tr>
            <td colspan="2" align="center"><webbase:spellCheck dataType="Correction" width="32"/></td>
          </tr>
          <tr>
            <td colspan="2" class="mattrlabeltext">Suggestions</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><webbase:spellCheck dataType="SuggestionList" depth="6" width="20"/></td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><webbase:spellCheck dataType="ReplaceButton" buttonLabel="Replace"> 
                      <img src="../../../images/navigation/replace.gif" alt="Replace" width="80" height="17" border="0"> 
                      </webbase:spellCheck> 
                      <webbase:spellCheck dataType="ReplaceAllButton" buttonLabel="ReplaceAll"> 
                      <img src="../../../images/navigation/replaceall.gif" alt="Replace All" width="80" height="17" border="0"> 
                      </webbase:spellCheck> 
                      <webbase:spellCheck dataType="IgnoreButton" buttonLabel="Ignore"> 
                      <img src="../../../images/navigation/ignore.gif" alt="Ignore" width="80" height="17" border="0"> 
                      </webbase:spellCheck> 
                      <webbase:spellCheck dataType="IgnoreAllButton" buttonLabel="IgnoreAll"> 
                      <img src="../../../images/navigation/ignoreall.gif" alt="Ignore All" width="80" height="17" border="0"> 
                      </webbase:spellCheck> 
                      <webbase:spellCheck dataType="ResetButton" buttonLabel="Reset"> 
                      <img src="../../../images/navigation/reset.gif" alt="Reset" width="80" height="17" border="0"> 
                      </webbase:spellCheck> </td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td align="center" width="50%"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/AllOnePage.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper></td> 
            <td align="center" width="50%"><img src="../../../images/spacer.gif" width="1" height="10"> 
              <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/Obits/AllOnePage.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:formHelper></td> 
          </tr> 
          <tr> 
            <td align="center"><webbase:spellCheck dataType="LoadDynamicVariables"/>
              <webbase:formHelper dataType="formList"/></td> 
            <td align="center">&nbsp;</td> 
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
