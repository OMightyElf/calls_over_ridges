//= require active_admin/base
//= require froala


$(document).ready ->
  $('#post_content').froalaEditor
    imageUploadURL: '/attachment/upload.json'
    imageUploadMethod: 'POST'
    imageUploadParams: authenticity_token: $('meta[name="csrf-token"]').attr('content')
  return




