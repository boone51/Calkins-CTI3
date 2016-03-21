<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<form name="ViewOrders" method="post" action="WebBaseMain.do"> 
	<h2>Current Orders</h2>
			
			

<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<ul class="list-unstyled">
			<li><strong>Order Status:</strong>
			<webbase:orderData dataType="Order Status"/></li>
			<li><strong>Order Confirmation Number:</strong>
			<webbase:orderData dataType="Order Number" /></li>
			<li><strong>Ad Type:</strong>
			<webbase:adData dataType="AdType"/></li>
			<li><strong>Number of Lines:</strong>
			<webbase:adData  dataType="AdDepthInUnits"/></li>
			<li><strong>Run Schedule:</strong>
			<ul>
				<webbase:runScheduleIt>
					
						<li><webbase:RSDetail dataType="NumInserts"/>
						day(s) beginning on
						<webbase:RSDetail dataType="Fday"/>
						in
						<webbase:RSDetail dataType="Product"/></li>
					
				</webbase:runScheduleIt>
			</ul> </li>                 
			<div class="row"><strong>Total Price:</strong>
			<webbase:orderData dataType="Total Price"/></div>

			<div class="row text-center"><strong>Ad Preview</strong></br>
			<webbase:adData dataType="ImagePreview"/> 
			</div>
		</ul>
			<%-- Show Media Loader Images 
			<!-- if online photos were uploaded, display photos -->
			<webbase:showIf expression="isOnlinePhotoUploaded">
			Uploaded Photos
			<webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/>
			&nbsp;
			</webbase:showIf> --%>
	</div>
	<div class="col-md-2">
	</div>
</div>
<!--END row-->							
				  
				  
<!--BEGIN button row-->
<div class="row" style="padding-top:30px">
	<div class="col-sm-4 text-center">
	<webbase:showIf expression="!isCurrentOrderKilled">
			    <webbase:orderData dataType="KillOrderBtn" label="Kill Order" nextURL="/jsp/ViewCurrentOrders.jsp">
                  		<img src="../../../images/navigation/cancelthisad.gif" width="115" height="17">
                	    </webbase:orderData>
						</br>
						<button type="button" class="btn btn-danger Ebutton" value="KillOrderBtn">
							Stop This Ad!
							<span class="glyphicon glyphicon-stop"></span>
							<!--glyphicon glyphicon-remove-circle-->
						</button>
			</webbase:showIf>
	</div>
	<div class="col-sm-4 text-center">
		<webbase:showIf expression="adInEditMode">
				Click below to edit your ad!
				<webbase:adData dataType="EditAdButton" label="Edit Ad" nextURL="/jsp/EditAd.jsp">
					<img src="../../../images/navigation/editad.gif" border="0">
				</webbase:adData> 
			</webbase:showIf>
	</div>
	<div class="col-sm-4 text-center">
		<a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp"><img src="../../../images/navigation/back.gif" width="49" height="17" border="0"></a>
	</div>
</div>
<!--END row-->
<!--END button row-->
		
<webbase:formHelper dataType="formList"/>
<webbase:formHelper dataType="FormValidate"/>
</form> 
<%@ include file="../includes/footer.htm"%>
</html>