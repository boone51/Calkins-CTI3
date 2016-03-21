<script>
$(document).ready(function() {

		//
		$(".Ecategory a:nth-child(1)").addClass("popover-trigger");
//$( ".Ecategory" ).each(function( index ) {
//console.log('number '+index)
 // $( this ).addClass("popover");
//});


		  //
		var originalLeave = $.fn.popover.Constructor.prototype.leave;
		$.fn.popover.Constructor.prototype.leave = function(obj){
		  var self = obj instanceof this.constructor ?
			obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type)
		  var container, timeout;

		  originalLeave.call(this, obj);

		  if(obj.currentTarget) {
			container = $(obj.currentTarget).siblings('.popover')
			timeout = self.timeout;
			container.one('mouseenter', function(){
			  //We entered the actual popover – call off the dogs
			  clearTimeout(timeout);
			  //Let's monitor popover content instead
			  container.one('mouseleave', function(){
				$.fn.popover.Constructor.prototype.leave.call(self, self);
			  });
			})
		  }
		};


		$('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'auto', delay: {show: 50, hide: 400}});
		  //
		  $(".popover-trigger").mouseover(function() {
			el = $(this);
			testID = $(this).attr("id");
			console.log(testID);
			// $(".popover-trigger").not(this).popover('hide');
			$.get("testLoad.html", function(response) {
			  el.unbind('click').popover({
				content: response,
				title: 'Dynamic response!',
				trigger: 'click hover',
				html: true,
				delay: {show: 500, hide: 100}
			  }).popover('show');
			});
		  });
		  //
		  //
		/*END on Load function*/
		});
</script>
