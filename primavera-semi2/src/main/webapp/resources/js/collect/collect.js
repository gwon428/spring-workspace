const navIcons = document.querySelectorAll("#direc");
const list = document.querySelectorAll(".image-content");
     
navIcons[0].addEventListener("click", function(){
	list.forEach((a)=>{
		a.classList.remove("header-main-bottom-right");
	});
});
     
navIcons[1].addEventListener("click", function () {
	list.forEach((a) => {
		a.classList.add("header-main-bottom-right");
	});
});


$(document).ready(function(){
					$('.baa').each(function() {
						$(this).click(function() {
							let layer = $(this).parent().next();
							layer.toggle(
								function() {layer.addClass('hide')},
								function() {layer.addClass('show')}
							);
						})
					});
				});