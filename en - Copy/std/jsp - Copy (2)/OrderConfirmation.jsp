<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ include file="header.jsp"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
<%-- AdMission Commit Statement --%>
<webbase:IpixAdmission dataType="CommitAdmissionMediaset" scriptSrc="http://apps-preprod.admission.net/commit.js" />
<form name="ConfirmOrder" method="post" action="WebBaseMain.do">
<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/OrderConfirmation.jsp'/>
            <h2>Order Confirmation</h2>
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div style="padding-bottom:30px">Your selected Ad Category is:
				<span class="mgroupname">
					<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
				</span>
				</br>
				
				<ul class="list-unstyled">
						<li><span class="mgroupname">Order Confirmation Number:</span> <span class="mattrlabeltext"><webbase:orderData dataType="Order Number" /></span></li>
						<li>Total Price:<span class="mattrlabeltext"><webbase:orderData dataType="Total Price"/></span></li>
								<%-- Show Media Loader Images --%>
								<!-- if online photos were uploaded, display photos -->
								<li><webbase:showIf expression="isOnlinePhotoUploaded">
										Uploaded Photos
										<webbase:uploadImage dataType="thumbNails" numColumns="2" thumbnailSize="100" displayOnly="true"/>
										<a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>
										&nbsp;
								</webbase:showIf></li>
						
						<webbase:adIt>
								<ul class="list-unstyled">
									<li><span class="mgroupname" style="font-weight: bold">Ad Preview</span></li>
									<li><webbase:adData dataType="ImagePreviewAllVersions"/></li>
									<li><span class="mgroupname" style="font-weight: bold">Ad Information</span></li>
									<li>Ad Type: 
									<webbase:adData dataType="AdType"/></li>
									<li>Size:
									<webbase:adData dataType="AdDepthInUnits"/></li>
									Run Schedule: 
										<webbase:runScheduleIt> 
												<ul class="list-unstyled">
														 <li> <webbase:RSDetail dataType="NumInserts"/> 
														  day(s) starting
														  <webbase:RSDetail dataType="Fday"/> 
														  in
														  <webbase:RSDetail dataType="Product"/> </li>
												</ul>
										</webbase:runScheduleIt>
											<li>Price:
											<webbase:adData dataType="AdPrice"/></li>
								</ul>
						</webbase:adIt>
				</ul>
				</div>
				<div class="col-md-2">
				</div>
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
                </webbase:orderData></div> 
				<!--END back buttons-->
				</div>
				<div class="col-md-2">
				</div>
				<div class="col-sm-3 text-center">
				<!--continue buttons-->
				 <a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp"><img src="../../../images/navigation/logoff.gif" width="54" height="17" BORDER=0></a>
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
<%@ include file="footer.jsp"%>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
</html>