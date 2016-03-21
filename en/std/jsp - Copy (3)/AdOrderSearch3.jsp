<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!-- saved from url=(0022)http://internet.e-mail -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Ad Order Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../../jsp/allstyles.css" rel="stylesheet" type="text/css">
<!-- calendar stylesheet -->
<link rel="stylesheet" type="text/css" media="all" href="../../../scripts/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" /> 
<!-- main calendar program --> 
<script type="text/javascript" src="../../../scripts/calendar/calendar.js"></script> 
<!-- language for the calendar --> 
<script type="text/javascript" src="../../../scripts/calendar/lang/calendar-en.js"></script> 
<!-- the following script defines the Calendar.setup helper function --> 
<script type="text/javascript" src="../../../scripts/calendar/calendar-setup.js"></script> 
<!-- contains Mactive specific calendar related functions --> 
<script type="text/javascript" src="../../../scripts/calendar/calendar-mactive.js"></script>		
</head>

<body>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" -->  
      <form method="post" action="WebBaseMain.do" name="OrderSearch"> 
        <br> 
        <table width="400" border="0" align="center" cellpadding="2" cellspacing="0" class="navborder"> 
          <tr> 
            <td colspan="4"><span style="font-weight: bold">Search Orders</span></td> 
          </tr> 
          <tr class="bgcolor"> 
            <td width="162" align="right" class="mattrlabelcell">Order Number:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="OrderNumber" editMode="1" /></td> 
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">PO Number:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="PONumber" editMode="1" /></td> 
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Primary Orderor LName:</td> 
            <td colspan="3" ><webbase:OrderSearchBy dataType="PrimaryOrderor" editMode="1" /></td>  
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">RS Invoice Text:</td> 
            <td colspan="3" ><webbase:OrderSearchBy dataType="RSInvoiceText" editMode="1" /></td>  
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Order Invoice Text:</td> 
            <td colspan="3" ><webbase:OrderSearchBy dataType="OrderInvoiceText" editMode="1" /></td>  
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Sort Text:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="SortText" editMode="1" /></td> 
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Ad Type:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="AdType" editMode="1" /></td> 
          </tr> 
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Product:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="Product" editMode="1" /></td> 
          </tr> 
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Placement:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="Placement" editMode="1" /></td>  
          </tr> 
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Position:</td> 
            <td colspan="3"><webbase:OrderSearchBy dataType="Position" editMode="1" /></td> 
          </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Created From:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchCreateDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>						  
		<td align="right" class="mattrlabelcell">Order Created To:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchCreateDateTo" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Edit From:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchEditDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Edit To:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchEditDateTo" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run From:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchRunDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run To:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchRunDateTo" editMode="1" /></td>
	  </tr> 
	  <tr>
		<td align="right" class="mattrlabelcell">Order Expire From:</td>  
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchExpireDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Expire To:</td>
		<td colspan="3"><webbase:OrderSearchBy dataType="SearchExpireDateTo" editMode="1" /></td>
	  </tr> 
 
          <tr>          
		<td> <div align="center"><a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.htm"><img src="../../../images/navigation/logoff.gif" width="53" height="17" border="0"></a></div></td> 
		<td colspan="2" align="center"><webbase:OrderSearchBy dataType="SubmitOrderSearchButton" label="Search"/>
		</td> 
		<td colspan="2" align="center"> </td>
          </tr> 
        </table>
        <webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/> 
      </form>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
        <tr> 
          <td class="mgroupheadercell"><span class="mgroupname"><b>Select an order 
            from the search results below to view detailed information:</b></span></td> 
        </tr> 
        <tr> 
          <td class="mgroupheadercell">&nbsp;</td> 
        </tr> 
        <tr> 
          <td><table width="100%" border="0" cellpadding="2" cellspacing="2" align="center"> 
              <tr class="mattrlabeltext"> 
                <td width="11%">&nbsp;Ad Order Number </td> 
                <td width="11%" >Ad Classification</td> 
                <td width="11%" >Sub-Classification</td> 
                <td width="11%" >Creation Date</td> 
                <td width="11%" >Start Date</td> 
                <td width="11%" >PO Number</td> 
                <td width="11%" >Price</td>
                <td width="11%" >Orderor</td> 
                <td width="12%" >RSInvText</td>
              </tr> 
              <webbase:OrderSearch userQueryMode="1"> 
              <tr> 
                <td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="Position" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="PONumber" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
                <td ><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>
                <td ><webbase:OrderSearchDetail dataType="PrimaryOrderor" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td>  
                <td ><webbase:OrderSearchDetail dataType="RSInvoiceText" openOrderLinkType="view" openOrderURL="/jsp/ViewExistingOrder.jsp"/></td> 
 
              </tr> 
              </webbase:OrderSearch> 
               </table></td> 
        </tr> 
	<tr> 
          <td class="mgroupheadercell">&nbsp;</td> 
        </tr>  
     </table> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
