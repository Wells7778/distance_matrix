$(document).on('turbolinks:load', function() {
  if ($('#lists-show').length > 0) {
    new Clipboard('.copy')
    $('.copy').on('click', function(e) {
      var tr = e.target.parentNode.parentNode
      var serviceName = $(tr).find('.text-name')
      $(serviceName).toggleClass('text-line-through bg-dark')
    })
    $('.disable-line-through').on('click', function(e) {
      $('.text-line-through').removeClass('text-line-through bg-dark')
    })
  }
})
$(document).on('turbolinks:before-render', function() {
  $('.disable-line-through').off('click', function() {})
  $('.copy').off('click', function() {})
})
