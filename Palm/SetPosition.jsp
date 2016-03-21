<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select A Position</title>
<body bgcolor="#FFFFFF">
  
<p><font size="4"><b>Select A Position</b></font></p>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	<webbase:ConstraintLists dataType="Position"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/SetRunDays.jsp"/>
	<br>
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/SetPlacement.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>