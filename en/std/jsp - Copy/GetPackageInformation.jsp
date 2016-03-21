<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "GetPackageInformation.jsp" );%>
<% session.putValue( "returnPage", "GetPackageInformation.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
 <form method="post" action="WebBaseMain.do" name="merchattributes"> 
        <webbase:errorData dataType='ErrorMsg'/> 
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/GetPackageInformation.jsp'/> 
		 
           
            Schedule Ad 
           
          
            <div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
			<div style="padding-bottom:30px">Your selected Ad Category is:
				<span class="mgroupname">
				<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
				</span>
			</div>
			<!--BEGIN package tag-->
			 <webbase:PackageDayPatternV2Tag displayDetails="true" displayElements="product" optionalRunScheduleHeadingText="Optional Products" displayAllAtOnce="true" displayOptionalAsDropDownIfOnlyOne="true"  dispOptMessage=" Select a product (optional)"/>
			 <!--END package tag-->
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
		<div id="previousBUT">
			<webbase:formHelper dataType="cancelButtonV2" label="Back" name="GoBack" nextURL="/jsp/AnswerQuestions.jsp"> 
					<img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
			</webbase:formHelper>
		</div>
	<!--END back buttons-->
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-sm-3 text-center">
	<!--continue buttons-->
					<webbase:formHelper dataType="SubmitPackageSchedulingButtonV2"  name="SubmitSchedule" label="Submit"  nextURL="/jsp/PreviewAds.jsp" buttonClass="btn btn-success"/>
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
<%@ include file="../includes/footer.htm"%>
</html>
