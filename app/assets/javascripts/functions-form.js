$(document).ready(function(){
	$('#championship_date_initial_inscription , #championship_date_end_inscription').datepicker({ dateFormat: "yy-mm-dd" });
	$('#date_start').datepicker({dateFormat: 'yyy-dd-mm'});

	$("#team_name").autocomplete({
		delay: 500,
		minLength: 1,
		source: function(request, response) {
			$.getJSON("http://localhost:3000/search-players?term="+request.term,
			function(data) {
				// data is an array of objects and must be transformed for autocomplete to use
				var array = data.error ? [] : $.map(data, function(t) {
					return {
						label: t.name + " (" + t.id + ")",
						url: t.id							};
				});
				response(array);
			});
		},
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
		},
	});


});