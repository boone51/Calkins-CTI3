var isDOM=document.getElementById?1:0;
var isIE=document.all?1:0;
var isNS4=navigator.appName=='Netscape'&&!isDOM?1:0;
var isIE4=isIE&&!isDOM?1:0;
var isOp=window.opera?1:0;
var isDyn=isDOM||isIE||isNS4;

// Are we using Netscape, IE, Mozilla, or Opera?  Set up a global variable
ns4 = false;
ie4 = false;
w3c = false;
opr = false;
knq = false;


// Test for browser types
if (document.layers)
{
    ns4 = true;
}
//else if (navigator.userAgent.indexOf("Konqueror")!=-1)
//{
//    knq = true;
//}
else if (navigator.userAgent.indexOf("Opera")!=-1)
{
    opr = true;
}
else if (document.getElementById)
{
    w3c = true;
}
else if (document.all)
{
    ie4 = true;
}
else
{
    var wrong_browser = "You appear to have an unsupported browser. This application works with Netscape 4 and above, Internet Explorer 4 and above, Mozilla 0.8 and above, or Opera 6 and above.";

    // Only popup the alert box if there is a message to display
    if(wrong_browser != "")
    {
        alert(wrong_browser);
    }
}

// The session id for this application
sessionid = '5305562e2030bd4da636b65a84ce14a5';

// Don't allow select boxes to grow larger then this
maxSelectBoxWidth = 30;

// Set the current active (visible) layer
currentLayer = "";

// Automatically clear select lists before putting data into them?
autoClear = true;

// Instanciate the form element caching hash
formElement = new Object;

fetchStart   = 'Fetching records...';
fetchDisplay = 'Fetching records... displaying';
fetchFinish  = 'Fetching records... done!';

nullReply = 'Error: The server responded, but the response contained no data.';

runmode = '';
runmodeParam = 'run_mode';

commandArray = null;
autoExecute = false;
serverBusyFlag = false;
pageLoadingFlag = false;
openButtonDialog = false;
refreshRetries = 0;



// Deprecated: We now use CallUrl(), this is here for backwards compatability
function SendParameters()
{
    if ( serverBusyFlag == true )
    {
        if ( refreshRetries == 0 )
        {
            refreshRetries = 1000;
          setTimeout("refreshCommand()",10);
        }
    }
    else
    {
        serverBusyFlag = true;
        var commFrame = 1;
        // Serialize the parameters we were passed into an XML Packet
        var XMLPacket = Hash2XML(GenParams(SortParams(SendParameters.arguments)));
        Send(SendParameters.arguments[0], commFrame, XMLPacket);
    }
}

function SendParametersInternal()
{
    var commFrame = 1;
    // Serialize the parameters we were passed into an XML Packet
    var XMLPacket = Hash2XML(GenParams(SortParams(SendParametersInternal.arguments)));
    Send(SendParametersInternal.arguments[0], commFrame, XMLPacket);
}

function refreshCommand()
{
    if ( serverBusyFlag == true && refreshRetries != 0 )
    {
        refreshRetries = refreshRetries - 1;
        setTimeout("refreshCommand()",10);
    }
    else
    {
      serverBusyFlag = false;
        refreshRetries = 0;
        SendParameters('WebBaseMain.ot', 'run_mode=misc', 'command=Refresh', 'param1=none');
    }
}

// This is the function that will be communicating with the server
function CallUrl()
{
    var commFrame = 1;

    // Serialize the parameters we were passed into an XML Packet
    var XMLPacket = Hash2XML(GenParams(SortParams(CallUrl.arguments)));

    Send(CallUrl.arguments[0], commFrame, XMLPacket);
}

// This loads a new page in the content frame
function FetchHtml()
{
    var commFrame = 0;

    // Serialize the parameters we were passed into an XML Packet
    var XMLPacket = Hash2XML(GenParams(SortParams(FetchHtml.arguments)));

    ExpireCache();
    Send(FetchHtml.arguments[0], commFrame, XMLPacket);
}

