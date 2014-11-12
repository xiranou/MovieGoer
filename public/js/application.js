$(document).ready(function() {
  $('body').on('click', 'a#signup', function(e) {
    e.preventDefault();
    console.log(1);
    $("#signup-form").toggle();
    $("#login-form").hide();
  });

  $('body').on('click', 'a#login', function(e) {
    e.preventDefault();
    console.log(2);
    $("#login-form").toggle();
    $("#signup-form").hide();
  });

  $('body').on('click','a#logout',function(e) {
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
  });

  $('body').on('click', '#movie-link', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(response) {
      $('.container').html(response);
    });
  });

  $('body').on('click', '#review-link', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(response) {
      $('.container').html(response);
    });
  });

  $('body').on('click', '#home-link', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(moviesAllPartical) {
      $('.container').html(moviesAllPartical);
    });
  });

  $('body').on('click', '.new-review', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(response) {
      $link.closest('.movies').find('#new-review-single').remove();
      $link.closest('.movie').append(response);
    });
  });

});
