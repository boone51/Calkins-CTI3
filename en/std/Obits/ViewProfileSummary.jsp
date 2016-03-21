<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/ObitsleftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
<span class="PageName"> !! -- ViewProfileSummary.jsp</span>
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
	  <form method="post" action="WebBaseMain.do" name="myaccount"> 
        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" > 
          <tr>
            <td colspan="2" align="center" class="errormsg" ><webbase:errorData dataType='ErrorMsg'/>
            <webbase:errorData dataType='ErrorURL' nextURL='/Obits/ViewProfileSummary.jsp'/></td>
          </tr>
          <tr> 
            <td colspan="2" class="heading" >Profile Information</td> 
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" class="mattrlabeltext">Personal Information</td> 
          </tr> 
          <tr> 
            <td colspan="2">
              <webbase:customerData dataType="FullName" dataSource="U"/> </td> 
          </tr> 
          <tr> 
            <td colspan="2"><webbase:customerData dataType="AddrStreet1" dataSource="U"/></td> 
          </tr> 
          <tr> 
            <td colspan="2"><webbase:customerData dataType="AddrStreet2" dataSource="U" postValHTML="<br>"/> 
              <webbase:customerData dataType="AddrStreet3" dataSource="U" postValHTML="<br>"/> 
              <webbase:customerData dataType="AddrCity" dataSource="U"/> 
              ,
              <webbase:customerData dataType="AddrState" dataSource="U"/> 
              <webbase:customerData dataType="AddrZip1" dataSource="U"/> 
              - 
              <webbase:customerData dataType="AddrZip2" dataSource="U"/> 
              <webbase:customerData dataType="AddrCountry" dataSource="U"/></td> 
          </tr> 
          <tr> 
            <td colspan="2">( 
              <webbase:customerData dataType="PhoneAC" dataSource="U"/> 
              )
              <webbase:customerData dataType="Phone3" dataSource="U"/> 
              - 
              <webbase:customerData dataType="Phone4" dataSource="U"/> 
              <webbase:customerData dataType="Phonex" dataSource="U"/></td> 
          </tr> 
          <tr> 
            <td colspan="2"><webbase:customerData dataType="Email" dataSource="U"/></td> 
          </tr> 
          <tr> 
            <td colspan="2" align="center"><a href="WebBaseMain.do?NextURL=/Obits/editaccount.jsp"><img src="../../../images/navigation/editaccount.gif" width="99" height="17" border="0"></a></td> 
          </tr> 
          <tr> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="2" class="mattrlabeltext">Credit Cards on File</td> 
          </tr> 
          <tr>
            <td colspan="2" align="center"><a href="WebBaseMain.do?NextURL=/Obits/AddCreditCard.jsp&urlaction=push"><img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0"></a></td>
          </tr>
		  <webbase:CCardIt> 
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="mgroupname">&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td> 
            <td><webbase:CCardData dataType="CardKind"/></td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td><webbase:CCardData dataType="CardNum"/></td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td>Expires:
            <webbase:CCardData dataType="ExpDate"/></td>
          </tr> 
          <tr> 
            <td colspan="2" class="mgroupname">&nbsp;</td> 
          </tr> 
          <tr> 
            <td width="29">&nbsp;</td> 
            <td width="421"><webbase:CCardData dataType="Name"/></td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td><webbase:CCardData dataType="Addr1"/></td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td><webbase:CCardData dataType="City"/>
              ,
                <webbase:CCardData dataType="State"/>
                <webbase:CCardData dataType="Zip"/></td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
            <td><webbase:CCardData dataType="Phone"/></td>
          </tr> 
          <tr><td colspan="2"></webbase:CCardIt> 
                   </table> 
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
