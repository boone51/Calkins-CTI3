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
     <span class="PageName"> !! -- ViewExpiredOrders.jsp</span>
	  <form name="ViewOrders" method="post" action="WebBaseMain.do"> 
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr> 
            <td colspan="3" class="heading">ORDER CONFIRMATION</td> 
          </tr> 
          <tr> 
            <td colspan="3" align="right"><img src="../../../images/spacer.gif" width="1" height="3"></td> 
          </tr> 
          <tr> 
            <td align="center"><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp"><img src="../../../images/navigation/back.gif" width="49" height="17" border="0"></a></td> 
            <td align="right">&nbsp;</td> 
            <td align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="3" valign="top">&nbsp;</td> 
          </tr> 
          <tr> 
            <td width="252" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="2"> 
                <tr> 
                  <td nowrap class="standard"><strong>Order Status: </strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong class="standard12px"> 
                    <webbase:orderData dataType="Order Status"/> 
                    </strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong>Order Confirmation Number:</strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard12px"><webbase:orderData dataType="Order Number" /></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong>Ad Type: </strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard12px"><webbase:adData dataType="AdType"/></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong>Number of Lines: </strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard12px"><webbase:adData  dataType="AdDepthInUnits"/></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong>Run Schedule: </strong><strong></strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard12px"><webbase:runScheduleIt> 
                    <webbase:RSDetail dataType="NumInserts"/> 
                    day(s) beginning on
                    <webbase:RSDetail dataType="Fday"/> 
                    in
                    <webbase:RSDetail dataType="Product"/> 
                    <br> 
                  </webbase:runScheduleIt></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard"><strong>Total Price: </strong></td> 
                </tr> 
                <tr> 
                  <td nowrap class="standard12px"><webbase:orderData dataType="Total Price"/></td> 
                </tr> 
              </table></td> 
            <td width="2" class="bglight"><img src="../../../images/spacer.gif" width="2" height="1"></td> 
            <td width="143" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                <tr> 
                  <td width="10"> <img src="../../../images/spacer.gif" width="10" height="8"> </td> 
                  <td align="center"> <strong><span class="standard">Ad Preview</span></strong> 
                    <table width="20" border="1" align="center" cellpadding="2" cellspacing="2"> 
                      <tr> 
                        <td><webbase:adData dataType="ImagePreview"/></td> 
                      </tr> 
                    </table></td> 
                  <td width="10"><img src="../../../images/spacer.gif" width="10" height="8"></td> 
                </tr> 
              </table></td> 
          </tr> 
          <tr> 
            <td colspan="3" align="right" valign="top">&nbsp;</td> 
          </tr> 
          <tr> 
            <td align="center" valign="top"><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp"><img src="../../../images/navigation/back.gif" width="49" height="17" border="0"></a></td> 
            <td align="right" valign="top">&nbsp;</td> 
            <td align="center" valign="top">&nbsp;<webbase:formHelper dataType="formList"/> 
              <webbase:formHelper dataType="FormValidate"/> </td> 
          </tr> 
          <tr> 
            <td colspan="3" align="right" valign="top">&nbsp;</td> 
          </tr> 
        </table> 
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
