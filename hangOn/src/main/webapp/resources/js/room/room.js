/**
 * 
 */

$('#cloudNav').click(function(e) { 
	e.preventDefault(); 
	$( ".cloud-manager" ).toggle(  "slow" );
});
$('#notiNav').click(function(e) { 
	e.preventDefault(); 
	$( ".notice-manager" ).toggle(  "slow" );
});
$('#sttNav').click(function(e) { 
	e.preventDefault(); 
	const $exp = $( ".experiment" );
	$exp.toggle(  "slow" );
	if($exp.css("display")=='block'){
		$( "#backBox" ).show();
	}
	localStorage.clear();
});

$('#chatNav').click(function(e) { 
	e.preventDefault(); 
	$( "#backBox" ).fadeToggle(200);
});

