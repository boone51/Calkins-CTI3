<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Complete Order</title>
<body bgcolor="#FFFFFF">
  
<font size="4"><b>Complete Order</b></font><br>
  <form name="form1" method="post" action="../App/WebBaseMain.do">
	Start Date <webbase:RSDetail dataType="Fday" editMode="1" generateStartDate="true" width="10"/><br>
	Insert Count <webbase:RSDetail dataType="NumInserts" editMode="1" width="3"/><br>
	Ad Width <webbase:adData dataType="AdWidth_i" editMode="1" width="2"/><br>
	Ad Depth <webbase:adData dataType="AdDepth_i" editMode="1" width="5"/><br><br>
	<webbase:formHelper dataType="submitButton" label="Next" name="BtnNext" nextURL="/Palm/ReviewOrder.jsp"/>
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