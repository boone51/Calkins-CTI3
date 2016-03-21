<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Customer Orders</title>
<body bgcolor="#FFFFFF">
  
<font size="4"><b>Customer Orders</b></font><br>
     <webbase:customerData dataType="FullName" dataSource="C"/><br>
  <webbase:OrderSearch dataSource="CurrentCustomer">
    <webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/Palm/ViewExistingOrder.jsp"/>
	<b>Placement</b> <webbase:OrderSearchDetail dataType="Placement"/>:
	<webbase:OrderSearchDetail dataType="Position"/>
	<b>Start</b> <webbase:OrderSearchDetail dataType="Fday"/>
	<b>End</b> <webbase:OrderSearchDetail dataType="Lday"/><br>
  </webbase:OrderSearch><br>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <webbase:formHelper dataType="submitButton" label="Customer Summary" name="BtnOrders" nextURL="/Palm/CustomerSummary.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>