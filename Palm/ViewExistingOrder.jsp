<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Order Detail</title>
<body bgcolor="#FFFFFF">
<font size="4"><b>Order Detail</b></font> 
<form name="reviewOrderForm" method="post" action="../App/WebBaseMain.do">  
  <b>Order Number</b> <webbase:orderData dataType="Order Number"/><br>
  <b>Total Cost</b> <webbase:orderData dataType="Total Price"/><br>
  <b>Ad Type</b> <webbase:adData dataType="AdType"/><br>
  <b>Ad Width</b> <webbase:adData dataType="AdWidth_i"/><br>
  <b>Ad Depth</b> <webbase:adData dataType="AdDepth_i"/><br>
  <b>Ad Run Schedule(s)</b>:<br>
  <webbase:runScheduleIt>
    <webbase:RSDetail dataType="NumInserts"/> 
    day(s) beginning on <webbase:RSDetail dataType="Fday"/> 
    in <webbase:RSDetail dataType="Product"/> (<webbase:RSDetail dataType="Placement"/>:<webbase:RSDetail dataType="Position"/>)<br>
  </webbase:runScheduleIt>
  <br>
  <webbase:orderData dataType="CloseOrderBtn" label="Continue" nextURL="/Palm/CustomerOrders.jsp"/>
  <webbase:formHelper dataType="formList"/>
  <webbase:formHelper dataType="FormValidate"/>
</form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>