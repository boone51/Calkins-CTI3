
<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html public "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<head>
<Meta Name="DESCRIPTION" Content="">
<Meta Name="keywords" Content="">
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
//-->
</script>
<STYLE type=text/css>BODY {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
P {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
UL {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
OL {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
LI {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
DIV {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
TABLE {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
TR {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
BR {
	FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, Geneva, Verdana, Swiss, SunSans-Regular
}
H1 {
	COLOR: #369
}
H2 {
	COLOR: #369
}
H3 {
	COLOR: #369
}
H4 {
	COLOR: #369
}
H5 {
	COLOR: #369
}
H6 {
	COLOR: #369
}
A:hover {
	TEXT-DECORATION: none
}
.navhed {
	MARGIN-TOP: 2px; PADDING-LEFT: 4px; FONT-WEIGHT: bold; FONT-SIZE: 12px; MARGIN-BOTTOM: 0px; PADDING-BOTTOM: 0px; COLOR: #003; PADDING-TOP: 2px; FONT-FAMILY: arial, helvetica, sans-serif
}
.rnavlist {
	PADDING-RIGHT: 0px; PADDING-LEFT: 4px; FONT-WEIGHT: normal; FONT-SIZE: 10px; PADDING-BOTTOM: 4px; MARGIN: 0px 0px 0px 8px; COLOR: #006; TEXT-INDENT: -8px; LINE-HEIGHT: 11px; PADDING-TOP: 0px; FONT-FAMILY: verdana, arial, helvetica, sans-serif
}
.navhedwhite {
	MARGIN-TOP: 1px; PADDING-LEFT: 4px; FONT-WEIGHT: bold; FONT-SIZE: 12px; MARGIN-BOTTOM: 0px; PADDING-BOTTOM: 0px; COLOR: #fff; PADDING-TOP: 0px; FONT-FAMILY: arial, helvetica, sans-serif
}
.navlink {
	MARGIN-TOP: 0px; PADDING-LEFT: 4px; FONT-SIZE: 12px; MARGIN-BOTTOM: 0px; PADDING-BOTTOM: 2px; MARGIN-LEFT: 0px; LINE-HEIGHT: 12px; PADDING-TOP: 2px; FONT-FAMILY: arial, helvetica, sans-serif
}
.navlink A:link {
	COLOR: #fff
}
.navlink A:visited {
	COLOR: #fff
}
.navlink A:hover {
	COLOR: #fd0; TEXT-DECORATION: none
}
.navlink A:active {
	COLOR: #f90; TEXT-DECORATION: none
}
.rnavlist A:link {
	COLOR: #009
}
.rnavlist A:visited {
	COLOR: #636
}
.rnavlist A:hover {
	COLOR: #36f; TEXT-DECORATION: none
}
.rnavlist A:active {
	COLOR: #f90; TEXT-DECORATION: none
}
.tenpixel {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; LINE-HEIGHT: 12px; FONT-FAMILY: verdana, arial, helvetica, sans-serif
}
.10px {
	FONT-SIZE: 10px
}
.classyheds {
	MARGIN-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 14px; MARGIN-BOTTOM: 0px; PADDING-BOTTOM: 2px; LINE-HEIGHT: 14px; PADDING-TOP: 0px; FONT-FAMILY: "Arial Narrow", "Arial MT Condensed Light", "Helvetica Narrow", sans-serif; TEXT-ALIGN: center
}
.classylisting {
	MARGIN-TOP: 0px; FONT-SIZE: 10px; MARGIN-BOTTOM: 0px; PADDING-BOTTOM: 2px; MARGIN-LEFT: 9px; COLOR: #346; TEXT-INDENT: -9px; LINE-HEIGHT: 10px; PADDING-TOP: 0px; FONT-FAMILY: Verdana; TEXT-ALIGN: left
}
.classylisting A:link {
	COLOR: #009
}
.classylisting A:visited {
	COLOR: #636
}
.classylisting A:hover {
	COLOR: #36f; TEXT-DECORATION: none
}
.classylisting A:active {
	COLOR: #f90; TEXT-DECORATION: none
}
</STYLE>
<style type="text/css">
<!--
.m_group_header_cell {  background-color: #4f7194}
.m_attr_label_cell {  background-color: #FFFFFF}
.m_main_table {
	border-color: #FFFFFF #FFFFFF #FFFFFF #FFFFFF;
	border-top-width: 1;
	border-right-width: 1;
	border-bottom-width: 1;
	border-left-width: 1;
	background-color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 9px;
	font-style: normal;
	font-weight: normal;
	color: #000000;
}
.mgrouptable {  border-color: #FFFFFF #FFFFFF #FFFFFF #FFFFFF; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1; background-color: #FFFFFF}
.m_group_name {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #FFFFFF;
	font-size: 9pt}
.m_group_desc {
	font-style: italic;
	font-weight: bold;
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-small}
.m_attr_label_text {  color: #000000}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Mactive's Web Solutions - Making Publishing More Profitable</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"></td>
  </tr>
  <tr valign="top">
    <td>
      <table width="100%" border="0">
        <tr>
          <td width="806" height="100%" valign="top">            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr valign="top">
                <td>
                  <table width="100%" border="0">
                    <tr>
                      <td width="806" height="100%" valign="top">
                        <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
                        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2" color="#0033FF"><br>
                          <b>This email is to acknowledge your recent ad quote with
                          Classifieds.</b></font> <br>
                          <br>
                        </div>
                        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><b>Order
                          Confirmation Number: </b></font> <font face="Arial, Helvetica, sans-serif" size="2"><webbase:orderData dataType="Order Number" /></font>
                          <br>
                          <br>
                        </div>
                        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><b>Ad
                          Type: </b></font> <font face="Arial, Helvetica, sans-serif" size="2"><webbase:adData dataType="AdType"/></font>
                          <br>
                          <br>
                        </div>
                        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><b>Total
                          Order Price: </b></font> <font face="Arial, Helvetica, sans-serif" size="2"><webbase:orderData dataType="Total Price"/></font>
                          <br>
                          <br>
                        </div>
                        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><b>Ad
                          Run Schedule(s): </b></font><br>
                          <webbase:runScheduleIt> <webbase:RSDetail dataType="NumInserts"/></webbase:runScheduleIt>
                          <p align="left"><font size="2" face="Arial, Helvetica, sans-serif"><webbase:runScheduleIt>
                            day(s) beginning on <webbase:RSDetail dataType="Fday"/>
                            in <webbase:RSDetail dataType="Product"/> (<webbase:RSDetail dataType="Placement"/>:<webbase:RSDetail dataType="Position"/>)<br>
                            </webbase:runScheduleIt></font></p>
                        </div>
                        {navbar}

<%-- AdPay Click N Buy
<webbase:showIf expression="isOnlinePhotoUploaded">
  <webbase:AdPay dataType="ClickNBuy" useHref="true" useNewWindow="true">Click here to enhance your online ad.</webbase:AdPay> <br>
  If the link doesn't work, copy the below URL into your browser's address bar.<br>
  <webbase:AdPay dataType="ClickNBuy" useHref="false" useNewWindow="true"/>
</webbase:showIf> --%>

                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!-- TemplateEndEditable -->
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="1"><img src="../../../images/blue_pixel.gif" width="100%" height="1"></td>
  </tr>
  <tr bgcolor="#E0E0E0">
    <td height="8">
      <div align="center">
        <p align="center"><font size="-2" face="Arial, Helvetica, sans-serif">&copy;2001
          Mactive Inc. All rights reserved. </font></p>
      </div>
    </td>
  </tr>
</table>
<table
	width="100%"
	cellpadding="0"
	cellspacing="0"
	border="0">
  <tr>
    <td height="1" bgcolor="#000000" width="100%"></td>
  </tr>
</table>
<table
	width="100%"
	cellpadding="0"
	cellspacing="0"
	border="0">
  <tr>
    <td height="1" bgcolor="#000000" width="176"></td>
    <td height="1" bgcolor="#000000" width="956"></td>
  </tr>
</table>
</body>

</HTML>
