$(function () {
	$('.header__toggle').click(function (e) {
		e.preventDefault();
		$('body').toggleClass('menu--on');
	});

	$('[data-fancybox="true"]').fancybox();

	$('[data-fancybox-close="true"]').click(function (e) {
		e.preventDefault();
		$.fancybox.close();
	});

	$('[data-reset="true"]').click(function (e) {
		e.preventDefault();
		$(this).closest('form')[0].reset();
	});
});