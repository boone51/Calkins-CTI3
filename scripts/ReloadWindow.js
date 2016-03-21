function ReloadWindow(theWindow,theFormName)
    {
    var i,theObject;
    theObject = MM_findObj(theFormName, theWindow.document);
    if ( theObject != null )
        {
        theObject.submit();
        }
    else
        {
        for ( i=0 ; i<theWindow.length ; ++i )
            {
            ReloadWindow(theWindow.frames[i],theFormName);
            }
        }
    }