//
// JavaScript Calendar Component
// Author: Robert W. Husted  (robert.husted@iname.com)
// Date:   8/22/1999
// Modified Date: 11/30/1999
// Modified By:   Robert W. Husted
// Notes:  Added frameset support (changed reference for "newWin" to "top.newWin")
//         Also changed Spanish "March" from "Marcha" to "Marzo"
//         Fixed JavaScript Date Anomaly affecting days > 28
//
//
//
// Usage:  Add the following lines of code to your page to enable the Calendar
//         component.
//
//
//         // THIS LINE LOADS THE JS LIBRARY FOR THE CALENDAR COMPONENT
//
//         <SCRIPT LANGUAGE="JavaScript" SRC="calendar.js"></SCRIPT>
//
//
//
//         // THIS LINE IS USED IN CONJUNCTION WITH A FORM FIELD (myDateField) IN A FORM (myForm).
//         // Replace "myForm" and "myDateField" WITH THE NAME OF YOUR FORM AND INPUT FIELD RESPECTIVELY
//         // WINDOW OPTIONS SET THE WIDTH, HEIGHT, AND X/Y POSITION OF THE CALENDAR WINDOW
//         // WITH TITLEBAR ON, ALL OTHER OPTIONS (TOOLBARS, ETC) ARE DISABLED BY DEFAULT
//
//         <A HREF="javascript:doNothing()" onClick="setDateField(document.myForm.myDateField);top.newWin = window.open('calendar.html','cal','dependent=yes,width=210,height=230,screenX=200,screenY=300,titlebar=yes')">
//         <IMG SRC="calendar.gif" BORDER=0></A><font size=1>Popup Calendar</font>
//
//
//
// Required Files:
//
//         BookerCalendar.js   - contains all JavaScript functions to make the calendar work
//
//         BookerCalendar.html - frameset document (not required if you call the showCalendar()
//                         function.  However, calling showCalendar() directly causes
//                         the Java Virtual Machine (JVM) to start which slows down the
//                         loading of the calendar.)
//
//
// Files Generally Included:
//
//         calendar.gif  - image that looks like a little calendar
//
//         yourPage.html - page that contains a form and a date field which implements
//                         the calendar component
//
// 11-may-2005 J. Oelschlegel
//  Added in a mandatoryDates() array that is a list of dates that MUST be selected
//  and cannot be turned off via the user.  The message must be that the date is mandatory if 
//  the user tries to disable it..
// 1-nov-2005 J. Oelschlegel  Track # 29770 - calendar was not being displayed properly nor was proper date being
//  selected.  Problem stemmed from how date object was being manipulated. Full explanation is below in code. 



// BEGIN USER-EDITABLE SECTION -----------------------------------------------------



// SPECIFY DATE FORMAT RETURNED BY THIS CALENDAR
// (THIS IS ALSO THE DATE FORMAT RECOGNIZED BY THIS CALENDAR)

// DATE FORMAT OPTIONS:
//
// dd   = 1 or 2-digit Day
// DD   = 2-digit Day
// mm   = 1 or 2-digit Month
// MM   = 2-digit Month
// yy   = 2-digit Year
// YY   = 4-digit Year
// yyyy = 4-digit Year
// month   = Month name in lowercase letters
// Month   = Month name in initial caps
// MONTH   = Month name in captital letters
// mon     = 3-letter month abbreviation in lowercase letters
// Mon     = 3-letter month abbreviation in initial caps
// MON     = 3-letter month abbreviation in uppercase letters
// weekday = name of week in lowercase letters
// Weekday = name of week in initial caps
// WEEKDAY = name of week in uppercase letters
// wkdy    = 3-letter weekday abbreviation in lowercase letters
// Wkdy    = 3-letter weekday abbreviation in initial caps
// WKDY    = 3-letter weekday abbreviation in uppercase letters
//
// Examples:
//
// calDateFormat = "mm/dd/yy";
// calDateFormat = "Weekday, Month dd, yyyy";
// calDateFormat = "wkdy, mon dd, yyyy";
// calDateFormat = "DD.MM.YY";     // FORMAT UNSUPPORTED BY JAVASCRIPT -- REQUIRES CUSTOM PARSING
//

calDateFormat    = "mm/dd/yyyy";

CELL_TYPE_DATE_IN_PAST	= 0;
CELL_TYPE_NO_SELECT 	= 1;
CELL_TYPE_SELECT	= 2;
CELL_TYPE_UNSELECT	= 3;

DOW_Monday      = 0x01;
DOW_Tuesday     = 0x02;
DOW_Wednesday   = 0x04;
DOW_Thursday    = 0x08;
DOW_Friday      = 0x10;
DOW_Saturday    = 0x20;
DOW_Sunday      = 0x40;

// CALENDAR COLORS
topBackground    = "white";         // BG COLOR OF THE TOP FRAME
bottomBackground = "white";         // BG COLOR OF THE BOTTOM FRAME
tableBGColor     = "black";         // BG COLOR OF THE BOTTOM FRAME'S TABLE
cellUnselectedColor = "lightgrey";  // TABLE CELL BG COLOR OF THE DATE CELLS IN THE BOTTOM FRAME
cellSelectedColor   = "yellow";     // TABLE CELL BG COLOR OF THE SELECTED DATE CELLS IN THE BOTTOM FRAME
headingCellColor = "white";         // TABLE CELL BG COLOR OF THE WEEKDAY ABBREVIATIONS
headingTextColor = "black";         // TEXT COLOR OF THE WEEKDAY ABBREVIATIONS
dateColor        = "blue";          // TEXT COLOR OF THE LISTED DATES (1-28+)
validDateColor   = "white";
invalidDateColor = "lightgrey";
focusColor       = "#ff0000";       // TEXT COLOR OF THE SELECTED DATE (OR CURRENT DATE)
hoverColor       = "darkred";       // TEXT COLOR OF A LINK WHEN YOU HOVER OVER IT
fontStyle        = "12pt arial, helvetica";           // TEXT STYLE FOR DATES
BIGfontStyle     = "11pt bold, arial, helvetica";           // TEXT STYLE FOR HOVER DATES
headingFontStyle = "bold 12pt arial, helvetica";      // TEXT STYLE FOR WEEKDAY ABBREVIATIONS

// FORMATTING PREFERENCES
bottomBorder  = false;        // TRUE/FALSE (WHETHER TO DISPLAY BOTTOM CALENDAR BORDER)
tableBorder   = 0;            // SIZE OF CALENDAR TABLE BORDER (BOTTOM FRAME) 0=none



// END USER-EDITABLE SECTION -------------------------------------------------------


// DETERMINE BROWSER BRAND
var isNav = false;
var isIE  = false;
var startDate = new Date(1901, 1, 1, 0, 0, 0, 0);
var validDates_a = new Array();
var invalidDates_a = new Array();
var selectedDates_a = new Array();
var savSelectedDates_a = new Array();
var deadlineDates_a = new Array();
var mandatoryDates_a = new Array();
var timeoutId;
var theDowMask;

