<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/ObitsleftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" -->
        <span class="PageName"> !! -- editaccount.jsp</span>
	  <script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
	  <webbase:AdbaseEFormValidationMask />
      <form method="post" action="WebBaseMain.do" name="NewCustomer" onSubmit="return verify()">
	    <table width="450" border="0" align="center" cellpadding="2" cellspacing="0" > 
          <tr align="center">
            <td colspan="4" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/Obits/editaccount.jsp'/></td>
          </tr>
          <tr> 
            <td colspan="4" class="heading">Edit Account </td> 
          </tr> 
          <tr> 
            <td colspan="4" align="right">&nbsp;</td> 
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
            <td class="mattrlabeltext">First Name:</td> 
            <td colspan="3"><webbase:customerData dataType="Fname" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Last Name:</td> 
            <td colspan="3"><webbase:customerData dataType="Lname" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Phone Number: </td> 
            <td width="78" nowrap><webbase:customerData dataType="PhoneFull" editMode="1" width="13" newStyleValidationFlag="1"/></td> 
            <td width="18" class="mattrlabeltext">Ext</td> 
            <td width="196"><webbase:customerData dataType="Phonex" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Subscriber:</td> 
            <td colspan="3"><webbase:customerData dataType="SubscriberFlag" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Address:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrStreet1" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">City:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrCity" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">State:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrState" editMode="1" dataDefault="FL"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Zip:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrZipFull" editMode="1" newStyleValidationFlag="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Country:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrCountry" editMode="1" dataDefault="USA"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Email:</td> 
            <td colspan="3"><webbase:customerData dataType="Email" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Email Confirm: </td> 
            <td colspan="3"><webbase:customerData dataType="EmailC" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Username:</td> 
            <td colspan="3"><webbase:customerData dataType="WebLogin" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password:</td> 
            <td colspan="3"><webbase:customerData dataType="WebPassword" editMode="1"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password Confirm: </td> 
            <td colspan="3"><webbase:customerData dataType="WebPasswordC" editMode="1"/></td> 
          </tr> 
          <tr >
            <td class="mattrlabeltext">Secret Question: </td>
            <td colspan="3"><webbase:customerData dataType="WebQuestion" editMode="1"/>
          &nbsp;</td>
          </tr>
          <tr >
            <td class="mattrlabeltext">Secret Answer: </td>
            <td colspan="3"><webbase:customerData dataType="WebAnswer" editMode="1"/></td>
          </tr>
          <tr> 
            <td colspan="4" align="right">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="2" align="center"> <a href="WebBaseMain.do?NextURL=/Obits/ViewProfileSummary.jsp"><img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0"></a> </td> 
            <td colspan="2" align="center"><webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/Obits/ViewProfileSummary.jsp"> 
              <input name="imageField" type="image" src="../../../images/navigation/accept.gif" alt="Click To Log In" width="49" height="17" border="0"> 
              </webbase:formHelper> </td> 
          </tr> 
        </table> 
        <webbase:customerData dataType="SaveCustomer"/> 
        <webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/> 
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
