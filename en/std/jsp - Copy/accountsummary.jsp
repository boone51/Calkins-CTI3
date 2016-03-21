<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<h2>Account Sumamry</h2>
	<form method="post" action="WebBaseMain.do" name="CustomerAccountSummary">
				<div class="row">
					<div class="col-md-4">
							<strong>Customer Information</strong>
											First Name:
											<webbase:customerData dataType="Fname" editMode="0" dataSource="U"/>
											Last Name:
											<webbase:customerData dataType="Lname" editMode="0" dataSource="U"/>
											Address:
											<webbase:customerData dataType="AddrStreet1" editMode="0" dataSource="U"/>
											City:
											<webbase:customerData dataType="AddrCity" editMode="0" dataSource="U"/>
											State</span>:
											<webbase:customerData dataType="AddrState" editMode="0" dataSource="U"/>
											Zip:
											<webbase:customerData dataType="AddrZip1" editMode="0" dataSource="U"/> - <webbase:customerData dataType="AddrZip2" editMode="0" dataSource="U"/>
					</div>
					<div class="col-md-8">
							Statement Month
											<webbase:transactionReport>
												Select a Different Month
												<webbase:transactionControls dataType="btnPreviousMonth" editMode="0" nextURL="/jsp/accountsummary.jsp">
													<img src="../../../images/navigation/arrowprevious.gif" width="19" height="17" border="0">
												</webbase:transactionControls>
												<webbase:transactionControls dataType="selectNewMonth" editMode="1" nextURL="/jsp/accountsummary.jsp"/>
												<webbase:transactionControls dataType="btnNextMonth" editMode="0" nextURL="/jsp/accountsummary.jsp"> 
													<img src="../../../images/navigation/arrownext.gif" width="19" height="17" border="0">
												</webbase:transactionControls>
												Customer Balance
												Date of Balance
												<webbase:customerData dataType="LastCreditRefreshDate" editMode="0"/>
												Current Balance
												$
												<webbase:customerData dataType="CurrentBalance" editMode="0"/>
												Account Summary
												Payments and Credits
												<webbase:transactionTotals dataType="PaymentCreditTotal"/>
												Purchases (Orders)
												<webbase:transactionTotals dataType="PurchaseTotal"/>
												Account Transaction(s)
								<table class="table-striped">
											<tr class="mattrlabeltext">
												<td width="24%">Posting Date</td>
												<td width="27%" >Trans Date</td>
												<td width="38%" >Transaction</td>
												<td width="11%" >Amount</td>
											</tr>
									<webbase:transactionIt>
											<tr>
												<td><webbase:transactionData dataType="PostedDate"/></td>
												<td ><webbase:transactionData dataType="TransactionDate"/></td>
												<td ><webbase:transactionData dataType="Transaction"/></td>
												<td ><webbase:transactionData dataType="Amount"/></td>
											</tr>		  
									</webbase:transactionIt>
								</table>
					</div>
					<!--<div class="col-md-2">
					</div>-->
				</div>
<!--END row-->
                <webbase:formHelper dataType="formList"/> 
				<webbase:formHelper dataType="FormValidate"/>
              </webbase:transactionReport>
    </form>
<!-- InstanceEndEditable -->
<%@ include file="../includes/footer.htm"%>
</html>