$(document).ready(function() {
  $('body').on('click', 'a#signup', function(e) {
    e.preventDefault();
    $("#signup-form").toggle();
    $("#login-form").hide();
  });

  $('body').on('click', 'a#login', function(e) {
    e.preventDefault();
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
    .done(function(reviews) {
      $('.container').html(reviews);
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
    .done(function(newReviewForm) {
      $link.find('.new-review-single').remove();
      $link.find('.new-review-single').remove();
      $link.after(newReviewForm);
    });
  });

  $('body').on('submit', '.new-review-single', function(e) {
    e.preventDefault();
    $form = $(e.target);
    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      dataType: 'html',
      data: $form.serialize(),
    })
    .done(function(response) {
      $('.container').html(response);
    });
  });

  $('body').on('click', '.cancel-form-btn', function(e) {
    e.preventDefault();
    $(e.target).closest('form').remove();
  });

  $('body').on('click', '#new-review-select', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(newReviewSelectForm) {
      $link.closest('.movies').find('#new-review-all').remove();
      $link.closest('.movies').append(newReviewSelectForm);
    });
  });

  $('body').on('click', '.movie-reviews', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(reviews) {
      $('.container').html(reviews);
    });
  });

  $('body').on('click', '.movie-link', function(e) {
    e.preventDefault();
    $link = $(e.target);
    $.ajax({
      url: $link.attr('href'),
      type: 'GET',
      dataType: 'html',
    })
    .done(function(moviesAll) {
      $('.container').html(moviesAll);
    });
  });

  $('body').on('click', '.delete-review', function(e) {
    e.preventDefault();
    $link = $(e.target);
    console.log($link.attr('href'));
    $.ajax({
      url: $link.attr('href'),
      type: 'Get',
      dataType: 'html',
    })
    .done(function(deleteConfirmation) {
      $link.after(deleteConfirmation);
    });
  });

  $('body').on('submit', '.delete-form', function(e) {
    e.preventDefault();
    $form = $(e.target);
    console.log($form.attr('method'));
    $.ajax({
      url: $form.attr('action'),
      type: "DELETE",
    })
    .done(function(reviews) {
      $('.container').html(reviews);
    });

  });

  $('body').on('click', '.cancel-delete', function(e) {
    e.preventDefault();
    $button = $(e.target);
    $button.closest('.delete-form').remove();
  });

});
