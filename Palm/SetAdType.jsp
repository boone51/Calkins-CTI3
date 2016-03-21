<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select Ad Type</title>
<body bgcolor="#FFFFFF">
  
<p><font size="4"><b>Select Ad Type</b></font></p>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	<webbase:mactiveAction dataType="NewOrder" dataValue=""/> 
	<webbase:mactiveAction dataType="SetInteractiveConstraintMode" dataValue="true"/> 
	<webbase:mactiveAction dataType="SetAdSpaceReservationOnlyMode" dataValue="true"/> 
	<webbase:mactiveAction dataType="NewRunSchedule" dataValue=""/>
	<webbase:ConstraintLists dataType="AdType"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/SetProduct.jsp"/>
	<br>
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/CustomerSummary.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>