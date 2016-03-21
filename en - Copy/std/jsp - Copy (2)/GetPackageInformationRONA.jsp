<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/headerGPI.htm"%>
<%@ include file="top-nav.jsp"%>
error here:
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetMerchandiseAttributes.jsp'/>
		<div id="EpageError" class="alert alert-danger" role="alert" style="display:none"><webbase:errorData dataType='ErrorMsg'/> </div>
<h2>Schedule Ad</h2>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div style="padding-bottom:30px">Your selected Ad Category is:
	<span class="mgroupname">
		<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
	</span>
	</div>
		<webbase:PackageDayPatternTag displayDetails="true" displayElements="product" optionalRunScheduleHeadingText="Optional Products" displayAllAtOnce="true" displayOptionalAsDropDownIfOnlyOne="true" dispOptMessage=" Select a product (optional)"/>
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
	<div class="col-sm-3 text-left">
	<div id="previousBUT"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AnswerQuestions.jsp">
<img src="../../../images/navigation/previous.gif" width="70" height="17" border="0">
</webbase:formHelper></div>
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-sm-3 text-right">
		<div style="display:inline">
<webbase:formHelper dataType="SubmitPackageSchedulingButton" label="Submit Schedule" name="continue" nextURL="/jsp/PreviewAds.jsp">
			<img src="../../../images/navigation/continue.gif" width="70" height="17" border="0">
		</webbase:formHelper></div>
<button type="button" class="btn btn-success Ebutton" value="SubmitPackageSchedulingButton">Continue</button>
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
</html>
