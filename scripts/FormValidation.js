// FormValidation.js
// 
// Author: Darrel Liu
// Copyright Mactive Incorporated, 2004
// This code may not be reused without express written permission from
// Mactive Incorporated.
//
// This Form Validation library code below contains four sections:
//   1. Browser detection code
//   2. Set of functions that validate common typed fields
//   3. Set of functions that validate field data based on pre-defined masks
//   4. Set of functions and browser event handlers that turn an HTML text edit box
//      to something similar to a Borland TMaskEdit control
//
// (J. Oelschlegel) NOTE:  I have spent literally weeks getting this to work properly under each of the various browsers... 
// Make sure that if you decide to modify any of the code trapKeyPress, handleKeyPress, handleKeyDown that 
// you test it on ALL BROWSERS on the PC   AND   on the MAC before you even THINK ABOUT checking in a modification cuz Im not working 
// on this stuff again   <and BTW   did I mention that I hate MACs?>     :-) 
// (and.... yes.. IE works differently on the MAC that it does on the PC as do Netscape and Mozilla/Firefox with respect to events)
//
// Verified that this works on the following 
//      PC 
//          (Perfectly)
//              IE 5/6
//              Mozilla (1.3a and up)
//              Firefox (all)
//              Netscape 7.1
//      Mac
//          (Perfectly)
//              Mozilla (1.7a)
//              Firefox (1.0)
//              Netscape 7.1
//          (Partially ... no cursor displays)
//              IE 5.2.3        doesnt support createTextRange()
//              Safari          doesnt support field.setSelectionRange(selectionStart, selectionEnd);
//              Mozilla (1.2)
//
// For more information, please refer to document "Form Validation.html" found under
// /Mactive/Java/Docs/Applications/ThinClient directory.
//
// History:
//    4-jul-2004 jpo
//      Extensive modifications to make this puppy work on all the browsers that we currently support and allow the keys
//      to be held down and let to autorepeat properly
//      Mostly on how events are handled... perform mostly in ON KEY DOWN and ON KEY PRESS versus the ON KEY UP... 
//      Biggest headache was on the MAC since the events propagate differently and the keycodes get strange 
//      (especially with SAFARI) 
//      trapKeyPress, handleKeyPress, handleKeyDown, browser sniffing routines, and various additional validation
//      routines along with fixing a few bugs.  
//    1-jan-2005 jpo
//      More modifications to support better internationalization currently on the CustomerDataTag pages.  Allow the masks to be
//      selected based on country codes specified via the combo box 'control field'.
//
// ================================================================================
// Global variables used by supporting functions 
// ================================================================================

// Defines browser types that support this library
var isIE = false;
var isMoz = false;
var isMac = false;
var isSafari = false;
var isOSX = false;
var isDebugFlag = false;
var lastKeyPressed;
var lastCharCode;
var aView;
var aBlinkOnErrorFlag = true;
var aBlinkRate = 500;
var aErrorFieldArray = new Array();
// the background color changes to indicate that there's an error in the field
var backgroundColorOK = "white";
var backgroundColorInvalid = "#ffd0d0";
var borderStyleOK = "inset"
var borderStyleError = "ridge"


function removeErrorField(field)
{
    for (var aIndex = 0; aIndex < aErrorFieldArray.length; aIndex++)
    {
        if ((aErrorFieldArray[aIndex]).id == field.id)
        {
            // Splice the array to delete the element.. 
            if (aErrorFieldArray.splice) aErrorFieldArray.splice(aIndex, 1);
            else
            {
                // Splice wasnt implemented.. therfore.. just null outthe entry
                for (var aNewIndex = aIndex; aNewIndex < aErrorFieldArray.length - 1; aNewIndex++)
                    aErrorFieldArray[aNewIndex] = aErrorFieldArray[aNewIndex+1];
                aErrorFieldArray[aNewIndex] = null;
                aErrorFieldArray.length = aErrorFieldArray.length - 1;
            }            
            break;            
        } // end if (aErrorFieldArray[aIndex].id == field.id)
    } // end for (var aIndex = 0; aIndex < aErrorFieldArray.length; aIndex++)

}

function indicateErrorFields()
{
    var aIndex = aErrorFieldArray.length -1;
    
    if (aBlinkOnErrorFlag == true)
    {
        if (aIndex >= 0)
        {
            // If you want to indicate on each field.. do this...    
            //    for (var aIndex = 0; aIndex < aErrorFieldArray.length; aIndex++)
            //    {
            //        if (isSafari) (aErrorFieldArray[aIndex]).style.opacity = ((aErrorFieldArray[aIndex]).style.opacity != "1") ? "1" : "0.5";
            //        if (!isSafari) aErrorFieldArray[aIndex].style.backgroundColor = ((aErrorFieldArray[aIndex]).style.backgroundColor == backgroundColorOK) ? backgroundColorInvalid : backgroundColorOK ; 
            //    }
            
            // only allow 1 field to be indicated at a time... 
            if (isSafari) (aErrorFieldArray[aIndex]).style.opacity = ((aErrorFieldArray[aIndex]).style.opacity != "1") ? "1" : "0.3";
            if (!isSafari) aErrorFieldArray[aIndex].style.backgroundColor = ((aErrorFieldArray[aIndex]).style.backgroundColor == backgroundColorOK) ? backgroundColorInvalid : backgroundColorOK ; 
            
        }
    
        if (aErrorFieldArray.length != 0)
        {
            setTimeout("indicateErrorFields()", aBlinkRate);
        }
    }
    
}

function addErrorField(field)
{

    // Add the field to the error list
    aErrorFieldArray[aErrorFieldArray.length] = field;

    // Only Kickoff the timer if this is the first eleent on the list.. otherwise.. it is already being set... 

    if (aBlinkOnErrorFlag == true)
    {    
        if (aErrorFieldArray.length == 1) setTimeout("indicateErrorFields()", aBlinkRate);
    }
    
}

// ================================================================================
// Section I. Supporting Functions
// ================================================================================

// check if user's browser supports this library
function isSupported()
{
	return (isIE || isMoz);
}

