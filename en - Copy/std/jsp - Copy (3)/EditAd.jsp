<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
    <webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do" />
    <!DOCTYPE html> 
    <% session.putValue( "pageName", "EditAd.jsp" );%>
        <% session.putValue( "returnName", "EditAd.jsp" );%>
        <%@ include file="header.jsp"%>
            
            <script language="javascript">
                
                function uploadPhotos() {
                    //document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
                    $( "input[name='ContinueButton.xURL']").val("/jsp/SetAdbaseImage.jsp");
                    document.editAd.submit();
                }

                function udpatePreview() {
                    //document.editAd.action = "WebBaseMain.do?NextURL=/jsp/EditAd.jsp";
                     $( "input[name='ContinueButton.xURL']").val("/jsp/EditAd.jsp");
                    document.editAd.submit();
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
                             $("#hidePreviews").load("externalpreviews2.jsp", function() {
                                 console.log("Ajax finished");
                            });
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

                        <div id="hidePreviews">
                            <!--<div class="loadingMSG" style="position:relative;width:100%;height:100%;background-color:white;">Please wait while we build your ad previews...
                                </div>
                            </div>-->
                            <div class="loadingMSG"><h2>Please wait while we build your ad previews...</h2>
                            </div>
                        </div>
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
