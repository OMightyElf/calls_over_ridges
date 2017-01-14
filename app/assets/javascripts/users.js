function readData() {
	$('#finishEdit').hide();
	$('#cancelEdit').hide();
	$('#editData').fadeIn();
	$('.input-field').each(function () {
		if ($(this).data('input') == 'radio') {
			var value = $(this).find('input:checked').val();
			switch (value) {
				case 'true':
				value = '是';
				break;
				case 'false':
				value = '否';
				break;
			}
		} else {
			var value = $(this).find('input').val();
		}
		$(this).hide().next('.value-field').fadeIn().find('.value').text(value);
	});
};