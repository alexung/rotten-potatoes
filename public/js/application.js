$(document).ready(function() {

	var counter = 0,
	$items = $('#slideshow figure'),
	numItems = $items.length;

	var showCurrent = function() {

		var itemToShow = Math.abs(counter%numItems);

		$items.removeClass('show');

		$items.eq(itemToShow).addClass('show');

	};

	$('.next').on('click', function() {
		counter++;
		showCurrent();
	});

	$('.prev').on('click', function() {
		counter--;
		showCurrent();
	});

// --comment box ajax below --

	$('#comment-box').submit(function(event) {
		event.preventDefault();
		var comment = $('#comment-text').val()
		$.ajax({
			type: "POST",
			url: $('#comment-box').attr("action"),
			data: {text: comment},
			dataType: 'JSON'
			//stuff I'm sending
		}).done(function(response) {
			console.log(response);
			$('#comments').append("User: " + response['user']['name'] + "<br> Time: " + response['comment']['created_at'] + "<br> Comment: " + response['comment']['text'])
			console.log(response)
			$('#comment-text').val('');
			// stuff i'm getting back
		});
	});

});
