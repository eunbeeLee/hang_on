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
	$( ".experiment" ).toggle(  "slow" );
});

$('#chatNav').click(function(e) { 
	e.preventDefault(); 
	$( "#backBox" ).fadeToggle(200);
});

