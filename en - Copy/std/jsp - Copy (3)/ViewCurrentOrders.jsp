<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "ViewCurrentOrders.jsp" );%>
<%-- session.putValue( "returnPage", "ViewCurrentOrders.jsp" );--%>
<%@ include file="header.jsp"%>
<webbase:mactiveAction dataType="NewOrder" dataValue=""/>
<webbase:TemplateControls dataType="clear"/>
<div class="container">
<h2>View Orders here</h2>
 <div class="row" style="padding:20px">
		   <webbase:OrderSearch orderType="IncompleteOrders">  Partials:
                 <table> <tr>
                    <td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="editpartialorder" /></td>
                    <td ><%--<webbase:OrderSearchDetail dataType="Position" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/>--%></td>
                    <td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="editpartialorder" /></td>
                    <td ><%--<webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/>--%></td>
                    <td ><%--<webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/>--%></td>
                    <td ><%--<webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/>--%></td>
                  </tr>
                  </webbase:OrderSearch>
				  </table>
</div>
<div class="row" style="padding:20px">
<h3>Saved  Orders </h3>

         <span class="lead">Select an order to view detailed information. </span>


			<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="table-striped">
					<tr>
						<td width="18%">&nbsp;Ad Order Number </td>
						<td width="18%" >Ad Classification</td>
						<td width="18%" >Sub-Classification</td>
						<td width="11%" >Creation Date</td>
						<td width="11%" >Start Date</td>
						<td width="10%" >End Date</td>
						<td width="10%" >Price</td>
					</tr>
					<webbase:OrderSearch orderType="Quote">
					<tr>
						<td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Position" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
					</tr>
					</webbase:OrderSearch>
    </table></div>
    <div class="row" style="padding:20px">
<h3>Current Orders </h3>
		<span class="lead">Select an order to view detailed information. </span>
			<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="table-striped">
					<tr>
						<td width="18%">&nbsp;Ad Order Number </td>
						<td width="18%" >Ad Classification</td>
						<td width="18%" >Sub-Classification</td>
						<td width="11%" >Creation Date</td>
						<td width="11%" >Start Date</td>
						<td width="10%" >End Date</td>
						<td width="10%" >Price</td>
					</tr>
					<webbase:OrderSearch orderType="ActiveNoQuote">
					<tr>
						<td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Position" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
					</tr>
					</webbase:OrderSearch>
        </table></div>
<div class="row" style="padding:20px">
<h3>Orders Expired in the Last 90 Days</h3>
			  <span class="lead">Select an order to view detailed information. </span>
			<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="table-striped">
					<tr>
						<td width="18%">&nbsp;Ad Order Number </td>
						<td width="18%" >Ad Classification</td>
						<td width="18%" >Sub-Classification</td>
						<td width="11%" >Creation Date</td>
						<td width="11%" >Start Date</td>
						<td width="10%" >End Date</td>
						<td width="10%" >Price</td>
					</tr>
					<webbase:OrderSearch orderType="Inactive" numberOfDays="90">
					<tr>
						<td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Position" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
						<td ><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
					</tr>
					</webbase:OrderSearch>
    </table></div>

<div style="clear: both;"></div>
    
    <div class="row">
                        <div class="col-md-12 col-md-offset-5">
                        <!--<input type="button" value="Back" class="btn btn-primary text-center" onclick="returnPop()" />-->
                        </div>
					</div>
  
</div>
<!--END test carousel-->

	<div class="col-md-2">
	</div>
	<div class="col-md-8">












	</div>
	<div class="col-md-2">
	</div>
</div>
<!--END row-->
	</div>


<%@ include file="footer.jsp"%>
</html>
