<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>

<%@ page contentType="text/html; charset=iso-8859-1" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
    <!--
      .Text {
        font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
      }
     .SelectedRunSchedule {
        font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
		background-color: #999999;
        color: #000000;
      }	 
	   .Labels {
        font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
        background-color: #EBE9E3;
        vertical-align: bottom;
      }

      .Panels {
        font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: bold;
        font-variant: normal;
        color: #000000;
        background-color: #C6B899;
      }

      .TableBack {
        font-family: Arial Narrow, Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-style: normal;
        font-weight: normal;
        font-variant: normal;
        color: #000000;
        background-color: #FFFFFF;
      }

      .TableFront {
	font-family: Arial Narrow, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
	height: 100%;
      }

      .InputFields {
	font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-style: normal;
	font-weight: normal;
	color: #000000;
	vertical-align: text-bottom;
	margin: 0px;
	padding: 0px;
	height: 17px;
      }

      .InputFieldsRequired {
        font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
        font-size: xx-small;
        font-weight: normal;
        color: #000000;
        background-color: #FFFF00;
      }
.TableBackPanels {
	font-family: Arial Narrow, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
	background-color: #EBE9E3;
	margin: 0px;
	padding: 0px;
	border: 0px ridge #EBE9E3;
	height: auto;
	width: 100%;
	background-position: center top;
}
.Labelstopalign {
	font-family: "Arial Narrow", Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	color: #000000;
	background-color: #EBE9E3;
	vertical-align: top;
	margin: 0px;
	padding: 0px;
}
.PanelTitles {
	font-family: "Arial Narrow", Arial;
	font-size: 10pt;
	font-weight: bold;
	color: #000000;
	background-position: left bottom;
	letter-spacing: normal;
	text-align: left;
	vertical-align: bottom;
	word-spacing: normal;
	margin: 0px;
	padding: 0px;
	width: auto;
}
.Row1 {
	background-color: #FFFFFF;
}
.Row2 {
	background-color: #CCCCCC;
}
    -->
    </style>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form method="post" action="WebBaseMain.do" name="composers">
  <table width="100%" border cellpadding="1" cellspacing="0" bgcolor="#CCCCCC">
                        <tr class="TableBack">
                          <td width="25%">Product</td>
                          <td width="25%">Placement/Class</td>
                          <td width="25%">Start</td>
                          <td width="25%">Times Published</td>
                        </tr>
                        <webbase:runScheduleIt> 
                        <tr class="Text">
			  <webbase:showIf expression="runScheduleSelected">
			  <td class="SelectedRunSchedule" link="#FFFFFF" vlink="FFFFFF" alink="FFFFFF"></webbase:showIf><webbase:showIf expression="!runScheduleSelected">
			  <td></webbase:showIf><webbase:RSDetail dataType="Product" openThoughtHREF="true"/>
			  </td>

			  <webbase:showIf expression="runScheduleSelected">
			  <td class="SelectedRunSchedule"></webbase:showIf><webbase:showIf expression="!runScheduleSelected">
			  <td></webbase:showIf><webbase:RSDetail dataType="Placement"/>
			  </td>

			  <webbase:showIf expression="runScheduleSelected">
			  <td width="49" class="SelectedRunSchedule"></webbase:showIf><webbase:showIf expression="!runScheduleSelected">
			  <td width="49"></webbase:showIf><webbase:RSDetail dataType="Fday"/>
			  </td>

			  <webbase:showIf expression="runScheduleSelected">
			  <td width="49" class="SelectedRunSchedule"></webbase:showIf><webbase:showIf expression="!runScheduleSelected">
			  <td width="55"></webbase:showIf><webbase:RSDetail dataType="NumInserts"/>
			  </td>
               
                </tr>
                        </webbase:runScheduleIt> 
  </table>
         
					
</form>

</body>
</html>
