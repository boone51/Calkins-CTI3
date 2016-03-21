<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "SetMerchandiseAttributes.jsp" );%>
<%@ include file="header.jsp"%>
<%@ include file="top-nav.jsp"%>
<script language="javascript">
function uploadPhotos(){
				document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
				document.editAd.submit();
			}
</script>

	  <form method="post" action="WebBaseMain.do" name="editAd" >
         <div class="container">
             <h2>Edit Ad</h2>
        <webbase:errorData dataType='ErrorMsg'/>
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/EditAd.jsp'/>
		<webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
		<webbase:mactiveAction dataType="UpdateData" dataValue=""/>   <br />
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
							<div style="padding-bottom:30px">Your selected Ad Category is:
								<span class="mgroupname">
								<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
								</span>
							</div><!--END catgeory display div-->
							<!--BEGIN main content-->
							<strong>Ad Information </strong>
							<ul class="list-unstyled">
								<li>Ad Preview</li>
								<li><!--BEING webbase tag-->
<webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="0" cellBorderWidth="0"/>
<!--END webbase tag--></li>
								<li>Ad Type:</li>
								<li><webbase:adData dataType="AdType"/></li>
								<li>Ad Depth:</li>
								<li><webbase:adData dataType="AdDepthInUnits"/></li>
								<li>Schedule:</li>
								<li><webbase:runScheduleIt>
								<ul>
									<li>
										<webbase:RSDetail dataType="NumInserts"/>
										day(s) starting
										<webbase:RSDetail dataType="Fday"/>
										in
										<webbase:RSDetail dataType="ProductDescription"/> &#8226 <webbase:RSDetail dataType="Placement"/>
									</li>
								</ul>
								</webbase:runScheduleIt>
								</li>
								<li>
								<!--Schedule
                          <a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ModifyRSButton')">
                            <webbase:RSDetail dataType="BookerCalendar"/>
                          <img src="../../../images/navigation/addinserts.gif" width="99" height="17" border="0"></a>
                          <iframe src="RunScheduleContent.jsp" name="RSTable" id="RSTable" width="400" height="75" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe>-->
                          Ad Text
                            <webbase:TemplateQuestions numGraphicColumns="3" showJTEs="false" boxWidth="70" boxHeight="6" filterQuestionsByLayout="false" headerString="" bodyString="" footerString=""/><webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/jsp/spellcheck.jsp"><img src="../../../images/navigation/checkspelling.gif" width="99" height="17" border="0"></webbase:formHelper>
								</li>
							</ul>
							<!--END main content-->
					</div>
					<div class="col-md-2">
					</div>
				</div>
<!--END row-->
<webbase:showIf expression="allowPhotoUpload">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
					<!--We DO allow photos in this ad-->

									  <!-- if a photo has not been uploaded yet -->
					<webbase:showIf expression="!isOnlinePhotoUploaded">
					<button type="button" class="btn btn-primary btn-lg" onClick="uploadPhotos()">CLICK HERE TO UPLOAD HOUSE PHOTOS</button>
					</webbase:showIf>
					<!-- if online photos were uploaded, display photos -->
					<webbase:showIf expression="isOnlinePhotoUploaded">
					<a href="#submitForm" class="grayButton" onClick="uploadPhotos()">CLICK HERE TO CHANGE PHOTOS</a>
					<webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true"/>
					</webbase:showIf>


			</div>
			<div class="col-md-2">
			</div>
		</div>
</webbase:showIf>
<!--END row-->
                        <!--tr align="center">
                        < tr align="center">
                          Schedule
                          <a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ModifyRSButton')">
                            <webbase:RSDetail dataType="BookerCalendar"/>
                          <img src="../../../images/navigation/addinserts.gif" width="99" height="17" border="0"></a>
                          <iframe src="RunScheduleContent.jsp" name="RSTable" id="RSTable" width="400" height="75" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                          Ad Text
                            <webbase:TemplateQuestions numGraphicColumns="3" showJTEs="false" boxWidth="70" boxHeight="6" filterQuestionsByLayout="false" headerString="" bodyString="" footerString=""/><webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/jsp/spellcheck.jsp"><img src="../../../images/navigation/checkspelling.gif" width="99" height="17" border="0"></webbase:formHelper>
                            <br>
                            <br>
                            <!-- if photo upload is allowed -->

				    <webbase:formHelper dataType="submitButton" label="Continue" name="ContinueSchedule" nextURL="/jsp/PreviewAds.jsp"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:formHelper>
          </div>
<!--          END container-->
        <webbase:formHelper dataType="formList"/>
		<webbase:formHelper dataType="FormValidate"/>
      </form>
      <!-- InstanceEndEditable -->
    <%@ include file="modals.jsp"%>
    <%@ include file="footer.jsp"%>
	</html>
