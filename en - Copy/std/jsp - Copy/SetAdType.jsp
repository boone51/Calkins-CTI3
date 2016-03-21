<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "SetAdType.jsp" );%>
<% session.putValue( "returnPage", "SetAdType.jsp" );%>
<%@ include file="../includes/header.htm"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
<%@ include file="../includes/top-nav.htm"%>
      <webbase:mactiveAction dataType="NewOrder" dataValue=""/> 
      <webbase:TemplateControls dataType="clear"/> 
	  <!--BEGIN row-->
		<div class="row">
			<h2>Choose Your Ad Category</h2>
			<form action="WebBaseMain.do" method="post" name="adtype" class="nomargin">
			<div class="col-md-2">
			</div>
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder paymentMethod='Credit Card'/>" />
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder orderStatus='Ready'/>"/> 
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder queue='Ready'/>"/>
			  <webbase:mactiveAction dataType="SetRep" dataValue="web"/>
			  <%-- Not normally used. These are commented out. Delete comments to set them
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder source='No Source'/>"/>
			  <webbase:mactiveAction dataType="SetProductionMethod" dataValue="Internal"/> --%>
						<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
						<webbase:errorData dataType="ErrorMsg"/>
						<webbase:errorData dataType="ErrorURL" nextURL="/jsp/SetAdType.jsp"/>
				<div class="col-md-6">
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="true" rootCategoryName="Services" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"  nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Merchandise" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"  nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Real Estate" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
				</div>
			<webbase:formHelper dataType="formList"/>
			<webbase:formHelper dataType="FormValidate"/> 
			</form>
			<div class="col-md-2">
			</div>
		</div>
	  <!--END row-->
<%@ include file="../includes/footer.htm"%>
<script type="javascript" src="../../../scripts/FormUtils.js"></script>
<script>
		$(document).ready(function() {

		//
		$(".Ecategory a:nth-child(1)").addClass("popover-trigger");
//$( ".Ecategory" ).each(function( index ) {
//console.log('number '+index)
 // $( this ).addClass("popover");
//});
		  
		  
		  //
		var originalLeave = $.fn.popover.Constructor.prototype.leave;
		$.fn.popover.Constructor.prototype.leave = function(obj){
		  var self = obj instanceof this.constructor ?
			obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type)
		  var container, timeout;

		  originalLeave.call(this, obj);

		  if(obj.currentTarget) {
			container = $(obj.currentTarget).siblings('.popover')
			timeout = self.timeout;
			container.one('mouseenter', function(){
			  //We entered the actual popover – call off the dogs
			  clearTimeout(timeout);
			  //Let's monitor popover content instead
			  container.one('mouseleave', function(){
				$.fn.popover.Constructor.prototype.leave.call(self, self);
			  });
			})
		  }
		};


		$('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'auto', delay: {show: 50, hide: 400}});
		  //
		  $(".popover-trigger").mouseover(function() {
			el = $(this);
			testID = $(this).attr("id");
			console.log(testID);
			// $(".popover-trigger").not(this).popover('hide'); 
			$.get("testLoad.html", function(response) {
			  el.unbind('click').popover({
				content: response,
				title: 'Dynamic response!',
				trigger: 'click hover',
				html: true,
				delay: {show: 500, hide: 100}
			  }).popover('show');
			});
		  });
		  //
		  //
		/*END on Load function*/
		});
</script>
</html>