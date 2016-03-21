<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "SetAdbaseImage.jsp" );%>
<% session.putValue( "returnPage", "SetAdbaseImage.jsp" );%>
<%@ include file="header.jsp"%>
<!-- InstanceBeginEditable name="head" -->
		<%-- Cropping feature includes and javascript --%>
        <webbase:mactiveAction dataType="RunCommand" dataValue="<SetAdbaseImage imageParameters='crop:false,pad:true,lock:true'/>"/>
		<script src="../../../scripts/crop/lib/prototype.js" type="text/javascript"></script>
		<script src="../../../scripts/crop/lib/scriptaculous.js?load=builder,dragdrop" type="text/javascript"></script>
		<script src="../../../scripts/crop/cropper.js" type="text/javascript"></script>
		<script type="text/javascript" charset="utf-8">
			// setup the callback function
			function onEndCrop( coords, dimensions ) {
				$( 'x1' ).value = coords.x1;
				$( 'y1' ).value = coords.y1;
				$( 'x2' ).value = coords.x2;
				$( 'y2' ).value = coords.y2;
				$( 'width' ).value = dimensions.width;
				$( 'height' ).value = dimensions.height;
			}
	<%--		
			// basic example
			Event.observe( 
				window, 
				'load', 
				function() { 
					new Cropper.ImgWithPreview( 
						'cropImage0',
						{ 
							minWidth: 75, 
							minHeight: 50,
							ratioDim: { x: 75, y: 50 },
							displayOnInit: true, 
							onEndCrop: onEndCrop,
							previewWrap: 'previewArea'
						} 
					) 
				}
			);
	--%> 		
			// basic example
Event.observe( 
    window, 
    'load', 
    function() { 
       new Cropper.ImgWithPreview( 
          'cropImage0',
         { 
            minWidth: eval(cropMinWidth), 
                minHeight: eval(cropMinHeight),
         <webbase:showIf expression="isPrintPhotoCropLocked">
                ratioDim: { x: eval(cropXRatio), y: eval(cropYRatio) },
         </webbase:showIf>
         <webbase:showIf expression="!isPrintPhotoCropLocked">
                onloadCoords: { x1: 0, y1: 0, x2: eval(cropXRatio), y2: eval(cropYRatio) },
         </webbase:showIf>
                displayOnInit: true, 
                onEndCrop: onEndCrop,
                previewWrap: 'previewArea'
         } 
      ) 
  }
      );                               
	<%--		
			if( typeof(dump) != 'function' ) {
				Debug.init(true, '/');
				function dump( msg ) {
					Debug.raise( msg );
				};
			} else dump( '---------------------------------------\n' );
	--%>		
		</script>
		<link rel="stylesheet" type="text/css" href="debug.css" media="all" />
		<style type="text/css">
			label {
				clear: left;
				margin-left: 50px;
				float: left;
				width: 5em;
			}
			html, body {
				margin: 0;
			}
			#testWrap {
				margin: 20px 0 0 50px; /* Just while testing, to make sure we return the correct positions for the image & not the window */
			}
.ML_ImageTd{
border:solid #999 10px;
}
.ML_ControlsTd{
border:solid green 4px;
}
            input[type=file] {
  position: relative;
  -webkit-appearance: textfield;
  -webkit-box-sizing: border-box;
}

input[type=file]::-webkit-file-upload-button {
  border: none;
  margin: 0;
  padding: 0;
  -webkit-appearance: none;
  width: 0;
}

/* "x::-webkit-file-upload-button" forces the rules to only apply to browsers that support this pseudo-element */
x::-webkit-file-upload-button, input[type=file]:after {
  content: 'Browse...';
  display: inline-block;
  left: 100%;
  margin-left:3px;
  padding: 3px 8px 2px;
  position: relative;
  -webkit-appearance: button;
}
		</style>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>

<div id="mainBox">
  <%--
       <webbase:showIf expression="isCustomerLoggedIn">
    <div id="menu">
      <%@ include file="../includes/leftSide.htm"%>
    </div>
  </webbase:showIf>
    --%>
<!--    END comment for JSP-->
  <div id="content">
	  <webbase:errorData dataType='ErrorMsg'/> 
	  <form method="post" action="WebBaseMain.do" name="imageUpload" enctype="multipart/form-data">
	  <%-- Updates the fielded data upon submitting this page --%>
	  <webbase:uploadImage dataType="generateCropParams" />
	  <webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetAdbaseImage.jsp'/>  
                    
             
          
          
          <div class="container">
                <h2> Create Ad  </h2>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-7">
            Your selected Ad Category is:  <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span><br>             
            
			<webbase:uploadImage dataType="uploadBrowseButton" label="Select Image" fieldSize="50"/>
						<div class="alert alert-info" role="alert" style="margin-top:5px;margin-bottom:5px">Be sure to click "Upload" after you've selected your image!</div>
                        <webbase:uploadImage dataType="uploadImageButton" label="Upload Image Selected" maxImageSize="1000" validImageFormats="JPEG"> 
				  <img src="../../../images/navigation/upload.png" border="0">						</webbase:uploadImage>
						<webbase:uploadImage dataType="thumbNails" numColumns="2" thumbnailSize="100" printImageIcon="print" rotateLeftIcon="left" rotateRightIcon="right" deleteImageIcon="delete"/>
                        <div class="hidden" id="previewArea" style="display:none"></div>
							<input type="hidden" name="x1" id="x1" />
							<input type="hidden" name="y1" id="y1" />
							<input type="hidden" name="x2" id="x2" />								
							<input type="hidden" name="y2" id="y2" />
							<input type="hidden" name="width" id="width" />
							<input type="hidden" name="height" id="height" />
             
             
                        
                        <!--BEGIN button row-->
<div class="row" style="padding-top:30px">
    <div class="col-md-6 text-center">
        <webbase:showIf expression="adIsPartOfPackage">
            <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/EditAd.jsp">
                <img src="../../../images/navigation/previous.png" border="0"> </webbase:formHelper>
        </webbase:showIf>
        <!-- if the ad NOT part of a package go to the SetAdType.jsp -->
        <webbase:showIf expression="!adIsPartOfPackage">
            <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AllOnePage.jsp">
                <img src="../../../images/navigation/previous.png" border="0"> </webbase:formHelper>
        </webbase:showIf>
    </div>
    <div class="col-md-6 text-center">
        <webbase:showIf expression="adIsPartOfPackage">
            <webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/EditAd.jsp" useAdGen="true">
                <img src="../../../images/navigation/continue.png">
            </webbase:uploadImage>
        </webbase:showIf>
        <!-- if it's not part of the package, go to the all one page. -->
        <webbase:showIf expression="!adIsPartOfPackage">
            <webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/AllOnePage.jsp" useAdGen="true">
                <img src="../../../images/navigation/continue.png"> </webbase:uploadImage>
        </webbase:showIf>
    </div>
</div>
                        <!--END button row-->
                        
			  <!-- If the ad is part of a package the previous page should be the SetPackage page -->
			             
			  <!-- if it's part of a package, go to the answer questions page -->
			      
                            <!--BEGIN Right Ad Info-->

                        <!--END Right Ad Info-->
                    </div>
                    <div id="subnav" class="col-xs-12 col-sm-12 col-md-3">
                        <%@ include file="orderPanel.jsp"%>
                    </div>
                </div>
            </div>
          
          
          
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>
      </form> 
     <%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>