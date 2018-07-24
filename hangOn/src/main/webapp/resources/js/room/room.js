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
	sideHide($clMa);
	if($clMa.css( "display")=='block'){
		$clMa.css( "display",'none');
		return;
	}
	$clMa.css( "display",'block');
});
$('#notiNav').click(function(e) { 
	e.preventDefault(); 
	sideHide($noMa);
	if($noMa.css( "display")=='block'){
		$noMa.css( "display",'none');
		return;
	}
	$noMa.css( "display",'block');
});
$('#sttNav').click(function(e) { 
	e.preventDefault(); 
	sideHide($exp);
	if($exp.css( "display")=='block'){
		$exp.css( "display",'none');
		return;
	}
	$exp.css( "display",'block');
	if($exp.css("display")=='block'){
		$back.css( "display",'block');
	}
	localStorage.clear();
});

$('#chatNav').click(function(e) { 
	e.preventDefault(); 
	sideHide($back);
	if($back.css( "display")=='block'){
		$back.css( "display",'none');
		return;
	}
	$back.css( "display",'block');
});

// 사이드 하이드
function sideHide(sideName){
	for(side of sideArr){
		if(side==sideName){
			continue;
		}
		side.css( "display",'none');
	}
}
