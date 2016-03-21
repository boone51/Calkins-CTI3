<!--<!DOCTYPE html>-->

<html lang="en">
<head><!--open header-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>AdbaseE</title>

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
<% if (session.getAttribute("pageName") == "GetPackageInformation.jsp") { %>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/utils/zapatec.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/lang/calendar-en.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-setup.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="../../../scripts/ZapatecCalendar-licensed/src/calendar-mactive.js"></SCRIPT>
    <link rel="stylesheet" type="text/css" href="../../../scripts/ZapatecCalendar-licensed/themes/winter.css" />
<%}%>
<!--END GetPackageInformation code-->

<!--BEGIN login.jsp code-->
<%  if (session.getAttribute("pageName") == "login.jsp"){ %>
    <style>
    .carousel {
  height: 300px;
  margin-bottom: 60px;
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
<%}%>
<!--END SetPackage code-->
<script>
function changeCSS(selSheet) {
    console.log('hit the function for the css');
    $('#mainCSS').attr("href", selSheet);
//.href="BS3/css/bootstrap-flat.css";
}
//BEGIN menuLeft hover code
$(function() {
  $('.menuLeft li').mouseover(function(){
        console.log('rollover hit');
        if ($('li ul li:hover').length) {
            $('li ul li:hover').css('background','gray');
        }else{
            $('li:hover').css('background','gray');
            $(this).children('a').css('color','white');
        }
    });
    $('.menuLeft li').mouseout(function(){
        $(this).css('background', 'transparent');
        $(this).children('a').css('color','black');
    });
});

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
        display:block;
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
  <div class="container-fluid" > 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      <a class="navbar-brand" href="WebBaseMain.do?NextURL=/jsp/login.jsp&urlaction=push"><img src="images/logo.png"></a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="defaultNavbar1">
      <ul class="nav navbar-nav">
        <li><a href="WebBaseMain.do?NextURL=/jsp/SetAdType.jsp">Build Ad Now<span class="sr-only"></span></a></li>
        <li><a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp&urlaction=push">Account Summary</a></li> 
          <li><a href="WebBaseMain.do?NextURL=/jsp/AdOrderSearch.jsp&urlaction=push" >Search Orders</a></li> 
          <li><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp&urlaction=push" >My Orders</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <li>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-53bfea00151a756b" async></script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<div class="addthis_sharing_toolbox" style="margin-top:10px"></div></li>
       
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