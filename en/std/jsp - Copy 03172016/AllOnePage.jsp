lo<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<html>
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/utils/zapatec.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/lang/calendar-en.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-setup.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-mactive.js"></SCRIPT>


<link rel="stylesheet" type="text/css" href="../../../scripts/ZapatecCalendar-licensed/themes/aqua.css"/>


<script language="javascript">
//if (self != window.top) top.location.href=self.location.href;
</script>

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
    <td width="150" valign="top"><%@ include file="../includes/leftSide.htm"%></td>
	<td width="600" valign="top">
	  <span class="PageName"> !! -- AllOnePage.jsp</span>	  
	  <form method="post" action="WebBaseMain.do" name="merchattributes">
	    <%-- Updates the fielded data upon submitting this page --%>
	    <webbase:orderData dataType="UpdateFieldedData" />
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
			
			<%-- Photo Upload for AdPay 
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
			--%>
			
			<%-- Photo Upload for AdMission 
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

			<%-- AdBase Upload Image --%>
			 <webbase:showIf expression="allowPhotoUpload">    
				  
				  <!-- if a photo has not been uploaded yet -->
				  <webbase:showIf expression="!isOnlinePhotoUploaded">
					<tr>
					  <td colspan="2" class="mgroupname">Upload Photos</td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to upload photos</a></td>
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
					  <td colspan="2" class="mgroupname"><webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname"><a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a></td>
					</tr>
					<tr>
					  <td colspan="2" class="mgroupname">&nbsp;</td>
					</tr>
				  </webbase:showIf>

			</webbase:showIf>
 
			
            <tr>
				<td colspan="" class="mgroupheadercell"><span class="mgroupname">Review your text and modify if necessary.</span></td> 
				<td align="right"><webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/Obits/spellcheck.jsp"><img src="../../../images/navigation/checkspelling.gif" width="99" height="17" border="0"></webbase:formHelper></td>
			</tr>
            <tr align="left"> 
            	<td colspan="2">
            	<webbase:TemplateQuestions showJTEs="false" graphicQuestionString="Attention Getters" filterQuestionsByLayout="false" headerString="" bodyString="" footerString="" numGraphicColumns="3"/>				</td> 
			</tr>
			 
            <tr>
              <td colspan="2"><div align="center"><a href="javascript:document.merchattributes.submit()"><img src="../../../images/navigation/updatepreview.gif" width="115" height="17" border="0"></a></div></td>
            </tr>
            
            <tr> 
              <td colspan="2" class="mgroupname">Ad Schedule</td> 
            </tr> 
            <tr> 
              <td colspan="2">&nbsp;</td> 
            </tr>
            <tr> 
              <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" class="mgrouptable"> 

				  
				  
				  
                  <webbase:AdSScheduleInfoIt> 
                  <tr class="standard"> 
                    <td><webbase:AdSScheduleInfo dataType="SSCheckBox" editMode="1"/></td> 
                    <td colspan="2" class="standard12px"><webbase:AdSScheduleInfo dataType="SSDescription"/></td>  
                  </tr> 
				  <tr class="standard"> 
                    <td>&nbsp;</td>  
                    <td>Earliest Start Date: <webbase:AdSScheduleInfo dataType="SSEarliestDate"/></td> 
                    <td>
					 <webbase:AdSScheduleInfo dataType="SSStartDate" editMode="0"/> 
					<%--<webbase:AdSScheduleInfo dataType="SSStartDateMonth" editMode="1"/>
					<webbase:AdSScheduleInfo dataType="SSStartDateDay"  editMode="1"/>
					<webbase:AdSScheduleInfo dataType="SSStartDateYear" editMode="1"/>--%>
                      <webbase:AdSScheduleInfo dataType="SSCalendarNew" editMode="1"/>
					  <webbase:AdSScheduleInfo dataType="SSNumTimes" editMode="1"/>					  </td> 
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
              <td> <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/SetMerchandiseAttributes.jsp"> 
                <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
                </webbase:formHelper></td> 
              <td><div align="right">
			  <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp"> 
                <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
                </webbase:formHelper>
				
				<%-- <webbase:formHelper dataType="submitButton" label="Continue" nextURL="/jsp/AdvancedScheduler.jsp"> 
                <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
                </webbase:formHelper> --%>
              </div></td> 
            </tr> 
            <tr> 
              <td colspan="2"><webbase:formHelper dataType="formList"/> 
                <webbase:formHelper dataType="FormValidate"/></td> 
            </tr> 
          </table> 
      </form></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
</html>
