// JavaScript Document

// *** COMMON CROSS-BROWSER COMPATIBILITY CODE ***

var isDOM=document.getElementById?1:0;
var isIE=document.all?1:0;
var isNS4=navigator.appName=='Netscape'&&!isDOM?1:0;
var isIE4=isIE&&!isDOM?1:0;
var isOp=window.opera?1:0;
var isDyn=isDOM||isIE||isNS4;


function getRef(id, par)
{
 par=!par?document:(par.navigator?par.document:par);
 return (isIE ? par.all[id] :
  (isDOM ? (par.getElementById?par:par.ownerDocument).getElementById(id) :
  (isNS4 ? par.layers[id] : null)));
}

function getSty(id, par)
{
 var r=getRef(id, par);
 return r?(isNS4?r:r.style):null;
}

if (!window.LayerObj) var LayerObj = new Function('id', 'par',
 'this.ref=getRef(id, par); this.sty=getSty(id, par); return this');
function getLyr(id, par) { return new LayerObj(id, par) }

function LyrFn(fn, fc)
{
 LayerObj.prototype[fn] = new Function('var a=arguments,p=a[0],px=isNS4||isOp?0:"px"; ' +
  'with (this) { '+fc+' }');
}
LyrFn('x','if (!isNaN(p)) sty.left=p+px; else return parseInt(sty.left)');
LyrFn('y','if (!isNaN(p)) sty.top=p+px; else return parseInt(sty.top)');
LyrFn('vis','sty.visibility=p');
LyrFn('bgColor','if (isNS4) sty.bgColor=p?p:null; ' +
 'else sty.background=p?p:"transparent"');
LyrFn('bgImage','if (isNS4) sty.background.src=p?p:null; ' +
 'else sty.background=p?"url("+p+")":"transparent"');
LyrFn('clip','if (isNS4) with(sty.clip){left=a[0];top=a[1];right=a[2];bottom=a[3]} ' +
 'else sty.clip="rect("+a[1]+"px "+a[2]+"px "+a[3]+"px "+a[0]+"px)" ');
LyrFn('write','if (isNS4) with (ref.document){write(p);close()} else ref.innerHTML=p');
LyrFn('alpha','var f=ref.filters,d=(p==null); if (f) {' +
 'if (!d&&sty.filter.indexOf("alpha")==-1) sty.filter+=" alpha(opacity="+p+")"; ' +
 'else if (f.length&&f.alpha) with(f.alpha){if(d)enabled=false;else{opacity=p;enabled=true}} }' +
 'else if (isDOM) sty.MozOpacity=d?"":p+"%"');


function setLyr(lVis, docW, par)
{
 if (!setLyr.seq) setLyr.seq=0;
 if (!docW) docW=0;
 var obj = (!par ? (isNS4 ? window : document.body) :
  (!isNS4 && par.navigator ? par.document.body : par));
 var IA='insertAdjacentHTML', AC='appendChild', newID='_js_layer_'+setLyr.seq++;

 if (obj[IA]) obj[IA]('beforeEnd', '<div id="'+newID+'" style="position:absolute"></div>');
 else if (obj[AC])
 {
  var newL=document.createElement('div');
  obj[AC](newL); newL.id=newID; newL.style.position='absolute';
 }
 else if (isNS4)
 {
  var newL=new Layer(docW, obj);
  newID=newL.id;
 }

 var lObj=getLyr(newID, par);
 with (lObj) if (ref) { vis(lVis); x(0); y(0); sty.width=docW+(isNS4?0:'px') }
 return lObj;
}


var CSSmode=document.compatMode;
CSSmode=(CSSmode&&CSSmode.indexOf('CSS')!=-1)||isDOM&&!isIE||isOp?1:0;

if (!window.page) var page = { win: window, minW: 0, minH: 0, MS: isIE&&!isOp,
 db: CSSmode?'documentElement':'body' }

page.winW=function()
 { with (this) return Math.max(minW, MS?win.document[db].clientWidth:win.innerWidth) }
page.winH=function()
 { with (this) return Math.max(minH, MS?win.document[db].clientHeight:win.innerHeight) }

page.scrollX=function()
 { with (this) return MS?win.document[db].scrollLeft:win.pageXOffset }
page.scrollY=function()
 { with (this) return MS?win.document[db].scrollTop:win.pageYOffset }



// *** MOUSE EVENT CONTROL FUNCTIONS ***


// Most of these are passed the relevant 'menu Name' and 'item Number'.
// The 'with (this)' means it uses the properties and functions of the current menu object.
function popOver(mN, iN) { with (this)
{
 // Cancel any pending menu hides from a previous mouseout.
 clearTimeout(hideTimer);
 // Set the 'over' variables to point to this item.
 overM = mN;
 overI = iN;
 // Call the 'onMouseOver' event if it exists, and the item number is 1 or more.
 if (iN && this.onmouseover) onmouseover(mN, iN);


 // Remember what was lit last time, and compute a new hierarchy.
 litOld = litNow;
 litNow = new Array();
 var litM = mN, litI = iN;
 while(1)
 {
  litNow[litM] = litI;
  // If we've reached the top of the hierarchy, exit loop.
  if (litM == 'root') break;
  // Otherwise repeat with this menu's parent.
  litI = menu[litM][0].parentItem;
  litM = menu[litM][0].parentMenu;
 }

 // If the two arrays are the same, return... no use hiding/lighting otherwise.
 var same = true;
 for (var z in menu) if (litNow[z] != litOld[z]) same = false;
 if (same) return;

 // If this is a different menu, clear another pending show.
 clearTimeout(showTimer);



 // Cycle through menu array, lighting and hiding menus as necessary.
 for (thisM in menu) with (menu[thisM][0])
 {
  // Doesn't exist yet? Keep rollin'...
  if (!lyr) continue;

  // The number of this menu's item that is to be lit, undefined if none.
  litI = litNow[thisM];
  oldI = litOld[thisM];

  // If it's lit now and wasn't before, highlight...
  if (litI && (litI != oldI)) changeCol(thisM, litI, true);

  // If another item was lit but isn't now, dim the old item.
  if (oldI && (oldI != litI)) changeCol(thisM, oldI, false);

  // Make sure if it's lit, it's shown, and set the visNow flag.
  if (litI && !visNow && (thisM != 'root'))
  {
   showMenu(thisM);
   visNow = true;
  }

  // If this menu has no items from the current hierarchy in it, and is currently
  // onscreen, call the hide function.
  if (isNaN(litI) && visNow)
  {
   hideMenu(thisM);
   visNow = false;
  }
 }


 // Get target menu to show - if we've got one, position & show it.
 // If this menu is set to show submenus on click, skip this.
 nextMenu = '';
 if ((menu[mN][iN].type == 'sm:') && !menu[mN][0].subsOnClick)
 {
  // The target menu and the layer object of the current menu itself (not this item).
  var targ = menu[mN][iN].href, lyrM = menu[mN][0].lyr;

// EXTRA CODE - Uncomment these lines to enable dynamic create-as-needed menu support,
// where you can create only the root menu on page load and others when you point at them.
// I would recommend using this for single-frame menus only, and changing the "Events"
// section of the code to call pMenu.update(false, 'root') on page load for all browsers
// and disabling "fast" inline creation mode. Bear in mind this won't work in Opera 5/6.

//if (!menu[targ][0].lyr) update(false, targ);
//if (!menu[targ][0].lyr) return;

  // Either show immediately or after a delay if set by passing it to the position and show functions.
  // Set nextMenu to the impending show, so the popOut() function knows when not to cancel it.
  var showStr = 'with ('+myName+') { menu.'+targ+'[0].visNow = true; ' +
   'position("'+targ+'"); showMenu("'+targ+'") }';
  nextMenu = targ;
  if (showDelay) showTimer = setTimeout(showStr, showDelay);
  else eval(showStr);
 }
}}