function Send(url, commFrame, XMLPacket)
{

    var date = new Date();
    bench = "Params: " + date.getTime() + "\n";

    // Update the message on the status bar
    window.status = fetchStart;

    var date = new Date();
    bench += "Ser: " + date.getTime() + "\n";

    // Now that the XML packet is created, reset the runmode
    set_runmode('');

    // Post request to server via the form in the controlFrame
    var date = new Date();
    bench += "Sent: " + date.getTime() + "\n";

    parent.frames[commFrame].location.href = url + "?OpenThought=" + XMLPacket;

    if (isIE)
      {
        frames[0].document.body.style.cursor = "wait";
      }
}

// Called by the CommFrame when data has arrived
function OpenThoughtUpdate(Content)
{

    var date = new Date();
    bench = "Recv: " + date.getTime() + "\n";

    // Update the message on the status bar
    window.status = fetchDisplay;

    // alert("Entering OpenThoughtUpdate:");

    // Display everything if we received a decent response
    if (Content != null)
    {
        FillFields(Content);
    }
    // Something didn't go right, reply accordingly
    else
    {
        if(nullReply != "")
        {
            alert(nullReply);
        }
        return;
    }

    var date = new Date();
    bench += "Done: " + date.getTime() + "\n";
    // alert("OpenThoughtUpdate complete:  " + bench);
}

// Called by the CommFrame when data has arrived

function OpenThoughtWindowUpdate(aWindow,aURL)
{
    // Update the message on the status bar
    window.status = fetchDisplay;
    ExpireCache();
    // alert("Got an openthoughtwindow update : " + aWindow.toString());

    var object = FindObject(aWindow);

    if ( object != null )
    {
        if (object.location)
        {
            // IE
            object.location.href = aURL;
        }
        else
        {
            var aElement = parent.frames[0].document.getElementById(aWindow);
            if (aElement != null)
            {
                // Safari on a mac... you need to set the page to BLANK otherwise, it will not get refreshed.
                // I cant explain this one...
                // alert("in getElementById: TYPE = " + aElement.toString() );
                aElement.src = "about:blank";
                aElement.src = aURL;
            }
            else
            if (object.src)
            {
                // Mozilla
                // alert("object.src non-null: " +  object.name );
                object.src = aURL;
            }
        }
    }
    // Something didn't go right, reply accordingly
    else
    {
        if(nullReply != "")
        {
            alert(nullReply);
        }
    }
    window.status = fetchFinish;
}


// Called by the CommFrame when data has arrived
function OpenThoughtBookerCalendar_ex(
    aUseDHTMLCalendar,
    startDateFieldName,
    insertsFieldName,
    validStartDate,
    validDates,
    invalidDates,
    validDowMask,
    deadlineDates,
    selectedDatesFieldName,
    theStartDateString,
    runCount,
    selectedDatesString,
    mandatoryDatesString,
    aCalendarButtonFieldId,
    aNumberOfMonthsToDisplay,
    aNumberOfMonthsInRow,
    aDateFormatString)
{

    // Update the message on the status bar
    window.status = fetchDisplay;

    
//    var aDateFormatString = "\'%m/%d/%Y\'";

    // simply call the version in the calendar-mactive.js module
    frames[0].CreateOpenThoughtCompatibleCalendar(    
        aUseDHTMLCalendar,
        startDateFieldName,
        insertsFieldName,
        validStartDate,
        validDates,
        invalidDates,
        validDowMask,
        deadlineDates,
        selectedDatesFieldName,
        theStartDateString,
        runCount,
        selectedDatesString,
        mandatoryDatesString,
        aCalendarButtonFieldId,
        aNumberOfMonthsToDisplay,
        aNumberOfMonthsInRow,
        aDateFormatString);

    window.status = fetchFinish;
}


