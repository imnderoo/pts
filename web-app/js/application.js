if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});

		$('.form-load').submit(function() {
			$('#spinner').fadeIn();
		});

	})(jQuery);
}
