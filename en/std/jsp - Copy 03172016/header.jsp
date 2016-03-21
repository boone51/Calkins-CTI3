<html lang="en">
<head><!--open header-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Post to Bucks County Courier Times Classifieds</title>

<!-- Bootstrap core CSS -->
<link id="mainCSS" href="BS3/css/bootstrap-flat.css" rel="stylesheet">
<!-- Bootstrap theme -->
<!--<link href="BS3/css/bootstrap-theme.min.css" rel="stylesheet">
	<link rel="stylesheet/less" type="text/css" href="BS3/css/theme-flat.less" />
	<link rel="stylesheet/less" type="text/css" href="BS3/css/variables-flat.less" />-->
<!-- Custom styles for this template -->
<link href="allstyles.css" rel="stylesheet">
<script src="jquery.js"></script>
<script src="BS3/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<!--BEGIN GetPackageInformation code-->
    <% if (session.getAttribute("pageName") == "GetPackageInformation.jsp" || session.getAttribute("pageName") == "AdOrderSearch.jsp") { %>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/utils/zapatec.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/lang/calendar-en.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-setup.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-mactive.js"></SCRIPT>
    <link rel="stylesheet" type="text/css" href="../../../scripts/ZapatecCalendar-licensed/themes/winter.css" />
        <script>
             $(function() {
         $("#SubmitOrderSearchButton").addClass("btn btn-primary");
    });
       
        </script>
<%}%>
<!--END GetPackageInformation code-->

<!--BEGIN login.jsp code-->
<%  if (session.getAttribute("pageName") == "login.jsp" || session.getAttribute("pageName") == "newaccount.jsp"){ %>
    <style>
    .carousel {
  height: 300px;
  margin-bottom: 60px;
}
.loginTrue {
 display:none;   
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel .item {
  height: 300px;
  background-color: #777;
}
.carousel-inner > .item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 500px;
}


/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 20px;
  text-align: center;
}
.marketing h2 {
  font-weight: normal;
}
.marketing .col-lg-4 p {
  margin-right: 10px;
  margin-left: 10px;
}


/* Featurettes
------------------------- */

.featurette-divider {
  margin: 80px 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  letter-spacing: -1px;
}

    </style>

<%}%>
<!--END login.jsp code-->
    <!--BEGIN SetAdType code-->
<%  if (session.getAttribute("pageName") == "SetAdType.jsp"){ %>
<style>
    .catList {
        width: 100%;
       /* max-height: 500px;*/
       /* overflow-y: scroll;*/
    }
    .Ecategory ul{
        max-height: 150px;
        overflow-y: scroll;
    }
</style>
<script>
    $(function() {
        console.log('jquery function loaded');
        $(".Ecategory a").click(function() {
            var CatNameStr = $(this).text();
            localStorage.setItem("CatName", CatNameStr);
        });
    });
</script>
<%}%>
<!--END SetAdType code-->
    <!--BEGIN SetPackage code-->
