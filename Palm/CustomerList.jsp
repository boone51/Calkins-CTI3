<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<html>
<title>Customer List</title>
<body bgcolor="#FFFFFF">
  
<font size="4"><b>Customer List</b></font><br>
  <webbase:CustomerSearch>
    <webbase:CustomerSearchDetail dataType="Phone1" openCustomerURL="/Palm/CustomerSummary.jsp"/> 
    <webbase:CustomerSearchDetail dataType="Name"/><br>
  </webbase:CustomerSearch><br>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <webbase:formHelper dataType="submitButton" label="Back" name="BtnContinue" nextURL="/Palm/SelectCustomer.jsp"/>
    <webbase:formHelper dataType="formList"/>
    <webbase:formHelper dataType="FormValidate"/>
  </form>
  <form name="exitform" method="post" action="../App/WebBaseMain.do">
    <input type="hidden" name="cmd" value="LogOff">
    <input type="submit" name="ExitButton" value="Exit">
  </form>
</body>
</html>