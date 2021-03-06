/**
 * util.js 
 * by Garrett Smith 
 * Provides functionality for working nodeLists.
 */
Browser={isSupported:function(){return(Boolean(document.getElementsByTagName)&&Boolean(document.getElementById));},id:new function(){var ua=navigator.userAgent;var OMNI=ua.indexOf("Omni")>0;this.OP5=ua.indexOf("Opera 5")>=0||ua.indexOf("Opera 6")>=0;this.OP7=ua.indexOf("Opera 7")>=0;this.MAC=ua.indexOf("Mac")>0;if(!this.OP5&&!OMNI){this.IE5=ua.indexOf("MSIE 5")>0;this.IE5_0=ua.indexOf("MSIE 5.0")>0;this.NS6=ua.indexOf("Gecko")>0;this.MOZ=this.NS6&&ua.indexOf("Netscape")==-1;this.MAC_IE5=this.MAC&&this.IE5;this.IE6=ua.indexOf("MSIE 6")>0;this.KONQUEROR=ua.indexOf("Konqueror/")>0;}}};var px="px";TokenizedExps={};function getTokenizedExp(t){var x=TokenizedExps[t];if(!x)
x=TokenizedExps[t]=new RegExp("\\b"+t+"\\b");return x;}function hasToken(s,t){return getTokenizedExp(t).test(s);};function getChildNodesWithClass(p,kl){var coll=p.childNodes;var rc=[];var exp=getTokenizedExp(kl);for(var i=0,n=0;i<coll.length;i++)
if(exp.test(coll[i].className))
rc[n++]=coll[i];return rc;}function getElementsWithClass(p,t,kl){var rc=[];var exp=getTokenizedExp(kl);var coll=(t=="*"&&p.all)?p.all:p.getElementsByTagName(t);for(var i=0,n=0;i<coll.length;i++){if(exp.test(coll[i].className))
rc[n++]=coll[i];}return rc;}function get_elements_with_class_from_classList(el,t,classList){var rc=new Array(0);var coll=(t=="*"&&el.all)?el.all:el.getElementsByTagName(t);var exps=[];for(var i=0;i<classList.length;i++)
exps[i]=getTokenizedExp(classList[i]);for(var j=0,coLen=coll.length;j<coLen;j++){kloop:for(var k=0;k<classList.length;k++){if(exps[k].test(coll[j].className)){rc[rc.length]=coll[j];break kloop;}}}return rc;}function findAncestorWithClass(el,kl){var exp=getTokenizedExp(kl);for(var p=el.parentNode;p!=null;){if(exp.test(p.className) )
return p;p=p.parentNode;}return null;}function getDescendantById(p,id){var childNodes=p.all?p.all:p.getElementsByTagName("*");for(var i=0,len=childNodes.length;i<len;i++)
if(childNodes[i].id==id)
return childNodes[i];return null;}function removeClass(el,kl){el.className=el.className.replace(getTokenizedExp(kl),"").normalize();}
function repaintFix(el){el.style.visibility='hidden';el.style.visibility='visible';}