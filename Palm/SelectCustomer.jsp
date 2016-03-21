<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Select Customer</title>
<body bgcolor="#FFFFFF">
  
<font size="4"><b>Select A Customer</b></font>
  <form method="post" action="../App/WebBaseMain.do" name="formOpenCustByPhone">
    <webbase:customerData dataType="OpenCustomerByPhoneNum" editMode="1" dataSource="C"/>
	<webbase:formHelper dataType="submitButton" label="Find Customer By Phone Number" name="BtnOpenByPhone" nextURL="/Palm/CustomerSummary.jsp"/> 
	<webbase:formHelper dataType="formList"/>
  </form>
  <form method="post" action="../App/WebBaseMain.do" name="formOpenCustByPhone">
	<webbase:customerData dataType="OpenCustomerByAcctNum" editMode="1" dataSource="C"/>
	<webbase:formHelper dataType="submitButton" label="Find Customer By Account Number" name="BtnOpenByAcct" nextURL="/Palm/CustomerSummary.jsp"/> 
	<webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
    <br>
  <form method="post" action="../App/WebBaseMain.do" name="formMyCustomers">
	<webbase:formHelper dataType="submitButton" label="My Customers" name="BtnOpenByAcct" nextURL="/Palm/CustomerList.jsp"/> 
	<webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <br>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>