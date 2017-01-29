$(document).ready(function(){

	var last = "home";
	check();
	

	$('#home-click').click(function(){
		$.ajax({
			url: '/home',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded home');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "home";
		localStorage.setItem("last", last);
		sessionStorage.setItem("check", 1);
		localStorage.setItem("check", 1);
	});

	$('#info-click').click(function(){
		$.ajax({
			url: '/info',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded info');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "info";
		localStorage.setItem("last", last);
		sessionStorage.setItem("check", 1);
		localStorage.setItem("check", 1);
	});

	$('#project-click').click(function(){
		$.ajax({
			url: '/project',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded project');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "project";
		localStorage.setItem("last", last);
		sessionStorage.setItem("check", 1);
		localStorage.setItem("check", 1);
	});

	$('#docs-click').click(function(){
		$.ajax({
			url: '/code',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded code');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "docs";
		localStorage.setItem("last", last);
		sessionStorage.setItem("check", 1);
		localStorage.setItem("check", 1);
	});

	$(document).on('click', '#reset', function(){
		document.getElementById("loading-gif").style.visibility = 'hidden';
	});

	$(document).on('submit', '#form', function(event){
		event.preventDefault();

		imglink = document.getElementById('img-link').value;
		height = document.getElementById('max-height').value;
		width = document.getElementById('max-width').value;
		numcolors = document.getElementById('num-colors').value;
		fabriccount = document.getElementById('fabric-count').value;

		var error_print = "Error(s):\n\n";
		var error_found = 0;

		if (isNaN(height)) {
			error_found = 1;
			error_print += "Your maximum height is not an integer number\n\n";
		} else if (height <= 0 || height > 20) {
			error_found = 1;
			error_print += "Your maximum height is out of desired range: 1 - 20\n\n";
		}

		if (isNaN(width)) {
			error_found = 1;
			error_print += "Your maximum width is not an integer number\n\n";
		} else if (width <= 0 || width > 20) {
			error_found = 1;
			error_print += "Your maximum width is out of desired range: 1 - 20\n\n";
		} 

		if (isNaN(numcolors)) {
			error_found = 1;
			error_print += "Your number of colors is not an integer number\n\n";
		} else if (numcolors <= 0 || numcolors > 20) {
			error_found = 1;
			error_print += "Your number of colors is out of desired range: 1 - 20\n\n";
		} 

		if (isNaN(fabriccount)) {
			error_found = 1;
			error_print += "Your fabric count is not an integer number\n\n";
		} else if (fabriccount <= 0 || fabriccount > 20) {
			error_found = 1;
			error_print += "Your fabric count is out of desired range: 1 - 20\n\n";
		} 


		if (error_found) {
			// not valid inputs
			alert(error_print);
			sessionStorage.setItem('valid', 0);
		} else {
			document.getElementById("loading-gif").style.visibility = 'visible';
			sessionStorage.setItem('valid', 1);
			params = {
				'imglink': String(imglink),
				'height': String(height),
				'width': String(width),
				'numcolors': String(numcolors),
				'fabriccount': String(fabriccount)
			};
			$.ajax({
				url: "/create",
				type: "GET",
				data: JSON.stringify(params),
				success: function(response) {
					console.log('finished');
					console.log(response);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					console.log(xhr.status);
					console.log(thrownError);
				}
			});
		}
	});
});


function check() {
	var check1 = localStorage.getItem("check");
	var check2 = sessionStorage.getItem("check");
	if (check1 == check2) {
		refresh();
	} else {
		$.ajax({
			url: '/home',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded home');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "home";
		localStorage.setItem("last", last);
	}
};

function refresh() {
	var last = localStorage.getItem("last");
	if (last == "info") {
		$.ajax({
			url: '/info',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded info');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "info";
		localStorage.setItem("last", last);
	} else if (last == "docs") {
		$.ajax({
			url: '/code',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded code');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "docs";
		localStorage.setItem("last", last);
	} else if (last == "project") {
		$.ajax({
			url: '/project',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded project');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "project";
		localStorage.setItem("last", last);
	} else {
		$.ajax({
			url: '/home',
			type: 'GET',
			dataType: 'html',
			success: function(html) {
				console.log('loaded home');
				var result = $('<div />').append(html).find('#main').html();
            	$('#main').html(result);
			},
			error: function(response) {
				console.log('error');
			}
		});
		last = "home";
		localStorage.setItem("last", last);
	} 
};






