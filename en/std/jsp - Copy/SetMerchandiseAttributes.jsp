<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "SetMerchandiseAttributes.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<h2>Create Ad</h2>
	  <div id="EpageError" class="alert alert-danger" role="alert" style="display:none"><webbase:errorData dataType='ErrorMsg'/> </div>

	  <%-- AdBase Upload Parameters 
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAdbaseImage imageParameters='active:true, width:160, height:160, xdpi:72, ydpi:72, printImage:true, numOfImage:4'/>"/>  --%>

	  <%-- AdMission Example Settings  
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetIpix urlParameters='active:true,format:EPS,query:t=tr/m:Fit/w:172/h:228&t=ts/r:200x200&t=ts/c:gray&t=teps/pw:172/ph:228/pr:200/pv:1/prm:Fit&t=ts/f:eps' currentBundle='4U' photoCharge='material:iPIX Gold;1;20'/>"/>
	  --%>

	  <%-- AdPay Example Settings	 
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAdPay photoCharge='material:Ipix Basic;1, material:Ipix Extra;2;3, material:Ipix Extra;4;30' />"/> service='active:true,sendEmail:false,tranType:W,status:-2'
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAdPay urlParameters='format:EPS, active:true, query:classification=511' />"/>
	  --%>

	  <%-- Border Margins
        <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAd borderMarginTop='4' borderMarginBottom='4' borderMarginRight='4' borderMarginLeft='4' />"/>
	  --%>
	  
	  <%-- Graphic Margins
	  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetGraphicParams graphicMargins='Left:2,Right:2,Top:2,Bottom:2'/>"/>
	  --%>
	  
	<%-- Order Options --%>
	<webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder paymentMethod='Credit Card'/>" />
	<webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder orderStatus='Ready'/>"/> 
	<webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder queue='Ready'/>"/>
	<webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder source='No Source'/>"/>
	<webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder rep='WEB'/>"/>
	<webbase:mactiveAction dataType="SetProductionMethod" dataValue="Internal"/>
	 <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAdbaseImage imageParameters='active:true, printImage:true, numOfImage:4'/>"/>
		<div class="row">
			<form method="post" action="WebBaseMain.do" name="merchattributes">	  
				<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetMerchandiseAttributes.jsp'/>  
				
				<%-- Do not use Java Text Editors --%>
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div style="padding-bottom:30px">Your selected Ad Category is:  
							<span class="mgroupname">
								<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
							</span>
						</div>
						<div id="EpageAlert" class="alert alert-danger" style="display:none">   <a href="#" class="close" data-dismiss="alert">&times;</a>
							<strong>Error!</strong>
							<span id="errorConent">alert text here<!--error text here-->
							</span>
						</div>
						<!--BEING webbase tag-->
						<%--<webbase:MerchandiseAttributesTag adTextOutput="AdGenTemplate" showJTEs="false"/>--%>
						<webbase:MerchandiseAttributesV2Tag adTextOutput="AdGenTemplate" showJTEs="false"/>
						<!--END webbase tag-->
					</div>
					<div class="col-md-2">
					</div>
				</div>
				<!--END row-->
				<%-- Use Java Text Editors 
				<webbase:MerchandiseAttributesTag adTextOutput="AdGenTemplate" showJTEs="true"/>
				--%>
				<!--END comment for JTE-->
				<div class="row" style="padding-top:30px">
					<div class="col-md-2">
					</div>
					<!-- If the ad is part of a package the previous page should be the SetPackage page -->
					<div class="col-md-4 text-center">
					<webbase:showIf expression="adIsPartOfPackage">               
						<webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/SetPackage.jsp" buttonClass=" btn btn-default"/>
					</webbase:showIf>
partial order button:

<webbase:orderData dataType="SavePartialOrderBtn" label="Save Partial Order" nextURL="/jsp/ViewCurrentOrders.jsp" rescheduleURL="/jsp/GetPackageInformation.jsp" unlock="1"> <img src="../../../images/nav_buttons/save.gif" width="72" height="35" border="0" /> </webbase:orderData>

<!--end partial order button test-->	
					<!-- if the ad NOT part of a package go to the SetAdType.jsp -->
					<webbase:showIf expression="!adIsPartOfPackage">    


				
						<webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/SetPackage.jsp" buttonClass=" btn btn-default"/>
					</webbase:showIf>
					
					</div>
					<div class="col-md-4 text-center">
					
						<!-- if it's part of a package, go to the answer questions page -->
						<div style="display:inline">
								<webbase:showIf expression="adIsPartOfPackage">				
									<!--BEING webbase tag-->
									<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Place Order!" nextURL="/jsp/AnswerQuestions.jsp" buttonClass="btn btn-success">
                <span class="glyphicon glyphicon-user"></span>
</webbase:formHelper>

<!--END webbase tag-->
								</webbase:showIf>
								<webbase:showIf expression="!adIsPartOfPackage">
										<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Place Order!" nextURL="/jsp/AllOnePage.jsp" buttonClass="btn btn-success">
                <span class="glyphicon glyphicon-user"></span>
</webbase:formHelper>
								</webbase:showIf>
						</div>
						<!--<button type="button" class="btn btn-success Ebutton" value="continueBUT">Place Order!</button>-->
					</div>
					<div class="col-md-2">
					</div>
				</div>
				<!--END row-->
				<!-- if it's not part of the package, go to the all one page. -->
				

				<webbase:formHelper dataType="formList"/> 
				<webbase:formHelper dataType="FormValidate"/>
			</form>
		</div>
		<!--BEGIN alert testing-->
		<!---->
		<!--END alert testing-->
	  <%@ include file="../includes/footer.htm"%>
	<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/utils/zapatec.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/lang/calendar-en.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-setup.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-mactive.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="../../../scripts/ZapatecCalendar-licensed/themes/aqua.css"/>
</html>