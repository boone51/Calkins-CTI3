// JavaScript Document

var hBar = new ItemStyle(100, 0, '', 0, 0, '#073356', '#848582', 'highText', 'lowText', '', '',
 null, null, 'hand', 'default');

var subM = new ItemStyle(22, 0, '&gt;', -10, 1, '#073356', '#2E3436', 'lowText', 'lowText',
 'itemBorder', 'itemBorder', null, null, 'hand', 'default');

var subBlank = new ItemStyle(22, 1, '&gt;', -15, 3, '#CCCCDD', '#6699CC', 'lowText', 'highText',
 'itemBorderBlank', 'itemBorder', null, null, 'hand', 'default');

var button = new ItemStyle(22, 1, '&gt;', -15, 2, '#2E3436', '#848582', 'buttonText', 'buttonHover',
 'buttonBorder', 'buttonBorderOver', 80, 95, 'crosshair', 'default');


var pMenu = new PopupMenu('pMenu');
with (pMenu)
{

startMenu('root', false, 0, 2, 17, hBar);

addItem('&nbsp; File', 'mFile', 'sm:');
addItem('&nbsp; Edit', 'mEdit', 'sm:');
addItem('&nbsp; Searches', 'mSearches', 'sm:');
addItem('&nbsp; Help', 'mHelp', 'sm:');

startMenu('mFile', true, 0, 15, 140, subM);
addItem('Import Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=importGraphic");', 'js:');
addItem('Delete Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=deleteGraphic");', 'js:');
addItem('Properties',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=propertiesGraphic");', 'js:');
addItem('Exit', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=exit");', 'js:');

startMenu('mEdit', true, 0, 15, 100, subM);
addItem('Copy', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsCopy");', 'js:');
addItem('Logo Group', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsLogoGroup");', 'js:');
addItem('Link Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsLink");', 'js:');
addItem('Unlink Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsUnlink");', 'js:');

startMenu('mSearches', true, 0, 15, 140, subM);
addItem('All Graphics',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchAllGraphics", "nextURL=graphics.jsp");', 'js:');
addItem('Customer Logos', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchCustomerLogos", "nextURL=graphics.jsp");', 'js:');
addItem('Logo Groups',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchLogoGroups", "nextURL=graphics.jsp");', 'js:');
addItem('Placement',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchPlacement", "nextURL=graphics.jsp");', 'js:');
addItem('Sales Rep',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchSalesRep", "nextURL=graphics.jsp");', 'js:');
addItem('Ad Category',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchAdCategory", "nextURL=graphics.jsp");', 'js:');

startMenu('mHelp', true, 0, 15, 110, subM);
addItem('Welcome', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=Welcome");', 'js:');
addItem('What&#8217;s New', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=WhatsNew");', 'js:');
addItem('Using WebBooker', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=usingWebBooker");', 'js:');
addItem('About WebBooker', 'about.jsp', 'window.open("about.jsp")');

startMenu('mWebBookerSearches', true, 100, 0, 140, subM);
addItem('My Customers',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchMyCustomers");', 'js:');
addItem('Expires Today', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchExpiredToday");', 'js:');
addItem('Expires Tomorrow',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchExpiresTomorrow");', 'js:');
addItem('Expired Ads',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchExpiredAds");', 'js:');
addItem('Todays Orders',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchTodaysOrders");', 'js:');
addItem('Killed Orders',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchKilledOrders");', 'js:');
addItem('Non Publishable Orders',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchNonPublishableOrders");', 'js:');

}
addMenuBorder(pMenu, window.subBlank,
 null, '#666666', 1, '#CCCCDD', 2);

addDropShadow(pMenu, window.subM,
 [40,"#333333",6,6,-4,-4], [40,"#666666",4,4,0,0]);
addDropShadow(pMenu, window.subBlank,
 [40,"#333333",6,6,-4,-4], [40,"#666666",4,4,0,0]);

if (!isOp && navigator.userAgent.indexOf('rv:0.')==-1)
{
 pMenu.showMenu = new Function('mN','menuAnim(this, mN, 10)');
 pMenu.hideMenu = new Function('mN','menuAnim(this, mN, -10)');
}
if (!isNS4)
{
 // Write menus now in non-NS4 browsers, by calling the "Fast" mode .update(true) method.
 pMenu.update(true);
 //anotherMenu.update(true);
}
else
{
 // For Netscape 4, back up the old onload function and make a new one to update our menus.
 // This is the regular "Dynamic" mode menu update, it works in IE and NS6 too if required.
 var popOldOL = window.onload;
 window.onload = function()
 {
  if (popOldOL) popOldOL();
  pMenu.update();
  //anotherMenu.update();
 }
}


// Other events must be assigned, these are less complicated, just add or remove menu objects.

var nsWinW = window.innerWidth, nsWinH = window.innerHeight, popOldOR = window.onresize;
window.onresize = function()
{
 if (popOldOR) popOldOR();
 if (isNS4 && (nsWinW!=innerWidth || nsWinH!=innerHeight)) history.go(0);
 pMenu.position();
 //anotherMenu.position();
}


window.onscroll = function()
{
 pMenu.position();
 //anotherMenu.position();
}


// NS4 can't reliably capture clicks on layers, so here's a workaround.
if (isNS4)
{
 document.captureEvents(Event.CLICK);
 document.onclick = function(evt)
 {
  with (pMenu) if (overI) click(overM, overI);
  //with (anotherMenu) if (overI) click(overM, overI);
  return document.routeEvent(evt);
 }
}

// Activate the window.onscroll() event in non-Microsoft browsers.
if (!isIE || isOp)
{
 var nsPX=pageXOffset, nsPY=pageYOffset;
 setInterval('if (nsPX!=pageXOffset || nsPY!=pageYOffset) ' +
 '{ nsPX=pageXOffset; nsPY=pageYOffset; window.onscroll() }', 50);
}

