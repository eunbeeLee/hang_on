/**
 * 
 */
const $clMa = $( ".cloud-manager" );
const $noMa = $( ".notice-manager" );
const $exp = $( ".experiment" );
const $back = $( "#backBox" );
const sideArr=[$clMa,$noMa,$exp,$back];

$('#cloudNav').click(function(e) { 
	e.preventDefault(); 
	sideHide();
	$clMa.css( "display",'block');
});
$('#notiNav').click(function(e) { 
	e.preventDefault(); 
	sideHide();
	$noMa.css( "display",'block');
});
$('#sttNav').click(function(e) { 
	e.preventDefault(); 
	sideHide();
	$exp.css( "display",'block');
	if($exp.css("display")=='block'){
		$back.css( "display",'block');
	}
	localStorage.clear();
});

$('#chatNav').click(function(e) { 
	e.preventDefault(); 
	sideHide();
	$back.css( "display",'block');
});

// 사이드 하이드
function sideHide(){
	for(side of sideArr){
		side.css( "display",'none');
	}
}
