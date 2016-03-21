<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select An Edition And Zone</title>
<body bgcolor="#FFFFFF">
  
<p><font size="4"><b>Select An Edition And Zone</b></font></p>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	Edition <webbase:ConstraintLists dataType="Edition"/><br>
	Zone <webbase:ConstraintLists dataType="Zone"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/SetPlacement.jsp"/>
	<br>
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/SetProduct.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>