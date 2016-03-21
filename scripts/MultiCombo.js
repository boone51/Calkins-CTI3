function returnSelectedItem(menuName)
   {
   var theMenu
   var returnValue = 0
   theMenu = MM_findObj(menuName)
   if ( theMenu.type == "select-one" )
      {
      for ( i=0 ; i<theMenuNames.length ; ++i )
         {
         if ( theMenuNames[i] == menuName )
            break
         }
      if ( i != theMenuNames.length )
         {
         returnValue = theMenuIds[i][theMenu.selectedIndex]
         }
      }
   return returnValue
   }

function updateMenus(menuName)
   {
   var theMenu
   var theSubMenu
   var i
   var j
   theMenu = MM_findObj(menuName)
   if ( theMenu.type == "select-one" )
      {
        // find menu selected
      for ( i=0 ; i<theMenuNames.length ; ++i )
         {
         if ( theMenuNames[i] == menuName )
            break
         }
        // clear all submenus
      for ( j=i+1 ; j<theMenuNames.length ; ++j )
         {
         theSubMenu = MM_findObj(theMenuNames[j])
         theSubMenu.length = 0
         }
        // set submenu with valid options
      while ( i < theMenuNames.length-1 )
         {
         selectedIndex[i] = theMenu.selectedIndex
	   if ( selectedIndex[0] < selectedIndexOffset[0] )
	      break;
         menuObject = MMD[selectedIndex[0]-selectedIndexOffset[0]].sm
         for ( j=1 ; j<=i ; ++j )
            {
            menuObject = menuObject[selectedIndex[j]-selectedIndexOffset[j]].sm
            }
         theSubMenu = MM_findObj(theMenuNames[i+1])
         if ( menuObject.length == 1 && menuObject[0].id == 0 )
            {
            theSubMenu.length = menuObject.length
            theSubMenu.options[0].text = menuObject[0].n
            theSubMenu.options[0].value = menuObject[0].id
            selectedIndex[i+1] = 0
            selectedIndexOffset[i+1] = 0
            theMenu = theSubMenu
            }
         else
            {
            selectedIndexOffset[i+1] = 1
            if ( theMenu.selectedIndex != 0 || theMenu.length == 1 )
               {
               theSubMenu.length = menuObject.length + 1
               theSubMenu.options[0].text = "Choose One"
               theSubMenu.options[0].value =  -1;
               for ( j=0 ; j<menuObject.length ; ++j )
                  {
                  theSubMenu.options[j+1].text = menuObject[j].n
                  theSubMenu.options[j+1].value = menuObject[j].id
                  }
               }
            break
            }
         ++i
         }
      }
   }

function setSelectedItem(menuName,theId)
   {
   var theMenu
   theMenu = MM_findObj(menuName)
   if ( theMenu.type == "select-one" )
      {
      for ( i=0 ; i<theMenu.length ; ++i )
         {
         if ( theMenu.options[i].value == theId )
            {
            theMenu.selectedIndex = i;
            break;
            }
         }
      }
   }