// Called by the CommFrame when data has arrived
function OpenThoughtBookerCalendar(startDateFieldName,insertsFieldName,validStartDate,validDates,invalidDates,
        validDowMask,deadlineDates,selectedDatesFieldName,theStartDateString,runCount,selectedDatesString,
        mandatoryDatesString)
{

    // Update the message on the status bar
    window.status = fetchDisplay;

    FindObject(startDateFieldName).value = theStartDateString;
    FindObject(insertsFieldName).value = runCount;
    FindObject(selectedDatesFieldName).value = selectedDatesString;

    setDateFields(FindObject(startDateFieldName),FindObject(insertsFieldName),validStartDate,
        validDates,invalidDates,validDowMask,deadlineDates,FindObject(selectedDatesFieldName),
        mandatoryDatesString );

    top.newWin = window.open("BookerCalendar.html","cal","WIDTH=208,HEIGHT=450");

    window.status = fetchFinish;
}

// Called by the CommFrame when open thought event complete
function OpenThoughtComplete()
{
    if ( pageLoadingFlag )
    {
        return;
    }

    if ( openButtonDialog )
    {
        openButtonDialog = false;
        return;
    }

    if (isIE)
        frames[0].document.body.style.cursor = "default";

    // alert("in open thought complete");
    serverBusyFlag = false;
}

function startAutoExecute()
{
    if ( commandArray == null )
    {
        alert("No commands to execute");
        return;
    }
    if ( autoExecute == true )
    {
        return;
    }
    autoExecute = true;
    setTimeout("executeNextCommand()",commandTimer);
}

function stopAutoExecute()
{
    autoExecute = false;
}

function executeNextCommand()
{

    // execute next command within array
    if ( autoExecute == false )
    {
        return;
    }

    // execute next command
    setTimeout("executeNextCommand()",commandTimer);

    if ( serverBusyFlag == true )
        return;

    serverBusyFlag = true;

    if ( commandArray == null )
    {
        autoExecute = false;
        serverBusyFlag = false;
        return;
    }
    if ( commandArrayIndex >= commandArray.length )
    {
        autoExecute = false;
        serverBusyFlag = false;
        return;
    }

    if ( commandArray[commandArrayIndex][0] == 'TIMER' )
    {
        commandTimer = commandArray[commandArrayIndex][1] * 1000;
        commandArrayIndex = commandArrayIndex + 1;
    }
    if ( commandArrayIndex >= commandArray.length )
    {
        autoExecute = false;
        serverBusyFlag = false;
        return;
    }
    if ( commandArray[commandArrayIndex][0] == 'LOOP' )
        commandArrayIndex = 0

    var XMLPacket = Hash2XML(GenParams(SortParams(commandArray[commandArrayIndex])));
    Send(commandArray[commandArrayIndex][0], 1, XMLPacket );
    commandArrayIndex = commandArrayIndex + 1;
}

function getRefOT(element, d)
{
    // If we have this particular object cached in our hash, use the cached
    // version (Just remember, Dr Suess wrote the "Cat in the Hat".  It's me
    // who wrote "The Cache in the Hash" ;-)
    if(typeof(formElement[element]) == "object")
    {
        return formElement[element];
    }
    var p,i,x;
    if(!d && frames[0].document)
    {
        d = frames[0].document;
    }
    if((p = element.indexOf("?")) > 0 && parent.frames.length)
    {
        d = parent.frames[element.substring(p+1)].document;
        element = element.substring(0,p);
    }
    if(!(x = d[element]) && d.all)
    {
        x = d.all[element];
    }
    for (i=0;!x&&i<d.forms.length;i++)
    {
        x = d.forms[i][element];
    }
    for(i=0; !x && d.layers && i < d.layers.length; i++)
    {
        x = getRefOT(element, d.layers[i].document);
    }
    // Mozilla needs this
    for(i=0; !x && d.frames && typeof(d.frames)!='undefined' && i<d.frames.length;i++)
    {
      x = getRefOT(element, d.frames[i].document);
    }
    if(!x && d.getElementById)
    {
        x = d.getElementById(element);
    }
    // Now that we found our Object, cache it for later use
    //formElement[element] = x;
    return x;
}



// Digs through the browsers DOM hunting down a particular form element
function FindObject(element, d)
{
    var ret = getRefOT(element, d);
    if (ret == null)
    {
        ret = getRefOT(element, top.frames[0].document);
    }
//    if (ret == null)
//    {
//        alert("FindObject: Tried but failed to find object: name=" + element);
//    }
    return ret;
}


