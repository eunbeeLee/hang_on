/**
 * 
 */

$('#downNav').click(function(e) { 
	e.preventDefault(); 
	$( ".download-manager" ).toggle(  "slow" );
});

$('#chatNav').click(function(e) { 
	e.preventDefault(); 
	$( "#chatBigBox" ).fadeToggle(200);
});

