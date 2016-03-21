<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/> 
<!DOCTYPE html><html><!-- #BeginTemplate "/Templates/withmenu.dwt" --><!-- DW6 -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">


<!-- #BeginEditable "JavaScript" -->
<script language="javascript">

</script>
<!-- #EndEditable -->
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
    <td width="150" valign="top"><!-- #BeginEditable "options" --><%@ include file="../includes/leftSide.htm"%><!-- #EndEditable --></td>
	<td width="600" valign="top"><!-- #BeginEditable "content" --> 
        <br>
        <br>
        <table width="75%" align="center">
          <tr> 
            <td> 
              <div align="center"><font face="Arial, Helvetica, sans-serif" size="4" color="#000000"> 
                <webbase:errorData dataType="ErrorMsg"/> </font></div>
            </td>
          </tr>
          <tr> 
            <td> 
              <div align="center"> <font face="Arial, Helvetica, sans-serif">You 
                may <A href="WebBaseMain.do">try again</A></font> </div>
            </td>
          </tr>
        </table>
        <!-- #EndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- #EndTemplate --></html>