// ASSUME IT'S EITHER NETSCAPE OR MSIE
if (navigator.appName == "Netscape") {
    isNav = true;
}
else {
    isIE = true;
}

// GET CURRENTLY SELECTED LANGUAGE
selectedLanguage = navigator.language;

// PRE-BUILD PORTIONS OF THE CALENDAR WHEN THIS JS LIBRARY LOADS INTO THE BROWSER
buildCalParts();



// CALENDAR FUNCTIONS BEGIN HERE ---------------------------------------------------


// FUNCTION:	setDateFields
// PURPOSE:	Setup Valid Dates, Invalid Dates, inserts and date fields,
//		and valid start date.
// PARAMETERS:	dateField	- First date selected (datatype: text field)
//		insertsField	- number of inserts (datatype: text field)
//		startDateField	- valid start date (datatype: string)
//		validDates	- valid run dates user can select (datatype: string)
//		invalidDates	- invalid run dates user cant select (datatype: string)
//		validDowMask	- valid Days of Week mask (days user can select, datatype: int)
//		deadlineDates	- valid start dates for each Day of Week (datatype: string)
//		selectedDates	- selected dates (datatype: hidden field)
//		applyFlag	- field is set to true if user has hit the apply button
//		formObject	- form to submit when dates applied
//      mandatoryDates - dates that should be in the 'validDates' array.. but that cannot be unselected by the 
//                       user
function setDateFields(dateField,insertsField,startDateField,validDates,
			invalidDates,DowMask,deadlineDates,selectedDates,mandatoryDates,applyFlag,aformObject) {

    if ( startDateField )
        {
	startDate.setTime(Date.parse(startDateField));
        }

    // ASSIGN THE INCOMING FIELD OBJECT TO A GLOBAL VARIABLE
    calDateField = dateField;
    calInsertsField = insertsField;
    calSelectedDatesField = selectedDates;
    applyFlagField = applyFlag;
    formObject = aformObject;

    // GET THE VALUE OF THE INCOMING FIELD
    inDate = dateField.value;

    // Track 24537 use today's date if the field is empty
    if (inDate.length == 0) { var d = new Date(); inDate = "" + (d.getMonth()+1) + "/" + d.getDate() + "/" + d.getFullYear(); }

    // SET calDate TO THE DATE IN THE INCOMING FIELD OR DEFAULT TO TODAY'S DATE
    setInitialDate();

    
    // Parse valid date string
    validDates_a.length = 0;
    if ( validDates )
        {
        ValidDateArrayStr = validDates.split('|');
	if ( ValidDateArrayStr.length )
	    {
	    for ( var i=0 ; i<ValidDateArrayStr.length ; ++i )
	    	{
	    	var aDate = new Date(Date.parse(ValidDateArrayStr[i]));
	    	validDates_a[validDates_a.length] = aDate;
	    	}
	    }
        }

    // Parse invalid date string
    invalidDates_a.length = 0;
    if ( invalidDates )
        {
        InvalidDateArrayStr = invalidDates.split('|');
	if ( InvalidDateArrayStr.length )
	    {
	    for ( var i=0 ; i<InvalidDateArrayStr.length ; ++i )
	    	{
	    	var aDate = new Date(Date.parse(InvalidDateArrayStr[i]));
	    	invalidDates_a[invalidDates_a.length] = aDate;
	    	}
	    }
        }

    // Parse selected date string
    selectedDates_a.length = 0;
    savSelectedDates_a.length = 0;
    if ( selectedDates )
        {
	SelectedDateStr = selectedDates.value;
	if ( SelectedDateStr.length )
	    {
            SelectedDateArrayStr = SelectedDateStr.split('|');
	    for ( var i=0 ; i<SelectedDateArrayStr.length ; ++i )
	        {
	        var aDate = new Date(Date.parse(SelectedDateArrayStr[i]));
	        selectedDates_a[selectedDates_a.length] = aDate;
	        savSelectedDates_a[savSelectedDates_a.length] = aDate;
	        }
	    }
        }

    // Parse deadline date string (should have 7 entries - one
    // for each day of week)
    deadlineDates_a.length = 0;
    if ( deadlineDates )
        {
        DeadlineDateArrayStr = deadlineDates.split('|');
	for ( var i=0 ; i<DeadlineDateArrayStr.length ; ++i )
	    {
	    var aDate = new Date(Date.parse(DeadlineDateArrayStr[i]));
	    deadlineDates_a[deadlineDates_a.length] = aDate;
	    }
        }

    // Parse mandatoryDates string
    // Enhancement for new-style packages... 
    mandatoryDates_a.length = 0;
    if ( mandatoryDates )
        {
        ManadatoryDateArrayStr = mandatoryDates.split('|');
	if ( ManadatoryDateArrayStr.length )
	    {
	    for ( var i=0 ; i<ManadatoryDateArrayStr.length ; ++i )
	    	{
	    	var aDate = new Date(Date.parse(ManadatoryDateArrayStr[i]));
	    	mandatoryDates_a[mandatoryDates_a.length] = aDate;
	    	}
	    }
        }
        
    // save the Day of Week mask
    theDowMask = DowMask;

    // THE CALENDAR FRAMESET DOCUMENTS ARE CREATED BY JAVASCRIPT FUNCTIONS
    calDocTop    = buildTopCalFrame();
    calDocInfo	 = buildInfoFrame();
    calDocMessage = buildMessageFrame("");
    calDocApplyCancel = buildApplyCancel();
    calDocBottom = buildBottomCalFrame();
    calDocHackingSafari = "<html><body><script> parent.opener.setToday(); </script></body></html>";
}


// SET THE INITIAL CALENDAR DATE TO TODAY OR TO THE EXISTING VALUE IN dateField
function setInitialDate() {

    // CREATE A NEW DATE OBJECT (WILL GENERALLY PARSE CORRECT DATE EXCEPT WHEN "." IS USED AS A DELIMITER)
    // (THIS ROUTINE DOES *NOT* CATCH ALL DATE FORMATS, IF YOU NEED TO PARSE A CUSTOM DATE FORMAT, DO IT HERE)
    calDate = new Date(Date.parse(inDate));

    // IF THE INCOMING DATE IS INVALID, USE THE CURRENT DATE
    if (isNaN(calDate)) {

        // ADD CUSTOM DATE PARSING HERE
        // IF IT FAILS, SIMPLY CREATE A NEW DATE OBJECT WHICH DEFAULTS TO THE CURRENT DATE
        calDate = new Date();
    }

    // KEEP TRACK OF THE CURRENT DAY VALUE
    calDay  = calDate.getDate();

    // SET DAY VALUE TO 1... TO AVOID JAVASCRIPT DATE CALCULATION ANOMALIES
    // (IF THE MONTH CHANGES TO FEB AND THE DAY IS 30, THE MONTH WOULD CHANGE TO MARCH
    //  AND THE DAY WOULD CHANGE TO 2.  SETTING THE DAY TO 1 WILL PREVENT THAT)
    calDate.setDate(1);
}