function sniffBrowser()
{

    //----
    // J. Oelschlegel
    // Found this 'ultimate browser sniffer on netscape site.... so we will use this to set our specific flags...
    // I know this is OVERKILL for our little app.. but I thought it was complete and shoud provide us with everything 
    // we need now and in the future.. :-) 
    //----
    
    // Revised 22 Feb 01 to correct Javascript Detection for IE 5.x, Opera 4, 
    //                      correct Opera 5 detection
    //                      add support for winME and win2k
    //                      synch with browser-type-oo.js
    // Revised 26 Mar 01 to correct Opera detection
    // Revised 02 Oct 01 to add IE6 detection
    
    // Everything you always wanted to know about your JavaScript client
    // but were afraid to ask. Creates "is_" variables indicating:
    // (1) browser vendor:
    //     is_nav, is_ie, is_opera, is_hotjava, is_webtv, is_TVNavigator, is_AOLTV
    // (2) browser version number:
    //     is_major (integer indicating major version number: 2, 3, 4 ...)
    //     is_minor (float   indicating full  version number: 2.02, 3.01, 4.04 ...)
    // (3) browser vendor AND major version number
    //     is_nav2, is_nav3, is_nav4, is_nav4up, is_nav6, is_nav6up, is_gecko, is_ie3,
    //     is_ie4, is_ie4up, is_ie5, is_ie5up, is_ie5_5, is_ie5_5up, is_ie6, is_ie6up, is_hotjava3, is_hotjava3up,
    //     is_opera2, is_opera3, is_opera4, is_opera5, is_opera5up
    // (4) JavaScript version number:
    //     is_js (float indicating full JavaScript version number: 1, 1.1, 1.2 ...)
    // (5) OS platform and version:
    //     is_win, is_win16, is_win32, is_win31, is_win95, is_winnt, is_win98, is_winme, is_win2k
    //     is_os2
    //     is_mac, is_mac68k, is_macppc
    //     is_unix
    //     is_sun, is_sun4, is_sun5, is_suni86
    //     is_irix, is_irix5, is_irix6
    //     is_hpux, is_hpux9, is_hpux10
    //     is_aix, is_aix1, is_aix2, is_aix3, is_aix4
    //     is_linux, is_sco, is_unixware, is_mpras, is_reliant
    //     is_dec, is_sinix, is_freebsd, is_bsd
    //     is_vms
    //
    // See http://www.it97.de/JavaScript/JS_tutorial/bstat/navobj.html and
    // http://www.it97.de/JavaScript/JS_tutorial/bstat/Browseraol.html
    // for detailed lists of userAgent strings.
    //
    // Note: you don't want your Nav4 or IE4 code to "turn off" or
    // stop working when new versions of browsers are released, so
    // in conditional code forks, use is_ie5up ("IE 5.0 or greater") 
    // is_opera5up ("Opera 5.0 or greater") instead of is_ie5 or is_opera5
    // to check version in code which you want to work on future
    // versions.

    // convert all characters to lowercase to simplify testing
    var agt=navigator.userAgent.toLowerCase();

    // *** BROWSER VERSION ***
    // Note: On IE5, these return 4, so use is_ie5up to detect IE5.
    var is_major = parseInt(navigator.appVersion);
    var is_minor = parseFloat(navigator.appVersion);

    // Note: Opera and WebTV spoof Navigator.  We do strict client detection.
    // If you want to allow spoofing, take out the tests for opera and webtv.
    var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
                && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
                && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1));
    var is_nav2 = (is_nav && (is_major == 2));
    var is_nav3 = (is_nav && (is_major == 3));
    var is_nav4 = (is_nav && (is_major == 4));
    var is_nav4up = (is_nav && (is_major >= 4));
    var is_navonly      = (is_nav && ((agt.indexOf(";nav") != -1) ||
                          (agt.indexOf("; nav") != -1)) );
    var is_nav6 = (is_nav && (is_major == 5));
    var is_nav6up = (is_nav && (is_major >= 5));
    var is_gecko = (agt.indexOf('gecko') != -1);


    var is_ie     = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
    var is_ie3    = (is_ie && (is_major < 4));
    var is_ie4    = (is_ie && (is_major == 4) && (agt.indexOf("msie 4")!=-1) );
    var is_ie4up  = (is_ie && (is_major >= 4));
    var is_ie5    = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")!=-1) );
    var is_ie5_5  = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.5") !=-1));
    var is_ie5up  = (is_ie && !is_ie3 && !is_ie4);
    var is_ie5_5up =(is_ie && !is_ie3 && !is_ie4 && !is_ie5);
    var is_ie6    = (is_ie && (is_major == 4) && (agt.indexOf("msie 6.")!=-1) );
    var is_ie6up  = (is_ie && !is_ie3 && !is_ie4 && !is_ie5 && !is_ie5_5);

    
    // Macintosh safari.. maybe need to beef this up a little for various versions
    var is_safari = (agt.indexOf("safari") != -1);
    
    // KNOWN BUG: On AOL4, returns false if IE3 is embedded browser
    // or if this is the first browser window opened.  Thus the
    // variables is_aol, is_aol3, and is_aol4 aren't 100% reliable.
    var is_aol   = (agt.indexOf("aol") != -1);
    var is_aol3  = (is_aol && is_ie3);
    var is_aol4  = (is_aol && is_ie4);
    var is_aol5  = (agt.indexOf("aol 5") != -1);
    var is_aol6  = (agt.indexOf("aol 6") != -1);

    var is_opera = (agt.indexOf("opera") != -1);
    var is_opera2 = (agt.indexOf("opera 2") != -1 || agt.indexOf("opera/2") != -1);
    var is_opera3 = (agt.indexOf("opera 3") != -1 || agt.indexOf("opera/3") != -1);
    var is_opera4 = (agt.indexOf("opera 4") != -1 || agt.indexOf("opera/4") != -1);
    var is_opera5 = (agt.indexOf("opera 5") != -1 || agt.indexOf("opera/5") != -1);
    var is_opera5up = (is_opera && !is_opera2 && !is_opera3 && !is_opera4);

    var is_webtv = (agt.indexOf("webtv") != -1); 

    var is_TVNavigator = ((agt.indexOf("navio") != -1) || (agt.indexOf("navio_aoltv") != -1)); 
    var is_AOLTV = is_TVNavigator;

    var is_hotjava = (agt.indexOf("hotjava") != -1);
    var is_hotjava3 = (is_hotjava && (is_major == 3));
    var is_hotjava3up = (is_hotjava && (is_major >= 3));

    // *** JAVASCRIPT VERSION CHECK ***
    var is_js;
    if (is_nav2 || is_ie3) is_js = 1.0;
    else if (is_nav3) is_js = 1.1;
    else if (is_opera5up) is_js = 1.3;
    else if (is_opera) is_js = 1.1;
    else if ((is_nav4 && (is_minor <= 4.05)) || is_ie4) is_js = 1.2;
    else if ((is_nav4 && (is_minor > 4.05)) || is_ie5) is_js = 1.3;
    else if (is_hotjava3up) is_js = 1.4;
    else if (is_nav6 || is_gecko) is_js = 1.5;
    // NOTE: In the future, update this code when newer versions of JS
    // are released. For now, we try to provide some upward compatibility
    // so that future versions of Nav and IE will show they are at
    // *least* JS 1.x capable. Always check for JS version compatibility
    // with > or >=.
    else if (is_nav6up) is_js = 1.5;
    // NOTE: ie5up on mac is 1.4
    else if (is_ie5up) is_js = 1.3

    // HACK: no idea for other browsers; always check for JS version with > or >=
    else is_js = 0.0;

    // *** PLATFORM ***
    var is_win   = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );
    // NOTE: On Opera 3.0, the userAgent string includes "Windows 95/NT4" on all
    //        Win32, so you can't distinguish between Win95 and WinNT.
    var is_win95 = ((agt.indexOf("win95")!=-1) || (agt.indexOf("windows 95")!=-1));

    // is this a 16 bit compiled version?
    var is_win16 = ((agt.indexOf("win16")!=-1) || 
               (agt.indexOf("16bit")!=-1) || (agt.indexOf("windows 3.1")!=-1) || 
               (agt.indexOf("windows 16-bit")!=-1) );  

    var is_win31 = ((agt.indexOf("windows 3.1")!=-1) || (agt.indexOf("win16")!=-1) ||
                    (agt.indexOf("windows 16-bit")!=-1));

    var is_winme = ((agt.indexOf("win 9x 4.90")!=-1));
    var is_win2k = ((agt.indexOf("windows nt 5.0")!=-1));

    // NOTE: Reliable detection of Win98 may not be possible. It appears that:
    //       - On Nav 4.x and before you'll get plain "Windows" in userAgent.
    //       - On Mercury client, the 32-bit version will return "Win98", but
    //         the 16-bit version running on Win98 will still return "Win95".
    var is_win98 = ((agt.indexOf("win98")!=-1) || (agt.indexOf("windows 98")!=-1));
    var is_winnt = ((agt.indexOf("winnt")!=-1) || (agt.indexOf("windows nt")!=-1));
    var is_win32 = (is_win95 || is_winnt || is_win98 || 
                    ((is_major >= 4) && (navigator.platform == "Win32")) ||
                    (agt.indexOf("win32")!=-1) || (agt.indexOf("32bit")!=-1));

    var is_os2   = ((agt.indexOf("os/2")!=-1) || 
                    (navigator.appVersion.indexOf("OS/2")!=-1) ||   
                    (agt.indexOf("ibm-webexplorer")!=-1));

    var is_mac    = (agt.indexOf("mac")!=-1);
    // hack ie5 js version for mac
    if (is_mac && is_ie5up) is_js = 1.4;
    var is_mac68k = (is_mac && ((agt.indexOf("68k")!=-1) || 
                               (agt.indexOf("68000")!=-1)));
    var is_macppc = (is_mac && ((agt.indexOf("ppc")!=-1) || 
                                (agt.indexOf("powerpc")!=-1)));
    var is_OSX   = (agt.indexOf("os x") != -1);
    var is_sun   = (agt.indexOf("sunos")!=-1);
    var is_sun4  = (agt.indexOf("sunos 4")!=-1);
    var is_sun5  = (agt.indexOf("sunos 5")!=-1);
    var is_suni86= (is_sun && (agt.indexOf("i86")!=-1));
    var is_irix  = (agt.indexOf("irix") !=-1);    // SGI
    var is_irix5 = (agt.indexOf("irix 5") !=-1);
    var is_irix6 = ((agt.indexOf("irix 6") !=-1) || (agt.indexOf("irix6") !=-1));
    var is_hpux  = (agt.indexOf("hp-ux")!=-1);
    var is_hpux9 = (is_hpux && (agt.indexOf("09.")!=-1));
    var is_hpux10= (is_hpux && (agt.indexOf("10.")!=-1));
    var is_aix   = (agt.indexOf("aix") !=-1);      // IBM
    var is_aix1  = (agt.indexOf("aix 1") !=-1);    
    var is_aix2  = (agt.indexOf("aix 2") !=-1);    
    var is_aix3  = (agt.indexOf("aix 3") !=-1);    
    var is_aix4  = (agt.indexOf("aix 4") !=-1);    
    var is_linux = (agt.indexOf("inux")!=-1);
    var is_sco   = (agt.indexOf("sco")!=-1) || (agt.indexOf("unix_sv")!=-1);
    var is_unixware = (agt.indexOf("unix_system_v")!=-1); 
    var is_mpras    = (agt.indexOf("ncr")!=-1); 
    var is_reliant  = (agt.indexOf("reliantunix")!=-1);
    var is_dec   = ((agt.indexOf("dec")!=-1) || (agt.indexOf("osf1")!=-1) || 
           (agt.indexOf("dec_alpha")!=-1) || (agt.indexOf("alphaserver")!=-1) || 
           (agt.indexOf("ultrix")!=-1) || (agt.indexOf("alphastation")!=-1)); 
    var is_sinix = (agt.indexOf("sinix")!=-1);
    var is_freebsd = (agt.indexOf("freebsd")!=-1);
    var is_bsd = (agt.indexOf("bsd")!=-1);
    var is_unix  = ((agt.indexOf("x11")!=-1) || is_sun || is_irix || is_hpux || 
                 is_sco ||is_unixware || is_mpras || is_reliant || 
                 is_dec || is_sinix || is_aix || is_linux || is_bsd || is_freebsd);

    var is_vms   = ((agt.indexOf("vax")!=-1) || (agt.indexOf("openvms")!=-1));


    // Set MACTIVEs known variables... 
    isIE = is_ie5up;
    isSafari = is_safari;
    isMac = is_mac;
    isOSX = is_OSX;
    
    // Make the MAC IE look like mozilla since the key sequences are different... 
    isMoz = is_gecko || is_nav6up || isSafari;
    
}

// Run the method to initialize global variables
sniffBrowser();


// ================================================================================
// Section II. Validation Methods for Fields
// ================================================================================

