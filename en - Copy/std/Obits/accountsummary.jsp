<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
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
	<span class="PageName"> !! -- accountsummary.jsp</span>
			<form method="post" action="WebBaseMain.do" name="CustomerAccountSummary">
            <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" >
              <tr>
                <td colspan="2" class="heading" >Account Sumamry</td>
              </tr>
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" class="mgroupname">Customer
                        Information</td>
              </tr>
              <tr >
                <td width="159" class="mattrlabeltext">First Name:</td>
                <td><webbase:customerData dataType="Fname" editMode="0" dataSource="U"/></td>
              </tr>
              <tr >
                <td class="mattrlabeltext">Last Name:</td>
                <td><webbase:customerData dataType="Lname" editMode="0" dataSource="U"/></td>
              </tr>
              <tr >
                <td class="mattrlabeltext">Address:</td>
                <td><webbase:customerData dataType="AddrStreet1" editMode="0" dataSource="U"/></td>
              </tr>
              <tr >
                <td class="mattrlabeltext">City:</td>
                <td><webbase:customerData dataType="AddrCity" editMode="0" dataSource="U"/></td>
              </tr>
              <tr >
                <td class="mattrlabeltext">State</span>:</td>
                <td><webbase:customerData dataType="AddrState" editMode="0" dataSource="U"/></td>
              </tr>
              <tr >
                <td class="mattrlabeltext">Zip:</td>
                <td><webbase:customerData dataType="AddrZip1" editMode="0" dataSource="U"/> - <webbase:customerData dataType="AddrZip2" editMode="0" dataSource="U"/></td>
              </tr>
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" class="mgroupname">Statement
                    Month</td>
              </tr><webbase:transactionReport>
              <tr>
                <td class="mattrlabeltext">Select a Different Month</td>
                <td><table width="200" border="0" cellspacing="0" cellpadding="4">
                    <tr>
                      <td width="63" align="right"><webbase:transactionControls dataType="btnPreviousMonth" editMode="0" nextURL="/Obits/accountsummary.jsp"><img src="../../../images/navigation/arrowprevious.gif" width="16" height="15" border="0"></webbase:transactionControls></td>
                      <td width="37" align="center"><webbase:transactionControls dataType="selectNewMonth" editMode="1" nextURL="/Obits/accountsummary.jsp"/></td>
                      <td width="76"><webbase:transactionControls dataType="btnNextMonth" editMode="0" nextURL="/Obits/accountsummary.jsp"> <img src="../../../images/navigation/arrownext.gif" width="16" height="15" border="0"></webbase:transactionControls>
</td>
                    </tr>
                  </table>                  </td>
              </tr>
				
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" class="mgroupname">Customer
                    Balance</td>
              </tr>
              <tr>
                <td class="mattrlabeltext">Date of Balance</td>
                <td>
                <webbase:customerData dataType="LastCreditRefreshDate" editMode="0"/></td>
              </tr>
              <tr>
                <td class="mattrlabeltext">Current Balance</td>
                <td>$
                <webbase:customerData dataType="CurrentBalance" editMode="0"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" class="mgroupname">Account
                    Summary</td>
              </tr>
              <tr>
                <td class="mattrlabeltext">Payments and Credits</td>
                <td>
                <webbase:transactionTotals dataType="PaymentCreditTotal"/></td>
              </tr>
              <tr>
                <td class="mattrlabeltext">Purchases (Orders)</td>
                <td>
                <webbase:transactionTotals dataType="PurchaseTotal"/></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2" class="mgroupname">Account
                    Transaction(s)</td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="2" align="center">
          <tr class="mattrlabeltext">
            <td width="24%">Posting
                Date</td>
            <td width="27%" >Trans
                Date</td>
            <td width="38%" >Transaction</td>
            <td width="11%" >Amount</td>
          </tr>
		  <webbase:transactionIt>
          <tr>
            <td><webbase:transactionData dataType="PostedDate"/></td>
            <td ><webbase:transactionData dataType="TransactionDate"/></td>
            <td ><webbase:transactionData dataType="Transaction"/></td>
            <td ><webbase:transactionData dataType="Amount"/></td>
          </tr>		  </webbase:transactionIt>
        </table></td>
              </tr>
              <tr>
                <td colspan="2"><webbase:formHelper dataType="formList"/> <webbase:formHelper dataType="FormValidate"/></td>
              </tr></webbase:transactionReport>
            </table>
            </form>
<!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
