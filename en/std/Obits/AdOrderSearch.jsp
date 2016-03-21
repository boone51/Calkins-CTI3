<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/Obitswithmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">


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
    <td width="150" valign="top"><%@ include file="../includes/ObitsleftSide.htm"%></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
      <span class="PageName"> !! -- AdOrderSearch.jsp</span>
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
      <form method="post" action="WebBaseMain.do" name="OrderSearch">
        </font>&nbsp;
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
        <p align="center">Search Results</p><br>
	                    <webbase:OrderSearchCSV userQueryMode="1" dataType="OrderNumber,Placement,Position,Cdate,Fday,Lday,PosDescription,PrimaryOrderor,PrimaryOrderorAcctNumber,SortText,RSInvoiceText,ProductionComments,PONumber,OrderPrice,AdOrderStatus"><img src="/webbase/en/std/Obits/Excel-CSV-Icon-20px.gif" width="20" height="20" border=0 valign=center>  Click here to download an enhanced list of your search results.</webbase:OrderSearchCSV>
	                    <table width="635" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#9A9A9A">
  <tr>
    <td><iframe src="ObitSearchResultsSorted.jsp" name="OrderResultsSorted" id="OrderResultsSorted" width="635" height="100" scrolling="auto" frameborder="1" marginwidth="0" marginheight="0" align="left"></iframe></td>
  </tr>
</table>	
        <table width="400" border="0" align="center" cellpadding="2" cellspacing="0" class="navborder"> 
          <tr> 
            <td colspan="4" align="center">
			
			</td>
		  </tr>
			<tr>
			<td colspan="4" align="center">
			
			
            	<b>Use % as a wildcard in your searches.</b>&nbsp;&nbsp;For example, <br>
            	to find all occurrences of <b>greece</b> search for <b>%greece%</b><br>
            	<br><br>            	
           	</td> 
          </tr> 
          <tr class="bgcolor"> 
            <td width="100" align="right" class="mattrlabelcell">Order Number:</td> 
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="OrderNumber" editMode="1" /></td> 
          </tr>
          <tr class="bgcolor"> 
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
          </tr>
          <tr class="bgcolor"> 
            <td align="right" class="mattrlabelcell">Sort Text:</td> 
            <td colspan="3" align="left"><webbase:OrderSearchBy dataType="SortText" editMode="1" /></td> 
          </tr>
          <tr class="bgcolor"> 
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
          </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Created From:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchCreateDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>						  
		<td align="right" class="mattrlabelcell">Order Created To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchCreateDateTo" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Edit From:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchEditDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Edit To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchEditDateTo" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run From:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchRunDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Run To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchRunDateTo" editMode="1" /></td>
	  </tr> 
	  <tr>
		<td align="right" class="mattrlabelcell">Order Expire From:</td>  
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchExpireDateFrom" editMode="1" /></td>
	  </tr>
	  <tr>
		<td align="right" class="mattrlabelcell">Order Expire To:</td>
		<td colspan="3" align="left"><webbase:OrderSearchBy dataType="SearchExpireDateTo" editMode="1" /></td>
	  </tr> 
 
          <tr>          
		<td>&nbsp;</td> 
		<td colspan="2" align="center"><webbase:OrderSearchBy dataType="SubmitOrderSearchButton" label="Search"/>		</td> 
		<td width="136" colspan="2" align="center"> </td>
          </tr> 
        </table>
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
