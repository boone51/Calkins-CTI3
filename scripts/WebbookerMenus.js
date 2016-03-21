// JavaScript Document

var hBar = new ItemStyle(100, 0, '', 0, 0, '#005c82', '#005F64', 'highText', 'lowText', '', '',
 null, null, 'hand', 'default');

var subM = new ItemStyle(22, 0, '&gt;', -10, 1, '#005c82', '#2E3436', 'lowText', 'lowText',
 'itemBorder', 'itemBorder', null, null, 'hand', 'default');

var subBlank = new ItemStyle(22, 1, '&gt;', -15, 3, '#2E3436', '#2E3436', 'lowText', 'highText',
 'itemBorderBlank', 'itemBorder', null, null, 'hand', 'default');

var button = new ItemStyle(22, 1, '&gt;', -15, 2, '#2E3436', '#2E3436', 'buttonText', 'buttonHover',
 'buttonBorder', 'buttonBorderOver', 80, 95, 'crosshair', 'default');


var pMenu = new PopupMenu('pMenu');
with (pMenu)
{

startMenu('root', false, 0, 0, 0, hBar);

addItem('&nbsp; File', 'mFile', 'sm:');

startMenu('mFile', true, 0, 15, 140, subM);
addItem('New Customer Order',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=newCustomerOrder");', 'js:');
addItem('Find Order',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=findOrder");', 'js:');
addItem('Save Ad Order', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=saveOrder");', 'js:');
addItem('Save & Close Ad Order', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=saveCloseOrder");', 'js:');
addItem('Close Ad Order', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=closeOrder");', 'js:');
addItem('Print', 'mPrint', 'sm:');
addItem('Email', 'mEmail', 'sm:');
addItem('Exit', 'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=exit");', 'js:');

startMenu('mPrint', true, 100, 0, 160, subM);
addItem('Order Confirmation',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printOrderConfirmation");', 'js:');
addItem('Work Order',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printWorkOrder");', 'js:');
addItem('Ad Text',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printAdText");', 'js:');
addItem('Address',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=printAddress");', 'js:');

startMenu('mEmail', true, 100, 0, 160, subM);
addItem('Order Confirmation',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=emailOrderConfirmation");', 'js:');
addItem('Work Order',  'parent.SendParameters("WebBaseMain.ot", "run_mode=adbooker_menuClick", "menuItem=emailWorkOrder");', 'js:');

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

