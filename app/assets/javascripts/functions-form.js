$(document).ready(function(){
	$('#championship_date_initial_inscription , #championship_date_end_inscription').datepicker({ dateFormat: "yy-mm-dd" });
	$('#date_start').datepicker({dateFormat: 'yy-mm-dd'});
	$('#player_name').focus(function(){
      $(this).val('');
	});
	$(".autocomplete-player .input-group input").autocomplete({
		delay: 500,
		minLength: 1,
		source: function(request, response) {
			$.getJSON("http://localhost:3000/search-players?term="+request.term+"&team_id="+ $('#team_id').val(),
			function(data) {
				// data is an array of objects and must be transformed for autocomplete to use
				var array = data.error ? [] : $.map(data, function(t) {
					return {
						label: t.id + " - " + t.first_name  + "  "+ t.last_name +  " (" + t.tshirt_number + ")",
						//label: t.id,
						id: t.id							};
				});
				response(array);
			});
		},
		select: function( event, ui ){
             $('#player_id').val(ui.item.id);
		},
	});


});