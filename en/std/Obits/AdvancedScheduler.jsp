<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<%@ taglib uri="/Mactive/AdBookerTags" prefix="adbooker" %>
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
        <br />
		<span class="PageName"> !! -- AdvancedScheduler.jsp</span>
        <webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
        <form method="post" action="WebBaseMain.do" name="merchattributes">
        <webbase:errorData dataType='ErrorMsg'/>
        <webbase:errorData dataType='ErrorURL' nextURL='jsp/AdvancedScheduler.jsp'/>
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr align="left"> 
            <td class="pagetitlecell" style="font-weight: bold" colspan="2"><h3 class="mgroupheadercell">Scheduling 
                Opportunities</h3></td> 
          </tr> 
          <tr align="center">
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr align="center"> 
            <td height="30" colspan="2"> 
          </td>
          </tr> 
          <tr>
            <td colspan="2" class="mgrouptable">&nbsp;</td>
       
          </tr>
          <tr>
            <td colspan="2" ><strong><span class="categoryTitle">Ad Preview</span></strong> </td>
          </tr>
          <tr>
            <td colspan="2"><webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/><webbase:Image dataType="PreviewContents"/>
            </td>
          </tr>
          <tr>
            <td width="51%">&nbsp;</td>
            <td width="49%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="5" class="blue_tables">
              
             
              <tr>
                <td valign="top">&nbsp;</td>
                <td valign="top">
				  <webbase:RSDetail dataType="BookerCalendar"/>
				  <div align="right">
				    <a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ModifyRSButton')"><img src="../../../images/addinserts.gif" width="106" height="13" border="0"></a>&nbsp;
					<!-- <a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=AddRSButton')"><img src="../../../images/addschedule.gif" width="107" height="17" border="0"></a>&nbsp;
					<a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=RemoveRSButton')"><img src="../../../images/removeschedule.gif" width="132" height="17" border="0"></a> -->
				  </div>
				</td>
              </tr>
              <tr>
                <td colspan="2" valign="top"><iframe src="RunScheduleContent.jsp" name="RSTable" id="RSTable" width="100%" height="120" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe></td>
              </tr>
            </table>              
            </td>
          </tr>
          <tr> 
            <td colspan="2" align="center">&nbsp;</td>
          </tr> 
          <tr>
            <td colspan="2" align="center"><table width="100%"  border="0" cellpadding="0" cellspacing="0" id="noBorder2">
              <tr>
                <td width="50%"><div align="center"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/Obits/adgenschedule.jsp"> 
                <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
                </webbase:formHelper></div></td>
                <td width="50%"><div align="center">
                  <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/Obits/adGenReviewOrder.jsp"> 
              <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
              </webbase:formHelper></div></td>
              </tr>
            </table></td>
          </tr>
          <tr> 
              <webbase:formHelper dataType="formList"/>
              <webbase:formHelper dataType="FormValidate"/>
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