function popOut(mN, iN) { with (this)
{
 // Sometimes, across frames, overs and outs can get confused.
 // So, return if we're exiting an item we have yet to enter...
 if ((mN != overM) || (iN != overI)) return;

 // Evaluate the onmouseout event, if any.
 if (this.onmouseout) onmouseout(mN, iN);

 var thisI = menu[mN][iN];

 // Stop showing another menu if this item isn't pointing to the same one.
 if (thisI.href != nextMenu)
 {
  clearTimeout(showTimer);
  nextMenu = '';
 }

 // Hide all menus rapidly (if it's a root menu item without a popout) or as specified.
 // Remember that the timeout is cancelled by another instance of the over function.
 // Calling 'over("root", 0)' hides all menus but the root menu, and highlights no items.
 // If hideDelay equals zero the menus are never hidden.
 if (hideDelay)
 {
  var delay = ((mN == 'root') && (thisI.type != 'sm:')) ? 50 : hideDelay;
  hideTimer = setTimeout(myName + '.over("root", 0)', delay);
 }

 // Clear the 'over' variables.
 overM = 'root';
 overI = 0;
}}


function popClick(mN, iN) { with (this)
{
 // Evaluate the onclick event, if any.
 if (this.onclick) onclick(mN, iN);

 var thisI = menu[mN][iN], hideM = true;

 with (thisI) switch (type)
 {
  // Targeting another popout? Either activate show-on-click or skip to the end.
  case 'sm:':
  {
   if (menu[overM][0].subsOnClick)
   {
    menu[href][0].visNow = true;
    position(href);
    showMenu(href);
    hideM = false;
   }
   break;
  }
  // A JavaScript function? Eval() it and break out of switch.
  case 'js:': { eval(href); break }
  // Otherwise, point to the window if nothing else and navigate.
  case '': type = 'window';
  default: if (href) eval(type + '.location.href = "' + href + '"');
 }

 // Hide all menus if we're supposed to.
 if (hideM) over('root', 0);
}}


function popChangeCol(mN, iN, isOver) { with (this.menu[mN][iN])
{
 if (!lyr || !lyr.ref) return;

 // Pick a new background colour, and decide on whether it's an image (contains a period?).
 var col = isOver?overCol:outCol;
 var bgFn = (col.indexOf('.')==-1) ? 'bgColor' : 'bgImage';
 // Then we do it before or after the text/border change due to Netscape bugs.
 if (isNS4) lyr[bgFn](col);

 // Test for CSS text/border style changes, we can skip them if not needed.
 // In Netscape 4, rewrite layer contents if required (causes a little flickering)...
 // Otherwise manipulate the DOM tree for IE/NS6+ (faster than rewriting contents).
 if ((overClass != outClass) || (outBorder != overBorder)) with (lyr)
 {
  if (isNS4) write(this.getHTML(mN, iN, isOver));
  else
  {
   ref.className = (isOver ? overBorder : outBorder);
   var chl = (isDOM ? ref.childNodes : ref.children)
   if (chl) for (var i = 0; i < chl.length; i++) chl[i].className = isOver?overClass:outClass;
  }
 }

 if (!isNS4) lyr[bgFn](col);

 // Alpha filtering activated? Might as well set that then too...
 // Weirdly it has to be done after the border change, another random Mozilla bug...
 if (outAlpha != overAlpha) lyr.alpha(isOver ? overAlpha : outAlpha);
}}


function popPosition(posMN) { with (this)
{
 // Pass a menu name to position, or nothing to position all menus.
 for (mN in menu)
 {
  if (posMN && (posMN != mN)) continue;
  with (menu[mN][0])
  {
   // If the menu hasn't been created or is not set to be visible, loop.
   if (!lyr || !lyr.ref || !visNow) continue;

   // Set up some variables and the initial calculated positions.
   var pM, pI, newX = eval(offX), newY = eval(offY);
   // Find its parent menu references, if it's not the topmost root menu.
   if (mN != 'root')
   {
    pM = menu[parentMenu];
    pI = pM[parentItem].lyr;
    // Having no parent item is a bad thing, especially in cross-frame code.
    if (!pI) continue;
   }

   // Find parent window for correct page object, or this window if not.
   var eP = eval(par);
   var pW = (eP && eP.navigator ? eP : window);

   // Find proper numerical values for the current window position + edges, so menus
   // don't make a beeline for the upper-left corner of the page.
   with (pW.page) var sX=scrollX(), wX=sX+winW(), sY=scrollY(), wY=winH()+sY;
   wX = isNaN(wX)||!wX ? 9999 : wX;
   wY = isNaN(wY)||!wY ? 9999 : wY;

   // Relatively positioned submenus? Add parent menu/item position & check screen edges.
   if (pM && typeof(offX)=='number') newX = Math.max(sX,
    Math.min(newX+pM[0].lyr.x()+pI.x(), wX-menuW-(isIE?5:20)));
   if (pM && typeof(offY)=='number') newY = Math.max(sY,
    Math.min(newY+pM[0].lyr.y()+pI.y(), wY-menuH-(isIE?5:20)));

   // Assign the final calculated positions.
   lyr.x(newX);
   lyr.y(newY);
  }
 }
}}





// *** MENU OBJECT CONSTRUCTION FUNCTIONS ***

// This takes arrays of data and names and assigns the values to a specified object.
function addProps(obj, data, names, addNull)
{
 for (var i = 0; i < names.length; i++) if(i < data.length || addNull) obj[names[i]] = data[i];
}

function ItemStyle()
{
 // Like the other constructors, this passes a list of property names that correspond to the list
 // of arguments.
 var names = ['len', 'spacing', 'popInd', 'popPos', 'pad', 'outCol', 'overCol', 'outClass',
  'overClass', 'outBorder', 'overBorder', 'outAlpha', 'overAlpha', 'normCursor', 'nullCursor'];
 addProps(this, arguments, names, true);
}

function popStartMenu(mName) { with (this)
{
 // Create a new array within the menu object if none exists already, and a new menu object within.
 if (!menu[mName]) { menu[mName] = new Array(); menu[mName][0] = new Object(); }

 // Clean out existing items in this menu in case of a menu update.
 // actMenu is a reference to this menu for addItem() function later, while the local variable
 // aM is a quick reference to the current menu descriptor -- array index 0, 1+ are items.
 actMenu = menu[mName];
 aM = actMenu[0];
 actMenu.length = 1;

 // Not all of these are actually passed to the constructor -- the last few are null.
 // N.B: I pass 'isVert' twice so the first parameter (the menu name) is overwritten & ignored.
 var names = ['isVert', 'isVert', 'offX','offY', 'width', 'itemSty', 'par',
  'parentMenu', 'parentItem', 'visNow', 'oncreate', 'subsOnClick'];
 addProps(aM, arguments, names, true);

 // extraHTML is a string added to menu layers for things like dropshadows, backgrounds etc.
 aM.extraHTML = '';
 // Set the menu dimensions to zero initially. Also these are used to position items.
 aM.menuW = aM.menuH = 0;

 // Reuse old layers if we can, no use creating new ones every time the menus refresh.
 if (!aM.lyr) aM.lyr = null;
 
 // Assign a default oncreate event to the root menu to show it.
 if (mName == 'root') menu.root[0].oncreate = new Function('this.visNow=true; ' +
  myName + '.position("root"); this.lyr.vis("visible")');
}}


