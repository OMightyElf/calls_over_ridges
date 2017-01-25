// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require froala/froala_editor.min
//= require froala/plugins/align.min
//= require froala/plugins/char_counter.min
//= require froala/plugins/code_view.min
//= require froala/plugins/colors.min
//= require froala/plugins/emoticons.min
//= require froala/plugins/entities.min
//= require froala/plugins/file.min
//= require froala/plugins/font_family.min
//= require froala/plugins/font_size.min
//= require froala/plugins/fullscreen.min
//= require froala/plugins/image.min
//= require froala/plugins/image_manager.min
//= require froala/plugins/inline_style.min
//= require froala/plugins/line_breaker.min
//= require froala/plugins/link.min
//= require froala/plugins/lists.min
//= require froala/plugins/paragraph_format.min
//= require froala/plugins/paragraph_style.min
//= require froala/plugins/quote.min
//= require froala/plugins/table.min
//= require froala/plugins/save.min
//= require froala/plugins/url.min
//= require froala/plugins/video.min

$( document ).ready(function() {
  $('.froala_editor').froalaEditor({
    language: 'zh_tw',
    imageMaxSize: 1 * 1024 * 1024, //限制1MB
    heightMin: 480,
    // toolbarSticky: true # tool bar 跟著捲軸
    toolbarStickyOffset: 0.,
    toolbarButtons: ['bold', 'italic', 'underline', 
    'strikeThrough', 'fontFamily', 'fontSize', 'subscript', 'superscript', '|', 
    'color', 'emoticons', 'paragraphStyle', '|', 'paragraphFormat', 
    'align', 'formatOL', 'formatUL', 'html', 'fullscreen', '-', 'outdent', 'indent', 'quote', 'insertHR',
    '|', 'insertLink', 'insertImage', 'insertVideo', 'insertTable', 
    'undo', 'redo', 'clearFormatting'],
    imageUploadURL: '/froala_editor/upload_image',
    htmlRemoveTags: [],
    htmlAllowedEmptyTags: ['textarea', 'a', 'iframe', 'object', 'video', 'style', 'script', 'div']
  })
  .on('froalaEditor.image.error', function (e, editor, error, response) {
    // Bad link.
    if (error.code == 1) { }

    // No link in upload response.
    else if (error.code == 2) { }

    // Error during image upload.
    else if (error.code == 3) { }

    // Parsing response failed.
    else if (error.code == 4) { }

    // Image too text-large.
    else if (error.code == 5) { 
      sweetAlert("圖片大小超過1MB", "請重新選擇檔案", "error");
    }

    // Response contains the original server response to the request if available.
  });
});