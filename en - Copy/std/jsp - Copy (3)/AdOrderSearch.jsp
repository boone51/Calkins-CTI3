<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "AdOrderSearch.jsp" );%>
<%@ include file="header.jsp"%>
<div class="container">
                <h2>Search Orders</h2>
                <div class="row">
                    <div class="col-xs-12 col-sm-2 col-md-2"><!-- InstanceBeginEditable name="options" --><%@ include file="menuLeft.jsp"%><!-- InstanceEndEditable --></div>
	<div class="col-xs-12 col-sm-7 col-md-7"><!-- InstanceBeginEditable name="content" -->

      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
          <td>Enter search criteria and click submit </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>

        <tr>
          <td><form method="post" action="WebBaseMain.do" name="OrderSearch">

        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="navborder">
          <tr>
            <td colspan="4">
            	<b>Use % as a wildcard in your searches.</b>&nbsp;&nbsp;For example, <br>
            	to find all occurrences of <b>greece</b> search for <b>%greece%</b><br>
            	<br><br>            	</td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Order Number:&nbsp; </td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="OrderNumber" editMode="1" /></td>
          </tr>
          <!--<tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Sort ID:</td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="PONumber" editMode="1" /></td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Run Schedule Invoice Text:</td>
            <td colspan="3" align="left" ><webbase:OrderSearchBy dataType="RSInvoiceText" editMode="1" /></td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Ordered By / Office Name: </td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="PrimaryOrderor" editMode="1" /></td>
          </tr>-->
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Ad Text:&nbsp; </td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="SortText" editMode="1" /></td>
          </tr>
          <!--<tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Ad Type:</td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="AdType" editMode="1" /></td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Product:</td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="Product" editMode="1" /></td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Placement:</td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="Placement" editMode="1" /></td>
          </tr>
          <tr class="bgcolor">
            <td align="right" class="mattrlabelcell">Position:</td>
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="Position" editMode="1" /></td>
          </tr>-->
	  <tr>
		<td align="right" class="mattrlabelcell">Order Created From:&nbsp; </td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchCreateDateFrom" editMode="1" /></td>
	  </tr>
       
	  <tr>
		<td align="right" class="mattrlabelcell">Order Created To:&nbsp; </td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchCreateDateTo" editMode="1" /></td>
	  </tr>
	  <!--<tr>
		<td align="right" class="mattrlabelcell">Order Edit From:&nbsp; </td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchEditDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Edit To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchEditDateTo" editMode="1" /></td>
	  </tr>-->
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run From:&nbsp; </td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchRunDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run To:&nbsp; </td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchRunDateTo" editMode="1" /></td>
	  </tr>
	  <!--<tr>
		<td align="right" class="mattrlabelcell">Order Expire From:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchExpireDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Expire To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchExpireDateTo" editMode="1" /></td>
	  </tr>-->

          <tr>
		<td>&nbsp;</td>
		<td colspan="2" align="center"><webbase:OrderSearchBy dataType="SubmitOrderSearchButton" label="Search"/>		</td>
		<td colspan="2" align="center"> </td>
          </tr>
        </table>
        <webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
      </form></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="mgroupname">Search Results </td>
        </tr>
        <tr>
          <td><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#9A9A9A">
  <tr>
    <td><webbase:OrderSearch userQueryMode="1">
              <tr>
                <td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="PosDescription" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="PONumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="PrimaryOrderor" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="RSInvoiceText" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>

              </tr>
              </webbase:OrderSearch> </td>
  </tr>
</table></td>
        </tr>
        <tr>
                      <td>  <input type="button" value="Back" class="btn btn-primary text-center" onclick="history.back(-1)" /></td>
        </tr>
      </table>
        <!-- InstanceEndEditable --></div><div class="col-xs-12 col-sm-3 col-md-3"></div>
</div>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
