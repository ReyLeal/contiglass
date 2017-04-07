$(document).on('turbolinks:load',function(){     // Navbar Scroll-Spy
  var offset = $('.courasel-container').offset().top;
  var stop = Math.round($(window).scrollTop());
  if(stop > offset) {
    $('ul.nav li a').css('font-size', '1.25rem');
    $('ul.nav li a').css('height', '4rem');
    $('ul.nav li a').css('padding-top', '10px');
    $('ul.nav li').css('height', '4rem');
    $('ul.nav li.active').css('height', '4rem');
    $('.navbar').css('height', '5rem');
    $('a.navbar-brand').css('height', '4.75rem');
  } else {
    $('ul.nav li a').css('font-size', '1.5rem');
    $('ul.nav li a').css('height', '5rem');
    $('ul.nav li a').css('padding-top', '15px');
    $('ul.nav li').css('height', '5rem');
    $('ul.nav li.active').css('height', '5rem');
    $('.navbar').css('height', '6rem');
    $('a.navbar-brand').css('height', '5.5rem');
  };

  $(window).on('scroll', function() {
    var stop = Math.round($(window).scrollTop());
    if(stop > offset) {
      $('ul.nav li a').css('font-size', '1.25rem');
      $('ul.nav li a').css('height', '4rem');
      $('ul.nav li a').css('padding-top', '10px');
      $('ul.nav li').css('height', '4rem');
      $('ul.nav li.active').css('height', '4rem');
      $('.navbar').css('height', '5rem');
      $('a.navbar-brand').css('height', '4.75rem');
    } else {
      $('ul.nav li a').css('font-size', '1.5rem');
      $('ul.nav li a').css('height', '5rem');
      $('ul.nav li a').css('padding-top', '15px');
      $('ul.nav li').css('height', '5rem');
      $('ul.nav li.active').css('height', '5rem');
      $('.navbar').css('height', '6rem');
      $('a.navbar-brand').css('height', '5.5rem');
    };
  });
  $('.overlay-btn-btn.stairs').on('click', function() {
    document.getElementById('link-to-stairs').click();
  });
  $('.overlay-btn-btn.metal').on('click', function() {
    document.getElementById('link-to-metal').click();
  });
  $('.glass-dropdown').click(function(){
    if ($('.glass-dropdown').hasClass('inactive')){
      $('.navbar-nav').height('63rem');
      $('.glass-dropdown').removeClass('inactive');
      $('.glass-dropdown').addClass('activated');
    } else {
        $('.navbar-nav').height('29rem');
        $('.glass-dropdown.activated').removeClass('activated');
        $('.glass-dropdown.activated').addClass('inactive');
    }
  });
  $('.metal-dropdown').click(function(){
    if ($('.metal-dropdown').hasClass('inactive')){
      $('.navbar-nav').height('39rem');
      $('.metal-dropdown').removeClass('inactive');
      $('.metal-dropdown').addClass('activated');
    } else {
        $('.navbar-nav').height('29rem');
        $('.metal-dropdown.activated').removeClass('activated');
        $('.metal-dropdown.activated').addClass('inactive');
    }
  });
});

if (window.matchMedia('(min-width: 501px)').matches) {
  $(document).ready(function(){     // Slide-in Scroll-Spy
    var offset = $('.courasel-container').offset().top + 300;
    var stop = Math.round($(window).scrollTop());
    if(stop > offset) {
      $('.left-slide-in').animate({right: '0'}, 2000);
      $('.right-slide-in').animate({right: '0'}, 2000);
    } else {
      $('.left-slide-in').css('right', '100vw');
      $('.right-slide-in').css('right', '-100vw');
    };

    $(window).on('scroll', function() {
      var offset = $('.courasel-container').offset().top + 100;
      var stop = Math.round($(window).scrollTop());
      if(stop > offset) {
        $('.left-slide-in').animate({right: '0'}, 2000);
        $('.right-slide-in').animate({right: '0'}, 2000);
      };
    });
  });

  $(document).on('turbolinks:load', function() {
    $('.next-slide-right').click(function() {
      if($('ol>li').last().hasClass('active')){
        $('ol>li').first().click();
      } else {
        $('li.active').next().click();
      };
    });
    $('.prev-slide-left').click(function() {
      if($('ol>li').first().hasClass('active')){
        $('ol>li').last().click();
      } else {
        $('li.active').prev().click();
      };
    });

    $('.cta-text h1').mouseover(function() {
      $('.cta-bot').css('filter', 'none');
    });
    $('.cta-text h1').mouseleave(function() {
      $('.cta-bot').css({
        'filter': 'brightness(50%) blur(3px)',
        '-webkit-filter': 'brightness(50%) blur(3px)',
        'transition': 'filter 1s, -webkit-filter 1s'
      });
    });
  });


  $(document).on('turbolinks:load', function() {
    $('.left-slide-in').mouseover(function(div) {
      $(div).css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
      $('.left-overlay').css({
        'height': '50rem',
        'background-color': '#607D8B',
        'opacity': '.9',
        'display': 'block',
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
    });
    $('.left-overlay').mouseover(function(div) {
      $(div).css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
      $('.left-slide-in').css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
    });
    $('.left-slide-in').mouseout(function(div) {
      $(div).css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
      $('.left-overlay').css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
    });
    $('.left-overlay').mouseleave(function() {
      $('.left-slide-in').css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
      $('.left-overlay').css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)',
        'display': 'none'
      })
    });

    $('.right-slide-in').mouseover(function(div) {
      $(div).css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
      $('.right-overlay').css({
        'height': '50rem',
        'background-color': '#607D8B',
        'opacity': '.9',
        'display': 'block',
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
    });
    $('.right-overlay').mouseover(function(div) {
      $(div).css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
      $('.right-slide-in').css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
    });
    $('.right-slide-in').mouseout(function(div) {
      $(div).css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
      $('.right-overlay').css({
        'transition': 'transform 600ms',
        'transform': 'translateY(-15px)'
      });
    });
    $('.right-overlay').mouseleave(function() {
      $('.right-slide-in').css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)'
      });
      $('.right-overlay').css({
        'transition': 'transform 200ms',
        'transform': 'translateY(0px)',
        'display': 'none'
      });
    });
  });
};
