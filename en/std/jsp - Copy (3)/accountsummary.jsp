<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
    <% session.putValue( "pageName", "accountsummary.jsp" );%>
<% session.putValue( "returnPage", "accountsummary.jsp" );%>
<%@ include file="header.jsp"%>
<style>
.table-striped {
    border: 1px solid #666;
    padding: 10px;
}

.table-striped td {
    padding: 2px;
    border: 1px solid #999;
}    
</style>
<div class="container">
    <h2>Account Summary</h2>
	<form method="post" action="WebBaseMain.do" name="CustomerAccountSummary">
				<div class="row">
                    <div class="col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
<div class="col-md-5">
    <h4>Customer Information</h4>
    
    
    <ul class="list-unstyled">
				<li>Account Number:
				<webbase:customerData dataType="Accno" dataSource="U"/></li>
				<li>Name:
				<webbase:customerData dataType="FullName" dataSource="U"/></li>
				<li>Address:
				<webbase:customerData dataType="AddrStreet1" dataSource="U"/></li>
				<li>Address 2:
				<webbase:customerData dataType="AddrStreet2" dataSource="U"/></li>
				<li>Address 3:
				<webbase:customerData dataType="AddrStreet3" dataSource="U"/></li>
				<li>City:
				<webbase:customerData dataType="AddrCity" dataSource="U"/></li>
				<li>State:
				<webbase:customerData dataType="AddrState" dataSource="U"/></li>
				<li>Zip:
				<webbase:customerData dataType="AddrZip1" dataSource="U"/></li>
<!--
				<li>Country:
				<webbase:customerData dataType="AddrCountry" dataSource="U"/></li>
-->
				<li>Phone: (<webbase:customerData dataType="PhoneAC" dataSource="U"/>) <webbase:customerData dataType="Phone3" dataSource="U"/>-<webbase:customerData dataType="Phone4" dataSource="U"/> Ext. <webbase:customerData dataType="Phonex" dataSource="U"/> </li>
<!--				<li>Secondary Phone: (<webbase:customerData dataType="SecPhoneAC" dataSource="U"/>) <webbase:customerData dataType="SecPhone3" dataSource="U"/>-<webbase:customerData dataType="SecPhone4" dataSource="U"/> Ext. <webbase:customerData dataType="SecPhonex" dataSource="U"/> </li>-->
				<li>Email:
				<webbase:customerData dataType="Email" dataSource="U"/></li>
				</ul>
    <!--<ul>
        
        
        
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
    </ul>-->
    <a href="WebBaseMain.do?NextURL=/jsp/editaccount.jsp"><img src="../../../images/navigation/but_editaccount.png" border="0"></a>
    
    
			<h4>Credit Cards on File </h4>
<!--                <a href="javascript:void(0)" onClick="document.addCC.submit()"><button type="button" class="btn btn-info">Add Credit Card</button></a>-->

				<!--<a href="WebBaseMain.do?NextURL=/jsp/AddCreditCard.jsp&urlaction=push">
				<img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0">
				</a> -->
				<!--BEGIN Stored Cards-->
					  <webbase:CCardIt>
						<ul class="list-unstyled ckind">
						<li><webbase:CCardData dataType="CardKind"/></li>
						<li><webbase:CCardData dataType="CardNum"/></li>
						<li>Expires:
						<webbase:CCardData dataType="ExpDate"/></li>
						<li><webbase:CCardData dataType="Name"/></li>
						<li><webbase:CCardData dataType="Addr1"/></li>
						<li><webbase:CCardData dataType="City"/>
						  ,
							<webbase:CCardData dataType="State"/>
							<webbase:CCardData dataType="Zip"/></li>
						<li><webbase:CCardData dataType="Phone"/></li>
						</ul>
					  </webbase:CCardIt>
				<!--END Stored Cards-->
	
    
</div>
<div class="col-md-5">

    <div class="row"> <h4>Statement Month</h4></div>

    <webbase:transactionReport>
        <div class="row">
            <div>Select a Different Month</div>
            <div class="col-md-3 text-right" style="margin-top:12px">
                <webbase:transactionControls dataType="btnPreviousMonth" editMode="0" nextURL="/jsp/accountsummary.jsp">
                    <img src="../../../images/navigation/but_previousarrow.png" border="0">
                </webbase:transactionControls>
            </div>
            <div class="col-md-6">
                <webbase:transactionControls dataType="selectNewMonth" editMode="1" nextURL="/jsp/accountsummary.jsp" />
            </div>
            <div class="col-md-3 text-left" style="margin-top:12px">
                <webbase:transactionControls dataType="btnNextMonth" editMode="0" nextURL="/jsp/accountsummary.jsp">
                    <img src="../../../images/navigation/but_nextarrow.png" border="0">
                </webbase:transactionControls>
            </div>
        </div>
        <!--END row-->
        <div class="row">
            <div><h4>Customer Balance</h4></div>
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
            <h4>Account Transaction(s)</h4>
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
                    <!--<div class="row">
                        <div class="col-md-12 col-md-offset-6">
                        <input type="button" value="Back" class="btn btn-primary text-center" onclick="history.back(-1)" />
                        </div>
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
