jQuery(document).delegate '.page-users-show li a.delete', 'ajax:complete', (evt)->
  jQuery(this).closest('li').fadeOut().remove();