// Initialize and populate the Select list
function FillSelect(element, data)
{
    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }

    // If sent a string, and not an array, we just need to highlight an
    // existing item in the list, and not add anything
    if(typeof data == "string") {
        for (var i=0; i < element.options.length; i++)
        {
            if( element.options[i].value == data )
            {
                element.selectedIndex = i;
            }
        }

    }
    // Actually add the items we were sent to the list
    else
    {
        // Clear any current OPTIONS from the SELECT
        //element.options.length = 0;
        if((autoClear) || ((data.length == 1) && (data[0] == "")))
        {
            while (element.options.length) element.options[0] = null;
            if((data.length == 1) && (data[0] == ""))
            {
                return;
            }
        }

        // For each record...
        for (var i=0; i < data.length; i++)
        {
            var text = data[i][0];
            var value = data[i][1];

            if (data[i][1] == "")
            {
                value = text;
            }

            // Text cam't be null
           // if(text != undefined) {
                // If CutSelectBoxText is set, alter the length of the text to
                // lessen the need to the browser to resize the selectbox.
                // Netscape 4 does not resize selectboxes.
                if ((!ns4) && (maxSelectBoxWidth != 0))
                {
                    text = (text.substr(0,maxSelectBoxWidth));
                }

                // Add the new object to the SELECT list
                element.options[element.options.length] =
                                                    new Option(text, value);
            //}
        }
    }
}

// Put values into a text form field
function FillText(element, data)
{

    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }

    var formatted = "";

    if (window.contentFrame.importToMask) formatted = window.contentFrame.importToMask(element.id, data);

    if (element.readonly == true) {
        element.readonly = false;
        element.value = formatted;
        element.readonly = true;
    } else
        element.value = formatted;
}

// Select or unselect a checkbox form field
function FillCheck(element, data)
{
    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }

    if((data == "false") || (data == "FALSE") || (data == "False") ||
       (data == "unchecked") || (data < "1"))
    {
        element.checked = false;
    }
    else
    {
        element.checked = true;
    }
}

// Select a radio button
function FillRadio(element, value)
{
    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }

    for(var i=0; i<element.length; i++)
    {
        if(element[i].value == value)
        {
            element[i].checked = true;
        }
    }
}

// Take the data we received, and put it in it's appropriate field
function FillFields(Content)
{
    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }


    // Display text on the status bar stating that we received information
    // var aStatusMsg = "Beginning the FILL FIELDS";

    for (fieldName in Content)
    {
        // window.status = aStatusMsg + " " + fieldName;

        var object = FindObject(fieldName);

        if ( object == null )
        {
            // this may be an entry to select an entry from a ComboBox, remove
            // "_Select_" from the fieldName and try locating object again
            realFieldName = fieldName.replace("_Select_","");
        if ( realFieldName != fieldName )
                object = FindObject(realFieldName);
        }

        if ( object != null )
        {
          // This is kinda silly, but radio buttons don't seem to return an
          // object.name, in some versions of Mozilla
//        if((!ie4) && (object.type == undefined) && (object.length > 0))
//          {
//            object.type="radio";
//          }

try
{
          switch (object.type)
          {
            case "select":
            case "select-one":
            case "select-multiple":
                FillSelect(object,Content[fieldName]);
                break;

            case "text":
            case "password":
            case "textarea":
            case "hidden":
                FillText(object, Content[fieldName]);
                break;

            case "checkbox":
                FillCheck(object, Content[fieldName]);
                break;

            case "radio":
                FillRadio(object, Content[fieldName]);
                break;
          }
}
catch (ex)
{
    alert("We got some type of exception upon trying to fill an element: " + ex.toString() );

}

      }


    }

    // Display text on the status bar stating that we received information
    window.status = fetchFinish;

}

// Digs through all the parameters sent to the SendParameters function, and
// organizes them into categories
function SortParams(elements)
{
    var param  = new Object();
   var fields = new Array();
    var values = new Array();

    // The first parameter is the form url
    for(var i=1; i < elements.length; i++)
    {

        // If the parameter contains an equal sign (=), it's an expression
        if(elements[i].indexOf("=") != -1)
        {
            values[values.length] = elements[i];
        }
        // Otherwise, it's a form element
        else {
            fields[fields.length] = elements[i];
        }
    }

    param["fields"] = fields;
    param["expr"]   = values;

return param;
}

