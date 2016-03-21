<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Mactive Tag Library Document Stylesheet -->

	<!-- Global Definitions -->
	<xsl:output method="html" omit-xml-declaration="no" encoding="iso-8859-1" indent="no"/>

	<!-- Main Template -->
	<xsl:template match="/taglib">
		<html>
			<head>
				<title>Mactive Tag Library Document Stylesheet</title>
		        <link type="text/css" rel="stylesheet" href="../TagLibDoc/taglib.css" />

  				<script type="text/javascript">
				<![CDATA[
					var tagNameList = new Array();

					<!-- function to toggle the style of the topic -->
					function mouseOverTopic(obj) {
						obj.style.background = "#d0d0d0";
					}

					<!-- function to toggle the style of the topic -->
					function mouseOutTopic(obj) {
						obj.style.background = "#dbe0e5";
					}

					<!-- function to toggle the visibility of the content table -->
					function clickTopic(id) {
						var element = document.getElementById(id + "Content");
						var arrow = document.getElementById(id + "Arrow");

						if (element.style.display == "") {
							element.style.display = "none";
							arrow.src = "../TagLibDoc/images/arrow_right.gif";
						} else {
							element.style.display = "";
							arrow.src = "../TagLibDoc/images/arrow_down.gif";
						}
					}

					function expandTopic(id) {
						var element = document.getElementById(id + "Content");
						var arrow = document.getElementById(id + "Arrow");

						element.style.display = "";
						arrow.src = "../TagLibDoc/images/arrow_down.gif";
					}

					function collapseTopic(id) {
						var element = document.getElementById(id + "Content");
						var arrow = document.getElementById(id + "Arrow");

						element.style.display = "none";
						arrow.src = "../TagLibDoc/images/arrow_right.gif";
					}

					<!-- function to expand all tags -->
					function expandAllTopics() {
						for (i = 0; i < tagNameList.length; i++) {
							expandTopic(tagNameList[i]);
						}
					}

					<!-- function to collapse all tags -->
					function collapseAllTopics() {
						for (i = 0; i < tagNameList.length; i++) {
							collapseTopic(tagNameList[i]);
						}
					}
				]]>
				</script>
			</head>

			<body>

				<a name="top"></a>

				<script type="text/javascript">
					<!-- populate the tag name array for each of the tag -->
					<xsl:for-each select="/taglib/tag">
						tagNameList[tagNameList.length] = "<xsl:value-of select="name" />";
					</xsl:for-each>
				</script>

				<table cellpadding="10" cellspacing="10" border="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td class="header" width="80%"><xsl:value-of select="short-name" /> Document</td>
									<td class="header-description" align="right">Tag Library Version: <strong><xsl:value-of select="tlib-version" /></strong><br />JSP Version: <strong><xsl:value-of select="jsp-version" /></strong></td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<td>
							<img src="../TagLibDoc/images/blank.gif" width="5" border="0" alt="" /><a class="function-link" href="javascript:expandAllTopics();">Expand All</a><img src="../TagLibDoc/images/blank.gif" width="10" border="0" alt="" />|<img src="../TagLibDoc/images/blank.gif" width="10" border="0" alt="" /><a class="function-link" href="javascript:collapseAllTopics();">Collapse All</a>
						</td>
					</tr>

					<tr>
						<td width="100%" height="100%" valign="top">
							<xsl:apply-templates select="tag" />
						</td>
					</tr>

					<tr>
						<td class="footer">Copyright (c) 2003 Mactive, Inc.</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<!-- ignored tags -->
	<xsl:template match="/taglib/tlib-version | /taglib/jsp-version | /taglib/short-name" />

	<xsl:template match="tag">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td>
					<xsl:variable name="TopicNameIn"><xsl:value-of select="name" /></xsl:variable>

					<xsl:call-template name="topic">
						<xsl:with-param name="NameIn" select="$TopicNameIn" />
					</xsl:call-template>
				</td>
			</tr>

			<tr>
				<td>
					<xsl:variable name="ContentNameIn"><xsl:value-of select="name" /></xsl:variable>

					<xsl:call-template name="content">
						<xsl:with-param name="NameIn" select="$ContentNameIn" />
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>

	<!-- the clickable topic bar -->
	<xsl:template name="topic">
		<xsl:param name="NameIn" />

		<div class="dynamic-topic" onMouseOver="mouseOverTopic(this);" onMouseOut="mouseOutTopic(this);" onClick="clickTopic('{$NameIn}');">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td class="tag-name">
						<img id="{$NameIn}Arrow" src="../TagLibDoc/images/arrow_right.gif" border="0" alt="Click to Expand/Collapse" /><img src="../TagLibDoc/images/blank.gif" width="10" border="0" alt="" />
						<xsl:value-of select="name" /> Tag
					</td>
					<td class="tag-class" align="right">
						<strong>Class: </strong><xsl:value-of select="tag-class" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>

	<!-- the dynamic content area -->
	<xsl:template name="content">
		<xsl:param name="NameIn" />

		<div id="{$NameIn}Content" class="dynamic-content" style="display: none;">
			<table cellpadding="4" cellspacing="0" border="0">
				<tr>
					<td class="tag-description-label" width="100"><br />Description: </td>
					<td class="tag-description" width="100%"><br />
						<xsl:variable name="StringIn"><xsl:value-of select="description" /></xsl:variable>

						<xsl:variable name="ResultOut">
							<xsl:call-template name="parseDescription">
								<xsl:with-param name="StringToTransform" select="$StringIn" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:copy-of select="$ResultOut" /><br /><br />
					</td>
				</tr>
			</table>

			<table cellpadding="4" cellspacing="0" border="0" width="98%">
				<tr>
					<td class="attr-header" colspan="3">Tag Attributes</td>
				</tr>

				<tr>
					<td class="attr-label" width="15%">Name</td>
					<td class="attr-label" width="10%">Required</td>
					<td class="attr-label" width="80%">Description</td>
				</tr>

				<xsl:apply-templates select="attribute" />
			</table>

			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td class="section-footer"><br/><a class="function-link" href="#top">Back to Top</a><br/></td>
				</tr>
			</table>
		</div>
	</xsl:template>

	<xsl:template match="attribute">
		<tr>
			<xsl:choose>
				<xsl:when test="required='true'">
					<td class="attr-name-true"><xsl:value-of select="name" /></td>
					<td class="attr-req-true">
						<xsl:variable name="StringIn"><xsl:value-of select="required" /></xsl:variable>

						<xsl:variable name="ResultOut">
							<xsl:call-template name="requiredFlagTranslator">
								<xsl:with-param name="StringToTransform" select="$StringIn" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:copy-of select="$ResultOut" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td class="attr-name"><xsl:value-of select="name" /></td>
					<td class="attr-req">
						<xsl:variable name="StringIn"><xsl:value-of select="required" /></xsl:variable>

						<xsl:variable name="ResultOut">
							<xsl:call-template name="requiredFlagTranslator">
								<xsl:with-param name="StringToTransform" select="$StringIn" />
							</xsl:call-template>
						</xsl:variable>

						<xsl:copy-of select="$ResultOut" />
					</td>
				</xsl:otherwise>
			</xsl:choose>

			<td class="attr-description">
				<xsl:variable name="StringIn"><xsl:value-of select="description" /></xsl:variable>

				<xsl:variable name="ResultOut">
					<xsl:call-template name="parseDescription">
						<xsl:with-param name="StringToTransform" select="$StringIn" />
					</xsl:call-template>
				</xsl:variable>

				<xsl:copy-of select="$ResultOut" /><br />
			</td>
		</tr>
	</xsl:template>

	<!-- template to convert 'true' to 'Yes' and 'false' to 'No' -->
	<xsl:template name="requiredFlagTranslator">
		<!-- import $StringToTransform -->
		<xsl:param name="StringToTransform"/>

		<xsl:choose>
			<xsl:when test="contains($StringToTransform, 'true')">
				Yes
			</xsl:when>

			<xsl:otherwise>
				No
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- template to convert '\n' to '<br />' -->
	<xsl:template name="parseDescription">
		<!-- import $StringToTransform -->
		<xsl:param name="StringToTransform"/>

		<xsl:choose>
			<!-- replace '\n' -->
			<xsl:when test="contains($StringToTransform, '\n')">
				<xsl:value-of select="substring-before($StringToTransform, '\n')" />
				<br />

				<xsl:call-template name="parseDescription">
					<xsl:with-param name="StringToTransform">
						<xsl:value-of select="substring-after($StringToTransform, '\n')" />
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise>
				<xsl:value-of select="$StringToTransform" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