function popAddItem() { with (this) with (actMenu[0])
{
 // 'with' the current menu object and active menu descriptor object from startMenu().

 // Add these properties onto a new 'active Item' at the end of the active menu.
 var aI = actMenu[actMenu.length] = new Object();

 // Add function parameters to object. Again, the last few are undefined, set later.
 var names = ['text', 'href', 'type', 'itemSty', 'len', 'spacing', 'popInd', 'popPos',
  'pad', 'outCol', 'overCol', 'outClass', 'overClass', 'outBorder', 'overBorder',
  'outAlpha', 'overAlpha', 'normCursor', 'nullCursor',
  'iX', 'iY', 'iW', 'iH', 'lyr'];
 addProps(aI, arguments, names, true);

 // Find an applicable itemSty -- either passed to this item or the menu[0] object.
 var iSty = (arguments[3] ? arguments[3] : actMenu[0].itemSty);
 // Loop through its properties, add them if they don't already exist (overridden e.g. length).
 for (prop in iSty) if (aI[prop]+'' == 'undefined') aI[prop] = iSty[prop];

 // In NS4, since borders are assigned to the contents rather than the layer, increase padding.
 if (aI.outBorder)
 {
  if (isNS4) aI.pad++;
 }

 // The actual dimensions of the items, store here as properties so they can be accessed later.
 aI.iW = (isVert ? width : aI.len);
 aI.iH = (isVert ? aI.len : width);

 // The spacing of the previous menu item in this menu, if relevant.
 var lastGap = (actMenu.length > 2) ? actMenu[actMenu.length - 2].spacing : 0;

 // 'spc' is the amount we subtract from this item's position so borders overlap a little.
 // Of course we don't do it to the first item.
 var spc = ((actMenu.length > 2) && aI.outBorder ? 1 : 0);

 // We position this item at the end of the current menu's dimensions,
 // and then increase the menu dimensions by the size of this item.
 if (isVert)
 {
  menuH += lastGap - spc;
  aI.iX = 0; aI.iY = menuH;
  menuW = width; menuH += aI.iH;
 }
 else
 {
  menuW += lastGap - spc;
  aI.iX = menuW; aI.iY = 0;
  menuW += aI.iW; menuH = width;
 }

 // When we are running in proper 'CSS1Compat' mode, borders affect widths differently, so we
 // subtract some pixels here to go with the old 'loose' specification. Swap this around if you
 // want your documents to conform with the new specs.
 if (aI.outBorder && CSSmode)
 {
  aI.iW -= 2;
  aI.iH -= 2;
 }
}}



// *** MAIN MENU CREATION/UPDATE FUNCTIONS ***


// Returns the inner HTML of an item, used for menu generation, and highlights in NS4.
function popGetHTML(mN, iN, isOver) { with (this)
{
 var itemStr = '';
 with (menu[mN][iN])
 {
  var textClass = (isOver ? overClass : outClass);

  // If we're supposed to add a popout indicator, add it before text so it appears below in NS4.
  if ((type == 'sm:') && popInd)
  {
   if (isNS4) itemStr += '<layer class="' + textClass + '" left="'+ ((popPos+iW)%iW) +
    '" top="' + pad + '" height="' + (iH-2*pad) + '">' + popInd + '</layer>';
   else itemStr += '<div class="' + textClass + '" style="position: absolute; left: ' +
    ((popPos+iW)%iW) + 'px; top: ' + pad + 'px; height: ' + (iH-2*pad) + 'px">' + popInd + '</div>';
  }

  // For NS4, if a border is assigned, add a spacer to push border out to layer edges.
  // Add a link both to generate an onClick event and to stop the ugly I-beam text cursor appearing.
  if (isNS4) itemStr += (outBorder ? '<span class="' + (isOver?overBorder:outBorder) +
   '"><spacer type="block" width="' + (iW-8) + '" height="' + (iH-8) + '"></span>' : '') +
   '<layer left="' + pad + '" top="' + pad + '" width="' + (iW-2*pad) + '" height="' +
   (iH-2*pad) + '"><a class="' + textClass + '" href="#" ' +
   'onClick="return false" onMouseOver="status=\'\'; ' + myName + '.over(\'' + mN + '\',' +
   iN + '); return true">' + text + '</a></layer>';

  // IE4+/NS6 is an awful lot easier to work with sometimes.
  else itemStr += '<div class="' + textClass + '" style="position: absolute; left: ' + pad +
   'px; top: ' + pad + 'px; width: ' + (iW-2*pad) + 'px; height: ' + (iH-2*pad) + 'px">' +
   text + '</div>';
 }
 return itemStr;
}}


