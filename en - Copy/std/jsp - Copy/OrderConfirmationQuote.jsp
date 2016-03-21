<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "OrderConfirmationQuote.jsp" );%>
<% session.putValue( "returnPage", "OrderConfirmationQuote.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<!--ok-->
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
<form name="ConfirmOrder" method="post" action="WebBaseMain.do">
<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/OrderConfirmation.jsp'/>
            <h2>Quote Order Confirmation</h2>
			<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div style="padding-bottom:30px">Your selected Ad Category is:
					<span class="mgroupname">
						<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
					</span>
					 <ul>
							 <li><span class="mgroupname">Order Confirmation Number:</span> <span class="mattrlabeltext"><webbase:orderData dataType="Order Number" /></span></li>
						<li>Total Price:<span class="mattrlabeltext"><webbase:orderData dataType="Total Price"/></span></li>
					  <webbase:adIt>
							<strong>Ad Preview</strong></br>
							<webbase:adData dataType="ImagePreviewAllVersions"/>
							<webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
								
							<h4>Ad Information</h4>
							
							<ul class="list-unstyled">
							<li>Size: <webbase:adData dataType="AdDepthInUnits"/></li>
							
							<li>Run Schedule: </li>
							<webbase:runScheduleIt>
								<ul class="list-unstyled">
								<li><webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
								<webbase:RSDetail dataType="NumInserts"/> 
								day(s) starting
								<webbase:RSDetail dataType="Fday"/> in <webbase:RSDetail dataType="Product"/><br> 
								<webbase:RSDetail dataType="DateRangeEnd"/> </li>
								</ul>
							</webbase:runScheduleIt>
								</br>
								<strong>Price:</strong> <webbase:adData dataType="AdPrice"/>
							</ul>
						  </webbase:adIt>
				  </ul>
					</div>
					<div class="col-md-2">
					</div>
			</div></div>
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
<%@ include file="../includes/footer.htm"%>
	<script language="javascript">
		function disableBack(){
		history.go(1);
		}
		disableBack();
	</script>
</html>