<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
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
	<span class="PageName"> !! -- OrderConfirmationQuote.jsp</span>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
<form name="ConfirmOrder" method="post" action="WebBaseMain.do">
<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/Obits/OrderConfirmation.jsp'/>
        
		
		<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder">
          <tr> 
            <td class="heading">Quote Order Confirmation</td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
          </tr>
          <tr> 
            <td valign="top">Your selected Ad Category 
              is:<span class="mgroupname">  <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
            </span></td>
          </tr>
          
          <tr> 
            <td valign="top" >&nbsp;</td>
          </tr>
          <tr class="bgcolor"> 
            <td valign="top"> 
              <table width="100%"  border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td colspan="2"><span class="mgroupname">Order Confirmation Number:</span> <span class="mattrlabeltext"><webbase:orderData dataType="Order Number" /></span></td>
              </tr>
              <tr>
                <td colspan="2">Total Price:<span class="mattrlabeltext"><webbase:orderData dataType="Total Price"/></span></td>
              </tr>
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
			  <webbase:adIt>
              <tr>
                <td colspan="2"><span class="mgroupname" style="font-weight: bold">Ad Preview</span></td>
                </tr>
              <tr>
                <td colspan="2"><table width="100%"  border="1" cellspacing="0" cellpadding="4">
                  <tr>
                    <td><webbase:adData dataType="ImagePreviewAllVersions"/></td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td colspan="2"><span class="mgroupname" style="font-weight: bold">Ad Information</span></td>
                </tr>
              <tr>
                <td width="22%">Ad Type: </td>
                <td width="78%" class="standard12px"><webbase:adData dataType="AdType"/></td>
              </tr>
              <tr>
                <td>Size:</td>
                <td class="standard12px"><webbase:adData dataType="AdDepthInUnits"/></td>
              </tr>
              <tr>
                <td>Run Schedule: </td>
                <td class="standard12px"><webbase:runScheduleIt> 
                              <webbase:RSDetail dataType="NumInserts"/> 
                              day(s) starting
                              <webbase:RSDetail dataType="Fday"/> 
                              in
                              <webbase:RSDetail dataType="Product"/> 
                              <br> 
                              </webbase:runScheduleIt></td>
              </tr>
              <tr>
                <td>Price:</td>
                <td class="standard12px"><webbase:adData dataType="AdPrice"/></td>
              </tr>
			  </webbase:adIt>
            </table>            </td>
          </tr>
          <tr> 
            <td align="right" valign="top" colspan="4">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td valign="top" colspan="4"> 
              <div align="center">
                <webbase:orderData dataType="CloseOrderBtn" label="Continue" > 
                <img src="../../../images/navigation/placeanotherad.gif" width="115" height="17"> 
                </webbase:orderData></div>            </td>
          </tr>
          <tr> 
            <td align="right" valign="top" width="88"><a href="WebBaseMain.do?cmd=LogOff&NextURL=/Obits/logout.jsp"><img src="../../../images/navigation/logoff.gif" width="54" height="17" BORDER=0></a></td>
            
          </tr>
        </table>
		 <webbase:formHelper dataType="formList"/> <webbase:formHelper dataType="FormValidate"/> 
</form>
<!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
