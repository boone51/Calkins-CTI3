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
                            <!--END main content-->
                        </div>
                        <div class="col-md-3">
                            <%@ include file="orderPanel.jsp"%>
                        </div>
                    </div>

                </div>
                <!--          END container-->
                <webbase:formHelper dataType="formList" />
                <webbase:formHelper dataType="FormValidate" />
            </form>
            <!-- InstanceEndEditable -->
            <%@ include file="modals.jsp"%>
                <%@ include file="footer.jsp"%>

                    </html>