// The main menu creation/update routine. The first parameter is 'true' if you want the script
// to use document.write() to create the menus. Second parameter is optionally the name of one
// menu only to update rather then create all menus.
function popUpdate(docWrite, upMN) { with (this)
{
 // 'isDyn' (set at the very top of the script) signifies a DHTML-capable browser.
 if (!isDyn) return;

 // Loop through menus, using properties of menu description object (array index 0)...
 for (mN in menu) with (menu[mN][0])
 {
  // If we're updating one specific menu, only run the code for that.
  if (upMN && (upMN != mN)) continue;

  // Variable for holding HTML for items.
  var str = '';

  // Remember, items start from 1 in the array (0 is menu object itself, above).
  // Also use properties of each item nested in the other with() for construction.
  for (var iN = 1; iN < menu[mN].length; iN++) with (menu[mN][iN])
  {
   // An ID for divs/layers contained within the menu.
   var itemID = myName + '_' + mN + '_' + iN;

   // Now is a good time to assign another menu's parent to this if we've got a popout item.
   var targM = menu[href];
   if (targM && (type == 'sm:'))
   {
    targM[0].parentMenu = mN;
    targM[0].parentItem = iN;
   }

   // Have we been given a background image? It'll have a period in its name if so...
   var isImg = (outCol.indexOf('.') != -1) ? true : false;

   // NS6 uses a different cursor name for the 'hand' cursor than IE.
   if (!isIE && normCursor=='hand') normCursor = 'pointer';

   // Create a div or layer text string with appropriate styles/properties.
   // OK, OK, I know this is a little obtuse in syntax, but it's small...
   // At the end we set the alpha transparency (if specified) and the mouse cursor.
   if (isDOM || isIE4)
   {
    str += '<div id="' + itemID + '" ' + (outBorder ? 'class="'+outBorder+'" ' : '') +
     'style="position: absolute; left: ' + iX + 'px; top: ' + iY + 'px; width: ' + iW +
     'px; height: ' + iH + 'px; z-index: 1000; background: ' + (isImg?'url('+outCol+')':outCol) +
     ((typeof(outAlpha)=='number') ? '; filter: alpha(opacity='+ outAlpha + '); -moz-opacity: ' +
      (outAlpha/100) : '') +
     '; cursor: ' + ((type!='sm:' && href) ? normCursor : nullCursor) + '" ';
   }
   else if (isNS4)
   {
    // NS4's borders must be assigned within the layer so they stay when content is replaced.
    str += '<layer id="' + itemID + '" left="' + iX + '" top="' + iY + '" width="' +
     iW + '" height="' + iH + '" z-index="1000" ' +
     (outCol ? (isImg ? 'background="' : 'bgcolor="') + outCol + '" ' : '');
   }

   // Add mouseover and click handlers, contents, and finish div/layer.
   var evtMN = '(\'' + mN + '\',' + iN + ')"';
   str += 'onMouseOver="' + myName + '.over' + evtMN +
     ' onMouseOut="' + myName + '.out' + evtMN +
     ' onClick="' + myName + '.click' + evtMN + '>' +
     getHTML(mN, iN, false) + (isNS4 ? '</layer>' : '</div>');

  // End loop through items and with(menu[mN][iN]).
  }


  // The parent frame for this menu, if any.
  var eP = eval(par);


  // Do not ask me why Opera makes me set a timeout now rather than later, or in fact have
  // to set a timeout at all to get references to the divs we are about to create.
  // But, it makes the cross-frame version of the script actually work, so there's a benefit.
  setTimeout(myName + '.setupRef(' + docWrite + ', "' + mN + '")', 50);

  // Initial menu visibility, hidden unless tweaked otherwise.
  var mVis = visNow ? 'visible' : 'hidden';

  // For Fast creation mode (default for IE, NS6, Opera), write the menus to the document now.
  // I'm adding a bit to the widths for safety as borders are different across browsers.
  if (docWrite)
  {
   // Find the right target frame.
   var targFr = (eP && eP.navigator ? eP : window);
   targFr.document.write('<div id="' + myName + '_' + mN + '_Div" style="position: absolute; ' +
    'visibility: ' + mVis + '; left: 0px; top: 0px; width: ' + (menuW+2) + 'px; height: ' +
    (menuH+2) + 'px; z-index: 1000">' + str + extraHTML + '</div>');
  }
  else
  {
   // Create a new layer/div object dynamically using my setLyr() function above.
   // If we've got a layer created already, there's no use creating another!.
   // In IE4, we must shrink the menus to stop them sizing to the full body size -- thanks
   // to Jeff Blum and Paul Maden for debugging this for me :). If the layer has been created,
   // we've got to set a timeout to fix up IE4 again for some obscure reason.
   if (!lyr || !lyr.ref) lyr = setLyr(mVis, menuW, eP);
   else if (isIE4) setTimeout(myName + '.menu.' + mN + '[0].lyr.sty.width=' + (menuW+2), 50);

   // Give it a high Z-index, and write its content.
   with (lyr) { sty.zIndex = 1000; write(str + extraHTML) }
  }

 // End loop through menus and with (menu[mN][0]).
 }
}}


function popSetupRef(docWrite, mN) { with (this) with (menu[mN][0])
{
 // Get a reference to a div, only needed for Fast creation mode.
 if (docWrite || !lyr || !lyr.ref) lyr = getLyr(myName + '_' + mN + '_Div', eval(par));

 // Loop through menu items again to set up individual references.
 for (var i = 1; i < menu[mN].length; i++)
  menu[mN][i].lyr = getLyr(myName + '_' + mN + '_' + i, (isNS4?lyr.ref:eval(par)));

 // Call the 'oncreate' method of this menu if it exists (e.g. to show root menu).
 if (menu[mN][0].oncreate) oncreate();
}}



// *** POPUP MENU MAIN OBJECT CONSTRUCTOR ***

function PopupMenu(myName)
{
 // These are the properties of any PopupMenu objects you create.
 this.myName = myName;

 // Manage what gets lit and shown when.
 this.showTimer = 0;
 this.hideTimer = 0;
 this.showDelay = 0;
 this.hideDelay = 500;
 this.showMenu = '';

 // 'menu': the main data store, contains subarrays for each menu e.g. pMenu.menu['root'][];
 this.menu =  new Array();
 // litNow and litOld arrays control what items get lit in the hierarchy.
 this.litNow = new Array();
 this.litOld = new Array();

 // The item the mouse is currently over. Used by click processor to help NS4.
 this.overM = 'root';
 this.overI = 0;

 // The active menu, to which addItem() will assign its results.
 this.actMenu = null;

 // Functions to create and manage the menu.
 this.over = popOver;
 this.out = popOut;
 this.changeCol = popChangeCol;
 this.position = popPosition;
 this.click = popClick;
 this.startMenu = popStartMenu;
 this.addItem = popAddItem;
 this.getHTML = popGetHTML;
 this.update = popUpdate;
 this.setupRef = popSetupRef;

 // Default show and hide functions, overridden in the example script by the clipping routine.
 this.showMenu = new Function('mName', 'this.menu[mName][0].lyr.vis("visible")');
 this.hideMenu = new Function('mName', 'this.menu[mName][0].lyr.vis("hidden")');
}













// *** START EDITING HERE, READ THIS SECTION CAREFULLY! ***
//
//
// Before you start, make sure you've read the "Conditions Of Use" in this HTML document
// or on my site. Anyway, this menu script is split up into several sections. They are:
//
// (1) ITEMSTYLES - These define the colour and size of menu items. Required to run.
// (2) MENU DATA - These specify the text and links in the menu. Required to run.
// (3) MENU EFFECTS - Want to remove, or change borders, shadows and animation? Edit them here,
//     or you can delete this section entirely to remove extra effects.
// (4) EVENTS - Activate the menu(s), and choose creation mode (Dynamic / Fast) etc. I recommend
//     you read it, but you only really need to change it if you want multiple menus on one page,
//     or are trying to combine this with other JavaScripts. Required to run.
// (5) OPTIONAL CODE - Extra features like adding clicking to 'sm:' items or status messages on
//     mouseover. Animation/effects functions are here too. You can skip or delete this entirely.
// (6) FRAMESET README - If you're using a frameset, read this, it explains what you need to do.



// *** (1) ITEMSTYLES ***
//
// First of all we must create ItemStyles to use in the menu. ItemStyles are a collection of
// dimensions, colours, and font/border stylesheet class names that you can 'apply' to menus
// and items later on for a consistent look. The (somewhat lengthy) syntax is:
//
// styleName = new ItemStyle(length of items, spacing after items, 'popout indicator HTML',
//  popout indicator position, padding of text within item, 'out background colour or image
//  filename', 'hover background colour or filename', 'out text stylesheet class', 'hover text class',
//  'out border stylesheet class', 'hover border class', out opacity percentage or null to make
//  it fully opaque, hover opacity percentage or null, 'CSS mouse cursor for normal items',
//  'CSS cursor for sm: and blank items');
//
// One thing that needs explaining is the popout indicator position -- you pass a positive
// integer to position it from the left of the item, and a negative integer to position it from
// the right edge of the item -- see the example code below if that doesn't make much sense.
// Pass an empty string '' as the over or out background for a transparent background.
// If you pass 'hand' as a cursor, the script automatically translates it to 'pointer' for NS6.
// All stylesheet text/border classes come from the <STYLE> tag in this document, you can change
// the font and border colours and styles used there.
//
// Here are some examples used in this menu demo, read through and see how they're formatted,
// then try tweaking some of the numbers and refreshing the page:


