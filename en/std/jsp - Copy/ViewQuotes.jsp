<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <td colspan="2"><%@ include file="../includes/header.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/leftSideOptions.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
	<span class="PageName"> !! -- ViewQuotes.jsp</span>
      <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder">
        <tr>
          <td class="heading" style="font-weight: bold">View Saved Ads </td>
        </tr>
        <tr>
          <td class="mgrouptable">Select a quote to convert or expire.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="2" cellspacing="2" align="center">
              <tr>
                <td colspan="6" class="mgroupname">Saved Ads </td>
              </tr>
              <tr>
                <td width="18%">Ad Order Number </td>
                <td width="18%">Ad Classification</td>
                <td width="11%">Creation Date</td>
                <td width="11%">Start Date</td>
                <td width="10%">End Date</td>
                <td width="10%">Price</td>
              </tr>
              <webbase:OrderSearch orderType="Quote">
              <tr>
                <td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/QuoteConvertExpire.jsp"/></td>
              </tr>
              </webbase:OrderSearch>
              <tr>
                <td colspan="6">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="6" class="mgroupname">Expired Saved Ads </td>
              </tr>
              <tr>
                <td width="18%">Ad Order Number </td>
                <td width="18%">Ad Classification</td>
                <td width="11%">Creation Date</td>
                <td width="11%">Start Date</td>
                <td width="10%">End Date</td>
                <td width="10%">Price</td>
              </tr>
              <webbase:OrderSearch orderType="ExpiredQuote">
              <tr>
                <td><webbase:OrderSearchDetail dataType="OrderNumber" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Placement" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Cdate" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Fday" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="Lday" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
                <td><webbase:OrderSearchDetail dataType="OrderPrice" openOrderLinkType="view" openOrderURL="/jsp/QuoteExpire.jsp"/></td>
              </tr>
              </webbase:OrderSearch>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