// whitespace characters as defined by this sample code
var whitespace = " \t\n\r";

// Check whether string s is empty
function isEmpty (s)
{
	return ((s == null) || (s.length == 0))
}

// Returns true if string s is empty or whitespace characters only
function isWhitespace (s)
{
	var i;

	if (isEmpty(s)) return true;

	// Search through string's characters one by one until we find a non-whitespace character.
	// When we do, return false; if we don't, return true.
	for (i = 0; i < s.length; i++)
	{
		// Check that current character isn't whitespace.
		if (whitespace.indexOf(s.charAt(i)) == -1) return false;
	}

	return true;
}

// Returns true if character c is a letter (A..Z, a..z).
function isLetter(c)
{
	return (((c >= 'a') && (c <= 'z')) || ((c >= 'A') && (c <= 'Z')));
}

// Returns true if character c is a digit (0..9).
function isDigit(c)
{
	return ((c >= '0') && (c <= '9'));
}

// Returns true if character c is plus/minus sign.
function isSign(c)
{
	return ((c == '+') || (c == '-'));
}

// Returns true if character c is a letter or digit.
function isLetterOrDigit(c)
{
	return (isLetter(c) || isDigit(c));
}

// Returns true if character c is an ASCII character.
function isCharacter(c)
{
	return (c >= ' ' && c <= '~');
}

// Returns true if all characters in string s are non-signed integers.
function isInteger(s, required)
{
	var i;

	if (isEmpty(s)) return (required == false);

	for (i = 0; i < s.length; i++)
	{
		if (!isDigit(s.charAt(i))) return false;
	}

	return true;
}

// Returns true if all characters are numbers; first character is allowed to be + or - as well.
function isSignedInteger(s, required)
{
	if (isEmpty(s)) return (required == false);
	else {
		var startPos = 0;

		// skip leading + or -
		if ((s.charAt(0) == "-") || (s.charAt(0) == "+"))
			startPos = 1;
		return (isInteger(s.substring(startPos, s.length), required))
	}
}

// Returns true if string s is an integer > 0.
function isPositiveInteger(s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed integer, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a positive, not negative, number
	return (isSignedInteger(s, required) && ((isEmpty(s) && required) || (parseInt(s) > 0)));
}

// Returns true if string s is an integer >= 0.
function isNonnegativeInteger(s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed integer, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a number >= 0
	return (isSignedInteger(s, required) && ((isEmpty(s) && required) || (parseInt(s) >= 0)));
}

// Returns true if string s is an integer < 0.
function isNegativeInteger(s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed integer, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a negative, not positive, number
	return (isSignedInteger(s, required) && ((isEmpty(s) && required) || (parseInt(s) < 0)));
}

// Returns true if string s is an integer <= 0.
function isNonpositiveInteger(s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed integer, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a number <= 0
	return (isSignedInteger(s, required) && ((isEmpty(s) && required) || (parseInt(s) <= 0)));
}

// isIntegerInRange returns true if string s is an integer within the range of integer arguments a and b, inclusive.
function isIntegerInRange(s, a, b)
{
	if (isEmpty(s)) return (required == false);

	// Catch non-integer strings to avoid creating a NaN below,
	// which isn't available on JavaScript 1.0 for Windows.
	if (!isInteger(s, false)) return false;

	// Now, explicitly change the type to integer via parseInt
	// so that the comparison code below will work both on
	// JavaScript 1.2 (which typechecks in equality comparisons)
	// and JavaScript 1.1 and before (which doesn't).
	var num = parseInt (s);
	return ((num >= a) && (num <= b));
}

// True if string s is an unsigned floating point (real) number.
function isFloat(s, required)
{
	// var decimalPointDelimiter = document.getElementById("FormValidationMask_NumberDecimalPoint").value;
	var decimalPointDelimiter = getInternationalizedFieldMask("FormValidationMask_NumberDecimalPoint", null, null);

	var i;
	var seenDecimalPoint = false;

	if (isEmpty(s)) return (required == false);

	if (s == decimalPointDelimiter) return false;

	for (i = 0; i < s.length; i++)
	{
		var c = s.charAt(i);

		if ((c == decimalPointDelimiter) && !seenDecimalPoint) seenDecimalPoint = true;
		else if (!isDigit(c)) return false;
	}

	return true;
}

// True if string s is a signed or unsigned floating point (real) number. First character is allowed to be + or -.
function isSignedFloat(s, required)
{
	if (isEmpty(s)) return (required == false);
	else {
		var startPos = 0;

		// skip leading + or -
		if ((s.charAt(0) == "-") || (s.charAt(0) == "+"))
			startPos = 1;
		return (isFloat(s.substring(startPos, s.length), required))
	}
}

// Returns true if string s is a float > 0.
function isPositiveFloat (s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed float, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a positive, not negative, number
	return (isSignedFloat(s, required) && ((isEmpty(s) && required) || (parseInt(s) > 0)));
}

// Returns true if string s is a float >= 0.
function isNonnegativeFloat (s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed float, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a number >= 0
	return (isSignedFloat(s, required) && ((isEmpty(s) && required) || (parseInt(s) >= 0)));
}

// Returns true if string s is a float < 0.
function isNegativeFloat (s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed float, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a negative, not positive, number
	return (isSignedFloat(s, required) && ((isEmpty(s) && required) || (parseInt(s) < 0)));
}

// Returns true if string s is a float <= 0.
function isNonpositiveFloat (s, required)
{
	// The next line is a bit byzantine.  What it means is:
	// a) s must be a signed float, AND
	// b) one of the following must be true:
	//   i) s is empty and we are supposed to return true for empty strings
	//  ii) this is a number <= 0
	return (isSignedFloat(s, required) && ((isEmpty(s) && required) || (parseInt(s) <= 0)));
}

// Returns true if string s is English letters (A .. Z, a..z) only.
function isAlphabetic(s, required)
{
	var i;

	if (isEmpty(s)) return (required == false);

	for (i = 0; i < s.length; i++)
	{
		if (!isLetter(s.charAt(i))) return false;
	}

	return true;
}

// Returns true if string s is English letters (A .. Z, a..z) and numbers only.
function isAlphanumeric(s, required)
{
	var i;

	if (isEmpty(s)) return (required == false);

	for (i = 0; i < s.length; i++)
	{
		if (!(isLetter(s.charAt(i)) || isDigit(s.charAt(i)))) return false;
	}

	return true;
}

// isSSN returns true if string s is a valid U.S. Social Security Number. Must be 9 digits.
function isSSN(s, required)
{
	if (isEmpty(s)) return (required == false);

	return (isInteger(s) && s.length == 9);
}

// Email address must be of form a@b.c -- in other words:
function isEmail(s, required)
{
	if (isEmpty(s)) return (required == false);

	// is s whitespace?
	if (isWhitespace(s)) return false;

	var i = 1;
	var sLength = s.length;

	// look for @
	while ((i < sLength) && (s.charAt(i) != "@"))
		i++

	if ((i >= sLength) || (s.charAt(i) != "@")) return false;
	else i += 2;

	// look for .
	while ((i < sLength) && (s.charAt(i) != "."))
		i++

	// there must be at least one character after the .
	if ((i >= sLength - 1) || (s.charAt(i) != ".")) return false;
	else return true;
}

// Removes all characters which appear in string bag from string s.
function stripCharsInBag(s, bag)
{
	var i;
	var returnString = "";

	for (i = 0; i < s.length; i++)
	{
		var c = s.charAt(i);
		if (bag.indexOf(c) == -1) returnString += c;
	}

	return returnString;
}

// Removes all characters which do NOT appear in string bag from string s.
function stripCharsNotInBag(s, bag)
{
	var i;
	var returnString = "";

	for (i = 0; i < s.length; i++)
	{
		var c = s.charAt(i);
		if (bag.indexOf(c) != -1) returnString += c;
	}

	return returnString;
}

// Removes all whitespace characters from s.
function stripWhitespace (s)
{
	return stripCharsInBag(s, whitespace);
}

// Removes initial (leading) whitespace characters from s.
function stripInitialWhitespace (s)
{
	var i = s.indexOf(whitespace);

	return s.substring(i, s.length);
}

// reformat (TARGETSTRING, STRING, INTEGER, STRING, INTEGER ... )
//
// Handy function for arbitrarily inserting formatting characters
// or delimiters of various kinds within TARGETSTRING.
//
// reformat takes one named argument, a string s, and any number
// of other arguments.  The other arguments must be integers or
// strings.  These other arguments specify how string s is to be
// reformatted and how and where other strings are to be inserted
// into it.
//
// reformat processes the other arguments in order one by one.
// * If the argument is an integer, reformat appends that number
//   of sequential characters from s to the resultString.
// * If the argument is a string, reformat appends the string
//   to the resultString.
//
// NOTE: The first argument after TARGETSTRING must be a string.
// (It can be empty.)  The second argument must be an integer.
// Thereafter, integers and strings must alternate.  This is to
// provide backward compatibility to Navigator 2.0.2 JavaScript
// by avoiding use of the typeof operator.
//
// It is the caller's responsibility to make sure that we do not
// try to copy more characters from s than s.length.
//
// EXAMPLES:
//
// * To reformat a 10-digit U.S. phone number from "1234567890"
//   to "(123) 456-7890" make this function call:
//   reformat("1234567890", "(", 3, ") ", 3, "-", 4)
//
// * To reformat a 9-digit U.S. Social Security number from
//   "123456789" to "123-45-6789" make this function call:
//   reformat("123456789", "", 3, "-", 2, "-", 4)
//
// HINT:
//
// If you have a string which is already delimited in one way
// (example: a phone number delimited with spaces as "123 456 7890")
// and you want to delimit it in another way using function reformat,
// call function stripCharsNotInBag to remove the unwanted
// characters, THEN call function reformat to delimit as desired.
//
// EXAMPLE:
//
// reformat (stripCharsNotInBag ("123 456 7890", digits), "(", 3, ") ", 3, "-", 4)
function reformat(s)
{
	var arg;
	var sPos = 0;
	var resultString = "";

	for (var i = 1; i < reformat.arguments.length; i++) {
		arg = reformat.arguments[i];
		if (i % 2 == 1) resultString += arg;
		else {
			resultString += s.substring(sPos, sPos + arg);
			sPos += arg;
		}
	}

	return resultString;
}