// 'horizontal Bar' style: menu items that use this ItemStyle are 40px wide, have 10px gaps
// between them, no popout indicator (the ">" in some menus) or popout indicator position,
// 0px padding of the text within items, #336699 background colour, a hover colour of #6699CC,
// 'highText' is the stylesheet class used for the menu text both normally and when highlighted,
// no border styles, 'null' means fully opaque items (set them to numbers between 0 and 100 to
// enable semitranslucency), and the 'hand'/'default' cursors are used for linked/submenu items.

//var hBar = new ItemStyle(40, 10, '', 0, 0, '#336699', '#6699CC', 'highText', 'highText', '', '',
// null, null, 'hand', 'default');

// The 'sub Menu' items: 22px long, 0px spacing, a 'greater than' sign for a popout indicator
// (you may wish to use an image tag?), the popout indicator is positioned 15px from the right
// edge of the item, items have 3px padding, some colours, it uses 'lowText' as the dimmed text
// class but 'highText' when it is moused over, and 'itemBorder' as the border stylesheet class.
// No opacity is used, and they have the same cursors as the above ItemStyle.

//var subM = new ItemStyle(22, 0, '&gt;', -15, 3, '#CCCCDD', '#6699CC', 'lowText', 'highText',
// 'itemBorder', 'itemBorder', null, null, 'hand', 'default');

// 'subBlank' is similar, but has an 'off' border the same colour as its background so it
// appears borderless when dim, and 1px spacing between items to show the hover border.

//var subBlank = new ItemStyle(22, 1, '&gt;', -15, 3, '#CCCCDD', '#6699CC', 'lowText', 'highText',
// 'itemBorderBlank', 'itemBorder', null, null, 'hand', 'default');

// The purplish 'button' style also has 1px spacing to show up the fancy border, and it has
// different colours/text and less padding. They also have translucency set -- these items
// are 80% opaque when dim and 95% when highlighted. It uses the 'crosshair' cursor for items.

//var button = new ItemStyle(22, 1, '&gt;', -15, 2, '#006633', '#CC6600', 'buttonText', 'buttonHover',
// 'buttonBorder', 'buttonBorderOver', 80, 95, 'crosshair', 'default');




// *** (2) MENU DATA ***
//
// Read this section VERY CAREFULLY, it explains how to arrange and tweak the menus themselves.
// To use this script you must create one or more PopupMenu() objects, that will contain all
// the menu data and settings used. This demo contains one, named 'pMenu', although you can
// have as many totally separate menus as you want on one page.
//    Next we add menus and items to the object, using its startMenu() and addItem()
// commands. Each menu object MUST contain one menu named 'root', which is the first, always
// visible menu. The syntax of the startMenu() command is:
//
// startMenu('menu name', Vertical menu (true/false)?, left, top, width, default ItemStyle
//  for items in this menu, optional parent frame/window or layer in which this menu resides);
//
// In order, the parameters are a name for the menu like 'root' or 'mFile', which you can use to
// refer to this menu from other menus, to pop it out.
//    Next, pass 'true' if you want this to be a vertical stacked menu or 'false' if you want this
// to be a horizontal menu bar. You can orientate each menu differently this way.
//   The Left and Top positions allow you to locate this menu either absolutely from the page or
// relative to menu item that pops it out. If you want to offset this menu from the item that pops
// it out, set the positions as NUMBERS, e.g. 130, 10 would put the upper-left corner of this menu
// 130px across and 10px down from the upper-left corner of the item that popped it out.
//   If you put '130', '10' as positions in QUOTES, you can position the menu from the upper-left
// corner of the whole page. These strings can also include formulae to centre or scroll the menu,
// examples are included later on. Note: the 'root' menu is always positioned from the page corner.
//    The 'width' depends on the orientation of the menu -- for vertical menus it's the width,
// for horizontal menus it is the height. Basically, it's the constant dimension for all the items.
//    The parent window or layer parameter is optional, if not specified the current window is
// used -- this example does not use frames. See the frameset example file if you're using them,
// they are strings that when evaluated return a reference, like 'window.top'.
//
// Once you have created a menu, you add items to that menu using the addItem() command.
// You must give it THREE compulsory parameters: 1) The HTML/text to display in the item. 2) The
// menuname/filename/URL the item activates. 3) The action type or target frame of that item.
// All other parameters are optional -- you can override the menu's default ItemStyle with the
// item's own, and optionally override that was well by specifying a list of parameters in the
// same order as an ItemStyle, to give each item its own dimensions / colours etc.
// See the example menu below for an example of these extras...
//
// addItem('Text', 'URL or menuname', 'action type', optional ItemStyle, length, spacing,
//  'popout indicator', popout indicator position, etc... in the same order as ItemStyles);
//
// The third parameter, 'action type', tells the script what to do with the second parameter.
// You can tell the script to load a file in the current window or a particular frame, tell it
// to pop out a menu, or tell it to run a JavaScript command. You do these like this:
//
// addItem('Text', 'file.html', ''); //blank means opens up 'file.html' in the current window.
// addItem('Text', 'file.html', 'parent.content');  //opens 'file.html' in a frame named 'content'.
// addItem('Text', 'menuName', 'sm:');  //pops out another submenu called 'menuName'.
// addItem('Text', 'alert("Hello")', 'js:');  //runs a JavaScript command when clicked.
//
// Frame names should be valid JavaScript syntax, e.g. 'top.frameName' or 'parent.popupWin',
// evaluated from the the window containing the main script (this one). Also, this system means
// 'sm:' items aren't normally clickable. If you do want to add click or mouseover actions to
// items, see the "Optional Code" section of the script below.
// 
// See the example below if this seems complicated, it's quite easy once you get the hang of it.
// Thanks to Martin J. Cole for originally suggesting the syntax!
// If you want more information, there's a FAQ (Frequently Asked Questions) section on my
// site: http://www.twinhelix.com, on the 'Popup Menus' page, or try the 'Site Forums" perhaps.



// A PopupMenu() object must be passed its own name so it can reference itself when the menu
// is active. We also use a 'with' block to work with its properties and functions below.
//var pMenu = new PopupMenu('pMenu');
//with (pMenu)
//{

// *** MOVE OR CENTRE THE MENU HERE ***

// To centre it, or scroll with the window etc, just include a global variable or formula as one
// of the positions. This script includes my page object, which has several useful methods, namely
// 'page.winW()', 'page.winH()', 'page.scrollY()' and 'page.scrollX()'. These return the current
// dimensions of the visible window area and the scroll position of the window, which can be
// used to position menus however you want. Try replacing the first startMenu() below with one of
// these commented lines, and scroll/resize the window to see how they work.

//startMenu('root', false, 'page.winW()/2 - pMenu.menu.root[0].menuW/2', 0, 17, hBar); // Centres.
//startMenu('root', false, 10, 'page.scrollY()', 17, hBar); // Floats with window as you scroll.
//startMenu('root', false, 10, 0, 17, hBar, 'frameName'); // To create in subframe.

// The 'root' menu is horizontal, positioned at (x = 10, y = 0) and is 17px high, and items
// by default use the colours and dimensions in the 'hBar' ItemStyle defined above.
// This menu is also positioned over a similarly-coloured table in the HTML document above.
//startMenu('root', false, 10, 0, 17, hBar);

