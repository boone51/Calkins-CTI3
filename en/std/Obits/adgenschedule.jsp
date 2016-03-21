<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/Obitswithmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../jsp/allstyles.css" rel="stylesheet" type="text/css">


<!-- InstanceBeginEditable name="JavaScript" -->
<script language="javascript">

</script>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>

</head>

<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsheader.htm"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><%@ include file="../includes/ObitsleftSide.htm"%></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> 
      <span class="PageName"> !! -- adgenschedule.jsp</span>
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
      <form method="post" action="WebBaseMain.do" name="merchattributes"> 
        <table width="450" border="0" align="center" cellpadding="0" cellspacing="0"> 
          <tr align="center">
            <td colspan="2" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
            <webbase:errorData dataType='ErrorURL' nextURL='/Obits/SetMerchandiseAttributes.jsp'/></td>
          </tr>
          <tr> 
            <td class="heading"colspan="2">Schedule the Ad </td> 
          </tr> 
          <tr align="center"> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr align="center"> 
            <td height="30" colspan="2">Your selected Ad Category is:<br> 
                             <span class="chosencategory"><webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></span>               
            </td> 
          </tr> 
          <tr> 
            <td width="50%">&nbsp;</td> 
            <td width="50%" align="center">&nbsp;</td> 
          </tr> 
          <tr align="center">
            <td colspan="2" class="mgroupname">Ad Preview</td>
          </tr>
          <tr align="center">
            <td colspan="2"><table border="1" align="center" bordercolor="#666666" cellpadding="5"> 
                      <tr> 
                        <td><webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/> 
                          <webbase:adData dataType="ImagePreview"/></td> 
                      </tr> 
                    </table></td>
          </tr>
          <tr align="center">
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><span class="mgroupname">Ad Schedule</span>              <webbase:mactiveAction dataType="SetQueue" dataValue="Web Review"/>
              <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder orderStatus='Ready'/>"/>
              <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder source='Web'/>"/>
              <webbase:mactiveAction dataType="SetRep" dataValue="WEB"/></td>
          </tr>
          <tr align="center">
            <td colspan="2">
			  <!-- calendar stylesheet --> 
              <link rel="stylesheet" type="text/css" media="all" href="../../../scripts/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" /> 
              <!-- main calendar program --> 
              <script type="text/javascript" src="../../../scripts/calendar/calendar.js"></script> 
              <!-- language for the calendar --> 
              <script type="text/javascript" src="../../../scripts/calendar/lang/calendar-en.js"></script> 
              <!-- the following script defines the Calendar.setup helper function --> 
              <script type="text/javascript" src="../../../scripts/calendar/calendar-setup.js"></script> 
              <!-- contains Mactive specific calendar related functions --> 
              <script type="text/javascript" src="../../../scripts/calendar/calendar-mactive.js"></script>
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" class="mgrouptable"> 
                <tr> 
                  <td width="6%">&nbsp; </td> 
                  <td width="47%">Schedule Description</td> 
                  <td width="19%" nowrap>Start 
                    Date </td> 
                  <td width="28%" nowrap>Number 
                    of Times</td> 
                </tr> 
                <webbase:AdSScheduleInfoIt> 
                <tr>
                  <td colspan="4">&nbsp;</td>
                </tr>
                <tr> <script language="JavaScript" src="../../../scripts/calendar.js"></script> 
                  <td class="standard"><webbase:AdSScheduleInfo dataType="SSCheckBox" editMode="1"/></td> 
                  <td class="standard"><webbase:AdSScheduleInfo dataType="SSDescription"/></td> 
                  <td nowrap class="standard"><webbase:AdSScheduleInfo dataType="SSStartDate" editMode="1"/> 
                    <webbase:AdSScheduleInfo dataType="SSCalendar" editMode="1"/></td> 
                  <td align="center" nowrap class="standard"> <webbase:AdSScheduleInfo dataType="SSNumTimes" editMode="1"/></td> 
                </tr> 
                </webbase:AdSScheduleInfoIt> 
                 </table></td>
          </tr>
          <tr> 
            <td colspan="2">&nbsp;</td> 
          </tr> 
          <tr align="center"> 
            <td>
			<webbase:showIf expression="allowPhotoUpload">
			<webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/SetIpixImage.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper>
			</webbase:showIf>
			<webbase:showIf expression="!allowPhotoUpload">
			<webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/AnswerQuestions.jsp"> 
              <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
              </webbase:formHelper>
			  </webbase:showIf>
			  </td> 
            <td>
			  <%-- use the advanced scheduler --%>
			  <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/Obits/AdvancedScheduler.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:formHelper>
			  
			  <%-- do NOT use advanced scheduler 
			  <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/Obits/adGenReviewOrder.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:formHelper>
			  --%>
			  </td> 
          </tr> 
          <tr> 
            <td colspan="2"> <webbase:formHelper dataType="formList"/> 
              <webbase:formHelper dataType="FormValidate"/> </td> 
          </tr> 
        </table> 
      </form> 
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="../includes/Obitsfooter.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