function reformatSSN(value)
{
	return (reformat(value, "", 3, "-", 2, "-", 4));
}

function checkSSN(field, required, error)
{
	var retVal = true;

	var normalized = stripCharsInBag(field.value, "- ")
	if (!isSSN(normalized, required))
		retVal = false;
	else
		field.value = reformatSSN(normalized);

	return notify(retVal, field, error);
}

function checkEmail(field, required, error)
{
	return notify(isEmail(field.value, required), field, error);
}

function reformatCurrency(value, required)
{
//	var currencySymbol = document.getElementById("FormValidationMask_CurrencySymbol").value;
//	var numberGrouping = document.getElementById("FormValidationMask_NumberGrouping").value;
//	var numberGrouper = document.getElementById("FormValidationMask_NumberGrouper").value;
//	var decimalPointDelimiter = document.getElementById("FormValidationMask_NumberDecimalPoint").value;

	var currencySymbol = getInternationalizedFieldMask("FormValidationMask_CurrencySymbol", null, null);
	var numberGrouping = getInternationalizedFieldMask("FormValidationMask_NumberGrouping", null, null);
	var numberGrouper =  getInternationalizedFieldMask("FormValidationMask_NumberGrouper", null, null);
	var decimalPointDelimiter = getInternationalizedFieldMask("FormValidationMask_NumberDecimalPoint", null, null);

	var maxIntegerDigits = 10;

	if (value.length == 0 && required)
		value = "0.00";
	else if (isNonnegativeInteger(value, required)) {
		if (value.length > maxIntegerDigits)
			value = value.substring(value.length - maxIntegerDigits, value.length);
		value += ".00";
	} else if (isNonnegativeFloat(value, required)) {
		var integer = value.substring(0, value.indexOf(decimalPointDelimiter));
		if (integer.length > maxIntegerDigits)
			value = value.substring(integer.length - maxIntegerDigits, value.length);

		var numFraction = value.length - value.indexOf(decimalPointDelimiter) - 1;
        if (numFraction == 0)
        	value += "00";
        else if (numFraction == 1)
        	value += "0";
        else if (numFraction > 2)
        	value = value.substring(0, value.length - (numFraction - 2));
	}

	// return (reformat(value, currencySymbol, value.length));
	return value;
}



function checkCurrency(field, required, error)
{
	var retVal = true;

	// var currencySymbol = document.getElementById("FormValidationMask_CurrencySymbol").value;
	// var numberGrouper = document.getElementById("FormValidationMask_NumberGrouper").value;
	var currencySymbol = getInternationalizedFieldMask("FormValidationMask_CurrencySymbol", null, null);
	var numberGrouper =  getInternationalizedFieldMask("FormValidationMask_NumberGrouper", null, null);

	var normalized = stripCharsInBag(field.value, currencySymbol + numberGrouper + " ")
	if (!isNonnegativeFloat(normalized, required))
		retVal = false;
	else
		field.value = reformatCurrency(normalized, required);

	return notify(retVal, field, error);
}

function checkInteger(field, required, error)
{
	return notify(isInteger(field.value, required), field, error);
}

function checkSignedInteger(field, required, error)
{
	return notify(isSignedInteger(field.value, required), field, error);
}

function checkPositiveInteger(field, required, error)
{
	return notify(isPositiveInteger(field.value, required), field, error);
}

function checkNonnegativeInteger(field, required, error)
{
	return notify(isNonnegativeInteger(field.value, required), field, error);
}

function checkNegativeInteger(field, required, error)
{
	return notify(isNegativeInteger(field.value, required), field, error);
}

function checkNonpositiveInteger(field, required, error)
{
	return notify(isNonpositiveInteger(field.value, required), field, error);
}

function checkFloat(field, required, error)
{
	return notify(isFloat(field.value, required), field, error);
}

function checkSignedFloat(field, required, error)
{
	return notify(isSignedFloat(field.value, required), field, error);
}

function checkPositiveFloat(field, required, error)
{
	return notify(isPositiveFloat(field.value, required), field, error);
}

function checkNonnegativeFloat(field, required, error)
{
	return notify(isNonnegativeFloat(field.value, required), field, error);
}

function checkNegativeFloat(field, required, error)
{
	return notify(isNegativeFloat(field.value, required), field, error);
}

function checkNonpositiveFloat(field, required, error)
{
	return notify(isNonpositiveFloat(field.value, required), field, error);
}

function checkAlphabetic(field, required, error)
{
	return notify(isAlphabetic(field.value, required), field, error);
}

function checkAlphanumeric(field, required, error)
{
	return notify(isAlphanumeric(field.value, required), field, error);
}

function checkSelection(field, required, error)
{
	return notify((required == false || (!isEmpty(field.value) && (field.value != "0"))), field, error);
}

function checkNonBlank(field, required, error)
{
	return notify(required == false || !isEmpty(field.value), field, error);
}

// ================================================================================
// Section III. Validation Methods for Masks
// ================================================================================

// Defines valid mask symbols
// --------------------------------------------------------------------------------
// Symbol  Description
// --------------------------------------------------------------------------------
//      \  The character that follows a literal character. Use this to turn any of
//         the mask special characters as a literal in the data
//      L  Requires an alphabetic character only in this position (A-Z, a-z for US)
//      l  Permits only an alphabetic character in this position, but not required
//      0  Requires a numeric character only in this position
//      9  Permits a numeric character in this position, but not required
//      A  Requires an alphanumeric character only in this position
//      a  Permits an alphanumeric character in this position, but not required
//      C  Requires an arbitrary character in this position
//      c  Permits an arbitrary character in this position, but not required
//      #  Permits a numeric character or a plus or minus sign in this position,
//         but not required
//      _  Space in the mask

var maskSymbols = "Ll09AaCc#";

// Defines the blank used to be displayed in the mask
var maskBlank = '_';

// A form to validation list hash table
var theFormValidations = new Array();


// Return true if the character is a blank space
function isBlank(c)
{
	return (c == maskBlank);
}

// Return the mask template used to display initially in the input field
// (this function will replace any mask symbols with '_')
function getEditableTemplate(mask)
{
	var template = "";

    if (mask != null)
    {
        for (var i = 0; i < mask.length; i++) {
            if (maskSymbols.indexOf(mask.charAt(i)) == -1)
                // a literal
			    template += mask.charAt(i);
            else
                // a mask symbol
			    template += maskBlank;
        }
    }

	return template;
}

// Return true if the user hasn't filled anything into the field yet
function isFieldEmpty(value, mask)
{
	return (isEmpty(value) || (value == getEditableTemplate(mask)));
}

// Given a current place, return the next spot in the mask editable for user
function nextCaretPositionInMask(position, mask)
{
	var nextPosition = position;

	for (var i = position + 1; i < mask.length; i++) {
		if (maskSymbols.indexOf(mask.charAt(i)) != -1) {
			nextPosition = i;
			break;
		}
	}

	return nextPosition;
}

// Given a current place, return the previous spot in the mask editable for user
function prevCaretPositionInMask(position, mask)
{
	var prevPosition = position;

	for (var i = position - 1; i >= 0; i--) {
		if (maskSymbols.indexOf(mask.charAt(i)) != -1) {
			prevPosition = i;
			break;
		}
	}

	return prevPosition;
}

// Use partial raw data to fill in the mask. This method depends on the
// currentPosition and currentMask to work properly
function importPartialToMask(field, data)
{
	var temp = field.value.substring(0, currentPosition);
	var i, j = 0;

	for (i = currentPosition; i < currentMask.length; i++) {
		if (maskSymbols.indexOf(currentMask.charAt(i)) == -1)
			// a literal
			temp += currentMask.charAt(i);
		else if (j < data.length)
			// a mask symbol
			temp += data.charAt(j++);
		else
			temp += maskBlank;
	}
	currentPosition = (i < currentMask.length) ? i : i - 1;

	return temp;
}

// Import raw data to the mask
function importToMask(id, data)
{
	var mask = findMaskById(findFormByFiedId(id), id);

        return importToMaskByMaskString(mask, data);
}

function setMaskedFieldValue(id, aMask, data)
{
    var aResult = "";
    aResult = importToMaskByMaskString(aMask, data);
	document.getElementById(id).value = aResult;     
}


function nullMaskedField(id)
{
    var mask = findMaskById(findFormByFiedId(id), id);
    setMaskedFieldValue(id, mask, "");    
}

function importToMaskByMaskString(aMask, data)
{
	var mask = aMask;
	var temp = "";
	var i, j = 0;

	if (mask == null || mask.length == 0)
		return data;

	for (i = 0; i < mask.length; i++) {
		if (maskSymbols.indexOf(mask.charAt(i)) == -1)
			// a literal
			temp += mask.charAt(i);
		else if (j < data.length)
			// a mask symbol
        {
            var ch = data.charAt(j++);
            if (ch ==  ' ')
                temp += maskBlank;
            else
                temp += ch;
        }
		else
			temp += maskBlank;
	}

	return temp;
}