// CREATE THE TOP CALENDAR FRAME
function buildTopCalFrame() {

    // CREATE THE TOP FRAME OF THE CALENDAR
    var calDoc =
        "<HTML>" +
        "<HEAD>" +
        "</HEAD>" +
        "<BODY BGCOLOR='" + topBackground + "'>" +
        "<FORM NAME='calControl' onSubmit='return false;'>" +
        "<CENTER>" +
        "<TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0>" +
        "<TR><TD COLSPAN=7>" +
        "<CENTER>" +
        getMonthSelect() +
        "<INPUT NAME='year' VALUE='" + calDate.getFullYear() + "'TYPE=TEXT SIZE=4 MAXLENGTH=4 onChange='parent.opener.setYear()'>" +
        "</CENTER>" +
        "</TD>" +
        "</TR>" +
        "<TR>" +
        "<TD COLSPAN=7>" +
        "<INPUT " +
        "TYPE=BUTTON NAME='previousYear' VALUE='<<'    onClick='parent.opener.setPreviousYear()'><INPUT " +
        "TYPE=BUTTON NAME='previousMonth' VALUE=' < '   onClick='parent.opener.setPreviousMonth()'><INPUT " +
        "TYPE=BUTTON NAME='today' VALUE='Today' onClick='parent.opener.setToday()'><INPUT " +
        "TYPE=BUTTON NAME='nextMonth' VALUE=' > '   onClick='parent.opener.setNextMonth()'><INPUT " +
        "TYPE=BUTTON NAME='nextYear' VALUE='>>'    onClick='parent.opener.setNextYear()'>" +
        "</TD>" +
        "</TR>" +
        "</TABLE>" +
        "</CENTER>" +
        "</FORM>" +
        "</BODY>" +
        "</HTML>";

    return calDoc;
}


// CREATE THE BOTTOM CALENDAR FRAME
// (THE MONTHLY CALENDAR)
function buildBottomCalFrame() {

    // START CALENDAR DOCUMENT
    var calDoc = calendarBegin;

    // GET MONTH, AND YEAR FROM GLOBAL CALENDAR DATE
    month   = calDate.getMonth();
    year    = calDate.getFullYear();


    // GET GLOBALLY-TRACKED DAY VALUE (PREVENTS JAVASCRIPT DATE ANOMALIES)
    day     = calDay;

    var i   = 0;

    // DETERMINE THE NUMBER OF DAYS IN THE CURRENT MONTH
    var days = getDaysInMonth();

    // IF GLOBAL DAY VALUE IS > THAN DAYS IN MONTH, HIGHLIGHT LAST DAY IN MONTH
    if (day > days) {
        day = days;
    }

    // DETERMINE WHAT DAY OF THE WEEK THE CALENDAR STARTS ON
    var firstOfMonth = new Date (year, month, 1);

    // GET THE DAY OF THE WEEK THE FIRST DAY OF THE MONTH FALLS ON
    var startingPos  = firstOfMonth.getDay();
    days += startingPos;

    // KEEP TRACK OF THE COLUMNS, START A NEW ROW AFTER EVERY 7 COLUMNS
    var columnCount = 0;

    // MAKE BEGINNING NON-DATE CELLS BLANK
    for (i = 0; i < startingPos; i++) {

        calDoc += blankCell;
	columnCount++;
    }

    // SET VALUES FOR DAYS OF THE MONTH
    var currentDay = 0;
    var dayType    = "weekday";

    // DATE CELLS CONTAIN A NUMBER
    for (i = startingPos; i < days; i++) {

	var paddingChar = "&nbsp;";

        // ADJUST SPACING SO THAT ALL LINKS HAVE RELATIVELY EQUAL WIDTHS
        if (i-startingPos+1 < 10) {
            padding = "&nbsp;&nbsp;";
        }
        else {
            padding = "&nbsp;";
        }

        // GET THE DAY CURRENTLY BEING WRITTEN
        currentDay = i-startingPos+1;

        // SET THE TYPE OF DAY, THE focusDay GENERALLY APPEARS AS A DIFFERENT COLOR
        dayType = "weekDay";
//        if (currentDay == day) {
//            dayType = "focusDay";
//        }

        // ADD THE DAY TO THE CALENDAR STRING

// vlink, alink, link, text

	cellColor = cellUnselectedColor;
	if ( (startDate.getFullYear() > year) ||
             ((startDate.getFullYear() == year) && (startDate.getMonth() > month)) ||
             ((startDate.getFullYear() == year) && (startDate.getMonth() == month) && (startDate.getDate() > currentDay)))
            {
	    cellColor = invalidDateColor;
	    CellType = CELL_TYPE_DATE_IN_PAST;
	    }
	else if ( isSelectedDate(month,currentDay,year) )
	    {
	    cellColor = cellSelectedColor;
	    CellType = CELL_TYPE_SELECT;
	    }
	else if ( isPublishDate(month,currentDay,year ) )
            {
            cellColor = validDateColor;
	    CellType = CELL_TYPE_SELECT;
            }
        else
            {
	    cellColor = invalidDateColor;
	    CellType = CELL_TYPE_NO_SELECT;
	    }
//	else if ((validDates_a.length != 0) && (isValidDate(month,currentDay,year)))
//	    {
//	    cellColor = validDateColor;
//	    CellType = CELL_TYPE_SELECT;
//	    }
//	else if (validDates_a.length != 0)
//	    {
//	    cellColor = invalidDateColor;
//	    CellType = CELL_TYPE_NO_SELECT;
//	    }
//	else if ((invalidDates_a.length != 0) && (isInvalidDate(month,currentDay,year)))
//	    {
//	    cellColor = invalidDateColor;
//	    CellType = CELL_TYPE_NO_SELECT;
//	    }
//	else if (invalidDates_a.length != 0)
//	    {
//	    cellColor = validDateColor;
//	    CellType = CELL_TYPE_SELECT;
//	    }

	calDoc += "<TD align=center bgcolor='" + cellColor + "'>" +
                  "<a class='" + dayType + "' href='javascript:selectDate(" +
                  month + "," + currentDay + "," + year + "," + CellType +
		  ")'>" + padding + currentDay + paddingChar + "</a></TD>";

        columnCount++;

        // START A NEW ROW WHEN NECESSARY
        if (columnCount % 7 == 0) {
            calDoc += "</TR><TR>";
        }
    }

    // MAKE REMAINING NON-DATE CELLS BLANK
    for (i=days; i<42; i++)  {

        calDoc += blankCell;
	columnCount++;

        // START A NEW ROW WHEN NECESSARY
        if (columnCount % 7 == 0) {
            calDoc += "</TR>";
            if (i<41) {
                calDoc += "<TR>";
            }
        }
    }

    // FINISH THE NEW CALENDAR PAGE
    calDoc += calendarEnd;

    // RETURN THE COMPLETED CALENDAR PAGE
    return calDoc;
}

