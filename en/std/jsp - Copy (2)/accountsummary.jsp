<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <% session.putValue( "pageName", "accountsummary.jsp" );%>
<% session.putValue( "returnPage", "accountsummary.jsp" );%>
<%@ include file="header.jsp"%>

<div class="container">
    <h2>Account Sumamry</h2>
	<form method="post" action="WebBaseMain.do" name="CustomerAccountSummary">
				<div class="row">
                    <div class="col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
<div class="col-md-5">
    <strong>Customer Information</strong>
    <ul>
        <li>First Name:
            <webbase:customerData dataType="Fname" editMode="0" dataSource="U" />
        </li>
        <li>Last Name:
            <webbase:customerData dataType="Lname" editMode="0" dataSource="U" />
        </li>
        <li>Address:
            <webbase:customerData dataType="AddrStreet1" editMode="0" dataSource="U" />
        </li>
        <li>City:
            <webbase:customerData dataType="AddrCity" editMode="0" dataSource="U" />
        </li>
        <li>State:
            <webbase:customerData dataType="AddrState" editMode="0" dataSource="U" />
        </li>
        <li>Zip:
            <webbase:customerData dataType="AddrZip1" editMode="0" dataSource="U" /> -
            <webbase:customerData dataType="AddrZip2" editMode="0" dataSource="U" />
        </li>
    </ul>
</div>
<div class="col-md-5">

    Statement Month

    <webbase:transactionReport>
        <div class="row">
            <div>Select a Different Month</div>
            <div class="col-md-3 text-right">
                <webbase:transactionControls dataType="btnPreviousMonth" editMode="0" nextURL="/jsp/accountsummary.jsp">
                    <img src="../../../images/navigation/arrowprevious.gif" width="19" height="17" border="0">
                </webbase:transactionControls>
            </div>
            <div class="col-md-6">
                <webbase:transactionControls dataType="selectNewMonth" editMode="1" nextURL="/jsp/accountsummary.jsp" />
            </div>
            <div class="col-md-3 text-left">
                <webbase:transactionControls dataType="btnNextMonth" editMode="0" nextURL="/jsp/accountsummary.jsp">
                    <img src="../../../images/navigation/arrownext.gif" width="19" height="17" border="0">
                </webbase:transactionControls>
            </div>
        </div>
        <!--END row-->
        <div class="row">
            <div>Customer Balance</div>
            <ul class="list-unstyled">
                <li>Date of Balance
                    <webbase:customerData dataType="LastCreditRefreshDate" editMode="0" />
                </li>
                <li>Current Balance $
                    <webbase:customerData dataType="CurrentBalance" editMode="0" />
                </li>
                <li>Account Summary</li>
                <li>Payments and Credits
                    <webbase:transactionTotals dataType="PaymentCreditTotal" />
                </li>
                <li>Purchases (Orders)
                    <webbase:transactionTotals dataType="PurchaseTotal" />
                </li>
            </ul>
            Account Transaction(s)
        </div>
        <table class="table-striped">
            <tr class="mattrlabeltext">
                <td width="24%">Posting Date</td>
                <td width="27%">Trans Date</td>
                <td width="38%">Transaction</td>
                <td width="11%">Amount</td>
            </tr>
            <webbase:transactionIt>
                <tr>
                    <td>
                        <webbase:transactionData dataType="PostedDate" />
                    </td>
                    <td>
                        <webbase:transactionData dataType="TransactionDate" />
                    </td>
                    <td>
                        <webbase:transactionData dataType="Transaction" />
                    </td>
                    <td>
                        <webbase:transactionData dataType="Amount" />
                    </td>
                </tr>
            </webbase:transactionIt>
        </table>

    </webbase:transactionReport>
</div>
					<!--<div class="col-md-2">
					</div>-->
				</div>
<!--END row-->
                <webbase:formHelper dataType="formList"/>
				<webbase:formHelper dataType="FormValidate"/>

    </form>
    </div>
<!-- InstanceEndEditable -->
    <%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