// Export raw data from the mask
function exportFromMask(id)
{
	var field = document.getElementById(id);
	var mask = findMaskById(findFormByFiedId(id), id);
	var data = "";

	if (mask == null || mask.length == 0)
		return field.value;

	for (var i = 0; i < mask.length; i++) {
		if (maskSymbols.indexOf(mask.charAt(i)) == -1)
			// a literal
			;
		else if (field.value.charAt(i) != maskBlank)
			// a non-blank character
			data += field.value.charAt(i);
		else
			// a blank
			data += " ";
	}

	// trim ending spaces of the string
	return data.replace(/^\s+/g, '').replace(/\s+$/g, '');
}

// Called before form submission to strip off all masks
function beginSubmission(form)
{
	var backup = new Array();

	for (var i = 0; i < theFormValidations.length; i++)
	{
		if (form == theFormValidations[i].form)
		{
			backup[backup.length] = document.getElementById(theFormValidations[i].id).value;
			document.getElementById(theFormValidations[i].id).value = exportFromMask(theFormValidations[i].id);
		}
	}

	return backup;
}

// Called after form submission to re-mask form fields
function endSubmission(form, backup)
{
	var j = 0;
	for (var i = 0; i < theFormValidations.length; i++)
	{
		if (form == theFormValidations[i].form)
		{
			document.getElementById(theFormValidations[i].id).value = backup[j++];
		}
	}
}

// Validate a given character against a mask symbol
function validateCharMask(c, m)
{
	if ((m == 'L') && !isLetter(c))
		return false;
	else if ((m == 'l') && !isLetter(c) && !isBlank(c))
		return false;
	else if ((m == '0') && !isDigit(c))
		return false;
	else if ((m == '9') && !isDigit(c) && !isBlank(c))
		return false;
	else if ((m == 'A') && !isLetter(c) && !isDigit(c))
		return false;
	else if ((m == 'a') && !isLetter(c) && !isDigit(c) && !isBlank(c))
		return false;
	else if ((m == 'C') && !isCharacter(c))
		return false;
	else if ((m == 'c') && !isCharacter(c) && !isBlank(c))
		return false;

	return true;
}

// Validate the given value against a mask
function validateMask(value, mask, required)
{
	if (isFieldEmpty(value, mask) && !required)
		return true;

	for (var i = 0; i < mask.length; i++) {
		if (maskSymbols.indexOf(mask.charAt(i)) == -1) {
			// a literal
			if (mask.charAt(i) != value.charAt(i))
				return false;
		} else {
			// a mask symbol
			if (!validateCharMask(value.charAt(i), mask.charAt(i)))
				return false;
		}
	}

	return true;
}

// Return the mask by doing lookup in the validation list for a matching Id
function findMaskById(form, id)
{
	for (var i = 0; i < theFormValidations.length; i++)
	{
		if (id == theFormValidations[i].id)
			return theFormValidations[i].mask;
	}

	return null;
}

// Structure to hold necessary information to do the second-phase validation
function validationStruct()
{
	this.id = null;        // the field id to be validated
	this.form = null;      // the form this field resides
	this.validator = null; // the method to call to validate the field
	this.mask = null;      // the mask for validation
	this.required = null;  // whether this field is not required?
	this.error = null;     // the error message when validated invalid
    this.maskFieldName = null;
    this.controlFieldName = null;

}

// Find the form by specifying one of its field's id
function findFormByFiedId(fieldId)
{
	for (var i = 0; i < document.forms.length; i++) {
		for (var j = 0; j < document.forms[i].elements.length; j++) {
			var elem = document.forms[i].elements[j];

			if (elem.id == fieldId)
				return document.forms[i].name;
		}
	}

	return null;
}

// Add a field to the list to be validated in the second phase
function addField(fieldId, validator, isRequired, errorMsg)
{
	var valStruct = new validationStruct();
	valStruct.id = fieldId;
	valStruct.form = findFormByFiedId(fieldId);
	valStruct.validator = validator;
	valStruct.required = isRequired;
	valStruct.error = errorMsg;
    valStruct.maskFieldName = null;
    valStruct.controlFieldName = null;

	theFormValidations[theFormValidations.length] = valStruct;
}

function addMaskedField(fieldId, maskFieldId, isRequired, errorMsg)
{
	var valStruct = new validationStruct();
	valStruct.id = fieldId;
	valStruct.form = findFormByFiedId(fieldId);
	valStruct.mask = maskFieldId;
	valStruct.required = isRequired;
	valStruct.error = errorMsg;

    valStruct.maskFieldName = null;
    valStruct.controlFieldName = null;
	theFormValidations[theFormValidations.length] = valStruct;
}

// Global variables that are used to assist us... 
// InternationalizationControlFieldName - name of combo box that controls country to use...
// InternationalizationDefaultCountry - the 'name' of the default country code to use if there is no 
//      selection in the 'InternationalizationControlFieldName'
 
function getInternationalizedFieldMask(fieldName, controlFieldName, aInitialCountry)
{
    // Lets use the control field to go and generate the name of the actual form validation field name... 
    // The COUNTRY is prepended to each of the various masks...
    var aRetValue = "";  
    var aComboBoxElement = (controlFieldName != null) ? document.getElementById(controlFieldName) : null;
    var defaultCountry = document.getElementById("InternationalizationDefaultCountry").value;
    var internationalFieldName = defaultCountry + fieldName;       
    var currentCountry = null;
    
    // If there is no field specified return ""
    if (fieldName == null) return "";
    
    if (aComboBoxElement != null)
    {
        currentCountry = aComboBoxElement.options[aComboBoxElement.selectedIndex].text;
    } 
    else
    {
        // If the combo box element isnt there.. then maybe it hasnt been output to the page yet.  Therfore, lets use the initial
        // 'aInitialCountry' as the value for this
        if (aInitialCountry != null)
        {
            currentCountry = aInitialCountry;
        } // end if (aInitialCountry != null)
    }
    
    if ((currentCountry != null) && (currentCountry.length != 0))
    {
        // We will use the value of the current country to prepend..
        internationalFieldName = currentCountry + fieldName;
    } 

    if (document.getElementById(internationalFieldName) != null)
       aRetValue = document.getElementById(internationalFieldName).value;
    else
    {
        // Here we need to handle the case where the selection in the combo box in NON-NULL, however, is something
        // like "INVALID SELECTION" or some other goofy entry the programmer decided to put in there to specify 'none'
        // In this case.. lets use the default country for the masks
        internationalFieldName = defaultCountry + fieldName;
        aRetValue = document.getElementById(internationalFieldName).value;
    } // end if (document.getElementById(internationalFieldName) != null)
   
    // Now that we have a fully qualified internationalFieldName, we can go and lookup the real internationalized field
    return aRetValue;
    
}


function addMaskedField_ex(fieldId, maskFieldName, controlFieldName, isRequired, errorMsg)
{
    var valStruct = new validationStruct();
    valStruct.id = fieldId;
    valStruct.form = findFormByFiedId(fieldId);
    valStruct.mask = getInternationalizedFieldMask(maskFieldName, controlFieldName, null);
    // valStruct.mask = maskFieldId;
    valStruct.maskFieldName = maskFieldName;
    valStruct.controlFieldName = controlFieldName;
    valStruct.required = isRequired;
    valStruct.error = errorMsg;

    theFormValidations[theFormValidations.length] = valStruct;
}

function updateAllMaskedFields()
{
	var retVal = true;
	for (var i = 0; i < theFormValidations.length; i++) 
        {
           var field = document.getElementById(theFormValidations[i].id);
        
           // Rest the mask field for the new country code.. and mask field name

           if (theFormValidations[i].maskFieldName != null)
           {
               theFormValidations[i].mask = getInternationalizedFieldMask(theFormValidations[i].maskFieldName,theFormValidations[i].controlFieldName, null);
                // Now that we have the new mask in there... we can just go and NULL out the field
           }
        }

	for (var i = 0; i < theFormValidations.length; i++) 
        {
           var field = document.getElementById(theFormValidations[i].id);
           nullMaskedField(field.id);
        }
            
	return retVal;
}

// Notify user depending on the result value
function notify(retVal, field, s)
{
	if (retVal == true)
		return notifyOK(field);
	else
		return notifyInvalid(field, s);
}

// Change the field style as a notification of a good value
function notifyOK(field)
{
    // Make sure the field we are working on isnt indicated as an error.... 
    removeErrorField(field);  
    
    // IE doesnt like the 'important'
    field.style.backgroundColor = backgroundColorOK;
        
    if ( (isMac && isIE) == false ) field.style.borderStyle = borderStyleOK;
    
    var aPriorError = field.title ? ((field.title.indexOf("ERROR") == -1) ? false : true) : false;
    
    // On Safari, if there was previously an error.. lets decrease the size of the font now so 
    // that the user has some visual indication that the field is no longer in error
    // if (isSafari) if (aPriorError == true) field.style.fontSize = "smaller";
    if (isSafari) field.style.opacity = "1.0";
       
    // if (isSafari) field.parentNode.style.color = "black";

	// restore the original title or reset it to "" to clear out the error (remember this string is used when determining
    // if to make field 'smaller' on safari, so it is important to make sure it is cleared out.
    field.title = field.old_title ? ((field.old_title.indexOf("ERROR") == -1) ? field.old_title : "")  :  "";

	return true;
}

