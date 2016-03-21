<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>


<title>AdBaseE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="JavaScript" -->
<script language="javascript">

</script>
<!-- InstanceEndEditable -->
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
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
						onEndCrop: onEndCrop
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
</style>
</head>
<body onLoad="disableBack()" class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><%@ include file="header.jsp"%></td>
  </tr>
  <tr>
    <td width="150" valign="top"><!-- InstanceBeginEditable name="options" -->
      <%@ include file="../includes/leftSide.htm"%>
      <!-- InstanceEndEditable --></td>
    <td width="600" valign="top"><!-- InstanceBeginEditable name="content" --> <span class="PageName"> !! -- CropImage.jsp</span>
      <br>
      <font color="#CC0000" size="3"><b> <webbase:errorData dataType="ErrorMsg"/> </b></font>
      <br> 
      <form method="post" action="WebBaseMain.do" name="imageUpload" enctype="multipart/form-data">
        <webbase:showIf expression="adIsPartOfPackage">
           <webbase:mactiveAction dataType="SetAdToFirst" dataValue="" />
        </webbase:showIf>

	<webbase:uploadImage dataType="generateCropParams" />

        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/CropImage.jsp'/>
        <table width="500" border="0" align="center" cellpadding="0" cellspacing="0" class="navborder">
          <tr align="left">
            <td colspan="4" class="heading">Create Ad </td>
          </tr>
          <tr align="center">
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><br>
              Your selected Ad Category is: <span class="mgroupname">
              <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
              </span><br>
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">

<%--  'Buttons with icons'  --%>
              <webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" printImageIcon="<img src='../../../images/print.gif' alt='send to print' width='15' height='15'>" deleteImageIcon="<img src='../../../images/Recycle Bin.gif'  alt='delete this image' width='15' height='15'>" rotateLeftIcon="<img src='../../../images/rotate_left.gif' alt='rotate image left' width='15' height='15'>" rotateRightIcon="<img src='../../../images/rotate_right.gif' alt='rotate image right' width='15' height='15'>" cropIcon="<img src='../../../images/crop.gif' alt='crop image' width='15' height='15'>" cropAcceptButtonLabel='Apply' />

<%--  'Buttons' without icons
              <webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" />
--%>
            </td>
          </tr>

          <tr>
            <td colspan="2"><input type="hidden" name="x1" id="x1" /></td>            
          </tr>
          <tr>
            <td colspan="2"><input type="hidden" name="y1" id="y1" /></td>            
          </tr>
          <tr>
            <td colspan="2"><input type="hidden" name="x2" id="x2" /></td>            
          </tr>
          <tr>
            <td colspan="2"><input type="hidden" name="y2" id="y2" /></td>            
          </tr>
          <tr>
            <td colspan="2"><input type="hidden" name="width" id="width" /></td>            
          </tr>
          <tr>
            <td colspan="2"><input type="hidden" name="height" id="height" /></td>            
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td width="50%" align="center"><!-- If the ad is part of a package the previous page should be the SetPackage page -->
	      <%-- If previous after crop the thumbnail won't match image in print so REMOVE PREVIOUS BUTTON
              <webbase:showIf expression="adIsPartOfPackage">
                <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AnswerQuestions.jsp"> <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> </webbase:formHelper>
              </webbase:showIf>
              --%>

              <!-- if the ad NOT part of a package go to the SetAdType.jsp -->
              <%-- If previous after crop the thumbnail won't match image in print so REMOVE PREVIOUS BUTTON
              <webbase:showIf expression="!adIsPartOfPackage">
                <webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/AllOnePage.jsp"> <img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> </webbase:formHelper>
              </webbase:showIf>
	      --%>
            </td>
            <td align="center"><!-- if it's part of a package, go to the answer questions page -->
              <webbase:showIf expression="adIsPartOfPackage">
                <webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/AnswerQuestions.jsp" useAdGen="true"> <img src="../../../images/navigation/continue.gif" width="70" height="17"> </webbase:uploadImage>
              </webbase:showIf>
              <!-- if it's not part of the package, go to the all one page. -->
              <webbase:showIf expression="!adIsPartOfPackage">
                <webbase:uploadImage dataType="updatePrintImage" label="Continue" nextURL="/jsp/AllOnePage.jsp" useAdGen="true"> <img src="../../../images/navigation/continue.gif" width="70" height="17"> </webbase:uploadImage>
              </webbase:showIf>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
        </table>
        <webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
      </form>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td colspan="2"><%@ include file="footer.jsp"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd -->
</html>
