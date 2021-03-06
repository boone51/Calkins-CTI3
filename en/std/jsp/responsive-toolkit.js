/*!
 * Responsive Bootstrap Toolkit
 * Author:    Maciej Gurban
 * License:   MIT
 * Version:   2.3.0 (2015-02-15)
 * Origin:    https://github.com/maciej-gurban/responsive-bootstrap-toolkit
 */
;var ResponsiveBootstrapToolkit=function(e){var i={interval:300,breakpoints:{xs:e('<div class="device-xs visible-xs"></div>').appendTo("body"),sm:e('<div class="device-sm visible-sm"></div>').appendTo("body"),md:e('<div class="device-md visible-md"></div>').appendTo("body"),lg:e('<div class="device-lg visible-lg"></div>').appendTo("body")},timer:new Date,is:function(e){return i.breakpoints[e].is(":visible")},current:function(){var n="unrecognized";return e.each(i.breakpoints,function(e){i.is(e)&&(n=e)}),n},changed:function(){var e={};return function(n,s){var d=d?null:i.timer.getTime();if(e[d]&&clearTimeout(e[d]),"undefined"==typeof s)var s=i.interval;e[d]=setTimeout(n,s)}}()};return i}(jQuery);