// The text is a space then 'File', and this item pops out the 'mFile' submenu when moused over
// as we've set 'sm:' as the action type. If you want to assign a click action (e.g. navigating to
// a file) to one of these 'sm:' items, see the 'Optional Code' section below.
//addItem('&nbsp; File', 'mFile', 'sm:');
//addItem('&nbsp; Edit', 'mEdit', 'sm:');
//addItem('&nbsp; Help', 'mHelp', 'sm:');
// Next is an example of a Javascript function embedded in the menu, to open a new window...
// Also, note the extra optional 4th and 5th parameters -- this menu item is 80px long,
// rather than the default length from the ItemStyle.
//addItem('&nbsp; Visit My Site', 'window.open("http://www.twinhelix.com")', 'js:', hBar, 80);

// This is a vertical menu positioned 0px across and 22px down from its trigger, and is 80px wide.
//startMenu('mFile', true, 0, 22, 80, subM);
// The URLs are set to # here, be sure to replace them with your path/file names or JS functions!
// Also note how all the types are '', indicating these links open in the current frame.
//addItem('Open', '#', '');
//addItem('Save', '#', '');
//addItem('Reopen', 'mReopen', 'sm:');
//addItem('Check for<br />Update...', 'http://www.twinhelix.com', '', subM, 38);

//startMenu('mEdit', true, 0, 22, 80, subM);
//addItem('Cut', '#', '');
//addItem('Copy', '#', '');
//addItem('Paste', '#', '');
//addItem('Convert', 'mConvert', 'sm:');

// Popout slightly left of its trigger, for fun...
//startMenu('mHelp', true, -10, 22, 80, subM);
// Instead of using spaces to indent, consider 'text-indent' in the stylesheet class perhaps?
//addItem('&nbsp; &nbsp; Contents', '#', '');
//addItem('&nbsp; &nbsp; Search', '#', '');
// Here's an example of adding extra optional parameters to the addItem() command.
// This item uses the subM ItemSyle (regardless of what the rest of this menu uses), is 22px long,
// has 0px spacing after it, and a lesser-than-sign popout indicator positioned 3px from the left
// edge of this item. Note that the parameters after the ItemStyle name are in the same order as
// the ItemStyle command itself, and you can have as many as you want (e.g. background colours).
//addItem('&nbsp; &nbsp; About', 'mAbout', 'sm:', subM, 22, 0, '&lt;', 3);

// This is across but not down... a horizontal popout.
//startMenu('mReopen', true, 85, 0, 120, button);
// Again these items have their own ItemStyles, and unique lengths / spacings specified.
//addItem('Recent Doc 1:<br />Schedule', '#', '', button, 35);
//addItem('Recent Doc 2:<br />Cunning Plan', '#', '', button, 35, 5);
// Back to the normal submenu ItemStyle for this next item.
//addItem('Etc. etc...', '#', '', subM);

// This uses the subBlank ItemStyle which gives the items no borders when dim. The border around
// the whole menu comes from a JavaScript function in the "Menu Effects" section.
//startMenu('mConvert', true, 85, 0, 80, subBlank);
//addItem('Windows', '#', '');
//addItem('Unix', '#', '');
//addItem('Macintosh', '#', '');

// Leftwards popout with a negative x and y relative to its trigger. Custom height too.
//startMenu('mAbout', true, -85, -18, 80, subM);
//addItem('Leftwards!<br>And up!', '#', '', subM, 40);


// You can assign 'oncreate' events to specific menus. By default, the script has only one for
// the root menu that shows it when it is created. You may wish to change it to something like the
// following, which uses the animation function to show the menu, or delay its show altogether.
//menu.root[0].oncreate = function()
// { this.visNow=true; pMenu.position('root'); pMenu.showMenu('root') }

// Uncomment these lines to make specific menus show popouts on click rather than on mouseover.
//menu.root[0].subsOnClick = true;
//menu.mFile[0].subsOnClick = true;

// You can also customise hide or show delays (in milliseconds) to the menus. Defaults are:
//showDelay = 0;
//hideDelay = 500;
// Specify hideDelay as zero if you want to disable autohiding, and showDelay as a couple of
// hundred if you don't want the menus showing instantaneously when moused over.

// End of 'with (pMenu)' block. That's one menu object created, now we have to activate it...

//}


// You can create another menu object here if you want multiple menus on a page.
// Every menu object MUST have a menu named 'root' in it, as that's always visible.
// You can name the other menus in it anything you want.

//var anotherMenu = new PopupMenu('anotherMenu');
//with (anotherMenu)
//{
// startMenu('root', .....);
// ... make menus here ...
//}

// Then remember to add it to the event section below...







// *** (3) MENU EFFECTS AND ANIMATION ***


// Now you've created a basic menu object, you can add optional effects like borders and
// shadows to specific menus. These functions are found in the "Optional Code" section
// below, you can edit them or delete them entirely if you don't want to use them, with
// no harm to the rest of the script itself.


// Add a border to an all menus using a specified ItemStyle. The syntax is:
// addMenuBorder(menuObject, ItemStyle,
//  opacity of border, 'border colour', border width, 'padding colour', padding width);
// Opacity is a number from 0 to 100, or null for no filter, like the ItemStyles.

//addMenuBorder(pMenu, window.subBlank,
// null, '#666666', 1, '#CCCCDD', 2);


// Apply a dropshadow to specific menus again. The syntax is similar, but later on you
// pass arrays [...] for each layer of the shadow you want. I've used two grey layers
// here, but you can use as many or as few as you want. The syntax for the layers is:

// [opacity, 'layer colour', X offset, Y offset, Width Difference, Height difference]

// Opacity is from 0 to 100 (or null for no filter), and the X/Y offsets are the
// distance in pixels from the menu's top left corner to that shadow layer's corner.
// The width/height differences are added or subtracted to the current menu size, for
// instance the first layer of this shadow is 4px narrower and shorter than the menu
// it is shadowing.

//addDropShadow(pMenu, window.subM,
// [40,"#333333",6,6,-4,-4], [40,"#666666",4,4,0,0]);
//addDropShadow(pMenu, window.subBlank,
// [40,"#333333",6,6,-4,-4], [40,"#666666",4,4,0,0]);


// Add animation to the 'pMenu' menu object for supported browsers.
// Opera doesn't support clipping so we turn it off, and Mozilla versions prior to
// 1.x (such as Netscape 6) are too slow to support it, so disable there too.
// If you don't want animation, delete this entirely, and the menus will act normally.
// Change the speed if you want... it's the last number, between -100 and 100, and is
// defined as the percentage the animation moves each frame.
// The 'menuAnim' function is in the "Optional Code" section below, edit if you want to,
// I've put in a few extra tweaks in there like fading transitions if you're interested.

//if (!isOp && navigator.userAgent.indexOf('rv:0.')==-1)
//{
//pMenu.showMenu = new Function('mN','menuAnim(this, mN, 10)');
//pMenu.hideMenu = new Function('mN','menuAnim(this, mN, -10)');

 // Alternatively: try the IE5.5+/Windows filters. Comment above two lines out and uncomment:
 //pMenu.showMenu = function(mN)
 // { menuFilterShow(this, mN, 'progid:DXImageTransform.Microsoft.fade(duration=1)') }
 // There's a good list of transitions available from http://msdn.microsoft.com

 // Add animation to other menu objects like this...
 //anotherMenu.showMenu = new Function('mN','menuAnim(this, mN, 10)');
 //anotherMenu.hideMenu = new Function('mN','menuAnim(this, mN, -10)');
