$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseover",function(){
	$(this).children(".more-btn").css("opacity",1)
});
$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseout",function(){
	$(this).children(".more-btn").css("opacity",0);
});


$('.btn-upload').click(function(){
	$("#cloudForm > input[type=file]").trigger('click');
});

$('#cloudUpload').bind('change', function() {
    var idx = $(this).parent().parent().index();
    var frm = document.getElementById('cloudForm');
    frm.method = 'POST';
    frm.enctype = 'multipart/form-data';
  
    var fileData = new FormData(frm);
  
    // ajax
    $.ajax({
        url:'upload.json',
        type:'POST',
        data:fileData,
        async:false,
        cache:false,
        contentType:false,
        processData:false
    }).done(function(response){
        alert(response);
    });
  
});
  

