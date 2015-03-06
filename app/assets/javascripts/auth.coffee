jQuery(document).delegate '.sign-form form', 'submit', (evt)->
  evt.preventDefault()
  
  $form = jQuery(this)
  data = $form.serialize()
  url = $form.attr('action')

  jQuery.ajax
    type: 'POST'
    url: url
    data: data
    success: (res)->
      show_auth_info 'success', '登录成功', ->
        Turbolinks.visit '/'
    error: (res)->
      show_auth_info 'error', '邮箱/密码不正确'

show_auth_info = (klass, msg, func)->
  jQuery('.sign-form .auth-msg')
    .removeClass('error').removeClass('success')
    .addClass(klass)
    .html msg
    .css
      'opacity': 0
      'margin-top': 0
    .show()
    .animate
      'opacity': 1
      'margin-top': 30
    , ->
      func() if func