//}


// Advanced (or just plain determined to tweak everything) users: Custom item arrangement!
// Here you can extend a menu's overall dimensions, and then reposition or resize its items.
// You can arrange the items however you want within a menu, in a curve or similar,
// or even change the overall arrangement of the menu (put items in rows etc).
// Individual items have .iX and .iY which are positions and .iW and .iH which are dimensions.
// I recommend doing this *before* calling the border or shadow commands too :).

//with (pMenu.menu)
//{
// mFile[0].menuW += 20;
// mFile[0].menuH += 20;
// mFile[1].iX += 5;
// mFile[2].iX += 2;
// mFile[2].iW -= 2;
// mFile[3].iX += 5;
// mFile[4].iX += 10;
// mFile[4].iW += 10;
// mFile[4].iY += 3;
//}







// *** (4) EVENTS ***
//
// In JavaScript, there are document 'events' you need to set so any scripts you are using
// are notified of things like page loading/clicking/scrolling. If you've got several menus
// or another JavaScript entirely in your page, you'll need to add all their functions in here.
// For another menu object, call its functions like update() and position() next to pMenu's,
// I've put examples in to show where these need to go.
//    The reason for these is that every time you set them, they override a previous setting.
// So make sure you collate all the functions that need to be called in here! Syntax:

//object.onevent = function()
//{
// function1();
// function2();
// ...
//}

// That's similar to: <BODY ONEVENT="function1(); function2(); ...">


// The most important event is one used to display the menu by calling one of several methods of
// any menu object(s) you have created. This is where you select the menu creation mode. 'Dynamic'
// mode inserts the menus into the document once it has finished loading and supports features
// like modifying the menu after creation. You update a menu in 'Dynamic' mode by just calling the
// .update() method of a menu object like 'pMenu'.
//    'Fast' creation mode writes the menus to the document here and now, which is faster and
// more reliable in many browsers but only when the document's loading -- you do this by passing
// 'true' without quotes to the update function to signal that we're inline.
//    Opera only supports Fast mode and Netscape 4 only supports in Dynamic mode, so we use
// browser-detect code here. If you find some browser has troubles with one mode or another, try
// the other menu creation method -- see the "Cross-Browser" code at the very top of the SCRIPT
// tag for the variables used.
//    Hardcore tweakers -- there's some extra code commented in the popOver() function at the top
// which lets you create the root menu on page load and other menus only as needed, which might
// be useful for very very large menus in a single frame. Look it up if you want.

//if (!isNS4)
//{
 // Write menus now in non-NS4 browsers, by calling the "Fast" mode .update(true) method.
// pMenu.update(true);
 //anotherMenu.update(true);
//}
//else
//{
 // For Netscape 4, back up the old onload function and make a new one to update our menus.
 // This is the regular "Dynamic" mode menu update, it works in IE and NS6 too if required.
// var popOldOL = window.onload;
// window.onload = function()
// {
//  if (popOldOL) popOldOL();
//  pMenu.update();
  //anotherMenu.update();
// }
//}


// Other events must be assigned, these are less complicated, just add or remove menu objects.

//var nsWinW = window.innerWidth, nsWinH = window.innerHeight, popOldOR = window.onresize;
//window.onresize = function()
//{
// if (popOldOR) popOldOR();
// if (isNS4 && (nsWinW!=innerWidth || nsWinH!=innerHeight)) history.go(0);
// pMenu.position();
 //anotherMenu.position();
//}


//window.onscroll = function()
//{
// pMenu.position();
 //anotherMenu.position();
//}


// NS4 can't reliably capture clicks on layers, so here's a workaround.
//if (isNS4)
//{
// document.captureEvents(Event.CLICK);
// document.onclick = function(evt)
// {
//  with (pMenu) if (overI) click(overM, overI);
  //with (anotherMenu) if (overI) click(overM, overI);
//  return document.routeEvent(evt);
// }
//}

// Activate the window.onscroll() event in non-Microsoft browsers.
//if (!isIE || isOp)
//{
// var nsPX=pageXOffset, nsPY=pageYOffset;
// setInterval('if (nsPX!=pageXOffset || nsPY!=pageYOffset) ' +
// '{ nsPX=pageXOffset; nsPY=pageYOffset; window.onscroll() }', 50);
//}






// *** (5) OPTIONAL CODE ***   DELETE IF YOU'RE NOT USING THESE!


// MOUSE EVENTS:
//
// If you want, you can assign functions to handle mouse events like mouse over/out/click.
// You'll want to use these for assigning click actions to 'sm:' items or status messages etc.
// 'with (this)' means use the properties of the menu object, and it's passed the current
// menu name (mN) and item number (iN) you can use to calculate the active item.
// To uncomment and activate, delete the /* and */ at the start and end.

/*
pMenu.onclick = function(mN, iN) { with (this)
{
 // Do actions depending on the item that the mouse was over at the time of the click.
 // You may with to use nested IFs or 'switch' statements etc. if you're familiar with JS.

 if (mN == 'root')
 {
  if (iN == 1) status = 'Congratulations, you\'ve mastered clicking!';
  // Click on second item in root menu will navigate to 'edit.html'. Copy and paste this for
  // each menu item to add click actions to 'sm:' items...
  if (iN == 2) location.href = 'edit.html';
  if (iN == 3) location.href = 'help.html';
 }
}}

// Set the status message to the URL if the 'action type' is nothing, and clear on mouseout.
pMenu.onmouseover = function(mN, iN) { with (this)
{
 // By now, you either have my JS Object Browser script from my site or you need it... try
 // embedding in an IFrame and typing 'pMenu' into its Go To field to see the menu internals.
 with (menu[mN][iN]) if (!type) status = href;
}}
pMenu.onmouseout = function() { status = '' }
*/




// ANIMATION:
//
// Each menu object you create by default shows and hides its menus instantaneously.
// However you can override this behaviour with custom show/hide animation routines,
// as we have done in the "Menu Effects" section. Feel free to edit this, or delete
// this entire function if you're not using it. Basically, make functions to handle
// menuObj.showMenu() and .hideMenu(), both of which are passed menu names.
//
// Customisers: My lyr.clip() command gets passed the parameters (x1, y1, x2, y2)
// so you might want to adjust the direction etc. Oh, and I'm adding 2 to the dimensions
// to be safe due to different box models in some browsers.
// Another idea: add some if/thens to test for specific menu names...?


