<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "OrderConfirmationQuote.jsp" );%>
<% session.putValue( "returnPage", "OrderConfirmationQuote.jsp" );%>
<%@ include file="header.jsp"%>
<%@ include file="top-nav.jsp"%>
<!--ok-->
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
<form name="ConfirmOrder" method="post" action="WebBaseMain.do">
<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/OrderConfirmation.jsp'/>
            <h2>Quote Order Confirmation</h2>
			<div class="row">

			<div class="col-md-8">
				
					<%-- Show Media Loader Images --%>
						  <!-- if online photos were uploaded, display photos -->
						<webbase:showIf expression="isOnlinePhotoUploaded">
							Uploaded Photos
							<webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/>
							<a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>
						</webbase:showIf>
						<strong>Ad Preview</strong>
						<webbase:adIt>
							<div class="row">
								<div class="col-md-6 text-center adPreviews">
									</br>
								<ul class="list-unstyled text-center">
										<li><webbase:adData dataType="ImagePreviewAllVersions"/></li>
										<li>
										<webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
										</li>
									</ul>
								</div>
								<div class="col-md-6">
										<ul class="list-unstyled">
												<li>
															Prodcuts associated with this ad:
															<webbase:runScheduleIt>
															<ul>
																	<li>
																			<webbase:RSDetail dataType="Product"/>
																	</li>
															</ul>
														</webbase:runScheduleIt>
												</li>
										</ul>
								</div>
							</div>
						  </webbase:adIt>
						

			</div>
			<!--BEGIN Right Ad Info-->
							<div id="subnav" class="col-md-4">
									<%@ include file="orderPanel.jsp"%>
							</div>
							<!--END Right Ad Info-->
		</div>
			<!--END row-->
			<!--BEGIN button row-->
			<div class="row" style="padding-top:30px">
						<div class="col-sm-2">
						</div>
						<!-- If the ad is part of a package the previous page should be the SetPackage page -->
						<div class="col-sm-3 text-center">
						<!--back buttons-->
						<div align="center">
               <webbase:orderData dataType="CloseOrderBtn" label="Continue" > 
                <img src="../../../images/navigation/placeanotherad.gif" width="115" height="17"> 
                </webbase:orderData>
				<%-- <webbase:orderData dataType="CloseOrderBtnV2" label="Place Another Ad!" buttonClass="btn btn-success"/>--%><!---->
				
				</div>  
				<button type="button" class="btn btn-success Ebutton" value="CloseOrderBtn">Place Another Ad <span class="glyphicon glyphicon-ok"></span></button>

						<!--END back buttons-->
						</div>
						<div class="col-md-2">
						</div>
						<div class="col-sm-3 text-center">
						<!--continue buttons-->
						<a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp"><button type="button" class="btn btn-warning Ebutton" value="continue">Log Out <span class="glyphicon glyphicon-ban-circle"></span></button></a>
						<!--END continue buttons-->
						</div>
						<div class="col-sm-2">
						</div>
			</div>
			<!--END row-->
			<!--END button row-->
<webbase:formHelper dataType="formList"/> 
<webbase:formHelper dataType="FormValidate"/> 
</form>
<!-- InstanceEndEditable -->
<%@ include file="footer.jsp"%>
	<script language="javascript">
		function disableBack(){
		history.go(1);
		}
		disableBack();
	</script>
</html>