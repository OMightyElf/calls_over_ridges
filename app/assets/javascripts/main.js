$(function () {
	$('.header__toggle').click(function (e) {
		e.preventDefault();
		$('body').toggleClass('menu--on');
	});

	$('.parallax').parallax();

	$('[data-fancybox="true"]').fancybox();

	$('[data-fancybox-close="true"]').click(function (e) {
		e.preventDefault();
		$.fancybox.close();
	});

	$('[data-reset="true"]').click(function (e) {
		e.preventDefault();
		$(this).closest('form')[0].reset();
	});
	$(".dropdown-button").dropdown({belowOrigin:true });

	function counter() {
		$(window).scroll(function () {
			$('.counter').each(function () {
				if ($(window).scrollTop() > $(this).offset().top-$(window).height()) {
					var $this = $(this).find('.counter__number'),
						countTo = $this.attr('data-count'),
						duration = Number($this.attr('data-duration')),
						easing = $this.attr('data-easing');
					if (!$this.data('star')) {
						$({ countNum: $this.text() }).animate({
							countNum: countTo
						},
						{
							duration: duration,
							easing: easing,
							step: function () {
								$this.text(Math.floor(this.countNum));
							},
							complete: function () {
								$this.text(this.countNum);
							}
						});
					};
					$this.data('star', true);
				}
			});
		}).trigger('scroll');
	}
	counter();
});