// CREATE THE INFO CALENDAR FRAME
function buildInfoFrame() {

    var firstRunDateIndex = 0;
    var theSelectedDateStr = "N/A";

    if ( selectedDates_a.length != 0 )
	{
    	for ( var i=0 ; i<selectedDates_a.length ; ++i )
    	    {
	    if ( (selectedDates_a[firstRunDateIndex].getFullYear() > selectedDates_a[i].getFullYear()) ||
             	 ((selectedDates_a[firstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[firstRunDateIndex].getMonth() > selectedDates_a[i].getMonth())) ||
             	 ((selectedDates_a[firstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[firstRunDateIndex].getMonth() == selectedDates_a[i].getMonth()) && (selectedDates_a[firstRunDateIndex].getDate() > selectedDates_a[i].getDate())))
	    	{
	    	firstRunDateIndex = i;
	    	}
	    }
        //theSelectedDateStr = selectedDates_a[firstRunDateIndex].toLocaleString();
		theSelectedDateStr = (selectedDates_a[firstRunDateIndex].getMonth() + 1) + "/" +  selectedDates_a[firstRunDateIndex].getDate() + "/" +  selectedDates_a[firstRunDateIndex].getFullYear();
	}

    // CREATE THE TOP FRAME OF THE CALENDAR
    var calDoc =
    	"<HTML>" +
        "<HEAD>" +
        "</HEAD>" +
        "<BODY BGCOLOR='" + topBackground + "'>" +
	"START: " +
        theSelectedDateStr +
	"<BR>" +
	"# Inserts:  " +
	selectedDates_a.length +
        "</HTML>";

    return calDoc;
}

// CREATE THE MESSAGE CALENDAR FRAME
function buildMessageFrame(theMessage) {

    // CREATE THE TOP FRAME OF THE CALENDAR
    var calDoc =
    	"<HTML>" +
        "<HEAD>" +
        "</HEAD>" +
        "<BODY BGCOLOR='" + topBackground + "'>" +
	"Message: " +
        theMessage +
        "</HTML>";

    return calDoc;
}

// CREATE THE MESSAGE CALENDAR FRAME
function buildApplyCancel() {

    // CREATE THE TOP FRAME OF THE CALENDAR
    var calDoc =
    	"<HTML>" +
        "<HEAD>" +
        "</HEAD>" +
        "<BODY BGCOLOR='" + topBackground + "'>" +
	"<CENTER>" +
        "<TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0>" +
        "<TR>" +
        "<TD>" +
        "<INPUT TYPE=BUTTON NAME='applyButton' VALUE='Apply' onClick='parent.opener.applyButtonClick()'>" +
        "</TD>" +
	"<TD>" +
	"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
	"</TD>" +
	"<TD>" +
	"<INPUT TYPE=BUTTON NAME='cancelButton' VALUE='Cancel' onClick='parent.opener.cancelButtonClick()'>" +
        "</TD>" +
        "</TR>" +
        "</TABLE>" +

        "</BODY>" +
        "</HTML>";

    return calDoc;
}


// WRITE THE MONTHLY CALENDAR TO THE BOTTOM CALENDAR FRAME
function writeCalendar() {

    // CREATE THE NEW CALENDAR FOR THE SELECTED MONTH & YEAR
    // calDocBottom = buildBottomCalFrame();

    // WRITE THE NEW CALENDAR TO THE BOTTOM FRAME
    top.newWin.frames['bottomCalFrame'].document.open();
    try { netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead UniversalBrowserWrite"); } catch (ex) { }
    top.newWin.frames['bottomCalFrame'].document.write(buildBottomCalFrame());
    top.newWin.frames['bottomCalFrame'].document.close();
}

// WRITE THE MESSAGE TO THE MESSAGE FRAME
function writeMessage(theMessage) {

    if ( theMessage.length != 0 )
	{
	clearTimeout(timeoutId);
	}

    // CREATE THE NEW CALENDAR FOR THE SELECTED MONTH & YEAR
    calDocMessage = buildMessageFrame(theMessage);

    // WRITE THE NEW CALENDAR TO THE BOTTOM FRAME
    top.newWin.frames['messageCalFrame'].document.open();
    top.newWin.frames['messageCalFrame'].document.write(calDocMessage);
    top.newWin.frames['messageCalFrame'].document.close();

    if ( theMessage.length != 0 )
	{
	timeoutId = setTimeout("writeMessage(\"\")", 3000);
	}
}

// WRITE THE CALENDAR INFO TO THE INFO FRAME
function writeInfo() {

    // CREATE NEW START DATE AND INSERTS MESSAGE
    calDocInfo = buildInfoFrame();

    // WRITE THE NEW CALENDAR INFO TO THE INFO FRAME
    top.newWin.frames['infoCalFrame'].document.open();
    top.newWin.frames['infoCalFrame'].document.write(calDocInfo);
    top.newWin.frames['infoCalFrame'].document.close();

}

// SET THE CALENDAR TO TODAY'S DATE AND DISPLAY THE NEW CALENDAR
function setToday() {

    // SET GLOBAL DATE TO TODAY'S DATE
    calDate = new Date();

    // SET DAY MONTH AND YEAR TO TODAY'S DATE
    var month = calDate.getMonth();
    var year  = calDate.getFullYear();

    // SET MONTH IN DROP-DOWN LIST
    top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex = month;

    // SET YEAR VALUE
    top.newWin.frames['topCalFrame'].document.calControl.year.value = year;

    // DISPLAY THE NEW CALENDAR
    writeCalendar();
}


// SET THE GLOBAL DATE TO THE NEWLY ENTERED YEAR AND REDRAW THE CALENDAR
function setYear() {

    // GET THE NEW YEAR VALUE
    var year  = top.newWin.frames['topCalFrame'].document.calControl.year.value;

    // IF IT'S A FOUR-DIGIT YEAR THEN CHANGE THE CALENDAR
    if (isFourDigitYear(year)) {
        calDate.setFullYear(year);
        writeCalendar();
    }
    else {
        // HIGHLIGHT THE YEAR IF THE YEAR IS NOT FOUR DIGITS IN LENGTH
        top.newWin.frames['topCalFrame'].document.calControl.year.focus();
        top.newWin.frames['topCalFrame'].document.calControl.year.select();
    }
}


// Track # 29770 
// If you set/manipulate the MONTH part of the date and the current month has 31 days.. and the 
// next month has fewer days (i.e.  30), then the month will get incremented 2 times, because after 
// setting the month, it determines the day number is invalid for the month, so it adds the corresponding number
// of extra days... usually pushing it to the next month.. i.e.  Oct31 + 1 month = December 1st rather than November 30th
// Arghhh.. the docs dont explicitly say this, but there is a reference in the JDK on Date::setMonth()
// Here is an exerpt from the docs:
//      Sets the month of this date to the specified value. This Date object is modified so that it represents a point in time 
//      within the specified month, with the year, date, hour, minute, and second the same as before, as interpreted in the local 
//      time zone. If the date was October 31, for example, and the month is set to June, then the new date will be treated as if it 
//      were on July 1, because June has only 30 days.
//
// So basically, all of the hocus-pocus below achieves that if you increment the month, and the 'new' month has fewer
// days than the current month, it will set the day of the month to the last day of the month of the NEW month.
//
 
// SET THE GLOBAL DATE TO THE SELECTED MONTH AND REDRAW THE CALENDAR
function setCurrentMonth() {

    // GET THE NEWLY SELECTED MONTH AND CHANGE THE CALENDAR ACCORDINGLY
    var month = top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex;

    var testDate = new Date(calDate.getFullYear(), calDate.getMonth(), 1);
    var numDays = 0;
    numDays = getNumberOfDaysInMonth(testDate);
    if (numDays < calDate.getDate())
    {
        calDate.setDate(numDays);
    }
    calDate.setMonth(month);

    writeCalendar();
}


// SET THE GLOBAL DATE TO THE PREVIOUS YEAR AND REDRAW THE CALENDAR
function setPreviousYear() {

    var year  = top.newWin.frames['topCalFrame'].document.calControl.year.value;

    if (isFourDigitYear(year) && year > 1000)
    {
        year--;

        var testDate = new Date(year, calDate.getMonth(), 1);
        var numDays = 0;
        numDays = getNumberOfDaysInMonth(testDate);
        if (numDays < calDate.getDate())
        {
            calDate.setDate(numDays);
        }
	
        // Dont set the year until we are sure the month in that new year has same # of days
        // i.e. leap year

        calDate.setFullYear(year);
        top.newWin.frames['topCalFrame'].document.calControl.year.value = year;
        writeCalendar();
    }
}


// SET THE GLOBAL DATE TO THE PREVIOUS MONTH AND REDRAW THE CALENDAR
function setPreviousMonth() {

    var year  = top.newWin.frames['topCalFrame'].document.calControl.year.value;
    var aSetYearFlag = false;

    if (isFourDigitYear(year))
    {
        var month = top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex;

        // IF MONTH IS JANUARY, SET MONTH TO DECEMBER AND DECREMENT THE YEAR
        if (month == 0)
        {
            month = 11;
            if (year > 1000)
            {
                year--;
                aSetYearFlag = true;
//                calDate.setFullYear(year);
                top.newWin.frames['topCalFrame'].document.calControl.year.value = year;
            }
        }
        else
        {
            month--;
        }

        var testDate = new Date (year, month, 1);
        var numDays = 0;
        numDays = getNumberOfDaysInMonth(testDate);

        // We must do this before we call setMonth since incrementing the month when we're on a day > last day of new month
        // can double increment the month.

        if (numDays < calDate.getDate())
        {
            calDate.setDate(numDays);
      	}

        calDate.setMonth(month);
        if (aSetYearFlag == true) calDate.setFullYear(year);
        top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex = month;
        writeCalendar();
    }
}


// SET THE GLOBAL DATE TO THE NEXT MONTH AND REDRAW THE CALENDAR
function setNextMonth() {

    var year = top.newWin.frames['topCalFrame'].document.calControl.year.value;
    var aSetYearFlag = false;

    if (isFourDigitYear(year))
    {
        var month = top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex;

        // IF MONTH IS DECEMBER, SET MONTH TO JANUARY AND INCREMENT THE YEAR
        if (month == 11)
        {
            month = 0;
            year++;
            aSetYearFlag = true;
//            calDate.setFullYear(year);
            top.newWin.frames['topCalFrame'].document.calControl.year.value = year;
        }
        else
        {
            month++;
        }

        // Build up a junk test date of the first of the new month.. to find out how many 
        // days are int it... if there are < the current number of days in this month.. .then 
        // make it point to the last day of the month... 
        var testDate = new Date (year, month, 1);
        var numDays = 0;
        numDays = getNumberOfDaysInMonth(testDate);

        if (numDays < calDate.getDate())
        {
            calDate.setDate(numDays);
        }
        calDate.setMonth(month);

        if (aSetYearFlag == true) calDate.setFullYear(year);
        top.newWin.frames['topCalFrame'].document.calControl.month.selectedIndex = month;
        writeCalendar();
    }
}


// SET THE GLOBAL DATE TO THE NEXT YEAR AND REDRAW THE CALENDAR
function setNextYear() {

    var year  = top.newWin.frames['topCalFrame'].document.calControl.year.value;
    if (isFourDigitYear(year))
    {
        year++;
        var testDate = new Date(year, calDate.getMonth(), 1);
        var numDays = 0;
        numDays = getNumberOfDaysInMonth(testDate);
        if (numDays < calDate.getDate())
        {
            calDate.setDate(numDays);
        }
	
        // Dont set the year until we are sure the month in that new year has same # of days
        // i.e. leap year

        calDate.setFullYear(year);
        top.newWin.frames['topCalFrame'].document.calControl.year.value = year;
        writeCalendar();
    }
}

function getNumberOfDaysInMonth(aDate)
{
    var days;
    var month = aDate.getMonth()+1;
    var year  = aDate.getFullYear();

    // RETURN 31 DAYS
    if (month==1 || month==3 || month==5 || month==7 || month==8 ||
        month==10 || month==12)  {
        days=31;
    }
    // RETURN 30 DAYS
    else if (month==4 || month==6 || month==9 || month==11) {
        days=30;
    }
    // RETURN 29 DAYS
    else if (month==2)  {
        if (isLeapYear(year)) {
            days=29;
        }
        // RETURN 28 DAYS
        else {
            days=28;
        }
    }
    return (days);
}

// GET NUMBER OF DAYS IN MONTH
function getDaysInMonth()
{
    return getNumberOfDaysInMonth(calDate);
}


// CHECK TO SEE IF YEAR IS A LEAP YEAR
function isLeapYear (Year) {

    if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
        return (true);
    }
    else {
        return (false);
    }
}


// ENSURE THAT THE YEAR IS FOUR DIGITS IN LENGTH
function isFourDigitYear(year) {

    if (year.length != 4) {
        top.newWin.frames['topCalFrame'].document.calControl.year.value = calDate.getFullYear();
        top.newWin.frames['topCalFrame'].document.calControl.year.select();
        top.newWin.frames['topCalFrame'].document.calControl.year.focus();
    }
    else {
        return true;
    }
}


// BUILD THE MONTH SELECT LIST
function getMonthSelect() {

    // BROWSER LANGUAGE CHECK DONE PREVIOUSLY (navigator.language())
    // FIRST TWO CHARACTERS OF LANGUAGE STRING SPECIFIES THE LANGUAGE
    // (THE LAST THREE OPTIONAL CHARACTERS SPECIFY THE LANGUAGE SUBTYPE)
    // SET THE NAMES OF THE MONTH TO THE PROPER LANGUAGE (DEFAULT TO ENGLISH)

    // IF FRENCH
    if (selectedLanguage == "fr") {
        monthArray = new Array('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
                               'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
    }
    // IF GERMAN
    else if (selectedLanguage == "de") {
        monthArray = new Array('Januar', 'Februar', 'März', 'April', 'Mai', 'Juni',
                               'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember');
    }
    // IF SPANISH
    else if (selectedLanguage == "es") {
        monthArray = new Array('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                               'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
    }
    // DEFAULT TO ENGLISH
    else {
        monthArray = new Array('January', 'February', 'March', 'April', 'May', 'June',
                               'July', 'August', 'September', 'October', 'November', 'December');
    }

    // DETERMINE MONTH TO SET AS DEFAULT
    var activeMonth = calDate.getMonth();

    // START HTML SELECT LIST ELEMENT
    monthSelect = "<SELECT NAME='month' onChange='parent.opener.setCurrentMonth()'>";

    // LOOP THROUGH MONTH ARRAY
    for (i in monthArray) {

        // SHOW THE CORRECT MONTH IN THE SELECT LIST
        if (i == activeMonth) {
            monthSelect += "<OPTION SELECTED>" + monthArray[i] + "\n";
        }
        else {
            monthSelect += "<OPTION>" + monthArray[i] + "\n";
        }
    }
    monthSelect += "</SELECT>";

    // RETURN A STRING VALUE WHICH CONTAINS A SELECT LIST OF ALL 12 MONTHS
    return monthSelect;
}


// SET DAYS OF THE WEEK DEPENDING ON LANGUAGE
function createWeekdayList() {

    // IF FRENCH
    if (selectedLanguage == "fr") {
        weekdayList  = new Array('Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi');
        weekdayArray = new Array('Di', 'Lu', 'Ma', 'Me', 'Je', 'Ve', 'Sa');
    }
    // IF GERMAN
    else if (selectedLanguage == "de") {
        weekdayList  = new Array('Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag');
        weekdayArray = new Array('So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa');
    }
    // IF SPANISH
    else if (selectedLanguage == "es") {
        weekdayList  = new Array('Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado')
        weekdayArray = new Array('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa');
    }
    else {
        weekdayList  = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
        weekdayArray = new Array('Su','Mo','Tu','We','Th','Fr','Sa');
    }

    // START HTML TO HOLD WEEKDAY NAMES IN TABLE FORMAT
    var weekdays = "<TR BGCOLOR='" + headingCellColor + "'>";

    // LOOP THROUGH WEEKDAY ARRAY
    for (i in weekdayArray) {

        weekdays += "<TD class='heading' align=center>" + weekdayArray[i] + "</TD>";
    }
    weekdays += "</TR>";

    // RETURN TABLE ROW OF WEEKDAY ABBREVIATIONS TO DISPLAY ABOVE THE CALENDAR
    return weekdays;
}


// PRE-BUILD PORTIONS OF THE CALENDAR (FOR PERFORMANCE REASONS)
function buildCalParts() {

    // GENERATE WEEKDAY HEADERS FOR THE CALENDAR
    weekdays = createWeekdayList();

    // BUILD THE BLANK CELL ROWS
    blankCell = "<TD align=center bgcolor='" + cellUnselectedColor + "'>&nbsp;&nbsp;&nbsp;</TD>";

    // BUILD THE TOP PORTION OF THE CALENDAR PAGE USING CSS TO CONTROL SOME DISPLAY ELEMENTS
    calendarBegin =
        "<HTML>" +
        "<HEAD>" +
        // STYLESHEET DEFINES APPEARANCE OF CALENDAR
        "<STYLE type='text/css'>" +
        "<!--" +

        // Make it not underline the links
        "A{ text-decoration: none ; }" +

        "TD.heading { text-decoration: none; color:" + headingTextColor + "; font: " + headingFontStyle + "; }" +
        "A.focusDay:link { color: " + focusColor + "; text-decoration: none; font: " + fontStyle + "; }" +
        "A.focusDay:hover { color: " + focusColor + "; text-decoration: none; font: " + fontStyle + "; }" +
        "A.weekday:link { color: " + dateColor + "; text-decoration: none; font: " + fontStyle + "; }" +

        // Make text of selected days look just like unselected days
        "A.weekday:visited { color: " + dateColor + "; text-decoration: none; font: " + fontStyle + "; }" +
        "A.weekday:active { color: " + dateColor + "; text-decoration: none; font: " + fontStyle + "; }" +
        "A.weekday:hover { color: " + hoverColor + "; font: " + fontStyle + "; }" +
        "-->" +
        "</STYLE>" +
        // Mozilla needs this
        "<script>" +
        "function selectDate(m,d,y,type) {" +
        "try { netscape.security.PrivilegeManager.enablePrivilege('UniversalBrowserRead UniversalBrowserWrite'); } catch (ex) { }" +
        "parent.opener.selectDate(m,d,y,type);" +
        "}" +
        "</script>" +
        "</HEAD>" +
        "<BODY BGCOLOR='" + bottomBackground + "'>" +
        "<CENTER>";

        // NAVIGATOR NEEDS A TABLE CONTAINER TO DISPLAY THE TABLE OUTLINES PROPERLY
        if (isNav) {
            calendarBegin +=
                "<TABLE CELLPADDING=0 CELLSPACING=1 BORDER=" + tableBorder + " ALIGN=CENTER BGCOLOR='" + tableBGColor + "'><TR><TD>";
        }

        // BUILD WEEKDAY HEADINGS
        calendarBegin +=
            "<TABLE CELLPADDING=0 CELLSPACING=1 BORDER=" + tableBorder + " ALIGN=CENTER BGCOLOR='" + tableBGColor + "'>" +
            weekdays +
            "<TR>";


    // BUILD THE BOTTOM PORTION OF THE CALENDAR PAGE
    calendarEnd = "";

        // WHETHER OR NOT TO DISPLAY A THICK LINE BELOW THE CALENDAR
        if (bottomBorder) {
            calendarEnd += "<TR></TR>";
        }

        // NAVIGATOR NEEDS A TABLE CONTAINER TO DISPLAY THE BORDERS PROPERLY
        if (isNav) {
            calendarEnd += "</TD></TR></TABLE>";
        }

        // END THE TABLE AND HTML DOCUMENT
        calendarEnd +=
            "</TABLE>" +
            "</CENTER>" +
            "</BODY>" +
            "</HTML>";
}


// REPLACE ALL INSTANCES OF find WITH replace
// inString: the string you want to convert
// find:     the value to search for
// replace:  the value to substitute
//
// usage:    jsReplace(inString, find, replace);
// example:  jsReplace("To be or not to be", "be", "ski");
//           result: "To ski or not to ski"
//
function jsReplace(inString, find, replace) {

    var outString = "";

    if (!inString) {
        return "";
    }

    // REPLACE ALL INSTANCES OF find WITH replace
    if (inString.indexOf(find) != -1) {
        // SEPARATE THE STRING INTO AN ARRAY OF STRINGS USING THE VALUE IN find
        t = inString.split(find);

        // JOIN ALL ELEMENTS OF THE ARRAY, SEPARATED BY THE VALUE IN replace
        return (t.join(replace));
    }
    else {
        return inString;
    }
}


// JAVASCRIPT FUNCTION -- DOES NOTHING (USED FOR THE HREF IN THE CALENDAR CALL)
function doNothing() {
}


// ENSURE THAT VALUE IS TWO DIGITS IN LENGTH
function makeTwoDigit(inValue) {

    var numVal = parseInt(inValue, 10);

    // VALUE IS LESS THAN TWO DIGITS IN LENGTH
    if (numVal < 10) {

        // ADD A LEADING ZERO TO THE VALUE AND RETURN IT
        return("0" + numVal);
    }
    else {
        return numVal;
    }
}

// APPLY THE DATES USER SELECTED
function applyButtonClick() {

    clearTimeout(timeoutId);

    var theSelectedDateStr = "";
    var firstRunDateIndex = 0;
    for ( var i=0 ; i<selectedDates_a.length ; ++i )
    	{
	if ( (selectedDates_a[firstRunDateIndex].getFullYear() > selectedDates_a[i].getFullYear()) ||
             ((selectedDates_a[firstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[firstRunDateIndex].getMonth() > selectedDates_a[i].getMonth())) ||
             ((selectedDates_a[firstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[firstRunDateIndex].getMonth() == selectedDates_a[i].getMonth()) && (selectedDates_a[firstRunDateIndex].getDate() > selectedDates_a[i].getDate())))
	    {
	    firstRunDateIndex = i;
	    }

	if ( theSelectedDateStr.length != 0 )
	    {
	    theSelectedDateStr += "|";
	    }
	theSelectedDateStr += selectedDates_a[i].toLocaleString();
    	}

    // return selected run dates
    calSelectedDatesField.value = theSelectedDateStr;

    // return the first run date selected
    outDate = "";
    if ( selectedDates_a.length != 0 )
	{
	outDate += selectedDates_a[firstRunDateIndex].toLocaleString();
	}
    calDateField.value = outDate;

    // GIVE FOCUS BACK TO THE DATE FIELD
    //calDateField.focus();

    // set the count
    calInsertsField.value = selectedDates_a.length;

    // CLOSE THE CALENDAR WINDOW
    top.newWin.close();

    applyFlagField.value = "true";

    // submit the new dates
    formObject.submit();
}

// IGNORE ANY DATES USER SELECTED
function cancelButtonClick() {

    //selectedDates_a.length = savSelectedDates_a.length;
    //for ( var i=0 ; i<savSelectedDates_a.length ; ++i )
    	//{
	//selectedDates_a[i] = savSelectedDates_a[i];
	//}

    // CLOSE THE CALENDAR WINDOW
    top.newWin.close();
}

// return true if date selected
function isSelectedDate(aMonth,aDay,aYear) {

for ( var i=0 ; i<selectedDates_a.length ; ++i )
    {
    if ( aMonth == selectedDates_a[i].getMonth() &&
	 aDay == selectedDates_a[i].getDate() &&
	 aYear == selectedDates_a[i].getFullYear() )
	{
	return true;
	}
    }

return false;
}

// isPublishDate
function isPublishDate(aMonth,aDay,aYear) {

var returnValue_b = true;

// specified date is not publishable if valid dates
// are defined and specified date is not in the list
if ( validDates_a.length != 0 )
    {
    var found_b = false;
    for ( var i=0 ; i<validDates_a.length ; ++i )
        {
        if ( aMonth == validDates_a[i].getMonth() &&
	     aDay == validDates_a[i].getDate() &&
	     aYear == validDates_a[i].getFullYear() )
	    {
	    found_b = true;
            break;
	    }
        }
    if ( found_b == false )
        {
        returnValue_b = false;
        }
    }

// check if date specified in invalidate list
for ( var i=0 ; i<invalidDates_a.length ; ++i )
    {
    if ( aMonth == invalidDates_a[i].getMonth() &&
	 aDay == invalidDates_a[i].getDate() &&
	 aYear == invalidDates_a[i].getFullYear() )
	{
	returnValue_b = false;
        break;
	}
    }

// check Day of Week mask
theSpecifiedDate = new Date(aYear,aMonth,aDay,0,0,0,0);
theDOW = theSpecifiedDate.getDay();
theDayBit = 0;
switch ( theDOW )
    {
    case 0: theDayBit = DOW_Sunday; break;
    case 1: theDayBit = DOW_Monday; break;
    case 2: theDayBit = DOW_Tuesday; break;
    case 3: theDayBit = DOW_Wednesday; break;
    case 4: theDayBit = DOW_Thursday; break;
    case 5: theDayBit = DOW_Friday; break;
    case 6: theDayBit = DOW_Saturday; break;
    }
if ( !(theDayBit & theDowMask) )
    {
    returnValue_b = false;
    }

// check for deadline violation
if ( deadlineDates_a.length > theDOW )
    {
    theDeadlineDate = deadlineDates_a[theDOW];
    if ( theSpecifiedDate < theDeadlineDate )
        {
        returnValue_b = false;
        }
    }

return returnValue_b;
}

// return true if date is valid run date
function isValidDate(aMonth,aDay,aYear) {

for ( var i=0 ; i<validDates_a.length ; ++i )
    {
    if ( aMonth == validDates_a[i].getMonth() &&
	 aDay == validDates_a[i].getDate() &&
	 aYear == validDates_a[i].getFullYear() )
	{
	return true;
	}
    }

return false;
}

// return true if date is invalid date
function isInvalidDate(aMonth,aDay,aYear) {

for ( var i=0 ; i<invalidDates_a.length ; ++i )
    {
    if ( aMonth == invalidDates_a[i].getMonth() &&
	 aDay == invalidDates_a[i].getDate() &&
	 aYear == invalidDates_a[i].getFullYear() )
	{
	return true;
	}
    }

return false;
}

// return true if date is a MANDATORY date
function isMandatoryDate(aMonth,aDay,aYear) 
{
    for ( var i=0 ; i < mandatoryDates_a.length ; ++i )
    {
        if (aMonth == mandatoryDates_a[i].getMonth() &&
            aDay == mandatoryDates_a[i].getDate() &&
            aYear == mandatoryDates_a[i].getFullYear() )
        {
            return true;
        }
    }
    return false;
}

// SET FIELD VALUE TO THE DATE SELECTED AND CLOSE THE CALENDAR WINDOW
function selectDate(theMonth,theDay,theYear,theCellType)
{
    var i;
    var aMandatoryDateMsg_s;
    var aMandatoryFlag_b = false;
    
    // IF FRENCH
    if (selectedLanguage == "fr")
	{
        SelectMessageArray = new Array('Date In Past', 'Invalid Date', 'Date Selected', 'Date Unselected');
        aMandatoryDateMsg_s = 'Date is a mandatory date';
    	}
    // IF GERMAN
    else if (selectedLanguage == "de")
	{
        SelectMessageArray = new Array('Date In Past', 'Invalid Date', 'Date Selected', 'Date Unselected');
        aMandatoryDateMsg_s = 'Date is a mandatory date';
    	}
    // IF SPANISH
    else if (selectedLanguage == "es")
	{
        SelectMessageArray = new Array('Date In Past', 'Invalid Date', 'Date Selected', 'Date Unselected');
        aMandatoryDateMsg_s = 'Date is a mandatory date';
    	}
    else
	{
        SelectMessageArray = new Array('Date In Past', 'Invalid Date', 'Date Selected', 'Date Unselected');
        aMandatoryDateMsg_s = 'Date is a mandatory date';
    	}

    // if valid date selected, then check if date was already selected
    if ( theCellType == CELL_TYPE_SELECT )
	{
    	if ( isSelectedDate(theMonth,theDay,theYear) )
	    {
            if (!isMandatoryDate(theMonth,theDay,theYear))
            {
                // remove from selected list
                theCellType = CELL_TYPE_UNSELECT;
                for ( i=0 ; i<selectedDates_a.length ; ++i )
                {
                    if (theMonth == selectedDates_a[i].getMonth() &&
                        theDay == selectedDates_a[i].getDate() &&
                        theYear == selectedDates_a[i].getFullYear() )
                    {
                        break;
                    }
                }
                while ( (i+1) < selectedDates_a.length )
                {
                    selectedDates_a[i] = selectedDates_a[i+1];
                    ++i;
                }
                --selectedDates_a.length;
            } // end  if (!isMandatoryDate(theMonth,theDay,theYear))
            else
            {
                aMandatoryFlag_b = true;
            }
	        writeCalendar();
	    }
        else
	    {
            // add date to selected list
            var aDate = new Date(theYear,theMonth,theDay,0,0,0,0);

            // save valid date
            selectedDates_a[selectedDates_a.length] = aDate;
            writeCalendar();
	    }
	}

    if (aMandatoryFlag_b == true)
    {
        // Dump out a message indicating that the date they are trying to deselect is 
        // a MANDATORY date
        writeMessage(aMandatoryDateMsg_s);
    }
    else
    {
        writeMessage(SelectMessageArray[theCellType]);
    }
    writeInfo();
}

// SET FIELD VALUE TO THE DATE SELECTED AND CLOSE THE CALENDAR WINDOW
function returnDate(theMonth,theDay,theYear)
{

    // inDay = THE DAY THE USER CLICKED ON
    theNewDate = new Date(theYear,theMonth,theDay,0,0,0,0);

    // SET THE DATE RETURNED TO THE USER
    var day           = theNewDate.getDate();
    var month         = theNewDate.getMonth()+1;
    var year          = theNewDate.getFullYear();
    var monthString   = monthArray[theNewDate.getMonth()];
    var monthAbbrev   = monthString.substring(0,3);
    var weekday       = weekdayList[theNewDate.getDay()];
    var weekdayAbbrev = weekday.substring(0,3);

    outDate = calDateFormat;

    // RETURN TWO DIGIT DAY
    if (calDateFormat.indexOf("DD") != -1) {
        day = makeTwoDigit(day);
        outDate = jsReplace(outDate, "DD", day);
    }
    // RETURN ONE OR TWO DIGIT DAY
    else if (calDateFormat.indexOf("dd") != -1) {
        outDate = jsReplace(outDate, "dd", day);
    }

    // RETURN TWO DIGIT MONTH
    if (calDateFormat.indexOf("MM") != -1) {
        month = makeTwoDigit(month);
        outDate = jsReplace(outDate, "MM", month);
    }
    // RETURN ONE OR TWO DIGIT MONTH
    else if (calDateFormat.indexOf("mm") != -1) {
        outDate = jsReplace(outDate, "mm", month);
    }

    // RETURN FOUR-DIGIT YEAR
    if (calDateFormat.indexOf("yyyy") != -1) {
        outDate = jsReplace(outDate, "yyyy", year);
    }
    // RETURN TWO-DIGIT YEAR
    else if (calDateFormat.indexOf("yy") != -1) {
        var yearString = "" + year;
        var yearString = yearString.substring(2,4);
        outDate = jsReplace(outDate, "yy", yearString);
    }
    // RETURN FOUR-DIGIT YEAR
    else if (calDateFormat.indexOf("YY") != -1) {
        outDate = jsReplace(outDate, "YY", year);
    }

    // RETURN DAY OF MONTH (Initial Caps)
    if (calDateFormat.indexOf("Month") != -1) {
        outDate = jsReplace(outDate, "Month", monthString);
    }
    // RETURN DAY OF MONTH (lowercase letters)
    else if (calDateFormat.indexOf("month") != -1) {
        outDate = jsReplace(outDate, "month", monthString.toLowerCase());
    }
    // RETURN DAY OF MONTH (UPPERCASE LETTERS)
    else if (calDateFormat.indexOf("MONTH") != -1) {
        outDate = jsReplace(outDate, "MONTH", monthString.toUpperCase());
    }

    // RETURN DAY OF MONTH 3-DAY ABBREVIATION (Initial Caps)
    if (calDateFormat.indexOf("Mon") != -1) {
        outDate = jsReplace(outDate, "Mon", monthAbbrev);
    }
    // RETURN DAY OF MONTH 3-DAY ABBREVIATION (lowercase letters)
    else if (calDateFormat.indexOf("mon") != -1) {
        outDate = jsReplace(outDate, "mon", monthAbbrev.toLowerCase());
    }
    // RETURN DAY OF MONTH 3-DAY ABBREVIATION (UPPERCASE LETTERS)
    else if (calDateFormat.indexOf("MON") != -1) {
        outDate = jsReplace(outDate, "MON", monthAbbrev.toUpperCase());
    }

    // RETURN WEEKDAY (Initial Caps)
    if (calDateFormat.indexOf("Weekday") != -1) {
        outDate = jsReplace(outDate, "Weekday", weekday);
    }
    // RETURN WEEKDAY (lowercase letters)
    else if (calDateFormat.indexOf("weekday") != -1) {
        outDate = jsReplace(outDate, "weekday", weekday.toLowerCase());
    }
    // RETURN WEEKDAY (UPPERCASE LETTERS)
    else if (calDateFormat.indexOf("WEEKDAY") != -1) {
        outDate = jsReplace(outDate, "WEEKDAY", weekday.toUpperCase());
    }

    // RETURN WEEKDAY 3-DAY ABBREVIATION (Initial Caps)
    if (calDateFormat.indexOf("Wkdy") != -1) {
        outDate = jsReplace(outDate, "Wkdy", weekdayAbbrev);
    }
    // RETURN WEEKDAY 3-DAY ABBREVIATION (lowercase letters)
    else if (calDateFormat.indexOf("wkdy") != -1) {
        outDate = jsReplace(outDate, "wkdy", weekdayAbbrev.toLowerCase());
    }
    // RETURN WEEKDAY 3-DAY ABBREVIATION (UPPERCASE LETTERS)
    else if (calDateFormat.indexOf("WKDY") != -1) {
        outDate = jsReplace(outDate, "WKDY", weekdayAbbrev.toUpperCase());
    }

    return outDate;
}