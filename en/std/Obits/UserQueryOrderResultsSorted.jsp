<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<title>Mactive AdBase E Demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../../scripts/allstyles.css" rel="stylesheet" type="text/css">
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
<link href="../../../scripts/ActiveWidgets-1.0.1/runtime/styles/xp/grid.css" rel="stylesheet" type="text/css"  />
<script src="../../../scripts/ActiveWidgets-1.0.1/runtime/lib/grid.js"></script>

<link href="allstyles.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" onLoad="doSomething()">

<style>
	.active-controls-grid {height: 100%; font: menu;}
	.active-column-0 {text-align: left;}
	.active-column-1 {text-align: left;}
	.active-column-2 {text-align: left;}
	.active-column-3 {text-align: left;}
	.active-column-4 {text-align: left;}
	.active-column-5 {text-align: left;}
	.active-column-6 {text-align: right;}
	.active-column-7 {text-align: left;}
	.active-grid-column {border-right: 1px solid threedshadow;}
		.active-grid-row {border-bottom: 1px solid threedlightshadow;}
        .active-templates-row.gecko {display: -moz-box; width: auto; min-width: 100%;}        
</style>

<webbase:SortOrderSearch
		userQueryMode="1"
		openOrderURL="/jsp/ViewExistingOrder.jsp"
		alternateColor1="threedface"
		alternateColor2="white"
                col0="OrderNumber" col0Name="OrderNumber"
                col1="Placement" col1Name="Placement"
                col2="Position" col2Name="Position"
                col3="Cdate" col3Name="Cdate"
                col4="Fday" col4Name="Fday"
                col5="Lday" col5Name="Lday"
				col6="OrderPrice" col6Name="OrderPrice" 
				col7="AdOrderStatus" col7Name="AdOrderStatus" />
</body>
</html>
