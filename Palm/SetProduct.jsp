<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select A Product</title>
<body bgcolor="#FFFFFF">
  
<p><font size="4"><b>Select A Product</b></font></p>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	<webbase:ConstraintLists dataType="Product"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/SetEditionZone.jsp"/>
	<br>
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/SetAdType.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>