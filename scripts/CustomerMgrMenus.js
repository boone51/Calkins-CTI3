// JavaScript Document

var hBar = new ItemStyle(100, 0, '', 0, 0, '#073356', '#848582', 'highText', 'lowText', '', '',
 null, null, 'hand', 'default');

var subM = new ItemStyle(22, 0, '&gt;', -10, 1, '#848582', '#2E3436', 'lowText', 'lowText',
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
addItem('&nbsp; Options', 'mOptions', 'sm:');
addItem('&nbsp; Transactions', 'mTransactions', 'sm:');
addItem('&nbsp; Searches', 'mSearches', 'sm:');
addItem('&nbsp; Help', 'mHelp', 'sm:');

startMenu('mFile', true, 0, 17, 120, subM);
addItem('New Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=newCustomer");', 'js:');
addItem('Save Customer', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=saveCustomer");', 'js:');
addItem('Delete Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=deleteCustomer");', 'js:');
addItem('Transmit Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=transmitCustomer");', 'js:');
addItem('Refresh Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=refreshCustomer");', 'js:');
addItem('Previous Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=previousCustomer");', 'js:');
addItem('Next Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=nextCustomer");', 'js:');

startMenu('mEdit', true, 0, 15, 80, subM);
addItem('Cut', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=EditCustomerCut");', 'js:');
addItem('Copy', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=EditCustomerCopy");', 'js:');
addItem('Paste', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=EditCustomerPaste");', 'js:');
addItem('Clear', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=EditCustomerClear");', 'js:');

startMenu('mOptions', true, 0, 15, 120, subM);
addItem('Auto Wild Card', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=AutoWildCard");', 'js:');
addItem('Change Password', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=ChangePassword");', 'js:');
addItem('Refresh Credit', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=RefreshCredit");', 'js:');

startMenu('mTransactions', true, 0, 15, 120, subM);
addItem('Payment', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=Payment");', 'js:');
addItem('Bad Debt Payment', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=BadDebtPayment");', 'js:');
addItem('Credit Debit Memo', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=CreditDebitMemo");', 'js:');
addItem('Show Transactions', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=ShowTransactions");', 'js:');

startMenu('mSearches', true, 0, 15, 120, subM);
addItem('My Customers',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchMyCustomers");', 'js:');
addItem('Find Customer',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=findCustomer");', 'js:');
addItem('New Search',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=newSearch");', 'js:');

startMenu('mHelp', true, 0, 15, 110, subM);
addItem('Welcome', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=Welcome");', 'js:');
addItem('What&#8217;s New', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=WhatsNew");', 'js:');
addItem('Using WebBooker', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=usingWebBooker");', 'js:');
addItem('About WebBooker', 'about.jsp', 'window.open("about.jsp")');

startMenu('mPrint', true, 100, 0, 160, subM);
addItem('Print',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printCustomer");', 'js:');
addItem('Search Results',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printCustomer");', 'js:');
addItem('Contact Srch Results',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printCustomer");', 'js:');
addItem('Contact Prsn Srch Results',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printCustomer");', 'js:');

startMenu('meditGraphics', true, 100, 0, 100, subM);
addItem('Copy', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsCopy");', 'js:');
addItem('Logo Group', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsLogoGroup");', 'js:');
addItem('Link Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsLink");', 'js:');
addItem('Unlink Graphic', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=graphicsUnlink");', 'js:');

startMenu('mgraphicSearches', true, 100, 0, 140, subM);
addItem('All Graphics',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchAllGraphics");', 'js:');
addItem('Customer Logos', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchCustomerLogos");', 'js:');
addItem('Logo Groups',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchLogoGroups");', 'js:');
addItem('Placement',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchPlacement");', 'js:');
addItem('Sales Rep',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchSalesRep");', 'js:');
addItem('Ad Category',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=searchAdCategory");', 'js:');
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

