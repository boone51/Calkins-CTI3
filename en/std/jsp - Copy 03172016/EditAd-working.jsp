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
                        <div style="padding-bottom:30px">Your selected Ad Category is:
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
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr> 
            <td class="heading">Edit Ad </td> 
          </tr> 
          <tr> 
            <td height="30"><br />
            Your selected Ad Category is:  
              <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span>
            </td> 
          </tr> 
          <tr align="center"> 
            <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="2"> 
                  <tr>
                    <td align="left" class="mgroupname">Ad Information </td>
                    <td width="34%" align="left">&nbsp;</td>
                    <td width="33%" align="right" class="standard">&nbsp;
					  
					  
				    </td>
              
			      </tr>
                  <tr>
                    <td colspan="3" align="center" nowrap>
					  <table width="100%" border="0" >
						<tr>
						  <td align="center" class="seperationlinetext">Ad Preview</td>
					    </tr>
						<tr>
						  <td align="left">
						  <table width="100%"  border="0" cellspacing="0" cellpadding="2">
                            <tr>
                              <td colspan="2" align="center" nowrap><webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="1" cellBorderWidth="0"/></td>
                            </tr>
                            <tr>
                              <td width="16%" nowrap>Ad Type:</td>
                              <td width="84%"><webbase:adData dataType="AdType"/></td>
                            </tr>
                            
							<tr>
                              <td nowrap>Ad Depth:</td>
                              <td><webbase:adData dataType="AdDepthInUnits"/></td>
                            </tr>
                            <tr>
                              <td nowrap>Schedule:</td>
                              <td><webbase:runScheduleIt> 
                      		<webbase:RSDetail dataType="NumInserts"/> 
                      		day(s) starting
                      		<webbase:RSDetail dataType="Fday"/> 
                      		in
                      		<webbase:RSDetail dataType="ProductDescription"/> &#8226 <webbase:RSDetail dataType="Placement"/> 
                      		<br> 
                      		</webbase:runScheduleIt></td>
                            </tr>
                          </table>
						  
						 </td>
						</tr>
						<tr>
						  <td>
						  <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="0">
                        <!--tr align="center">
                          <td colspan="2">&nbsp;</td>
                        </tr>
                        < tr align="center">
                          <td colspan="2" class="seperationlinetext">Schedule</td>
                          </tr>
                        <tr>
                          <td width="50%" align="left">&nbsp;</td>
                          <td width="50%" align="right"><a href="JavaScript:parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ModifyRSButton')">
                            <webbase:RSDetail dataType="BookerCalendar"/>
                          <img src="../../../images/navigation/addinserts.gif" width="99" height="17" border="0"></a></td>
                        </tr>
                        <tr>
                          <td colspan="2"><iframe src="RunScheduleContent.jsp" name="RSTable" id="RSTable" width="400" height="75" scrolling="auto" frameborder="0" marginwidth="0" marginheight="0"></iframe></td>
                        </tr-->
                        <tr>
                          <td colspan="2" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan="2" align="center" class="seperationlinetext">Ad Text </td>
                          </tr>
                        <tr align="center">
                          <td colspan="2">
                            <webbase:TemplateQuestions numGraphicColumns="3" showJTEs="false" boxWidth="70" boxHeight="6" graphicQuestionString="Select a graphic" filterQuestionsByLayout="false" headerString="" bodyString="" footerString=""/><webbase:formHelper dataType="spellButton" label="SpellCheck" name="spellButton" nextURL="/jsp/spellcheck.jsp"><img src="../../../images/navigation/checkspelling.gif" width="99" height="17" border="0"></webbase:formHelper>
                          
                            <br>
                            <br>
                          
                            <!-- if photo upload is allowed -->
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
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2"></td>
                        </tr>
                      </table>
					      </td>
						</tr>
					  </table>
					</td>
                  </tr>
				  <tr>
				    <td height="19" colspan="3" align="right" ><webbase:formHelper dataType="submitButton" label="Continue" name="ContinueSchedule" nextURL="/jsp/PreviewAds.jsp"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:formHelper></td>
			      </tr>
				</table></td> 
          </tr> 
          <tr> 
            <td>&nbsp;</td>
          </tr> 
          <tr> 
            <td>&nbsp;</td> 
          </tr> 
        </table> 
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
