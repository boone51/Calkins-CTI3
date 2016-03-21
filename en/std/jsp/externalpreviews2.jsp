<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
    <webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do" />
    
    
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
                        <!-- <span class="loadingMSG">We're generating your previews. One moment please. </span>-->
                        <div id="thePreviews" style="display:inline;text-align:center">
                            <%----%><webbase:TemplateControls dataType="layouts" previewType="dynamic" numColumns="2" imageBorderWidth="0" cellBorderWidth="0" includeDescription="true" />	
                        </div>
                    </div>
                    <div class="clear"></div>
                    <webbase:showIf expression="allowPhotoUpload">
                        <div class="row">
                            <div class="col-md-12 text-center">

                                <!--We DO allow photos in this ad-->

                                <!-- if a photo has not been uploaded yet -->
                                <webbase:showIf expression="!isOnlinePhotoUploaded">
                                    <!--<button type="button" class="btn btn-primary btn-lg" onClick="uploadPhotos()">--><a href="WebbaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp" class="btn btn-primary">CLICK HERE TO UPLOAD PHOTOS</a>
                                </webbase:showIf>
                                <!-- if online photos were uploaded, display photos -->
                                <webbase:showIf expression="isOnlinePhotoUploaded">
                                   <a href="WebbaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp" class="btn btn-primary">CLICK HERE TO CHANGE PHOTOS</a>
                                    <webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true" />
                                </webbase:showIf>

                            </div>
                        </div>
                    </webbase:showIf>


                    <h3> Modify Ad Copy </h3>
                    <div id="row">
                        <!--move the contents of the div above previews to here after page load. Script at the bootom of the page to move them.-->
                        <webbase:TemplateQuestionsV2 showJTEs="false" graphicQuestionString=""  boxWidth="70" boxHeight="6" filterQuestionsByLayout="true" headerString="" bodyString="" footerString="" numGraphicColumns="3" />
                                            
                        
                    </div>
                    <!--END row-->
                    <p><a href="javascript:udpatePreview()"><h3>  Update Preview</a> to show your changes and to see how your ad will look in print </h3> </p>
                    <!--BEGIN buttons row-->
                    <div class="row">
                        
                            <div class="pull-left">
                                <webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/SetPackage.jsp" buttonClass="btn btn-default" />
                            </div>
                            <div class="pull-right">
                                <webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp" buttonClass="btn btn-success">
                                    <span class="glyphicon glyphicon-arrow-right glyphicon-cont"></span>
                                </webbase:formHelper>
                            </div>
                       
                    </div>

                    <webbase:formHelper dataType="formList" />
                    <webbase:formHelper dataType="FormValidate" />
                </form>

