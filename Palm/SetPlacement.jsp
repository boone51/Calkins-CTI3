<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select A Placement</title>
<body bgcolor="#FFFFFF">
  
<p><font size="4"><b>Select A Placement</b></font></p>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	<webbase:ConstraintLists dataType="Placement"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/SetPosition.jsp"/>
	<br>
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/SetEditionZone.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>