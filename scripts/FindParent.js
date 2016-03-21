function FindParentWindow()
    {
    var parentWindow = window;
    while ( parentWindow != parentWindow.parent )
        {
        parentWindow = parentWindow.parent;
        }
    return parentWindow;
    }