function menuAnim(menuObj, menuName, dir)
{
 // The array index of the named menu (e.g. 'mFile') in the menu object (e.g. 'pMenu').
 var mD = menuObj.menu[menuName][0];
 // Add timer and counter variables to the menu data structure, we'll need them.
 if (!mD.timer) mD.timer = 0;
 if (!mD.counter) mD.counter = 0;

 with (mD)
 {
  // Stop any existing animation.
  clearTimeout(timer);

  // If the layer doesn't exist (cross-frame navigation) quit.
  if (!lyr || !lyr.ref) return;
  // Show the menu if that's what we're doing.
  if (dir>0) lyr.vis('visible');
  // Also raise showing layers above hiding ones.
  lyr.sty.zIndex = 1001 + dir;

  // Alpha fade in IE5.5+. Mozilla's opacity isn't well suited to this as it's an inheritable
  // property rather than a block-level filter, and it's slow, but uncomment and try it perhaps.
  // WARNING: This looks funny if you're mixing opaque and translucent items e.g. solid menus
  // with dropshadows. If you're going to use it, make sure all your alpha values for a given
  // menus are numbers, or they're all null (solid).
  //if (isIE && window.createPopup) lyr.alpha(counter&&(counter<100) ? counter : null);

  // Clip the visible area. Tweak this if you want to change direction/acceleration etc.
  lyr.clip(0, 0, menuW+2, (menuH+2)*Math.pow(Math.sin(Math.PI*counter/200),0.75) );
  // Remove clipping in NS6 on completion, seems to help old versions.
  if ((isDOM&&!isIE) && (counter>=100)) lyr.sty.clip='';

  // Increment the counter and if it hasn't reached the end (10 steps either way),
  // set the timer to call the show/hide function again in 40ms.
  counter += dir;
  if (counter>100) counter = 100;
  else if (counter<0) { counter = 0; lyr.vis('hidden') }
  else timer = setTimeout(menuObj.myName+'.'+(dir>0?'show':'hide')+'Menu("'+menuName+'")', 40);
 }
}

// Here's the alternative IE5.5+ filter animation function.
function menuFilterShow(menuObj, menuName, filterName)
{
 var mD = menuObj.menu[menuName][0];
 with (mD.lyr)
 {
  sty.filter = filterName;
  var f = ref.filters;
  if (f&&f.length&&f[0]) f[0].Apply();
  vis('visible');
  if (f&&f.length&&f[0]) f[0].Play();
 }
}



// BORDERS AND DROPSHADOWS:
//
// Here's the menu border and dropshadow functions we call above. Edit ot delete if you're
// not using them. Basically, they assign a string to pMenu.menu.menuName[0].extraHTML, which
// is written to the document with the menus as they are created -- the string can contain
// anything you want, really. They also adjust the menu dimensions and item positions
// to suit. Dig out the Object Browser script and open up "pMenu" for more info.

function addMenuBorder(mObj, iS, alpha, bordCol, bordW, backCol, backW)
{
 // Loop through the menu array of that object, finding matching ItemStyles.
 for (var mN in mObj.menu)
 {
  var mR=mObj.menu[mN], dS='<div style="position:absolute; background:';
  if (mR[0].itemSty != iS) continue;
  // Loop through the items in that menu, move them down and to the right a bit.
  for (var mI=1; mI<mR.length; mI++)
  {
   mR[mI].iX += bordW+backW;
   mR[mI].iY += bordW+backW;
  }
  // Extend the total dimensions of menu accordingly.
  mW = mR[0].menuW += 2*(bordW+backW);
  mH = mR[0].menuH += 2*(bordW+backW);

  // Set the menu's extra content string with divs/layers underneath the items.
  if (isNS4) mR[0].extraHTML += '<layer bgcolor="'+bordCol+'" left="0" top="0" width="'+mW+
   '" height="'+mH+'" z-index="980"><layer bgcolor="'+backCol+'" left="'+bordW+'" top="'+
   bordW+'" width="'+(mW-2*bordW)+'" height="'+(mH-2*bordW)+'" z-index="990"></layer></layer>';
  else mR[0].extraHTML += dS+bordCol+'; left:0px; top:0px; width:'+mW+'px; height:'+mH+
   'px; z-index:980; '+(alpha!=null?'filter:alpha(opacity='+alpha+'); -moz-opacity:'+(alpha/100):'')+
   '">'+dS+backCol+'; left:'+bordW+'px; top:'+bordW+'px; width:'+(mW-2*bordW)+'px; height:'+
   (mH-2*bordW)+'px; z-index:990"></div></div>';
 }
}


function addDropShadow(mObj, iS)
{
 // Pretty similar to the one above, just loops through list of extra parameters making
 // dropshadow layers (from arrays) and extending the menu dimensions to suit.
 for (var mN in mObj.menu)
 {
  var a=arguments, mD=mObj.menu[mN][0], addW=addH=0;
  if (mD.itemSty != iS) continue;
  for (var shad=2; shad<a.length; shad++)
  {
   var s = a[shad];
   if (isNS4) mD.extraHTML += '<layer bgcolor="'+s[1]+'" left="'+s[2]+'" top="'+s[3]+'" width="'+
    (mD.menuW+s[4])+'" height="'+(mD.menuH+s[5])+'" z-index="'+(arguments.length-shad)+'"></layer>';
   else mD.extraHTML += '<div style="position:absolute; background:'+s[1]+'; left:'+s[2]+
    'px; top:'+s[3]+'px; width:'+(mD.menuW+s[4])+'px; height:'+(mD.menuH+s[5])+'px; z-index:'+
    (a.length-shad)+'; '+(s[0]!=null?'filter:alpha(opacity='+s[0]+'); -moz-opacity:'+(s[0]/100):'')+
    '"></div>';
   addW=Math.max(addW, s[2]+s[4]);
   addH=Math.max(addH, s[3]+s[5]);
  }
  mD.menuW+=addW; mD.menuH+=addH;
 }
}


// Extra code for updating and moving the menus is embedded in the feature list in the HTML document
// below, have a look at that if you're interested in tweaking the menu more.









// *** (6) FRAMESET README ***

// You're looking at the single-frame version of this script right now. This menu does support
// frames with a few extensions -- the core script is the same, but you need to remove the "Events"
// section and include a modified version of it in each loaded file. Get the frameset example from
// my site first, I've put the modified section in a file named "SUBFR.JS".
//
// This script should reside in the topmost frameset. Files loaded in this frameset must satisfy
// two conditions to work:
// 
// 1) They must have all the needed CSS info from the <STYLE> tag included in them, and a small
// JavaScript file (SUBFR.JS) to activate and manage the menus in that frame.
// 
// 2) They must be from the same domain as this frameset -- you can't load in search results or
// similar from another server and pop menus out over it, due to browser JS security rules.
// 
// With the SUBFR.JS file, all you have to do is make sure that in the first line pMenu points to
// the correct pMenu -- that is, located within that frame's parent (this script). If you're using
// multiple menu objects across frames or loading framesets within framesets, you will have to edit
// it, otherwise just leave it as is. To use multiple menus, you need to create them both here and
// then edit SUBFR.JS in the same fashion as the Events section here, calling your second menu
// object whenever pMenu itself is called.
// 
// The example setup allows the menus in sub-frames scroll with their windows. All you have to do is
// use the 'page' object in that frame in a formula to get the current scrolling position of that
// frame, and then add or subtract pixels to position the menus from the scroll position, e.g. for a
// menu in a frame named 'xyz', we would set it to appear in that frame and appear near the top and
// 100px from the left:
// 
// startMenu('menuName', false, 'xyz.page.scrollX()+100', 'xyz.page.scrollY()+10', 17, hBar, 'xyz');
// 
// Of course, third-level menus in other frames can be positioned relative to their parents
// normally. (Remember: strings as positions mean 'absolute' and are calculated as formulae,
// numbers as positions mean 'relative', offset from its parent).
// 
// JS window syntax is OK, so parents can be 'xyz.subFrame.something' if you want, and the SUBFR
// file in that frame/window points back to this one (try scrWin=top rather than scrWin=parent).
// You'll probably want to specify target frames for each menu item, in the same fashion as
// you specified them for the menus themselves -- by default URLs will open in the window in
// which the script is located, the topmost frameset. Try addItem('Text', 'file.html', 'botFr');

