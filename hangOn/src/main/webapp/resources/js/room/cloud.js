$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseover",function(){
	$(this).children(".more-btn").css("opacity",1)
});
$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseout",function(){
	$(this).children(".more-btn").css("opacity",0);
});
