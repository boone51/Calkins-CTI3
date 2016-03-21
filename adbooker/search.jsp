<%@ taglib uri="/Mactive/AdBookerTags" prefix="adbooker" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Mactive JBooker</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <style type="text/css">
    <!--
      .Labels {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: x-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
        background-color: cccccc;
        vertical-align: bottom;
      }

      .Panels {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: x-small;
        font-style: normal;
        font-weight: bold;
        font-variant: normal;
        color: #000000;
        background-color: C4D2BC;
      }

      .TableBack {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
        background-color: #cccccc;
      }

      .TableFront {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
        background-color: #ffffff;
      }
    -->
    </style>
  </head>

  <body bgcolor="#2e3436">

  <form>
    <table width="800" height="600" border="3" align="center" cellpadding="3" cellspacing="3"><tr><td width="100%" colspan="2" valign="top">
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom" bgcolor="#cccccc">

            <script language="JavaScript">
            <!--
              function mmLoadMenus() {
                if (window.mm_menu_0202131037_0) return;

                window.mm_menu_0202131037_0 = new Menu("root",124,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#f2eeeb","#000084","left","middle",3,0,1000,-5,7,true,true,true,0,true,true);
                mm_menu_0202131037_0.addMenuItem("New&nbsp;Ad&nbsp;Order","location='index.jsp'");
                mm_menu_0202131037_0.addMenuItem("New&nbsp;Customer","location='index.jsp'");
                mm_menu_0202131037_0.addMenuItem("New&nbsp;Customer&nbsp;Order","location='index.jsp'");
                mm_menu_0202131037_0.addMenuItem("Find&nbsp;Order","location='index.jsp'");
                mm_menu_0202131037_0.addMenuItem("Find&nbsp;Customer","location='index.jsp'");
                mm_menu_0202131037_0.addMenuItem("Exit","location='index.jsp'");
                mm_menu_0202131037_0.hideOnMouseOut=true;
                mm_menu_0202131037_0.menuBorder=1;
                mm_menu_0202131037_0.menuLiteBgColor='#ffffff';
                mm_menu_0202131037_0.menuBorderBgColor='#555555';
                mm_menu_0202131037_0.bgColor='#555555';

                window.mm_menu_0202134724_1 = new Menu("root",140,16,"Verdana, Arial, Helvetica, sans-serif",10,"#000000","#ffffff","#f2eeeb","#000084","left","middle",3,0,1000,-5,7,true,true,true,0,true,true);
                mm_menu_0202134724_1.addMenuItem("New&nbsp;Search","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Expires&nbsp;Today","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Expires&nbsp;Tomorrow","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Expired&nbsp;Ads","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Today's&nbsp;Orders","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Killed&nbsp;Orders","location='index.jsp'");
                mm_menu_0202134724_1.addMenuItem("Non&nbsp;Publishable&nbsp;Orders","location='index.jsp'");
                mm_menu_0202134724_1.hideOnMouseOut=true;
                mm_menu_0202134724_1.menuBorder=1;
                mm_menu_0202134724_1.menuLiteBgColor='#ffffff';
                mm_menu_0202134724_1.menuBorderBgColor='#555555';
                mm_menu_0202134724_1.bgColor='#555555';

                mm_menu_0202134724_1.writeMenus();
              } // mmLoadMenus()
            //-->
            </script>

            <script language="JavaScript1.2" src="mm_menu.js"></script>
            <script language="JavaScript1.2">mmLoadMenus();</script>

            <table border="0" cellpadding="0" cellspacing="0" width="800">
              <tr>
                <td><img src="../../images/spacer.gif" width="27" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="19" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="34" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="39" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="681" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="1" height="1" border="0" alt=""></td>
              </tr>

              <tr>
                <td colspan="5"><img name="menu_r1_c1" src="../../images/menu_r1_c1.gif" width="800" height="10" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="1" height="10" border="0" alt=""></td>
              </tr>

              <tr>
                <td rowspan="2"><img name="menu_r2_c1" src="../../images/menu_r2_c1.gif" width="27" height="18" border="0" alt=""></td>
                <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0202131037_0,0,10,null,'menu_r2_c2');"><img name="menu_r2_c2" src="../../images/menu_r2_c2.gif" width="19" height="10" border="0" alt=""></a></td>
                <td rowspan="2"><img name="menu_r2_c3" src="../../images/menu_r2_c3.gif" width="34" height="18" border="0" alt=""></td>
                <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0202134724_1,0,10,null,'menu_r2_c4');"><img name="menu_r2_c4" src="../../images/menu_r2_c4.gif" width="39" height="10" border="0" alt=""></a></td>
                <td rowspan="2"><img name="menu_r2_c5" src="../../images/menu_r2_c5.gif" width="681" height="18" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="1" height="10" border="0" alt=""></td>
              </tr>

              <tr>
                <td><img name="menu_r3_c2" src="../../images/menu_r3_c2.gif" width="19" height="8" border="0" alt=""></td>
                <td><img name="menu_r3_c4" src="../../images/menu_r3_c4.gif" width="39" height="8" border="0" alt=""></td>
                <td><img src="spacer.gif" width="1" height="8" border="0" alt=""></td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td width="800" valign="bottom" bgcolor="cccccc">
            <table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="cccccc">
              <tr>
                <td><img src="../images/spacer.gif" width="596" height="1" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="1" height="1" border="0" alt=""></td>
              </tr>

              <tr>
                <td><img name="tabs_r1_c1" src="../../images/tabs_r1_c1.gif" width="400" height="4" border="0" alt=""></td>
                <td><img src="../../images/spacer.gif" width="1" height="1" border="0" alt=""></td>
              </tr>

              <tr>
                <td bgcolor="#cccccc">
                  <table border="0" cellpadding="0" cellspacing="0" width="400">
                    <tr>
                      <td><img src="../../images/spacer.gif" width="1" height="1" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="11" height="1" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="100" height="1" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="193" height="1" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="1" height="1" border="0" alt=""></td>
                    </tr>

                    <tr>
                      <td colspan="4"><img name="tabs2_r1_c1" src="../../images/tabs2_r1_c1.gif" width="400" height="4" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="1" height="4" border="0" alt=""></td>
                    </tr>

                    <tr>
                      <td><a href="index.jsp"><img name="tabs2_r2_c1" src="../../images/tabs2_r2_c1.gif" width="96" height="24" border="0" alt="Order"></a></td>
                      <td colspan="2"><a href="search.jsp"><img name="tabs2_r2_c2" src="../../images/tabs2_r2_c2.gif" width="111" height="24" border="0" alt="Search"></a></td>
                      <td><img name="tabs2_r2_c4" src="../../images/tabs2_r2_c4.gif" width="193" height="24" border="0" alt=""></td>
                      <td><img src="../../images/spacer.gif" width="1" height="24" border="0" alt=""></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td valign="top">
            <table width="100%" height="100%" border="2" bgcolor="#cccccc">
              <tr class="Panels">
                <td width="550" height="23">Search Results</td>
                <td width="250">Search Data</td>
              </tr>

              <tr>
                <td valign="top" bgcolor="#ffffff">
                  <div style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; overflow: auto; border-left: gray 1px solid; height: 100px; padding-top: 0px; border-bottom: gray 1px solid; border-right: gray 1px solid; width: 550px">
                    <table id="dataTable" cellspacing="0" cellpadding="1" border="1">
                      <tbody>
                        <tr bgcolor="#FFFFFF" class="TableBack" id="dataRow">
                          <td width="9%" valign="top">Acct #</td>
                          <td width="10%" valign="top">Last/Company</td>
                          <td width="10%" valign="top">First</td>
                          <td width="9%" valign="top">Phone 1</td>
                          <td width="9%" valign="top">Order Taker</td>
                          <td width="9%" valign="top">Customer Type</td>
                          <td width="9%" valign="top">Address 1</td>
                          <td width="9%" valign="top">Address 2</td>
                          <td width="8%" valign="top">City</td>
                          <td width="9%" valign="top">Territory</td>
                          <td width="9%" valign="top">Company</td>
                        </tr>

                        <adbooker:SearchResultCustomerListIterator hasCheckbox="false">
                          <adbooker:ListIteratorQuery dataType="Boolean" expression="IsEmpty">
                            <td colspan="11" cssClass="TableFront">&nbsp;No Data Available</td>
                          </adbooker:ListIteratorQuery>

                          <adbooker:ListIteratorQuery dataType="Boolean" expression="IsNotEmpty">
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="AccountNumber" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="LastName" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="FirstName" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="Phone1" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="OrderTaker" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="CustomerType" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="Address1" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="Address2" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="City" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="Territory" /></td>
                            <td class="TableFront">&nbsp;<adbooker:SearchResultCustomerListDetail dataType="Company" /></td>
                          </adbooker:ListIteratorQuery>
                        </adbooker:SearchResultCustomerListIterator>
                      </tbody>
                    </table>
                  </div>
                </td>

                <td valign="top">
                  <table width="100%" border="0">
                    <tr class="TableBack">
                      <td width="50%">Search Field</td>
                      <td width="50%">Value</td>
                    </tr>

                    <adbooker:SearchCriteriaListIterator hasCheckbox="false">
                      <td class="TableFront">&nbsp;<adbooker:SearchCriteriaListDetail dataType="Field" /></td>
                      <td class="TableFront">&nbsp;<adbooker:SearchCriteriaListDetail dataType="Value" /></td>
                    </adbooker:SearchCriteriaListIterator>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td></tr>
    </table>
  </form>

  </body>
</html>