// Change the field style as a notification of an invalid value
function notifyInvalid(field, s)
{
	if (validationEnabled() == false) return;
    var aPriorError = field.title ? ((field.title.indexOf("ERROR") == -1) ? false : true) : false;
    
    // The following doesnt do anything on Safari... arghhh
    field.style.background = backgroundColorInvalid;  
    
    if ( (isMac && isIE) == false ) field.style.borderStyle = borderStyleError;
    
    // On safari, we will make an erroneous field a BIGGER font if it invalid so that the user has some 
    // visual indication there is a problem.  If you can think of anything better.. have at it!
    // Also tried setting parents style... but it doesnt seem to do anything... 
    // if (isSafari) if (aPriorError == false) field.style.fontSize = "larger";
    // if (isSafari) field.style.opacity = "0.4";
    // if (isSafari) field.parentNode.style.color = "red";
    //if (aPriorError == false) 
    //    field.parentNode.innerHTML += "&#8656;";
   
	// backup the original title
    field.old_title = field.title ? field.title : "";
	
    // Set the new onMouseOver message... 
    field.title = "ERROR: " + s;
    
    // Add this field onto the list of error fields... 
    if (aPriorError == false) addErrorField(field);
	return false;
}

// Check whether to do the validation
function validationEnabled()
{
	var flag = document.getElementById("FormValidationHidden_ErrorIndicator").value;
	return (flag != "false");
}

// Validate a field in the page, using the stored corresponding mask
function validate(field)
{
	var retVal = true;

    // Hack for a situation where commented out sections on a JSP will still be evaluated
    // possibly causing some validations to get inserted... So lets just say its validated. 
    if (field == null) return true;
    
	for (var i = 0; i < theFormValidations.length; i++) 
    {
		if (field.id == theFormValidations[i].id) 
        {
			var val = theFormValidations[i];

			if (val.mask != null) {
				retVal = notify(validateMask(field.value, val.mask, val.required), field, val.error);

				// clear out the mask if the field is empty
				if (isFieldEmpty(field.value, val.mask))
					field.value = "";
			} else if (val.validator != null)
				retVal = val.validator(field, val.required, val.error);
			else
				retVal = true;
            
            // if we have found the field.. lets break out..
            break;
		} // end if (field.id == theFormValidations[i].id)
	} // end for (var i = 0; i < theFormValidations.length; i++) 

	return retVal;
}

// The upon-submission validation for all form fields
function validateForm(form)
{
	var retVal = true;

	for (var i = 0; i < theFormValidations.length; i++) 
    {
		if (form == theFormValidations[i].form) 
        {
			var field = document.getElementById(theFormValidations[i].id);

			if (!validate(field)) 
            {
				alert("ERROR: " + theFormValidations[i].error);
				field.focus();
				retVal = false;
				break;
			} // end if (!validate(field))
		} // endif (form == theFormValidations[i].form)  
	} // end for (var i = 0; i < theFormValidations.length; i++)

	return retVal;
}

// The upon-submission validation for all form fields that are require validations
// and those that are in the validation list and are not required only if they are NOT EMPTY 
function validateAllFields()
{
	var retVal = true;

	for (var i = 0; i < theFormValidations.length; i++) 
    {
		var field = document.getElementById(theFormValidations[i].id);
		if (theFormValidations[i].required == true)
        {
            if (!validate(field))
            {
                alert("ERROR: " + theFormValidations[i].error);
                field.focus(); 
                return false;
            } // end if (!validate(field))
        }
        else
        {
            if (!isEmpty(field.value))
            {
                if (!validate(field))
                {
				    alert("ERROR: " + theFormValidations[i].error);
       				field.focus();

                    return false;
                }
            } // end if (!isEmpty(field.value)) 
        } // end if (theFormValidations[i].required == true)
	} // end for (var i = 0; i < theFormValidations.length; i++) 

	return retVal;
}

// Validation all fields in the validation list that are not empty
function validateAll()
{
	for (var i = 0; i < theFormValidations.length; i++) 
    {
		var field = document.getElementById(theFormValidations[i].id);
		if (!isEmpty(field.value)) validate(field);
	} // end for (var i = 0; i < theFormValidations.length; i++)  
}


// ================================================================================
// Section IV. Borland TMaskEdit Simulation
// ================================================================================

KEY_SPACE     = 32;
KEY_BLANK     = 95;
KEY_ESC       = 27;
KEY_ALT       = 18;
KEY_CTRL      = 17;
KEY_BACKSPACE = 8;
KEY_END       = 35;
KEY_HOME      = 36;
KEY_LEFT      = 37;
KEY_UP        = 38;
KEY_RIGHT     = 39;
KEY_DOWN      = 40;
KEY_DELETE    = 46;
KEY_INSERT    = 45;
KEY_NUMLOCK   = 144;
KEY_PRINTSCREEN = 44;
KEY_SCROLL_LOCK = 145;
KEY_PAUSE       = 19;
KEY_NUMPAD_MINUS    = 109;
KEY_NUMPAD_MULTIPLY = 106;
KEY_NUMPAD_DOT      = 110;
KEY_NUMPAD_DIVIDE   = 111;
KEY_NUMPAD_PLUS     = 107;
KEY_NUMPAD_0        = 96;
KEY_NUMPAD_1        = 97;
KEY_NUMPAD_2        = 98;
KEY_NUMPAD_3        = 99;
KEY_NUMPAD_4        = 100;
KEY_NUMPAD_5        = 101;
KEY_NUMPAD_6        = 102;
KEY_NUMPAD_7        = 103;
KEY_NUMPAD_8        = 104;
KEY_NUMPAD_9        = 105;
KEY_F1              = 112;
KEY_F2              = 113;
KEY_F3              = 114;
KEY_F4              = 115;
KEY_F5              = 116;
KEY_F6              = 117;
KEY_F7              = 118;
KEY_F8              = 119;
KEY_F9              = 120;
KEY_F10              = 121;
KEY_F11              = 122;
KEY_F12              = 123;
KEY_SHIFT           = 16;

// Defines the control keys that are allowed in a text field
KEY_TAB       = 9;
KEY_ENTER     = 13;

// SAFARI seems to send this on a shift tab key
KEY_SHIFTTAB  = 25;
KEY_APPLE = 91;

// ================================================================================
// Global variables
// ================================================================================

// Indicate the current mask being used for the focused input field
var currentMask = "";
// Indicate the current position of caret in this input field
var currentPosition = -1;

// In IE if a number key on the keypad is pressed, value in event.keyCode
// will be different in onKeyPressed ('1' = 49) and onKeyUp ('1' = 97).
// So we use these modifier numbers to calculate the actual key code
var IEKeyModifier = 0;
var IENumberKeyModifier = -48;
var IESignKeyModifier = -64;

// Validate whether the specified key is blank keys
function isBlankKey(key)
{
	return (key == KEY_SPACE);
}

// Test whether the specified key is allowed for the input field
function isDataKey(key)
{
	var m = currentMask.charAt(currentPosition);

	var fromKeyPad = false;
	if (isIE && IEKeyModifier != 0)
		fromKeyPad = validateCharMask(String.fromCharCode(key + IEKeyModifier), m);

	return (isBlankKey(key) || validateCharMask(String.fromCharCode(key), m) || fromKeyPad);
}


// Test whether the specified key is a control key
function isControlKey(key)
{
	return (key == KEY_BACKSPACE ||
	        key == KEY_LEFT ||
	        key == KEY_RIGHT ||
	        key == KEY_UP ||
	        key == KEY_DOWN ||
	        key == KEY_HOME ||
	        key == KEY_END ||
	        key == KEY_DELETE ||
            
            // On IE 5.2.3 for the MAC, the shift key was being passed thru somehow... so it needed to be handled
            // like a control key...  It didnt seem to be generated for other browsers
            //      ohhhhh the torture of the MAC... 
            key == KEY_SHIFT ||
            key == KEY_CTRL ||
            key == KEY_ALT ||
            key == KEY_APPLE );
}

// Test whether the key is allowed (not handled)
function isAllowedKey(key)
{
	return (key == KEY_TAB ||
            key == KEY_SHIFTTAB ||
	        key == KEY_ENTER);
}

// Set a character in a specified position in the text
function setText(field, position, c)
{
	var len = field.value.length;
	field.value = field.value.substring(0, position) + String.fromCharCode(c) + field.value.substring(position + 1, len);
}

// Insert a character in a specified position in the text
function insertText(field, position, c)
{
	var len = field.value.length;
	field.value = field.value.substring(0, position) + String.fromCharCode(c) + field.value.substring(position, len);
}