<%  if (session.getAttribute("pageName") == "SetPackage.jsp"){ %>
<style>
    .packagetable {
        width: 33%;
        float: left;
        padding-right: 20px;
    }
</style>
<script>
    function clickPackBut(selItem){
        console.log('creating button wrap for item '+selItem);
               // $( "button[name='PackageSelectorV2']").eq(selItem).trigger( "click" );
        //#PackageSelectorId > a:nth-child(2) > div > button
       // $( "#PackageSelectorId > a:nth-child(2) > div > button").eq(selItem).click();
        //var butSelector = "PackageSelectorId > a:nth-child("+selItem+") > div > button"
        //console.log('selector is '+butSelector); 
         $("#PackageSelectorId > a:nth-child("+selItem+") > div > button").eq(0).trigger( "click" );
        // $( "button[name='PackageSelectorV2']").eq(selItem).click();
            }
    $(function() {
        //
        $( "#PackageSelectorId").click(function() {
             //var theOnClick = $(this).find('button').attr("onclick");
         // console.log('clicked the div for the pakage hard coded'+theOnClick);
        });
        //
        var retCatName = localStorage.getItem("CatName");
        $(".catName").append(retCatName);
        //
        console.log("loaded local storage on setpackage page");
        $( "button[name='PackageSelectorV2']").each(function(index){
            console.log("wrapping pkg");
            //
             var theOnClick = $(this).attr("onclick");
            $(this).closest('#PackageSelectorId').click(function() {
               
              console.log('clicked the div for the pakage hard coded'+theOnClick);
                //$(this).click();
            });
            //
            var indexPlus = index;
           // var theOnClick = $(this).attr("onclick");
                var a = $("<a href='javascript:void[0]'><a/>").attr("onclick", "clickPackBut('"+index+"')");
                //$(this).closest('.packagetable').wrap(a);
        });
    });
    //

    
</script>
<%}%>
<!--END SetPackage code-->   
<!--BEGIN SetmerchandiseAttributes code-->
<%  if (session.getAttribute("pageName") == "SetMerchandiseAttributes.jsp"){ %>
<script>


$(function(){
    var checkLength = $("#MainTable_Div input:checkbox").length;
    console.log(checkLength);
    
$("#MainTable_Div fieldset").contents().filter(function() {
    return this.nodeType === 3;
})
.wrap( "<label></label>" );
    $("#MainTable_Div input:checkbox").each(function(){
        
        // var $this = $(this);
       //$(this.lastChild).wrap('<label />')
       
      // use .add() and .nextUntil() to get both the .section-header
      // and .section-item elements into a single set for our .wrapAll() call
      //$this.add($this.nextUntil('input')).wrapAll('<div class="section-container"></div>');
        //console.log('the text is '+$(this)[0].nextSibling.nodeValue.replace(/\//g,'').replace(/\./g,'').replace(/\'/g,''));
        //var theCheck = $(this);
       // var theCheckText = $(this)[0].nextSibling.nodeValue.replace(/\//g,'').replace(/\./g,'').replace(/\'/g,'');
        // $(this)[0].nextSibling.nodeValue.replace(/\//g,'').replace(/\./g,'').replace(/\'/g,'').wrap("<label></label>");
        ////*[@id="MainTable_Div"]/fieldset[2]/text()[1]
        //console.log('the wrap should use'+theCheck+'followed by the text'+theCheckText);
        //$("fieldset").not(".checkboxWrapper").contents().filter(function(){ return this.nodeType == 3; }).hide();
       // $(this).wrapAll("<div class='checkboxWrapper'></div>").after(theCheckText);
       // $(this).parent().replace(theCheckText, '');
       //$("fieldset").not(".checkboxWrapper").contents().filter(function(){ return this.nodeType == 3; }).remove();
        //$( theCheckText ).appendTo( ".checkboxWrapper" );
       // $(this)[0].nextSibling.nodeValue.wrapAll("<div class='checkboxWrapper'></div>");
    });
   // $("#MainTable_Div input:checkbox").nextUntil("input").wrap("<div class='checkboxWrapper'></div>");
   // $.each(["#MainTable_Div input:checkbox"], function(i) {
       // console.log("trying" + i);
        //var tstVal = $(this).val();
        //console.log("trying with this one..."+tstVal+"<--");
        //console.log("Index #" + i + ": "+ tstVal);
        //$(this).nextUntil(":checkbox").wrap("<div class='checkboxWrapper'></div>");
    //});
});

    
</script>
    <style>
    .checkboxWrapper{
        width:300px;
        float:left;
    }

       input[type = checkbox] + label {
         width: 145px;   
        }
        

    </style>
    <%}%>
<!--END SetmerchandiseAttributes code-->
<!--BEGIN EditAd code-->
<%  if (session.getAttribute("pageName") == "EditAd.jsp"){ %>
<style>
    .pace-activity{
        max-height: 10px;
    }
    </style>
<%}%>
<!--END EditAd code-->
<script>
function changeCSS(selSheet) {
    console.log('hit the function for the css');
    $('#mainCSS').attr("href", selSheet);
//.href="BS3/css/bootstrap-flat.css";
}
//BEGIN menuLeft hover code
$(function() {
  $('.menuLeft li').mouseenter(function(){
        console.log('rollover hit');
        if ($('li ul li:hover').length) {
            $('li ul li:hover').css('background','gray');
        }else{
            $('li:hover').css('background','gray');
            $(this).children('a').css('color','white');
        }
    });
    $('.menuLeft li').mouseleave(function(){
        $(this).css('background', 'transparent');
        $(this).children('a').css('color','black');
    });
    //
    $('.mgraphiclogotable img').each(function(){
    $(this).next('input').andSelf().wrapAll('<div class="test"/>');
});
    //
});
//
    function uploadPhotos(buttonCLK){
        console.log("clicked "+buttonCLK);
         //console.log('upload button hit');
                //
                //
                var submitInput = document.getElementsByName(buttonCLK+'.xURL');
                $(submitInput).val('/jsp/SetAdbaseImage.jsp');
         //
         $(document.getElementsByName(buttonCLK)).trigger("click");
         //
                //document.editAd.submit();
                //
				 //document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
				 //document.editAd.submit();
         //
         //$.post( "PreviewAds.jsp", $( "#editAd" ).serialize() );
         //document.location = "WebbaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
         //
			}
