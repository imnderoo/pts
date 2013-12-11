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

$(function() {

	$(".searchPlate96").autocomplete({
		source : searchPlate96Path,
		minLength : 3	,
		delay : 50,
		autoFocus : true,
		
		response : function(event, ui) {
			var field_id=$(this).attr('id').replace('.name', '\\.id');
			$('#' + field_id).val('');
		},

		select : function(event, ui) {
			var field_id=$(this).attr('id').replace('.name', '\\.id');
			$('#' + field_id).val(ui.item.id);
		},

		close : function(event, ui) {
			var field_name=$(this).attr('id');
			var field_id=$(this).attr('id').replace('.name', '\\.id');
			if ($('#' + field_id).val() == '-1') {
				$('#' + field_name).val('');
			}
		}
	});
	
	$(".datepicker").datepicker({
		dateFormat: "dd-mm-yy"	
	});
});