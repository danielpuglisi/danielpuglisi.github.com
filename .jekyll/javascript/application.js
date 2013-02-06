$(document).ready(function(){

  $('.tiles li').hover(function() {
    $('a', this).stop(true,true).fadeIn('fast');
  }, function() {
    $('a', this).fadeOut('fast');
  })

})
