<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
    <webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do" />
    <!DOCTYPE html>
    <% session.putValue( "pageName", "EditAd.jsp" );%>
        <%@ include file="header.jsp"%>
            <script src="pace.js"></script>
            <link href="pace.css" rel="stylesheet" />
            <script language="javascript">
                function uploadPhotos() {
                    document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
                    document.editAd.submit();
                }

                function udpatePreview() {
                    document.editAd.action = "WebBaseMain.do?NextURL=/jsp/EditAd.jsp";
                    document.editAd.submit();
                }
                $(window).load(function() {
                    //var theQsHTML = $(".moveTheseQs").html();
                    //alert(theQsHTML);
                    //theQsHTML
                    //$(theQsHTML).appendTo('#templateQs');
                    //$(".moveTheseQs").remove();
                    //
                    $("#hidePreviews").load("externalpreviews.jsp", function() {
                        console.log("loaded the exxternal previews");
                        $(".loadingMSG").fadeOut("slow", function() {
                            $(".loadingMSG").remove();
                            $("#hidePreviews").slideDown();
                        });
                    });
                });

            </script>

            <form method="post" action="WebBaseMain.do" name="editAd">
                <div class="container">
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
                            <div style="padding-bottom:30px">Your selected Ad Category is:
                                <span class="mgroupname">
								<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
								</span>
                            </div>
                            <!--END catgeory display div-->
                            <!--BEGIN main content-->
                          
                                    <div id="hidePreviews">
                                        <div class="loadingMSG" style="position:relative;width:100%;height:100%;background-color:white;">Please wait while we build your ad previews...
                                        </div>
                                    </div>
                                    <!--Schedule
                          <a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ModifyRSButton')">
                            <webbase:RSDetail dataType="BookerCalendar"/>
                          <img src="../../../images/navigation/addinserts.gif" width="99" height="17" border="0"></a>
                          <iframe src="RunScheduleContent.jsp" name="RSTable" id="RSTable" width="400" height="75" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe>-->
                                    <!--Ad Text
<%--
<webbase:TemplateQuestions numGraphicColumns="3" showJTEs="false" boxWidth="70" boxHeight="6" filterQuestionsByLayout="true" headerString="" bodyString="" footerString=""/>
<div class="row" style="padding-top:15px">
    <div class="container">
        <div class="col-md-6">
            <button type="button" class="btn btn-primary" onclick="udpatePreview()">Update Preview</button>
        </div>
        <div class="col-md-6">
            <div class="fixAlt">
                <webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/jsp/spellcheck.jsp">
                    Update The Text<img alt="SpellChecker" src="../../../images/navigation/spellcheck.png">
                </webbase:formHelper>
            </div>
        </div>
    </div>
</div>--%>
-->


                            <!--END main content-->
                            <!--BEGIN buttons row-->
                            <div class="row">
                                <div class="container">
                                    <div class="col-md-6">
                                        <webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/SetPackage.jsp" buttonClass=" btn btn-default" />
                                    </div>
                                    <div class="col-md-6">
                                        <!--                             <webbase:formHelper dataType="submitButton" label="Continue" name="ContinueSchedule" nextURL="/jsp/ReviewOrder.jsp"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:formHelper>-->
                                        <webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp" buttonClass="btn btn-success">
                                            <span class="glyphicon glyphicon-arrow-right glyphicon-cont"></span>
                                        </webbase:formHelper>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-3">
                            <%@ include file="orderPanel.jsp"%>
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
                                    <webbase:uploadImage dataType="thumbNails" numColumns="3" thumbnailSize="100" displayOnly="true" />
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


                </div>
                <!--          END container-->
                <webbase:formHelper dataType="formList" />
                <webbase:formHelper dataType="FormValidate" />
            </form>
            <!-- InstanceEndEditable -->
            <%@ include file="modals.jsp"%>
                <%@ include file="footer.jsp"%>

                    </html>