// Generates the key/value pairs to send to the server
function GenSettingParams()
{
    var param  = new Object();

    param["session_id"] = get_sessionid();
    param["need_script"] = 1;

    param["runmode_param"] = get_runmodeparam();

    if(get_runmode != "")
    {
        param["runmode"] = get_runmode();
    }

return param;
}

// Generates the key/value pairs to send to the server
function GenExprParams(elements)
{
    var param  = new Object();
    var keyval = new Array();

    for(var i=0; i < elements.length; i++)
    {

        keyval = elements[i].split("=");

        param[keyval[0]] = keyval[1];

        if( get_runmodeparam() == keyval[0] )
        {
            set_runmode( keyval[1] );
        }
    }

return param;
}

// Generates the field parameters to send to the server
function GenFieldParams(elements)
{
    var param = new Object();
    for(var i=0; i < elements.length; i++)
    {
        var object = FindObject(elements[i]);

        if ( object != null )
        {
            // This is kinda silly, but radio buttons don't seem to return an
            // object.name, in some versions of Mozilla
            // if((!ie4) && (object.type == undefined) && (object.length > 0))
            // {
            //     object.type="radio";
            // }

            switch (object.type)
            {
                case "text":
                case "textarea":
                        param[elements[i]] = (top.frames[0].exportFromMask) ? top.frames[0].exportFromMask(object.id) : object.value;
                        break;

                case "password":
                case "hidden":
                        param[elements[i]] = object.value;
                        break;

                case "select":
                case "select-one":
                case "select-multiple":
                        param[elements[i]] = SelectValue(object);
                        break;

                case "checkbox":
                        param[elements[i]] = CheckboxValue(object);
                        break;

                case "radio":
                        param[elements[i]] = RadioValue(object);
                        break;
            }
        }
        else
        {
            alert("Setting element to UNKNOWN");

            param[elements[i]] = "UNKNOWN";
        }

        if( get_runmodeparam() == elements[i] )
        {
            set_runmode( param[elements[i]] );
        }
    }

    return param;
}

// Build a single hash containing all the data to be sent to the server
function GenParams(elements) {

    var params = new Object();

    // Add the fields we were given, but only add it if there is at least one
    if(elements["fields"].length > 0)
    {
        params["fields"]  = GenFieldParams(elements["fields"]);
    }
    // Add key/pair values, but only if there is at least one
    if(elements["expr"].length > 0)
    {
        params["expr"]  = GenExprParams(elements["expr"]);
    }
    // Add settings, there will always be at least one
    params["settings"]  = GenSettingParams();

return params;
}

// Figure out which option is selected in our Select list
function SelectValue(element)
{
    if(element.selectedIndex >= 0)
    {
        return element.options[element.selectedIndex].value;
    }
    else {
        return -1;
    }
}

// Figure out which option is selected in our checkbox
function CheckboxValue(element)
{
    if(element.checked == true)
    {
        if(element.value == "on")
        {
            return true;
        }
        else
        {
            return element.value;
        }
    }
    else
    {
        return false;
    }

return;
}

// Figure out which option is selected in our radio button
function RadioValue(element)
{
    for (var i=0; i <= element.length; i++)
    {
        if(element[i].checked == true)
        {
            return element[i].value;
        }
    }

return;
}

// This method loads the given URL into the target frame
function LoadNewContent(url, targetFrame)
{
    // alert("Im in the load NewContent method ");
    pageLoadingFlag = true;
    parent.frames[0].location.href = url;
}

// This method loads the given URL into the target frame
function LoadNewContentDone()
{
    pageLoadingFlag = false;
    OpenThoughtComplete();
}

// Takes a fieldname as an argument, and gives that field the focus
function FocusField(element)
{
    var object = FindObject(element);
    if (object != null && !object.disabled)
        object.focus();
}

