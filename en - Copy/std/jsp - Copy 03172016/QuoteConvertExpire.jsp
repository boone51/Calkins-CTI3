<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">


<!-- InstanceBeginEditable name="JavaScript" -->
<script language="javascript">

</script>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>

</head>

<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/leftSideOptions.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
      <span class="PageName"> !! -- QuoteConvertExpire.jsp</span>
	  <form name="ViewOrders" method="post" action="WebBaseMain.do">
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder">
          <tr>
            <td class="pagetitlecell" style="font-weight: bold">Saved Ad </td>
          </tr>
          <tr>
            <td align="right"><img src="../../../images/spacer.gif" width="1" height="3"></td>
          </tr>
          <tr>
            <td align="center"><table width="400" border="0" cellspacing="0" cellpadding="2">
              <tr align="center">
                <td width="33%"><a href="WebBaseMain.do?NextURL=/jsp/ViewQuotes.jsp"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"></a></td>
                <td width="33%"><webbase:formHelper dataType="ConvertButton" label="Convert" nextURL="/jsp/ViewCurrentOrders.jsp">
              <img src="../../../images/navigation/PublishAd.gif" width="89" height="17"></webbase:formHelper></td>
                <td width="33%"><webbase:formHelper dataType="ExpireButton" label="Expire" nextURL="/jsp/ViewQuotes.jsp"><img src="../../../images/navigation/ExpireAd.gif" width="80" height="17"></webbase:formHelper></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td valign="top">&nbsp;</td>
          </tr>
          <tr class="bgcolor">
            <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="2">
			
			<webbase:adIt> 
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold"><strong>Order
                    Confirmation Number:<webbase:orderData dataType="Order Number" /></strong></td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold"><strong>Order
                    Status: <strong><webbase:orderData dataType="Order Status"/></strong></strong></td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold">Order
                    Cost: <webbase:orderData dataType="Total Price"/></td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold"><strong class="sectionHeading">Payment Info:</strong>
					<br>
					<webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/><br>
					<a href="WebBaseMain.do?NextURL=/jsp/AddCreditCard.jsp&urlaction=push">
				    <img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0"></a></td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold">&nbsp;</td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard" style="font-weight: bold">Ad Preview </td>
                </tr>
                <tr>
                  <td align="left" nowrap class="standard"> <webbase:Image dataType="PreviewContents"/></td>
                </tr>
                <tr> 
                  <td align="left" nowrap class="standard"><strong>Ad Type: </strong></td> 
                </tr> 
                <tr> 
                  <td align="left" nowrap class="standard"><webbase:adData dataType="AdType"/></td> 
                </tr> 
                <tr> 
                  <td align="left" nowrap class="standard"><strong>Number of Lines: </strong></td> 
                </tr> 
                <tr> 
                  <td align="left" nowrap class="standard"><webbase:adData  dataType="AdDepthInUnits"/></td> 
                </tr> 
                <tr> 
                  <td align="left" nowrap class="standard"><strong>Run Schedule: </strong><strong></strong></td> 
                </tr> 
                <tr> 
                  <td align="left" nowrap class="standard">					<webbase:runScheduleIt>
					 <webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
                    <webbase:RSDetail dataType="NumInserts"/> 
                    day(s) beginning on
                    <webbase:RSDetail dataType="Fday"/> 
                    in
                    <webbase:RSDetail dataType="Product"/> 
                    <br> 
					<webbase:RSDetail dataType="DateRangeEnd"/>
                    </webbase:runScheduleIt>					</td> 
                </tr> 
				</webbase:adIt>              </table></td>
          </tr>
          
          <tr>
              <td align="right" valign="top">
                <div align="center">Contact Customer Service for any assistance 
                  at (602) 444-8774</div>
              </td>
          </tr>
        </table>
        <webbase:formHelper dataType="formList"/><webbase:formHelper dataType="FormValidate"/>
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
