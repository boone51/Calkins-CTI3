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

      .InputFields {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: small;
        font-style: normal;
        font-weight: normal;
        color: #000000;
        vertical-align: top;
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

            <table border="0" cellpadding="0" cellspacing="0" width="100%">
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
            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="cccccc">
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
            <table width="100%" border="2" bgcolor="#cccccc">
              <tr class="Panels">
                <td width="580" height="23">Customer Information</td>
                <td width="220">Ad Preview</td>
              </tr>

              <tr>
                <td valign="top">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top"><td width="580" colspan="4">
                      <table width="100%" border="0" cellpadding="1" cellspacing="1">
                        <tr><td width="440">
                          <table width="100%" border="0" cellpadding="1" cellspacing="1">
                            <tr class="Labels">
                              <td width="145">Phone #1</td>
                              <td width="145">Phone #2</td>
                              <td width="145">Fax #</td>
                            </tr>
                            <tr class="InputFields">
                              <td><adbooker:CustomerTextarea dataType="Phone1" cols="16" /></td>
                              <td><adbooker:CustomerTextarea dataType="Phone2" cols="16" /></td>
                              <td><adbooker:CustomerTextarea dataType="Fax" cols="16" /></td>
                            </tr>
                            <tr class="Labels">
                              <td>Last/Company</td>
                              <td>First Name</td>
                              <td>Ordered By</td>
                            </tr>
                            <tr class="InputFields">
                              <td><adbooker:CustomerTextarea dataType="LastName" cols="16" /></td>
                              <td><adbooker:CustomerTextarea dataType="FirstName" cols="16" /></td>
                              <td><adbooker:CustomerTextarea dataType="OrderedBy" cols="16" /></td>
                            </tr>
                            <tr class="Labels">
                              <td>Account #</td>
                              <td>Email</td>
                              <td>Customer Type</td>
                            </tr>
                            <tr class="InputFields">
                              <td><adbooker:CustomerTextarea dataType="AccountNumber" cols="16" /></td>
                              <td><adbooker:CustomerTextarea dataType="Email" cols="16" /></td>
                              <td><adbooker:CustomerList dataType="CustomerType" /></td>
                            </tr>
                          </table>
                        </td>

                        <td width="140" valign="top">
                          <table width="100%" border="0" cellpadding="1" cellspacing="1">
                            <tr>
                              <td class="Labels"><adbooker:CustomerCheckbox dataType="Private">Private</adbooker:CustomerCheckbox></td>
                            </tr>
                            <tr>
                              <td class="Labels"><adbooker:CustomerCheckbox dataType="Subscriber">Subscriber</adbooker:CustomerCheckbox></td>
                            </tr>
                            <tr>
                              <td class="Labels"><adbooker:CustomerCheckbox dataType="Agency">Agency</adbooker:CustomerCheckbox></td>
                            </tr>
                            <tr>
                              <td class="Labels"><adbooker:CustomerCheckbox dataType="TaxExempt">Tax Exempt</adbooker:CustomerCheckbox></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>

                    <tr valign="top"><td colspan="4">
                      <table width="100%" border="0" cellpadding="1" cellspacing="1" class="Labels">
                        <tr class="Labels">
                          <td width="40%">Street Address</td>
                          <td width="20%">City</td>
                          <td width="20%">State/Prov</td>
                          <td width="20%">Country</td>
                        </tr>
                        <tr class="InputFields">
                          <td valign="top"><adbooker:CustomerTextarea dataType="Address1" cols="30" /></td>
                          <td valign="top"><adbooker:CustomerTextarea dataType="City" cols="12" /></td>
                          <td valign="top"><adbooker:CustomerList dataType="State" /></td>
                          <td valign="top"><adbooker:CustomerList dataType="Country" /></td>
                        </tr>
                        <tr>
                          <td valign="top" class="InputFields"><adbooker:CustomerTextarea dataType="Address2" cols="30" /></td>
                          <td class="Labels">Zip/Postal</td>
                          <td class="Labels">PO #</td>
                          <td class="Labels">Payment Method</td>
                        </tr>
                        <tr class="InputFields">
                          <td><adbooker:CustomerTextarea dataType="Address3" cols="30" /></td>
                          <td><adbooker:CustomerTextarea dataType="Zip" cols="4" />-<adbooker:CustomerTextarea dataType="ZipExt" cols="3" /></td>
                          <td><adbooker:CustomerTextarea dataType="PONumber" cols="12" /></td>
                          <td><adbooker:CustomerList dataType="PaymentMethod" /></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                </td>

                <td valign="top">
                  <table width="100%" border="0">
                    <tr>
                      <td valign="top"><adbooker:AdTextarea dataType="AdPreview" cols="24" rows="11" /></textarea></td>
                    </tr>
                    <tr>
                      <td class="InputFields"><a href="editthead.jsp">
                        <adbooker:AdBookerButton dataType="EditAdContent" nextURL="editthead.jsp" toolTipText="Edit Ad Content"><img src="../../images/editadcontent.gif" width="138" height="26" border="0"></adbooker:AdBookerButton>
                      </a></td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr class="Panels">
                <td colspan="2" height="23">Ad Information</td>
              </tr>

              <tr>
                <td valign="top">
                  <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr><td width="580" valign="top">
                      <table width="100%" border="0" cellpadding="1" cellspacing="1">
                        <tr>
                          <td width="25%" class="Labels">Ad Type</td>
                          <td width="12%" class="Labels">Width</td>
                          <td width="12%" class="Labels">Depth</td>
                          <td width="25%" class="Labels">Color</td>
                          <td width="25%" rowspan="4" valign="top">
                            <table border="0" cellpadding="1" cellspacing="1">
                              <tr>
                                <td class="Labels"><adbooker:AdCheckbox dataType="Coupon">Coupon</adbooker:AdCheckbox></td>
                              </tr>
                              <tr>
                                <td class="Labels"><adbooker:AdCheckbox dataType="Released">Released</adbooker:AdCheckbox></td>
                              </tr>
                              <tr>
                                <td class="Labels"><adbooker:AdCheckbox dataType="DoubleTruck">Double Truck</adbooker:AdCheckbox></td>
                              </tr>
                              <tr>
                                <td class="Labels"><adbooker:AdCheckbox dataType="Reversed">Reversed</adbooker:AdCheckbox></td>
                              </tr>
                            </table>
                          </td>
                        </tr>

                        <tr class="Labels">
                          <td valign="top"><adbooker:AdList dataType="AdType" /></td>
                          <td valign="top"><adbooker:AdList dataType="Width" /></td>
                          <td valign="top"><adbooker:AdTextarea dataType="Depth" cols="5" /></td>
                          <td valign="top"><adbooker:AdList dataType="Color" /></td>
                        </tr>

                        <tr class="Labels">
                          <td>Ad Subtype</td>
                          <td colspan="2">Production Method</td>
                          <td>Ad Number</td>
                        </tr>

                        <tr class="Labels">
                          <td valign="top"><adbooker:AdList dataType="AdSubtype" /></td>
                          <td colspan="2" valign="top"><adbooker:AdList dataType="ProductionMethod" /></td>
                          <td valign="top"><adbooker:AdTextarea dataType="AdNumber" cols="12" /></td>
                        </tr>
                      </table></td>
                    </tr>

                    <tr>
                      <td valign="top">
                        <table width="100%" border="0" cellpadding="1" cellspacing="1">
                          <tr><td width="540" valign="top"> <div style="width: 540px">
                            <table width="100%" border="1" cellpadding="1" cellspacing="0" id="header">
                              <tbody>
                                <tr class="TableBack">
                                  <th width="12%">Product</th>
                                  <th width="18%">Place</th>
                                  <th width="15%">Pos</th>
                                  <th width="12%">Start</th>
                                  <th width="12%">End</th>
                                  <th width="12%">Inserts</th>
                                  <th width="15%">Cost</th>
                                </tr>
                              </tbody>
                            </table>

                            <div style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px; overflow: auto; border-left: gray 1px solid; width: 540px; padding-top: 0px; border-bottom: gray 1px solid; border-right: gray 1px solid; height: 60px">
                              <table width="100%" id="dataTable" cellspacing="0" cellpadding="1" border="1">
                                <tbody>

                                  <adbooker:RunScheduleListIterator hasCheckbox="false">
                                    <adbooker:ListIteratorQuery dataType="Boolean" expression="IsEmpty">
                                      <td colspan="7" class="TableFront">&nbsp;No Data Available</td>
                                    </adbooker:ListIteratorQuery>

                                    <adbooker:ListIteratorQuery dataType="Boolean" expression="IsNotEmpty">
                                      <td width="12%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Product" /></td>
                                      <td width="18%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Placement" /></td>
                                      <td width="15%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Position" /></td>
                                      <td width="12%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Start" /></td>
                                      <td width="12%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="End" /></td>
                                      <td width="12%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Inserts" /></td>
                                      <td width="15%" class="TableFront">&nbsp;<adbooker:RunScheduleListDetail dataType="Cost" /></td>
                                    </adbooker:ListIteratorQuery>
                                  </adbooker:RunScheduleListIterator>

                                </tbody>
                              </table>
                            </div></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>

                <td valign="top">
                  <table width="90%" border="0" cellpadding="1" cellspacing="1">
                    <tr class="Labels">
                      <td width="50%">Product</td>
                      <td width="50%">Pl/Class</td>
                    </tr>

                    <tr class="Labels">
                      <td><adbooker:AdList dataType="Product" /></td>
                      <td><adbooker:AdList dataType="PlacementClass" /></td>
                    </tr>

                    <tr class="Labels">
                      <td>Edition</td>
                      <td>Pos/Sub-Class</td>
                    </tr>

                    <tr class="Labels">
                      <td><adbooker:AdList dataType="Edition" /></td>
                      <td><adbooker:AdList dataType="Position" /></td>
                    </tr>

                    <tr class="Labels">
                      <td>Zone</td>
                      <td>Promo Type</td>
                    </tr>

                    <tr class="Labels">
                      <td><adbooker:AdList dataType="Zone" /></td>
                      <td><adbooker:AdList dataType="PromotionType" /></td>
                    </tr>

                    <tr class="Labels">
                      <td>&nbsp;</td>
                      <td>Attribute</td>
                    </tr>

                    <tr class="Labels">
                      <td>&nbsp;</td>
                      <td><adbooker:AdList dataType="Attribute" /></td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td height="90" colspan="2" valign="top">
                  <table width="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr class="Labels">
                      <td width="25%">Order Invoice Text</td>
                      <td width="25%">Order Notes</td>
                      <td width="25%">Comments for Production</td>
                      <td width="25%">Ad Order Number</td>
                    </tr>

                    <tr valign="top">
                      <td><adbooker:AdTextarea dataType="OrderInvoiceText" cols="18" rows="2" /></td>
                      <td><adbooker:AdTextarea dataType="OrderNotes" cols="18" rows="2" /></td>
                      <td><adbooker:AdTextarea dataType="ProductionComments" cols="18" rows="2" /></td>
                      <td><adbooker:AdTextarea dataType="AdOrderNumber" cols="16" /></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
  </form>

  </body>
</html>
