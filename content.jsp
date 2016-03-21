<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0036)http://localhost/webbase/content.jsp -->
<HTML><HEAD><TITLE>Demo App</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=expired content="01-Mar-94 00:00:01 GMT">
<STYLE type=text/css>.Labels {
	FONT-WEIGHT: normal; FONT-SIZE: x-small; VERTICAL-ALIGN: bottom; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #cccccc; FONT-VARIANT: normal
}
.Panels {
	FONT-WEIGHT: bold; FONT-SIZE: x-small; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #c4d2bc; FONT-VARIANT: normal
}
.TableBack {
	FONT-WEIGHT: normal; FONT-SIZE: xx-small; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #cccccc; FONT-VARIANT: normal
}
.TableFront {
	FONT-WEIGHT: normal; FONT-SIZE: xx-small; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffffff; FONT-VARIANT: normal
}
.InputFields {
	FONT-WEIGHT: normal; FONT-SIZE: small; VERTICAL-ALIGN: top; COLOR: #000000; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.InputFieldsRequired {
	FONT-WEIGHT: normal; FONT-SIZE: small; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffff00
}
</STYLE>

<STYLE type=text/css></STYLE>

<META content="MSHTML 6.00.2800.1141" name=GENERATOR></HEAD>
<BODY bgColor=#339999 leftMargin=0 topMargin=0 rightMargin=0 marginheight="0"
marginwidth="0">
<FORM name=demoForm>
<TABLE cellSpacing=0 cellPadding=0 width=615 align=center border=0>
  <TBODY>
  <TR vAlign=center>
    <TD align=left colSpan=2><FONT size=4>
      <TABLE>
        <TBODY>
        <TR>&nbsp;</TR>
        <TR>&nbsp;</TR></TBODY></TABLE>This is just a very simple demo to show you
      some of OpenThought's most basic functions. <FONT
      size=-2>&nbsp;</FONT><BR></FONT></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=615 align=center bgColor=#ffffff
border=1>
  <TBODY>
  <TR vAlign=center>
    <TD align=left bgColor=#cc3333 colSpan=2><IMG height=2
      src="content_files/WebBase.htm" width=1></TD></TR>
  <TR>
    <TD align=middle bgColor=#000000 colSpan=2><FONT color=#ffffff
      size=+1>OpenThought Demo: OS Info</FONT> </TD></TR></TBODY></TABLE>
<CENTER>
<TABLE cellSpacing=0 cellPadding=2 width=615 align=center border=0>
  <TBODY>
  <TR>
    <TD align=middle bgColor=#cc3300>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" align=center
      bgColor=#bbbbbb border=0>
        <TBODY>
        <TR>
          <TD align=middle colSpan=2><input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=osList','run_mode=demo_mode2')" maxLength=30 value="Get OS List!" name=search>
</TD></TR><!--  my little expirement -->
        <TR>
          <TD align=middle colSpan=2><input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=bcool', 'run_mode=demo_mode2');" maxLength=30 value="Value of cool cxBox" name=bcool>

<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=toolTip', 'run_mode=demo_mode2');" maxLength=30 value="apply tool tip" name=toolTip>
<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=btnDialog', 'run_mode=demo_mode2');" maxLength=30 value="open btn dialog" name=btnDialog>

<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=style', 'run_mode=demo_mode2');" maxLength=30 value="set style" name=style>

<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=blur', 'run_mode=demo_mode2');" maxLength=30 value="blur this button" name=blur>

<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=selectItem', 'run_mode=demo_mode2');" maxLength=30 value="select windows from list" name=selectItem>

<input type='button' onclick="parent.SendParameters('WebBaseMain.ot','buttonName=openBrowser', 'run_mode=demo_mode2');" maxLength=30 value="open new browser" name=openBrowser>

</TD></TR>
        <TR>
          <TD align=middle><B>OS Names</B><BR><FONT size=2><SELECT
            onchange="parent.SendParameters('WebBaseMain.ot', 'selectlist', 'run_mode=demo_mode2')"
            size=6 name=selectlist> <OPTION>-- Download the OS List!
              --</OPTION></SELECT> </FONT></TD>
          <TD vAlign=center align=middle>OS<BR><INPUT onfocus=this.blur()
            size=30 name=os><BR>Creator<BR><INPUT onfocus=this.blur() size=30
            name=creator><BR>Notes<BR><TEXTAREA onfocus=this.blur() name=notes rows=8 wrap=virtual cols=25>    </TEXTAREA><BR>Apply
            a style to me<BR><TEXTAREA name=blurText wrap=virtual cols=25>    
</TEXTAREA><BR>
            <TABLE border=0>
              <TBODY>
              <TR>
                <TD><INPUT type=checkbox name=free>Free?<BR><INPUT
                  type=checkbox name=cool>Cool?<BR><INPUT type=checkbox
                  name=goodlooking>Good
        Looking?<BR></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM><!--  another one of my little expirements -->
<FORM name=demoForm3><INPUT
onclick="parent.SendParameters('WebBaseMain.ot','buttonName=submitForm','run_mode=demo_mode2')"
maxLength=30 value="Click to Submit" name=submitForm><BR></FORM>
<FORM name=demoForm2></FORM></CENTER></BODY></HTML>