// Set the selection range of the input field
function setSelectionRange(field, selectionStart, selectionEnd)
{
	if (isIE) 
    {
        if (field.createTextRange)
        {
		     var range = field.createTextRange();
     
             if (range)
             {
		          range.collapse(true);
		          range.moveStart("character", selectionStart);
		          range.moveEnd("character", selectionEnd - selectionStart);
		          range.select();
             } // end if (range) 
        }
        else
        {
            // I was gonna do this on the mac so it would look like it does Mozilla, IE on MAC OS 9.1
            // however, it looks like crap on IE on the MAC.  Text is about unreadable
            // field.select();
        }  // end if (field.createTextRange) 
	} else if (isMoz && field.setSelectionRange) 
    {
        // window.status = ("Setting selection range on the field for start=" + selectionStart + " to end=" + selectionEnd);           
        field.setSelectionRange(selectionStart, selectionEnd);
	}
    else if (isSafari == true)
    {
  
        // We select the field so that we can highlight it 
        // as occurrs in old mozilla and IE
        field.select();
    
        // Various experiments... I dunno.. Im outta ideas on how to highlight in Safari 
        // a) moving cursor via script
        //  var aNewEvt = initKeyEvent("keydown", false, false, aView, false, false, 
        //             false, false, KEY_HOME, 0);
        //          field.dispatchEvent(aNewEvt);
        //          for (iii = 0; iii < selectionStart; iii++)
        //          {
        //              aNewEvt = initKeyEvent("keydown", false, false, aView, false, false, 
        //              false, false, KEY_RIGHT, 0);
        //              field.dispatchEvent(aNewEvt);
        //          }
              
        // b) setting up a range and trying to select just that range in the text element... 
        //
        //        var rangeRef = document.createRange();         
        //        rangeRef.selectNodeContents(field);
        //        rangeRef.setStart(field, selectionStart);
        //        rangeRef.setEnd(field, selectionStart+1);
        //        rangeRef.select();
    }
    
    // Now focus the field
    field.focus();
}

// Set the caret to a specific position of the input field and select the char
// at that position
function setCaretPosition(field, position)
{
	setSelectionRange(field, position, position + 1);
	currentPosition = position;
}

// (IE Only) Stores the caret position of the input field so that .caretPos
// will always have valid caret information when needed
function storeCaretPosition(field)
{
	if (isIE && field.createTextRange)
		field.caretPos = document.selection.createRange().duplicate();
}

// Return the current caret position of the input field
function getCaretPosition(field)
{
	var position;

	if (isIE && field.createTextRange && field.isTextEdit) {
		var bookmark = "~";
		var text = field.value;

		field.caretPos.text = bookmark;
		position = field.value.search(bookmark);
		field.value = text;
		setCaretPosition(field, position);
	} else if (isMoz) {
		position = field.selectionStart;
	}

	return position;
}

// Find the next caret position given the key stroke
function nextCaretPosition(field, key)
{
	var position = currentPosition;

	// move caret based on the mask
	if (isDataKey(key)) 
    {
		position = nextCaretPositionInMask(position, currentMask);
	} 
    else 
    {
		switch (key) 
        {
			case KEY_LEFT:
			case KEY_UP:
				position = prevCaretPositionInMask(position, currentMask);
				break;
			case KEY_RIGHT:
			case KEY_DOWN:
				position = nextCaretPositionInMask(position, currentMask);
				break;
			case KEY_HOME:
				position = nextCaretPositionInMask(-1, currentMask);
				break;
			case KEY_END:
				position = prevCaretPositionInMask(field.value.length, currentMask);
				break;
			case KEY_BACKSPACE:
				position = prevCaretPositionInMask(position, currentMask);
				break;
			case KEY_DELETE:
				break;
            default: 
                break;
		} // end switch (key)
	} // end 	if (isDataKey(key)) 

	return position;
}

// Filter out unwanted key strokes for the input field
//----------------------------------------------------------------------------------------------------
// PLEASE... before modifying this method.. make sure you have all browsers loaded on your machine and 
// test your modifications on all browsers... (and especially on the MAC)
//----------------------------------------------------------------------------------------------------
function trapKeyPress(evt)
{

    evt = (evt) ? evt : ((window.event) ? window.event : "")
    var retVal = false;

	// we want to allow some special keys like TAB, ENTER, etc...
	if (isAllowedKey(evt.keyCode))
		return false;

	if (isIE) 
    {
		// prevent the default (print, caret moves forward) routine from being executed

		if (isDataKey(evt.keyCode) || isControlKey(evt.keyCode))
		    // accepted key strokes
            retVal = true;
		else
		    retVal = false;
		evt.returnValue = false;
	} else if (isMoz) 
    {
        if (isSafari == true)
        {  
            if (isDataKey(evt.keyCode) || isControlKey(evt.keyCode) || isControlKey(lastKeyPressed) )
                retVal = true;
            else
                retVal = false;

//            if (isDebugFlag)
//                window.status ="TRAP KEYPRESS B-  RET = " + retVal + " Key Pressed: " + evt.keyCode + " Char code: " + evt.charCode; 
        }
        else 
        {
            if (isDataKey(evt.charCode) || isControlKey(evt.keyCode))           
		       retVal = true;
            else
               retVal = false;

//            if (isDebugFlag)
//               window.status ="TRAP KEYPRESS A-  RET = " + retVal + " Key Pressed: " + evt.keyCode + " Char code: " + evt.charCode; 
        } // end if (isSafari == true) 

		// prevent the default (print, caret moves forward) routine from being executed
        evt.preventDefault();
	}

//  	if (isDebugFlag)
//        window.status ="TRAP KEYPRESS -  RET = " + retVal + " Key Pressed: " + evt.keyCode + " Char code: " + evt.charCode; 

	return retVal;
}

// Focus event handler: responsible for initializing the needed information
// for this input field, such as the mask, new current position, etc
function handleFocus(field)
{
	var mask = findMaskById(findFormByFiedId(field.id), field.id);

    // This is a real HACK for the MACINTOSH (OS X panther) where the field would not always initially be 
    // display properly.  The mask characters would sometimes have the first x of them cut off...  
    // when the display was drawn. We want the field to be refreshed properly.... and this seemed to do the trick  
    // arghhhhhh
    if (isMac && isIE) field.value = field.value;

    // initially display the mask template in the input field
    if (field.value == "")
        field.value = getEditableTemplate(mask);
    
    currentMask = mask;
    setCaretPosition(field, nextCaretPositionInMask(currentPosition, mask));

    notifyOK(field);   
}

// Blur event handler: responsible for resetting information so the next focused
// input field won't use this data info anymore
function handleBlur(field)
{
	currentMask = "";
	currentPosition = -1;  
}

function handleBlurAlt(field, nextFieldId)
{
    handleBlur(field);
    if (nextFieldId != null)
    {
        var aField = document.getElementById(nextFieldId);
        if (aField != null) aField.focus();
    }	
}

// Convenience method to focus on a given field... 
function setFocusToField(field)
{
    document.getElementById(nextFieldId).focus();
}

