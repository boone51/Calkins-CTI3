<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Customer SUmmary</title>
<body bgcolor="#FFFFFF">
<font size="4"><b>Customer Summary</b></font><br>
<webbase:customerData dataType="FullName" dataSource="C"/><br>
  <webbase:customerData dataType="AddrStreet1" dataSource="C"/><br>
  <webbase:customerData dataType="AddrStreet2" dataSource="C" postValHTML="<br>"/>
  <webbase:customerData dataType="AddrStreet3" dataSource="C" postValHTML="<br>"/>
  <webbase:customerData dataType="AddrCity" dataSource="C"/>, 
  <webbase:customerData dataType="AddrState" dataSource="C"/> 
  <webbase:customerData dataType="AddrZip1" dataSource="C"/>-<webbase:customerData dataType="AddrZip2" dataSource="C"/><br>
  Phone: (<webbase:customerData dataType="PhoneAC" dataSource="C"/>)
	<webbase:customerData dataType="Phone3" dataSource="C"/>-
	<webbase:customerData dataType="Phone4" dataSource="C"/>
	<webbase:customerData dataType="Phonex" dataSource="C" preValHTML=" x"/><br>
  Email: <webbase:customerData dataType="Email" dataSource="C"/>
<hr width="100%" align="left">
<form name="form1" method="post" action="../App/WebBaseMain.do">
	<webbase:formHelper dataType="submitButton" label="Take Order" name="BtnNewOrder" nextURL="/Palm/SetAdType.jsp"/> 
	<webbase:formHelper dataType="submitButton" label="View Orders" name="BtnOrders" nextURL="/Palm/CustomerOrders.jsp"/> 
    <webbase:formHelper dataType="submitButton" label="Close Customer" name="BtnClose" nextURL="/Palm/SelectCustomer.jsp" action="<DoAction action='CloseCustomer'/>"/>
	<webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>