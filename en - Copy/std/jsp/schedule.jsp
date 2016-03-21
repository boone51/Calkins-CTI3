<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">


<!-- InstanceBeginEditable name="JavaScript" -->
<script language="javascript">
if (self != window.top) top.location.href=self.location.href;
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
    <td colspan="2"><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" --><%@ include file="../includes/leftSide.htm"%><!-- InstanceEndEditable --></td>
	<td width="600" valign="top"><!-- InstanceBeginEditable name="content" -->
	  <span class="PageName"> !! -- AllOnePage.jsp</span>
	  <form method="post" action="WebBaseMain.do" name="merchattributes">
        <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
		<webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/AllOnePage.jsp'/>  
          <table width="400" border="0" align="center" cellpadding="0" cellspacing="0"> 
            <tr align="left"> 
              <td class="heading" colspan="2"> Enhance and Schedule Your Ad </td> 
            </tr> 
            <tr align="center">
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2"><br>
            Your selected Ad Category is:  <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span><br>            </td> 
          </tr> 
		  <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
            <tr>
              <td colspan="2" class="mgroupname">Ad Previews</td>
            </tr>
            <tr> 
              <td colspan="2" class="mgrouptable"><webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="1" cellBorderWidth="0" includeDescription="true"/></td> 
            </tr> 
			<tr>
			  <td colspan="2" class="mgroupname">&nbsp;</td>
		    </tr>
			<%-- Printed Ad Colors 
			<tr>
			  <td colspan="2" class="mgroupname">Print colors: <webbase:adData dataType="AdColors" editMode="1"/></td>
		    </tr>
			--%>
			<tr>
              <td colspan="2" class="mgroupname">&nbsp;</td>
            </tr>
			
			<%--first day logo code
			<tr>
              <td colspan="2" class="mgroupname">First Day Logos</td>
            </tr>
			<tr>
              <td colspan="2" class="mgroupname"><webbase:orderData dataType="TemporaryStore" /><webbase:Image dataType="AutoGraphic" imageFilter="FirstRunLogos" numColumns="3"/></td>
            </tr>
			<tr>
              <td colspan="2" class="mgroupname">&nbsp;</td>
            </tr>
			--%>
			
			<%-- Photo Upload for AdPay --%>
			  <!-- Is photo upload allowed? Based on active:true -->
				<webbase:showIf expression="allowPhotoUpload">
				  
				  <!-- if a photo has not been uploaded yet -->
				  <webbase:showIf expression="!isOnlinePhotoUploaded">
					<tr>
					  <td colspan="2" class="mgroupname">Upload Photos</td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/AdPay.jsp">Click to upload photos</a></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname">&nbsp;</td>
					</tr>
				  </webbase:showIf>
				  
				  <!-- if online photos were uploaded, display photos -->
				  <webbase:showIf expression="isOnlinePhotoUploaded">
					<tr>
					  <td colspan="2" class="mgroupname">Uploaded Photos</td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><webbase:AdPay dataType="PreviewWebPhotos" /></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/AdPay.jsp">Click to change photos</a></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname">&nbsp;</td>
					</tr>
				  </webbase:showIf>
			</webbase:showIf>
			
			
			<%-- Photo Upload for Ipix 
			  <!-- Is photo upload allowed? Based on active:true -->
				<webbase:showIf expression="allowPhotoUpload">
				  
				  <!-- if a photo has not been uploaded yet -->
				  <webbase:showIf expression="!isOnlinePhotoUploaded">
					<tr>
					  <td colspan="2" class="mgroupname">Upload Photos</td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/SetIpixImage.jsp">Click to upload photos</a></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname">&nbsp;</td>
					</tr>
				  </webbase:showIf>
				  
				  <!-- if online photos were uploaded, display photos -->
				  <webbase:showIf expression="isOnlinePhotoUploaded">
					<tr>
					  <td colspan="2" class="mgroupname">Uploaded Photos</td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><webbase:Ipix dataType="PreviewWebPhotos" heightDV="100" widthDV="100" modeDV="FitPad" numColumns="3"/></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/SetIpixImage.jsp">Click to change photos</a></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname">&nbsp;</td>
					</tr>
				  </webbase:showIf>
			</webbase:showIf>
			--%>
			
            
            
            <tr> 
              <td colspan="2" class="mgroupname">Ad Schedule</td> 
            </tr> 
            <tr> 
              <td colspan="2">&nbsp;</td> 
            </tr>
            <tr> 
              <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" class="mgrouptable"> 
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
                  <webbase:AdSScheduleInfoIt> 
                  <tr class="standard"> 
                    <td><webbase:AdSScheduleInfo dataType="SSCheckBox" editMode="1"/></td> 
                    <td colspan="2" class="standard12px"><webbase:AdSScheduleInfo dataType="SSDescription"/></td>  
                  </tr> 
				  <tr class="standard"> 
                    <td>&nbsp;</td>  
                    <td>Earliest Start Date: <webbase:AdSScheduleInfo dataType="SSEarliestDate"/></td> 
                    <td><webbase:AdSScheduleInfo dataType="SSStartDate" editMode="0"/> 
                      <webbase:AdSScheduleInfo dataType="SSCalendar" editMode="1"/>
					  <webbase:AdSScheduleInfo dataType="SSNumTimes" editMode="1"/>
					  </td> 
                  </tr> 
                  </webbase:AdSScheduleInfoIt> 
                   </table></td> 
            </tr> 
            <tr> 
              <td colspan="2">&nbsp;</td> 
            </tr> 
            <tr> 
              <td colspan="2" class="mgrouptable">&nbsp;</td>
            </tr> 
            <tr> 
              <td> <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AllOnePage.jsp"> 
                <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
                </webbase:formHelper></td> 
              <td><div align="right"><webbase:formHelper dataType="submitButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp"> 
                <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
                </webbase:formHelper>
              </div></td> 
            </tr> 
            <tr> 
              <td colspan="2"><webbase:formHelper dataType="formList"/> 
                <webbase:formHelper dataType="FormValidate"/></td> 
            </tr> 
          </table> 
      </form> 
        <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
