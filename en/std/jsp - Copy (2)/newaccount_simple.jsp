<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
<%-- Keep this script at top of page --%>
<script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
</head>
<body class="standard">
<%-- Keep this tag just after body tag --%>
<webbase:AdbaseEFormValidationMask />
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" --> 
	  <span class="PageName"> !! -- newaccount.jsp</span>
      <form method="post" action="WebBaseMain.do" name="NewCustomer"> 
        <table width="450" border="0" align="center" cellpadding="2" cellspacing="0" > 
          <tr align="center">
            <td colspan="4" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/jsp/newaccount.jsp'/></td>
          </tr>
          <tr> 
            <td colspan="4" class="heading">New Account </td> 
          </tr> 
          <tr> 
            <td align="right">&nbsp;</td> 
            <td colspan="3">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="4">Required fields are marked
                with an asterisk(*). </td> 
          </tr> 
          <tr> 
            <td width="162" align="right">&nbsp;</td> 
            <td colspan="3">&nbsp;</td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">First Name: * </td> 
            <td colspan="3"><webbase:customerData dataType="Fname" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Last Name: * </td> 
            <td colspan="3"><webbase:customerData dataType="Lname" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Username: *</td> 
            <td colspan="3"><webbase:customerData dataType="WebLogin" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password: *</td> 
            <td colspan="3"><webbase:customerData dataType="WebPassword" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password Confirm:  *</td> 
            <td colspan="3"><webbase:customerData dataType="WebPasswordC" editMode="1"/></td> 
          </tr>
          <tr > 
            <td class="mattrlabeltext">Email:</td>
            <td colspan="3"><webbase:customerData dataType="Email" editMode="1"/></td>
          </tr>
          <tr > 
            <td class="mattrlabeltext">Email Confirm: </td>
            <td colspan="3"><webbase:customerData dataType="EmailC" editMode="1"/></td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td> 
            <td width="78"><webbase:customerData dataType="NewCustomer" customerCompany="Fort Wayne Newspapers" customerType="Private Party"/></td> 
            <td colspan="2" align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="2" align="center"> <a href="WebBaseMain.do?NextURL=/jsp/login.jsp"><img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0"></a> </td> 
            <td colspan="2" align="center"><webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/SetAdType.jsp"> 
              <input name="imageField" type="image" src="../../../images/navigation/accept.gif" alt="Click To Log In" width="49" height="17" border="0"> 
              </webbase:formHelper> </td> 
          </tr> 
        </table> 
        <webbase:customerData dataType="SaveCustomer"/> 
        <webbase:customerData dataType="LoginCustomer"/> 
        <%-- You MUST include this tag so server knows to skip some of the normal logic for processing addr/phone --%> 
        <webbase:customerData dataType="NoAddrPhoneEntryFields"/> 
        <webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/> 
      </form> 
    <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