// Takes a fieldname as an argument, and disables that field
function DisableField(element)
{
    var object = FindObject(element);
    if ( object != null )
        object.disabled = true;
}

// Takes a fieldname as an argument, and enables that field
function EnableField(element)
{
    var object = FindObject(element);
    if ( object != null )
        object.disabled = false;
}

function SetStyle(element, styleName)
{
    var object = FindObject(element);
    if ( object != null )
        object.className = styleName;
}

function SetToolTip(element, toolTip)
{
    var object = FindObject(element);
    if ( object != null )
        object.title = toolTip;
}

// Submits a form to a target frame
function SubmitForm(formName, url)
{
    // had to expire cache so successive submits would work
    ExpireCache();
    var form = FindObject(formName);
    if (form != null)
    {
        form.action = url;
        form.target = "commFrame";
        if (window.contentFrame.validateForm(formName))
        {
            var backup = top.frames[0].beginSubmission(form.name);
            form.submit();
            top.frames[0].endSubmission(form.name, backup);
        }
        else
        {
            SendParametersInternal('WebBaseMain.ot', 'run_mode=action', 'command=none', 'param1=none');
        }
    }
    else
    {
        SendParametersInternal('WebBaseMain.ot', 'run_mode=action', 'command=none', 'param1=none');
    }
}


// Opens a new browser window without a toolbar
function OpenNewPlainBrowser(url, windowName, leftPos, topPos, newWidth, newHeight)
{
    //know to work in Mozilla 1.2.1, but won't resize or relocate in IE6
    //win = window.open(url, windowName, "resizable,screenX=" + leftPos +
                     // ",screenY=" + topPos + ",innerWidth=" + newWidth +
                      //",innerHeight=" + newHeight);

    win = window.open(url, windowName, 'resizable');

    //these two functions do not work with IE6:
    //they will cause an error on the page:
    win.resizeTo(newWidth, newHeight);
    win.moveTo(leftPos, topPos);
    win.focus();
}

function OpenNewButtonDialog(message, buttonName, buttonValue, buttonExpressions, runMode)
{
    openButtonDialog = true;

    if ( autoExecute != true )
    {
        //open a blank document
        winwidth = 350; // width of the new window
        winheight = 220; // height of the new window
        winleft = (screen.width / 2) - (winwidth / 2); // center the window right to left
        wintop = (screen.height / 2) - (winheight / 2); // center the window top to bottom
        win = window.open("generic.jsp", "windowName", "top="+wintop+",left="+winleft+",height="+winheight+",width="+winwidth+",resizable");

        win.document.writeln("<BODY BGCOLOR='c0c0c0'>");
        win.document.writeln("<center>" + message + "</center><br><br>");

        //ensure that the window will come to the front every 50 milliseconds
        win.setInterval('focus()', 50);

        var btnStr1 = "<input type=button name=";
        var btnStr2 = " value='";
        var btnStr3 = "' onClick=\"";
        var btnStr4 = " maxlength=50>";

        if(buttonValue.length == buttonName.length)
        {
            win.document.writeln("<center>");
            for(var i = 0; i < buttonName.length; i++)
            {
                var exprStr = "'buttonName=" +  buttonValue[i] + "'";
                if ( buttonExpressions[i].length > 0 )
                    exprStr += ", " + buttonExpressions[i];
                win.document.writeln(btnStr1 + buttonValue[i] + btnStr2 +
                                 buttonName[i] + btnStr3 +
                                 "opener.SendParametersInternal('WebBaseMain.ot', 'run_mode=" + runMode +"', " +
                                 exprStr + ");window.close();\"" + btnStr4);
            }
            win.document.writeln("</center>");
        }
        else
            win.document.writeln("<body text='ff0000'> ERROR OCCURRED, unable to display buttons properly");
    }
    else
    {
        // answer with first button
        var exprStr = "'buttonName=" +  buttonValue[0]+ "'";
        if ( buttonExpressions[0].length > 0 )
            exprStr += ", " + buttonExpressions[0];
        eval("SendParametersInternal('WebBaseMain.ot'"+","+"'run_mode=" + runMode +"',"+ exprStr + ")" );
    }
}

