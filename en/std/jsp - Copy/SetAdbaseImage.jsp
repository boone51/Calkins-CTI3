<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/adbasee.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
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

			
			
		</style>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
</head>

<body onLoad="disableBack()">
<div id="mainBox">
  <div id="header"><%@ include file="../includes/header.htm"%></div>

  <webbase:showIf expression="isCustomerLoggedIn">
    <div id="menu">
      <%@ include file="../includes/leftSide.htm"%>
    </div>
  </webbase:showIf>

  <div id="content"><!-- InstanceBeginEditable name="content" -->
	 <span class="PageName"> !! -- SetAdbaseImage.jsp</span>
	  <webbase:errorData dataType='ErrorMsg'/> 
  
	  <form method="post" action="WebBaseMain.do" name="imageUpload" enctype="multipart/form-data">
	  
	  <%-- Updates the fielded data upon submitting this page --%>
	  <webbase:uploadImage dataType="generateCropParams" />
	  <webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetAdbaseImage.jsp'/>  
        <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder"> 
          <tr align="left"> 
            <td colspan="4" class="heading">Create Ad </td> 
          </tr> 
          <tr align="center">
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2"><br>
            Your selected Ad Category is:  <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/> 
              </span><br>            </td> 
          </tr> 
		  <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="4">
			
			<webbase:uploadImage dataType="uploadBrowseButton" label="Select Image" fieldSize="50"/>
						<webbase:uploadImage dataType="uploadImageButton" label="Upload Image Selected" maxImageSize="1000" validImageFormats="JPEG"> 
				  <img src="../../../images/navigation/upload.gif" width="80" height="17" border="0">						</webbase:uploadImage>

						<webbase:uploadImage dataType="thumbNails" numColumns="2" thumbnailSize="100" printImageIcon="print" rotateLeftIcon="left" rotateRightIcon="right" deleteImageIcon="delete"/>
                        
                        <div class="hidden" id="previewArea" style="display:none"></div>
							<input type="hidden" name="x1" id="x1" />
							<input type="hidden" name="y1" id="y1" />
							<input type="hidden" name="x2" id="x2" />								
							<input type="hidden" name="y2" id="y2" />
							<input type="hidden" name="width" id="width" />
							<input type="hidden" name="height" id="height" />
							</td> 
          </tr> 
		  
          <tr> 
            <td align="center">&nbsp;</td> 
            <td align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td width="50%" align="center">
			  <!-- If the ad is part of a package the previous page should be the SetPackage page -->
			  <webbase:showIf expression="adIsPartOfPackage">               
                <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AnswerQuestions.jsp"> 
                  <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0">                </webbase:formHelper>
			  </webbase:showIf>
			  
			  <!-- if the ad NOT part of a package go to the SetAdType.jsp -->
			  <webbase:showIf expression="!adIsPartOfPackage">               
                <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AllOnePage.jsp"> 
                  <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0">                </webbase:formHelper>
			  </webbase:showIf>            </td> 
            <td align="center">
			  
			  <!-- if it's part of a package, go to the answer questions page -->
			  <webbase:showIf expression="adIsPartOfPackage">				
					<webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/AnswerQuestions.jsp" useAdGen="true">
					  <img src="../../../images/navigation/continue.gif" width="70" height="17"> 
				    </webbase:uploadImage>
				  </webbase:showIf>
			      

			
			  <!-- if it's not part of the package, go to the all one page. -->
			  <webbase:showIf expression="!adIsPartOfPackage">
			    <webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/AllOnePage.jsp" useAdGen="true">             
				  <img src="../../../images/navigation/continue.gif" width="70" height="17">                </webbase:uploadImage>
			  </webbase:showIf>            </td> 
          </tr> 
          <tr> 
            <td colspan="4">&nbsp;</td> 
          </tr> 
        </table> 
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>
      </form> 
      <!-- InstanceEndEditable -->
  </div>
  <br class="clear"/>
  <div id="footer">
    <%@ include file="../includes/footer.htm"%>
  </div>
</div>
</body>
<!-- InstanceEnd --></html>