$(document).on('turbolinks:load',function(){
  $('a').click(function(){
    DataTarget = $(this).data("target");
    $(DataTarget).toggle(function() {
      imageWidth = $(DataTarget+' .modal-content img').width();
      document.getElementsByClassName('modal-content', function() {
        this.css('width', imageWidth + 'rem!important');
      })
    });
  });

  if ($('.index-container').val() != undefined) {
    $('.index-div').css('display', 'none');
    $('.index-banner').css('height', '60vh')
    $('.banner-picture').css({
      'height': '60vh',
      'background-repeat': 'no-repeat',
      'background-size': 'cover',
      'background-position': 'center',
      'box-shadow':' 0rem 0rem 2rem 0rem black',
      'margin-bottom': '1rem'
    })
  } else {
    $('.banner-picture').css('background-image', 'none');
    $('.index-banner-container').css('display', 'none');
    $('.index-banner-tag').css('display', 'none');
  };
  if (document.getElementById('test-div')) {
    TestClass = document.getElementById('test-div').className.split('_');
    if (TestClass.includes('glass')) {
      $('li').removeClass('active');
      $('.glass').addClass('active');
    } else if (TestClass.includes('metal')){
      $('li').removeClass('active');
      $('.metal').addClass('active');
    } else if (TestClass.includes('all')){
      $('li').removeClass('active');
      $('.all').addClass('active');
    } else if (TestClass.includes('about')){
      $('li').removeClass('active');
      $('.about').addClass('active');
    } else if (TestClass.includes('contact')){
      $('li').removeClass('active');
      $('.contact').addClass('active');
    } else {
      $('li').removeClass('active');
      $('.home').addClass('active');
    };

    TestClass = TestClass.join(' ')
    if (TestClass == "glass windows doors") {
      TestClass = 'Glass Windows and Doors'
    }
    console.log(TestClass)
    $('.gallary-name').text(TestClass)
  }
});
