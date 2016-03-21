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
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/ObitsleftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
      <span class="PageName"> !! -- ReviewOrder.jsp</span>
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/> 
	  <webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
	  <form name="ReviewOrder" method="post" action="WebBaseMain.do"> 
	  <%-- <webbase:adData dataType="TemplateValidation"/> --%>
      <webbase:errorData dataType="ErrorURL" nextURL="/Obits/ReviewOrder.jsp"/>
        <div align="center">
          <font color="#CC0000" size="3"><b> <webbase:errorData dataType="ErrorMsg"/> </b></font><br> 
		  <table width="400" border="0" cellpadding="0" cellspacing="0" class="navborder"> 
            <tr align="left"> 
              <td colspan="2" class="heading">Review
                Order</td> 
            </tr>
            <tr>
              <td colspan="2" valign="top">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="2">Your selected Ad Category
                is: <span class="mgroupname"><webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></span></td> 
            </tr> 
            <tr>
              <td colspan="2" class="mgrouptable">&nbsp;</td>
            </tr>
            <tr class="bgcolor"> 
              <td colspan="2" valign="top" style="padding: 8px;"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
			  <webbase:adIt>
              <tr>
                <td colspan="2" class="mgroupname">Ad Preview</td>
                </tr>
              <tr>
                <td colspan="2"><table width="100%"  border="1" cellspacing="0" cellpadding="4">
                  <tr>
                    <td><webbase:adData dataType="ImagePreviewAllVersions"/></td>
                  </tr>
                </table></td>
                </tr>
				
              <tr align="left">
                <td colspan="2" valign="top"><span class="mgroupname" style="font-weight: bold">Ad Information</span></td>
                </tr>
              <tr align="left">
                <td width="22%" valign="top" class="mattrlabeltext">Ad Type: </td>
                <td width="78%" valign="top" class="standard12px"><webbase:adData dataType="AdType"/></td>
              </tr>
              <tr align="left">
                <td valign="top" class="mattrlabeltext">Size:</td>
                <td valign="top" class="standard12px"><webbase:adData dataType="AdDepthInUnits"/></td>
              </tr>
              <tr align="left">
                <td valign="top" class="mattrlabeltext">Run Schedule: </td>
                <td valign="top" class="standard12px"><webbase:runScheduleIt><webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
                              <webbase:RSDetail dataType="NumInserts"/> 
                              day(s) starting
                              <webbase:RSDetail dataType="Fday"/> 
                              in
                              <webbase:RSDetail dataType="Product"/><br> 
                              <webbase:RSDetail dataType="DateRangeEnd"/> 
                    </webbase:runScheduleIt></td>
              </tr>
              <tr align="left">
                <td valign="top" class="mattrlabeltext">Price:</td>
                <td valign="top" class="standard12px"><webbase:adData dataType="AdPrice"/></td>
              </tr>
              </webbase:adIt>
            </table></td> 
              </tr> 
            <tr> 
              <td colspan="2" align="right" valign="top" class="mgrouptable">&nbsp;</td> 
            </tr> 
			  <webbase:showIf expression="!isAdOrderZeroCost" >
				<webbase:showIf expression="!isPaymentByInvoice" >
					<tr align="left">
				  		<td colspan="2" ><span class="mgroupname">Credit Card: <webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/></span></td>
					</tr>
					<tr align="left">
				 		 <td colspan="2" align="center" ><a href="WebBaseMain.do?NextURL=/Obits/AddCreditCard.jsp&urlaction=push"><img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0"></a></td>
					</tr>
					<tr align="left">
				  		<td colspan="2" >&nbsp;</td>
					</tr>
					<tr align="left">
				  		<td colspan="2" >&nbsp;</td>
					</tr>
				  </webbase:showIf>	
			  </webbase:showIf>
            <tr> 
              <td colspan="2" valign="top"  style="padding: 8px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="33%">
					    <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/AllOnePage.jsp"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0" alt="Back"></webbase:formHelper>					  
					</td>

                    <td width="34%" align="center">
                      <div align="center"> <webbase:orderData dataType="SaveQuoteBtn" nextURL="/Obits/OrderConfirmationQuote.jsp" label="Save as Quote"><img src="../../../images/navigation/saveasquote.gif" width="99" height="17"></webbase:orderData></div>                    
					</td>
                    <td width="33%">
                      <div align="right"> <webbase:orderData dataType="SaveOrderBtn" label="Save Order" nextURL="/Obits/OrderConfirmation.jsp"><img src="../../../images/navigation/place_ad_now.gif" width="89" height="17" border="0"></webbase:orderData> </div>                    </td>
                  </tr>
                </table>

                 
			  </td> 
            </tr> 
            <tr> 
              <td colspan="2" align="right" valign="top">&nbsp;</td> 
            </tr>
          </table> 
        </div> 
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
