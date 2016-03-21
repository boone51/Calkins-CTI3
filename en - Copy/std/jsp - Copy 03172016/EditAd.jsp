<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
    <webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do" />
    <!DOCTYPE html> 
    <% session.putValue( "pageName", "EditAd.jsp" );%>
        <% session.putValue( "returnName", "EditAd.jsp" );%>
        <%@ include file="header.jsp"%>
            <script language="javascript">
                function uploadPhotos() {
                    //document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
                    $( "input[name='ContinueSchedule.xURL']").val("/jsp/SetAdbaseImage.jsp");
                    $( "input[name='ContinueSchedule']").trigger("click");
                    //document.editAd.submit();
                }
                function udpatePreview() {
                    //document.editAd.action = "WebBaseMain.do?NextURL=/jsp/EditAd.jsp";
                    // $( "input[name='ContinueSchedule.xURL']").val("/jsp/EditAd.jsp");
                   // document.editAd.submit();
                }
                $(window).load(function() {
                    console.log("window loaded, ajax call being executed now");
                   /* $("#hidePreviews").load("externalpreviews2.jsp", function() {
                        console.log("loaded the exxternal previews");
                        $(".loadingMSG").fadeOut("slow", function() {
                            $(".loadingMSG").remove();
                            $("#hidePreviews").slideDown();
                        });
                    });*/
                    Pace.track(function(){
                            /* $("#hidePreviews").load("externalpreviews2.jsp", function() {
                                 console.log("Ajax finished");
                            });*/
                    });
                    //
                });
                //
                paceOptions = {
                    ajax: true, // disabled
                    document: false, // disabled
                    startOnPageLoad: false,
                    eventLag: false, // disabled
                    elements: {
                    selectors: ['#hidePreviews']
                  }
                };
            </script>
            <style>
            .mgraphicquestiontext{
                display:none;
            }
            </style>
            <script src="pace.js"></script>
            <link href="pace.css" rel="stylesheet" />
            <div class="container">
                <!-- Added next line to get dates in order panel -->
                 <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
                <h2>Edit Ad</h2>
                <webbase:errorData dataType='ErrorMsg' />
                <webbase:errorData dataType='ErrorURL' nextURL='/jsp/EditAd.jsp' />
                <div class="row">
                    <div class="col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
                    <div class="col-md-7">
                        <div id="EpageAlert" class="alert alert-danger" style="display:none"> <a href="#" class="close" data-dismiss="alert">&times;</a>
                            <strong>Error!</strong>
                            <span id="errorConent">alert text here<!--error text here-->
							</span>
                        </div>
                        <div style="padding-bottom:30px">
						
						
						Your selected Ad Category is:
                            <span class="mgroupname"><strong>
								<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></strong>
								</span>
                        </div>
                        <!--END catgeory display div-->
                        <!--BEGIN main content-->
                        <form method="post" action="WebBaseMain.do" name="editAd" > 
        <webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/EditAd.jsp'/>     
		<webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
		<webbase:mactiveAction dataType="UpdateData" dataValue=""/>   <br />
            <h2>Edit Ad</h2>
            Your selected Ad Category is:  
              <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span>
                    Ad Information 
                            <ul class="list-unstyled">
                            
                                <li>Ad Preview</li>
                                <li><webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="1" cellBorderWidth="0"/></li>
                                
                                </ul>
                            <div class="row">
                            <webbase:showIf expression="allowPhotoUpload">    
							  <!-- if a photo has not been uploaded yet -->
							  <webbase:showIf expression="!isOnlinePhotoUploaded">
							    <a href="#submitForm" onClick="uploadPhotos()">CLICK HERE TO UPLOAD HOUSE PHOTOS</a>
							  </webbase:showIf>
						      <!-- if online photos were uploaded, display photos -->
						      <webbase:showIf expression="isOnlinePhotoUploaded">
							    <a href="#submitForm" class="grayButton" onClick="uploadPhotos()">CLICK HERE TO CHANGE PHOTOS</a>
                                <webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true"/>
						      </webbase:showIf>
							</webbase:showIf>
                            </div>
                            <!-- if photo upload is allowed -->
                            <div class="row">
                             <webbase:TemplateQuestionsV2 numGraphicColumns="3" showJTEs="false" boxWidth="70" boxHeight="6" graphicQuestionString="Select a graphic" filterQuestionsByLayout="true" headerString="" bodyString="" footerString=""/><webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/jsp/spellcheck.jsp"><img src="../../../images/navigation/checkspelling.gif"></webbase:formHelper>
                            </div>
						    
        <!--BEGIN button row-->
        <div class="row" style="padding-top:30px">
            <div class="col-md-6 text-center">
        
            </div>
            <div class="col-md-6 text-center">
                <webbase:formHelper dataType="submitButton" label="Continue" name="ContinueSchedule" nextURL="/jsp/PreviewAds.jsp"><img src="../../../images/navigation/continue.png"></webbase:formHelper>
            </div>
        </div>
        <!--END button row-->
        
                            
        <webbase:formHelper dataType="formList"/>
		<webbase:formHelper dataType="FormValidate"/>
      </form> 
                        <!--END main content-->
                    </div>
                    <div class="col-md-3">
                        <%@ include file="orderPanel.jsp"%>
                    </div>
                </div>
            </div>
            <!-- InstanceEndEditable -->
            <%@ include file="modals.jsp"%>
                <%@ include file="footer.jsp"%>
                    </html>