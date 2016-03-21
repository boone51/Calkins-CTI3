<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "AnswerQuestions.jsp" );%>
<% session.putValue( "returnPage", "AnswerQuestions.jsp" );%>
<%@ include file="header.jsp"%>

	  <form method="post" action="WebBaseMain.do" name="editAd">
        <webbase:errorData dataType='ErrorMsg'/>
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/AnswerQuestions.jsp'/>
		<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
		<div class="container">
            <h2>Review Ad Text and Add Graphics.</h2>
<%--first day logo code
			<webbase:orderData dataType="TemporaryStore" /><webbase:Image dataType="AutoGraphic" imageFilter="FirstRunLogos" numColumns="3"/>
--%>
<!--BEGIN MediaLoader comment-->
<%-- AdBase Upload Image
			 <webbase:showIf expression="allowPhotoUpload">

				  <!-- if a photo has not been uploaded yet -->
				  <webbase:showIf expression="!isOnlinePhotoUploaded">
				  Upload Photos
					  <a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to upload photos</a>
				  </webbase:showIf>

				  <!-- if online photos were uploaded, display photos -->
				  <webbase:showIf expression="isOnlinePhotoUploaded">
					Uploaded Photos
					  <webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/>
					  <a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>

				  </webbase:showIf>

			</webbase:showIf>
--%>
<!--END MediaLoader comment-->
<div class="row">
<div class="col-md-2">
    <%@ include file="menuLeft.jsp"%>
</div>

    <div class="col-md-7">
						<!--BEGIN Ad Gen Template Questions-->
						<webbase:TemplateQuestionsV2 showJTEs="false" filterQuestionsByLayout="true" headerString="" bodyString="" footerString=""/>
						<webbase:showIf expression="allowPhotoUpload">
						<!--END Ad Gen Template Questions-->
							<div class="row text-center" style="margin-top:20px">

										<!--We DO allow photos in this ad-->

														  <!-- if a photo has not been uploaded yet -->
										<webbase:showIf expression="!isOnlinePhotoUploaded">
										<button type="button" class="btn btn-primary btn-sm" onClick="uploadPhotos('editAd')">CLICK HERE TO UPLOAD PHOTOS</button>
										</webbase:showIf>
										<!-- if online photos were uploaded, display photos -->
										<webbase:showIf expression="isOnlinePhotoUploaded">
										<a href="#submitForm" class="btn btn-default btn-sm" onClick="uploadPhotos('editAd')">CLICK HERE TO CHANGE PHOTOS</a>
										<webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true"/>
										</webbase:showIf>



							</div>
					</webbase:showIf>
					</div>
					<!--BEGIN Right Ad Info-->
					<div id="subnav" class="col-md-3">
							<%@ include file="orderPanel.jsp"%>
					</div>
					<!--END Right Ad Info-->
				</div>
				<!--END row-->



			  <!-- if package input is required, go to the scheduling page -->

<!--BEGIN button row-->
<div class="row" style="padding-top:30px">
	<div class="col-md-2">
					</div>
	<!-- If the ad is part of a package the previous page should be the SetPackage page -->
	<div class="col-md-4 text-center">
		<div id="previousBUT">
		<webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/SetMerchandiseAttributes.jsp" buttonClass="btn btn-default"/>

		</div>
	</div>

	<div class="col-md-4 text-center">

	<!-- if it's part of a package, go to the answer questions page -->
	<div style="display:inline">
<%--partial order button:

<webbase:orderData dataType="SavePartialOrderBtn" label="Save Partial Order" nextURL="/jsp/ViewCurrentOrders.jsp" rescheduleURL="/jsp/Revieworder.jsp" unlock="1"> <img src="../../../images/nav_buttons/save.gif" width="72" height="35" border="0" /> </webbase:orderData>
--%>
<!--end partial order button test-->
				<webbase:showIf expression="anyPackageUserInputRequired">
					<webbase:showIf expression="!allPackageUserInputComplete">
					<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/GetPackageInformation.jsp" buttonClass="btn btn-success">
					<span class="glyphicon glyphicon-calendar"></span>
					</webbase:formHelper>
					<!--BEING webbase tag-->
<%--
<webbase:formHelper dataType="submitButton" label="Continue" name="continue" nextURL="/jsp/GetPackageInformation.jsp">
					<img src="../../../images/navigation/continue.gif" width="70" height="17">
					</webbase:formHelper>
--%>
<!--END webbase tag  input req-->
					</webbase:showIf>
					<webbase:showIf expression="allPackageUserInputComplete">
					<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/GetPackageInformation.jsp" buttonClass="btn btn-success">
					<span class="glyphicon glyphicon-calendar glyphicon-cont"></span>
					</webbase:formHelper><!--BEING webbase tag-->
<%--
<webbase:formHelper dataType="submitButton" label="Continue" name="continue" nextURL="/jsp/GetPackageInformation.jsp">
					<img src="../../../images/navigation/continue.gif" width="70" height="17">
					</webbase:formHelper>
--%>
<!--END webbase tag-->
					</webbase:showIf>
				</webbase:showIf>

				<!-- if no user input is required, go to the preview ad page. -->
				<webbase:showIf expression="!anyPackageUserInputRequired">
				<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/EditAd.jsp" buttonClass="btn btn-success">
					<span class="glyphicon glyphicon-user glyphicon-cont"></span>
					</webbase:formHelper>
					<!--BEING webbase tag-->
<%--
<webbase:formHelper dataType="submitButton" label="Continue" name="continue" nextURL="/jsp/PreviewAds.jsp">
					<img src="../../../images/navigation/continue.gif" width="70" height="17">
					</webbase:formHelper>
--%>
<!--END webbase tag-->
				</webbase:showIf>
			</div>
	</div>
	<div class="col-md-2">
					</div>
</div>
<!--END row-->
<!--END button row-->
    </div>
<!--    END container div-->


        <webbase:formHelper dataType="formList"/>
		<webbase:formHelper dataType="FormValidate"/>
      </form>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
