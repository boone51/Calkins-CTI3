//
// File: timeoutScript.js
//

// set session timeout amount (See WebBaseProperties.properties file: Login.InactiveTimeLogoff)
var maxTime = 1200

// adjust by number of minutes before session timeout
maxTime -= 180

// setup timeout timer
window.setTimeout("timeoutWarning();",maxTime*1000)

// redirect to timeout page
function timeoutWarning()
{
    // 23-jan-2008 J. Oelschlegel - Ryan told me that the original implementation did not work properly because
    // we had DISABLED the back button on the web pages, however, the original implementation relied on using the 
    // same mechanism to go to the previous page (window.history.go(-1) ... therefore it did not work properly.  Ryan's interim solution is 
    // simply notify the user.. and do nothing.  We need to revisit this and get it to work properly.  In the interim, Ryan
    // had asked me to put this code into source safe as a stop-gap measure
    // ORIGINAL S. Klingberg CODE BELOW:
    
    //
    //window.location = "WebBaseMain.do?cmd=timeoutWarning&NextURL=/jsp/timeoutWarning.jsp";
    
    // Ryan S attempt to fix the shortcomings of the above code.... 
    //window.location = "WebBaseMain.do?cmd=timeoutWarning&NextURL=/jsp/timeoutWarning.jsp&urlaction=push";
    //alert("Your session is about to time out. \rIf you ");

     test = confirm("Your session is about to time out. \rYou have 3 minutes to click a link or your session will end.");
      if(test == true)
      {    
          // Do nothing... 
      } else 
      {
        document.location = "WebBaseMain.do?cmd=LogOff";
      }


}