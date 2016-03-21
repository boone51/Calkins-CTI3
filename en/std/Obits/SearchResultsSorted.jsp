<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>Mactive AdBase E Demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../../jsp/allstyles.css" rel="stylesheet" type="text/css">

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features,x,y) { //v2.0
  if(screen){
    wide = (screen.width - x) /2;
	tall = (screen.height -y + 20) /2;
	features = features + ",top=" + tall + ",left=" + wide;
  }
  window.open(theURL,winName,features);
}

function doSomething(){

}

//-->
</script>
<link href="../../../scripts/grid/styles/xp/grid.css" rel="stylesheet" type="text/css"  />
<script src="../../../scripts/ThinClient/activeui.js"></script>

<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" onLoad="doSomething()" class="mmaintable">
<webbase:SortOrderSearch
			  userQueryMode="1"
			  openOrderURL="/jsp/ViewExistingOrder.jsp"
			  alternateColor1="threedface"
			  alternateColor2="white"
                    col0="OrderNumber" col0Name="OrderNumber"
                    col1="Placement" col1Name="Placement"
                    col2="Position" col2Name="Position"
                    col3="PrimaryOrderor" col3Name="Ordered By"
                    col4="Cdate" col4Name="Ordered"
                    col5="Fday" col5Name="Fday"
			 	    col6="SortText" col6Name="SortText" />
</body>
</html>