//END menyLeft hover code
    
</script>
<!--  Universal Styles -   Styles listed below should be needed on every page-->
<style>
    #cityStZip select {
            width: 80%;
        }

    #top-nav.affix {
     position: fixed;
        top: 0;
        <!-- width: 100% -->
    }
    #ordersCarousel {
        height: 440px;
    }

    .scrollit {
        float: left;
        /*width: 71%*/
    }
    /*mgraphiclogotable*/
    .adPreviews img { display: block; margin-left: auto; margin-right: auto; /*width: 70%;*/ }
    .adPreviews { margin-left: auto; margin-right: auto; text-align: center;}
    .customHeader {
        height: 150px;
        background: #e7e7e7;
    }
    .menuLeft {
/*        margin-left: -15px;*/
        background-color: #d7d7d7;
    }

    .menuLeft li {
        /* border-top: 1px solid #d8d8d8; */
        padding-left: 5px;
    }

    .menuLeft li a {
        color: #3b3b3b;
        text-decoration: none;
    }

    .menuLeft hr {
        margin-top: 2px;
        margin-bottom: 2px;
    }

    textarea {
        display: block;
        width: 100%;
    }
    input[type="checkbox"] {
        /*display:inline-block;*/
        margin-left:10px;
        /*width: 150px;*/
    }
    fieldset {
        display:block;
    }
    /*.mattrlabeltext{
        display:block;
    }*/
    .packagepatterndaypatterntable{
        white-space: pre-line;
    }
    .packagepatterndaypatterntable input{
        margin-top:10px;
    }
    .mgraphiclogotable img{
       /* display:block;*/
    }
    .mgraphiclogotable input{
       /* float:right;*/
    }
    input[name="spellButton"] {
       /* padding: 0;
        border: none;
        line-height: 40px;
        text-align: center;
        background: none;*/
    }
    .fixAlt {
/*        text-align: center;*/
    }
    .carousel-control.left, .carousel-control.right { background-image: none }
</style>
<!--END Universal styles-->

</head>

<body>

<div class="container">
    <div class="row" style="padding-bottom:30px;">
    <!--    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
        <div class="col-md-12 col-lg-12">
            <div class="customHeader">
<nav class="navbar navbar-inverse navbar-static-top navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            <a class="navbar-brand" href="WebBaseMain.do?NextURL=/jsp/login.jsp&urlaction=push"><img src="images/logo.png"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="defaultNavbar1">
            <ul class="nav navbar-nav">
                
<%  if (session.getAttribute("pageName") == "login.jsp" || session.getAttribute("pageName") == "newaccount.jsp"){ %>
    <li><a href="javascript:document.LoginUser2.submit()">Build Ad Now<span class="sr-only"></span></a></li>
    <%}%>
        

           
<%  if (session.getAttribute("pageName") != "login.jsp" && session.getAttribute("pageName") != "newaccount.jsp"){ %>
    
    <webbase:showIf expression="isFakeCustomerLoggedIn">
        <%  if (session.getAttribute("pageName") == "ReviewOrder.jsp"){ %>
		<li class="clickable"><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Login<!--<span class="caret"></span>--></a></li>
		<li class="clickable"><a href="WebBaseMain.do?cmd=NewCustomerLL">Create New Account</a></li>
        <%}%>    
		</webbase:showIf>
    
    <webbase:showIf expression="!isFakeCustomerLoggedIn">
        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp&urlaction=push">Account Summary</a></li>
<!--        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/AdOrderSearch.jsp&urlaction=push">Search Orders</a></li>-->
        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp&urlaction=push">My Orders</a></li>
<!--        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/ViewProfileSummary.jsp&urlaction=push">My Profile</a></li>-->
<!--
         <li class="clickable"><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('profile')">My Profile
                    </a></li>
-->
    </webbase:showIf>
    <li class="clickable"><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('Deadlines')">Deadlines</a></li>
    <li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/SetAdType.jsp">Start Over</a></li>
       <webbase:showIf expression="!isFakeCustomerLoggedIn" > <li> <a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp" class="menuLinks">Log Out</a></li></webbase:showIf>
<%}%>
<!--                END showif tag for latelogin-->
                       
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="tel:1-866-938-3010">Need help? Call us at 866-938-3010</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
            </div>
        </div>
    </div>
</div>

<div style="padding:10px">