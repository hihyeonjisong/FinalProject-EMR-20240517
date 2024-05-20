$(function(){
	var pagingArea = $("#pagingArea");
	var searchForm = $("#searchForm");

	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});