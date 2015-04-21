jQuery(document).delegate '.page-users-show li a.delete', 'ajax:complete', (evt)->
  jQuery(this).closest('li').fadeOut().remove();

jQuery(document).delegate '.page-users-show .action a.new', 'click', ->
  jQuery(this).hide()
  jQuery(this).closest('.action').find('form').slideDown()

jQuery(document).delegate '.page-users-show .action form a.submit', 'click', ->
  jQuery(this).closest('form').submit()

jQuery(document).delegate '.page-users-show .action form a.cancel', 'click', ->
  jQuery(this).closest('form').find('textarea').val('')
  jQuery(this).closest('form').slideUp 'normal', =>
    jQuery(this).closest('.action').find('a.new').show()

jQuery(document).delegate '.page-users-show .action form', 'ajax:complete', (evt, res)->
  jQuery(this).closest('form').slideUp 'normal', =>
    jQuery(this).closest('form').find('textarea').val('')
    jQuery(this).closest('.action').find('a.new').show()
    if res.status == 200
      ul = jQuery(evt.target).closest('.tasks').find('ul')
      ul.append res.responseText
      ul.find('li:last').effect "highlight", 2000

