//= require active_admin/base
//= require active_admin/select2
//= require froala
//= require jquery-fileupload


$(document).ready ->
  $('#post_content').froalaEditor
    imageUploadURL: '/attachment/upload.json'
    imageUploadMethod: 'POST'
    imageUploadParams: authenticity_token: $('meta[name="csrf-token"]').attr('content')
  return




