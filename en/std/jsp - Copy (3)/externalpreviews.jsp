	<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<head>
<title></title>
<script src="pace.js"></script>
  <link href="pace.css" rel="stylesheet" />
</head>
<body>

<form method="post" action="WebBaseMain.do" name="editAd">
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
    <webbase:showIf expression="!allPackageAdsComplete">
      <webbase:showIf expression="adIsPartOfPackage">
          <webbase:showIf expression="allPackageUserInputComplete">
              <webbase:mactiveAction dataType="GeneratePackageAdPreviews" dataValue=""/> 
          </webbase:showIf>
        </webbase:showIf>
    </webbase:showIf>
    <webbase:showIf expression="allPackageAdsComplete">
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
    <webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
      <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
    </webbase:showIf>

	<!---->

	<webbase:mactiveAction dataType="SetAdToFirst" dataValue="" />
	<div id="myPreviews">
	 <!-- <div id="previewOverlay">here</div> -->
	 <span class="loadingMSG">We're generating your previews. One moment please. </span>
        <div id="thePreviews" style="display:inline;text-align:center">
			<webbase:TemplateControls dataType="layouts" previewType="dynamic" numColumns="2" imageBorderWidth="0" cellBorderWidth="0" includeDescription="true" />		
		</div>
	</div>
	<div class="clear"></div>
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
                                    <webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true" />
                                </webbase:showIf>


                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                    </webbase:showIf>
          
                    
       <h3> Modify Ad Copy </h3> 
            <div id="row">
                <!--move the contents of the div above previews to here after page load. Script at the bootom of the page to move them.-->
                <webbase:TemplateQuestionsV2 showJTEs="false" graphicQuestionString="" filterQuestionsByLayout="true" headerString="" bodyString="" footerString="" numGraphicColumns="2" />
            </div>
<!--END row-->
       <p><strong><a href="javascript:document.editAd.submit()"><h2>  Update Preview</a> to show your changes and to see how your ad will look in print </h2> </strong></p>
 <!--BEGIN buttons row-->
                            <div class="row">
                                <div class="container">
                                    <div class="col-md-6">
                                        <webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/AnswerQuestions.jsp" buttonClass=" btn btn-default" />
                                    </div>
                                    <div class="col-md-6">
                                        <webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp" buttonClass="btn btn-success">
                                            <span class="glyphicon glyphicon-arrow-right glyphicon-cont"></span>
                                        </webbase:formHelper>
                                    </div>
                                </div>
                            </div>
    
           <webbase:formHelper dataType="formList"/>
           <webbase:formHelper dataType="FormValidate"/>
        </form>
	
	
	
	<!---->
	</body>
	</html>