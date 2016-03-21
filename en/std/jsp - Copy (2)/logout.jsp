<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html><!-- #BeginTemplate "/Templates/nomenu.dwt" --><!-- DW6 -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
<link href="marketplacestyle.css" rel="stylesheet" type="text/css">
<link href="../includes/3rdpartyheaders_update.css" rel="stylesheet" type="text/css">
</head>

<body>
<center>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td><!-- #BeginEditable "content" --> 
        <span class="PageName"> !! -- logout.jsp</span>
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
            
          <td height="20"> 
            <div align="center"> 
                      <p align="center"><font size="2" face="Arial, Helvetica, sans-serif">You 
                        have successfully logged out.</font></p>
                      <p align="center"><font size="2" face="Arial, Helvetica, sans-serif"><A href="WebBaseMain.do">Re-enter 
                        site.</A></font></p>
            </div>
            </td>
          </tr>
        </table>
        <!-- #EndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</center>
</body>
<!-- #EndTemplate --></html>