// KeyPress event handler: basically this function processes key presses and
// moves the caret to the next valid position
//
function handleKeyPress(field, evt)
{
    if (field.readOnly == true) return false;
	
    evt = (evt) ? evt : ((window.event) ? window.event : "");
    IEKeyModifier = 0;
    
    // Yes.. this a real HACK for the MAC platform.  It appears that the event gets eaten and the keycode is lost after
    // passing thru the keydown event handler..  Dont fully understand why IE works differently on the MAC
    // Also... it works DIFFERENTLY between the IE on OS9.1 and OSX arghhhh.. in the 9.1 case, the value in the 
    // keycode is -1 and in the OSX case, the keycode is 1 
    
	// prevent unwanted key stokes from being passed to the field
//    if (isDebugFlag)
//        window.status = "KEYPRESS --  char code: " + evt.keyCode + " lastKeyPressed=" + lastKeyPressed + 
//        "  userAgent- " + navigator.userAgent;


    // hocus pocus for Safari because for some reason, when you modified the event object, the modifications were not applied... 
    // I for the life of me cant explain it.... any ideas?  Therfore, store the key code and the char codes in a temporary variable
    // that we can modify and use later one in the processing
    var aKeyCode = 0
    var aCharCode = 0

    // Safari returns some strange keycodes.... > 65000 ... very strange... (probably a ones compliment number)
    if (isSafari)
    {

        // Experimentation:  tried generating an event here... still has some promise for moving a cursor in Safari & IE
        //            var aNewEvt = initKeyEvent(evt.eventType, evt.bubblesFlag, evt.cancelableFlag, evt.view, evt.ctrlKeyFlag, evt.altKeyFlag, 
        //                evt.shiftKeyFlag, evt.metaKeyFlag, lastKeyPressed, lastCharCode);
        //          will never get past this point
            
        aKeyCode = lastKeyPressed;
        aCharCode = lastCharCode;

        // For some reason.. this doesnt seem to work on Safari... 
        evt.keyCode = lastKeyPressed;
        evt.charCode = lastCharCode;
//        if (aDebugFlag)
//            window.status = "RESET LASTKEY: evt.Keycode= " + evt.keyCode + " evt.charCode=" + evt.charCode + " lastKeyPressed=" + lastKeyPressed;     
    }
    else
    {
        // On the MACs, sometimes the keyCode comes in as a -1.  It was as if the KEY DOWN gobbled it up.  I dunno why!!
        // Therefore, we use the one that was stored in the ON KEY DOWN
        if (isMac && (evt.keyCode == -1 || evt.keyCode == 1) ) 
        {
            evt.keyCode = lastKeyPressed;
        } // end if (isMac && (evt.keyCode == -1 || evt.keyCode == 1) )    
    } // end if (isSafari) 
   
    
    if (isIE)
    {
         // Need to do this BEFORE the isDataKey is called... 
		if (isDigit(String.fromCharCode(aKeyCode)))
			IEKeyModifier = IENumberKeyModifier;
		else if (isSign(String.fromCharCode(aKeyCode)))
			IEKeyModifier = IESignKeyModifier;
    } // end if (isIE)

	// prevent unwanted key stokes from being passed to the field.  Only call the trapKeyPress one time
    // here.. because I think it was causing problems on the MAC.  Dinking with the event object wasnt good after the first time...
    
    var aTrapResult = trapKeyPress(evt);
 	
    if (isIE && aTrapResult) 
    {        
        if (isDataKey(evt.keyCode)) 
        {
            // since we are preventing the default operation from being done
			// we have to print the typed character
			if (isBlankKey(evt.keyCode))
				setText(field, currentPosition, KEY_BLANK);
			else
				setText(field, currentPosition, evt.keyCode);
            currentPosition = nextCaretPosition(field, evt.keyCode);
		} // end if (isDataKey(evt.keyCode)) 
        
        if (evt.keyCode != KEY_BACKSPACE && evt.keyCode != KEY_DELETE)
           setCaretPosition(field, currentPosition);
        
 	} else if (isMoz && aTrapResult) 
    {
        if (isSafari == false)
        {
//            if (isDebugFlag)
//                window.status = "evt.charCode= " + evt.charCode + "  evt.isChar=" + evt.isChar;
            
            // on mozilla / firefox on os-x, this didnt work because evt.ischar returned false for a 0-9 keys
            // arghhh.. yet another inconsistency... 
            // if (evt.charCode && evt.isChar && isDataKey(evt.charCode))
            if (evt.charCode && isDataKey(evt.charCode)) 
            {
                // since we are preventing the default operation from being done
                // we have to print the typed character
                if (isBlankKey(evt.charCode))
                    setText(field, currentPosition, KEY_BLANK);
                else
                    setText(field, currentPosition, evt.charCode);

                currentPosition = nextCaretPosition(field, evt.charCode);
                
//                if (isDebugFlag)
//                    window.status = "NORMAL KEY - non safari ";  

            }
            else if (isControlKey(evt.keyCode)) 
            {
                if (evt.keyCode == KEY_DELETE)
                {
                    setText(field, currentPosition, KEY_BLANK);
                } else if (evt.keyCode == KEY_BACKSPACE)
                {
                    setText(field, currentPosition, KEY_BLANK);
                    currentPosition = nextCaretPosition(field, evt.keyCode);
                } else
                    currentPosition = nextCaretPosition(field, evt.keyCode);

//                    if (isDebugFlag)
//                        window.status = "CTRL KEY - non safari ";  
            } // end if (evt.charCode && isDataKey(evt.charCode)) 
		} 
        else 
        {
            if (aKeyCode && isDataKey(aKeyCode))
            {
                // SAFARI Falls into this category
                // since we are preventing the default operation from being done
                // we have to print the typed character
                if (isBlankKey(aKeyCode))
                    setText(field, currentPosition, KEY_BLANK);
                else
                    setText(field, currentPosition, aKeyCode);

                currentPosition = nextCaretPosition(field, aKeyCode);

//                if (isDebugFlag)
//                    window.status = "DATA KEY - SAFARI ";  
                
            } else if (isControlKey(aKeyCode)) 
            {
                if (aKeyCode == KEY_DELETE)
                {
                    setText(field, currentPosition, KEY_BLANK);
                } else if (aKeyCode == KEY_BACKSPACE)
                {
                    setText(field, currentPosition, KEY_BLANK);
                    currentPosition = nextCaretPosition(field, aKeyCode);
                } else
                    currentPosition = nextCaretPosition(field, aKeyCode);
  
//                if (isDebugFlag)
//                    window.status = "CTRL KEY - SAFARI ";  
            } // end if (aKeyCode && isDataKey(aKeyCode))
        } // end  if (isSafari == false)
        
        setCaretPosition(field, currentPosition);
	}
    
    // On the MAC, if you dont return a true from here.. it appears as if the event will not propagate without returning a true here...
    if ((isMac && isMoz) || isSafari) return true;
    
}

// KeyPress event handler: basically this function processes key presses and
// moves the caret to the next valid position.  
// Since some CONTROL KEYS only fire on the onKeyDown versus on the onKeyPress, 
// you must handle them here (IE was the culprit)
function handleKeyDown(field, evt)
{
    var aReturnValue = true;
    evt = (evt) ? evt : ((window.event) ? window.event : "")

    IEKeyModifier = 0;

    // Always keep the last key pressed around... sometimes event gets eaten on MACs
    lastKeyPressed = evt.keyCode;
    lastCharCode = evt.charCode ? evt.charCode : 0;
    
	// prevent unwanted key stokes from being passed to the field

//    if (isDebugFlag) 
//        window.status = "KEYDOWN ---  char code: " + evt.keyCode + "  curpos - " + currentPosition +  " usrAgt = " + navigator.userAgent;

    if (isIE)
    {
        // YOU DONT GET CHARCODES in this routine.. you only get the keycodes
         // Need to do this BEFORE the isDataKey is called... 
		if (evt.keyCode >= KEY_NUMPAD_0 && evt.keyCode <= KEY_NUMPAD_9)
			IEKeyModifier = IENumberKeyModifier;
		else if (evt.keyCode == KEY_NUMPAD_MINUS || evt.keyCode == KEY_NUMPAD_PLUS)
			IEKeyModifier = IESignKeyModifier;
    } // end if (isIE)


//  if (isDebugFlag)
//      window.status = "before trapcall:  KEYPRESS a - keycode: " +  evt.keyCode;

    if (isIE && trapKeyPress(evt))
    {
        if (isControlKey(evt.keyCode) )     
        {
            if ((evt.keyCode != KEY_DELETE && evt.keyCode != KEY_BACKSPACE))
            {
                currentPosition = nextCaretPosition(field, evt.keyCode);
            }
            else
            {
                // (IE BUG) we can't really prevent the DELETE key from deleting the current
                // character so we have to insert a blank one after it's done
                if (evt.keyCode == KEY_DELETE)
                {
                    if (evt.ctrlKey == true)
                    {
                        nullMaskedField(field.id);
                        currentPosition = nextCaretPosition(field, KEY_HOME);
                    }
                    else
                        setText(field, currentPosition, KEY_BLANK);
                } // end  if (evt.keyCode == KEY_DELETE) 

                if (evt.keyCode == KEY_BACKSPACE)
                {
                    if (evt.ctrlKey == true)
                    {
                        nullMaskedField(field.id);
                        currentPosition = nextCaretPosition(field, KEY_HOME);
                    }
                    else
                    {
                        setText(field, currentPosition, KEY_BLANK);                
                        currentPosition = nextCaretPosition(field, evt.keyCode);
                    } // end if (evt.ctrlKey == true) 
                } // end if (evt.keyCode == KEY_BACKSPACE)
                
            }
            // for control keys.. dont perform default action
            evt.returnValue = false;
            aReturnValue = true;
            setCaretPosition(field, currentPosition);
        }
        else
        {
            // Let events that are not CONTROL TYPE keys propagate to the next level. 
            evt.returnValue = true;
            aReturnValue = true;
//            if (isDebugFlag) 
//                window.status =  "KEYDOWN-NON CONTROL KEY ---  char code: " + evt.keyCode + "  curpos - " + currentPosition +  
//                " isMoz =" + isMoz + " isIE=" + isIE  +  " is_safari=" + isSafari + 
//                " cancelBubble= " + evt.cancelBubble + " type= " + evt.type;
        } // end  if (isControlKey(evt.keyCode) )      
    }
    else
    {
        // let all 'known special keys TAB & ENTER ' propagate... but squash any others... 
        // strange control keys etc... otherwise, you will get strange characters that popup in the 
        // edit boxes
        if (isIE) 
        {
            if (isAllowedKey(evt.keyCode)) 
                evt.returnValue = true;
            else
                evt.returnValue = false;
        } // end if (isIE)     
    } // end if (isIE && trapKeyPress(evt))
    
    if ((isIE && isMac) || (isMoz && isMac) || isSafari) 
    {
//            if (isDebugFlag) 
//                window.status =  "KEYDOWN-NON RETURN  ---  char code: " + evt.keyCode + "  curpos - " + currentPosition +  
//                " isMoz =" + isMoz + " isIE=" + isIE  +  " is_safari=" + isSafari + 
//                " cancelBubble= " + evt.cancelBubble + " type= " + evt.type;
        return aReturnValue;
    } // end  if ((isIE && isMac) || (isMoz && isMac) || isSafari)
    
    return;
}

// KeyUp event handler: basically this function processes key ups and
// moves the caret to the next valid position
function handleKeyUp(field, evt)
{
    // Obsoleted..... we do everything in the KEY DOWN and KEY PRESS methods now...
    // If you did the processing here.. and say you held down a key and in the middle, 
    // pressed another key you would get hosed because the event isequence is 
    // key down, one or more key press events (if you hold down the key),  key up
    // On some browsers, it was continuous keydown, keypress sequences, followed by a keyup
    
    if (isMac) return true;
    return;
}

// In IE an onSelect event will also trigger an onClick, which will cause the selection
// being ignored because of the replacement of the caret. This boolean is used to let it skip
// the onClick event if it's trigger by the onSelect event
var inSelectEvent = false;

// MouseClick event handler: basically this function will select the one
// character under the new caret position
function handleClick(field, evt)
{
	if (isIE) {
       
        // attempt to get it to refresh.. 
		storeCaretPosition(field);
        
		if (inSelectEvent) {
			inSelectEvent = false;
			return;
		}
	}

	setCaretPosition(field, getCaretPosition(field));
}

// MouseSelect event handler: skip the onClick event
function handleSelect(field, evt)
{
	if (isIE) inSelectEvent = true;
}

// (IE ONLY, Mozilla doesn't support onPaste event)
// Paste event handler: import text data to the masked field
function handlePaste(field, evt)
{
	if (isIE) {
		event.returnValue = false;

		var text = window.clipboardData.getData("Text");
		field.value = importPartialToMask(field, text);
	}
}
