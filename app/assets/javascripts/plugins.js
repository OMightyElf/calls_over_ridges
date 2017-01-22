// Avoid `console` errors in browsers that lack a console.
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];

        // Only stub undefined methods.
        if (!console[method]) {
            console[method] = noop;
        }
    }
}());
; (function ($) {
	var settings = {
		selector: ' > li > a > img',
		dataPC: 'img-pc',
		dataMobile: 'img-mobile'
	},
	methods = {
		init: function (options) {
			var $this = $(this);
			settings = $.extend({}, settings, options);
			methods.reset.apply($this);
			$(window).on('resize', function (e) {
				//clearTimeout($.data(this, 'resizeTimerSlider'));
				//$.data(this, 'resizeTimerSlider', setTimeout(function () {
				methods.reset.apply($this);
				//}, 100));
			});
			return this;
		},
		reset: function () {
			var $this = $(this);
			var toMode = Modernizr.mq('(max-width: 768px)') ? 'Mobile' : 'PC';
			var oeMode = $this.data('mode');
			if (toMode != oeMode) {
				var dataName = toMode == 'PC' ? settings.dataPC : settings.dataMobile;
				//$this.parents('.bx-viewport').css('overflow', 'visible');
				$(settings.selector, $this).each(function (i, el) {
					$(el).prop('src', $(el).data(dataName));
				});
				$this.data('mode', toMode);
			}
		}
	};

	$.fn.aplusRwdSlider = function (methodOrOptions) {
		if (methods[methodOrOptions]) {
			return methods[methodOrOptions].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof methodOrOptions === 'object' || !methodOrOptions) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + methodOrOptions + ' does not exist on jQuery.magicLine');
		}
	};
})(jQuery);
// Place any jQuery/helper plugins in here.

