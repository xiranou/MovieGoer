$(document).ready(function() {
  $('body').on('click', '#signup', function(e) {
    e.preventDefault();
    $("#signup-form").toggle();
    $("#login-form").hide();
  });

  $('body').on('click', '#login', function(e) {
    e.preventDefault();
    $("#login-form").toggle();
    $("#signup-form").hide();
  });

  $('body').on('click','#logout',function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
    })
    .done(function(welcomePartial) {
      $('header').replaceWith(welcomePartial);
    });
  });

  $('.cancel-btn').click(function(e) {
    e.preventDefault();
    $(e.target).closest('form').toggle();
  });

  $('#login-form').submit(function(e) {
    e.preventDefault();
    $form = $(e.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize(),
    })
    .done(function(welcomePartial) {
      $form.toggle(400);
      $('header').replaceWith(welcomePartial);
    });
  });

  $('#signup-form').submit(function(e) {
    e.preventDefault();
    $form = $(e.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize(),
    })
    .done(function(welcomePartial) {
      $form.toggle(400);
      $('header').replaceWith(welcomePartial);
    });
  });

  $('body').on('click', '#show-comments', function(e) {
    e.preventDefault();
    $(e.target).siblings('.comments').toggle(400);
    // $('.comments').toggle();
  });
});