// Takes a fieldname as an argument, and enables that field
function EnableField(element)
{
    var object = FindObject(element);
    if ( object != null )
        object.disabled = false;
}

// Display an error message to the user
function DisplayError(msg)
{
    alert(msg);
}

// Convert our parameter hash into an XML object
function Hash2XML(hash)
{
    // Define the root element
    var xml = "<OpenThought>";

    // Loop through each child in the hash (fields and expr)
    for (child in hash) {

        xml += "<" + child + ">";

        if(typeof(hash[child]) == "object")
        {

            // Now get every child of the children elements (grandchild)
            for(grandchild in hash[child])
            {
                xml += "<" + grandchild + ">";
                xml += hash[child][grandchild];
                xml += "</" + grandchild + ">";
            }
        }
        else {
            xml += hash[child];
        }

        xml += "</" + child + ">";
    }
    xml += "</OpenThought>";

return xml;
}

// Used for the tabs - hide the current layer, show the new one
function showDiv(layerName)
{
   // First hide the layer, then set 'currentLayer' to the new layer, and
   // finally show the new layer
   if (ns4)
   {
      if(currentLayer != "")
      {
        frames[0].document.layers[currentLayer].visibility = "hide"
      }
      currentLayer = layerName;
      frames[0].document.layers[layerName].visibility = "show";
   }
   else if (ie4)
   {
      if(currentLayer != "")
      {
        frames[0].document.all[currentLayer].style.visibility = "hidden";
      }
      currentLayer = layerName;
      frames[0].document.all[layerName].style.visibility = "visible";
   }
   else if ((w3c) || (opr) || (knq))
   {

      if(currentLayer != "")
      {
        frames[0].document.getElementById(currentLayer).style.visibility = "hidden";

      }
      currentLayer = layerName;
      frames[0].document.getElementById(layerName).style.visibility = "visible";
   }
}

// Every call to find a form object is cached for later use.  If the underlying
// HTML is changed though, the values listed in the cache will be incorrect.
// The following function should be called anytime you change the page, or
// directly manipulate the name or location of a form element.
function ExpireCache()
{

    formElement = "";

    // Instanciate the form element caching hash
    formElement = new Object;

}

// Clear ad preview
function OpenThoughtClearPreview()
{
    var thePreview = FindObject("WebBookerPreview");
    if ( thePreview != null )
        {
        thePreview.src = "images/adcontentwindow.gif";
        }
}


// open Java Text Editor
function OpenThoughtOpenEditor() {
    var theApplet = FindObject("MactiveJavaTextEditor");
    if (theApplet != null)
    {
        theApplet.toggleWindowVisibility();
    }
}

function UpdateGUIElements()
{
    // alert("Ad content has been changed. Click OK to update.");
    SendParametersInternal("WebBaseMain.ot", "run_mode=textEditor", "command=updateGUI");
}

// ------------------------------------------------------------------------//
//   Accessor Methods
//
//   The following methods are to access & change the values of
//   existing variables
// ------------------------------------------------------------------------//

function set_maxselectboxwidth(width) { maxSelectBoxWidth = width; }
function set_autoclear(val)
{
    if(val < 1)
    {
         autoClear = false;
    }
    else
    {
        autoClear = true;
    }

}
function set_fetchstart(msg)   { fetchStart   = msg; }
function set_fetchdisplay(msg) { fetchDisplay = msg; }
function set_fetchfinish(msg)  { fetchFinish  = msg; }
function set_nullreply(msg)    { nullReply    = msg; }
function set_runmode(msg)      { runmode      = msg; }
function set_runmodeparam(msg) { runmodeParam = msg; }

function get_sessionid()         { return sessionid;    }
function get_maxselectboxwidth() { return maxSelectBoxWidth; }
function get_autoclear()         { return autoClear;    }
function get_fetchstart()        { return fetchStart;   }
function get_fetchdisplay()      { return fetchDisplay; }
function get_fetchfinish()       { return fetchFinish;  }
function get_nullreply()         { return nullReply;    }
function get_runmode()           { return runmode;      }
function get_runmodeparam()      { return runmodeParam; }