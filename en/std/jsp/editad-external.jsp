
<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<!--
      <script src="jquery.js"></script>
    <script src="pace.js"></script>
-->
 <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
	  <webbase:showIf expression="!allPackageAdsComplete">
	    <webbase:showIf expression="adIsPartOfPackage">
          <webbase:showIf expression="allPackageUserInputComplete">
              <webbase:mactiveAction dataType="GeneratePackageAdPreviews" dataValue=""/> 
          </webbase:showIf>
        </webbase:showIf>
	  </webbase:showIf>
	  <webbase:showIf expression="allPackageAdsComplete">
	    <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
		<webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
		<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
	  </webbase:showIf>
	  
       


		<div>
			<!--RONA moved the pub info out to preivew ads page-->
			
			<webbase:TemplateControls dataType="layouts" previewType="dynamic" imageBorderWidth="1" cellBorderWidth="0"/>
				
            
            
				

		
		</div>
