$(document).ready(function(){
  $(".notice").fadeOut(4600);
  $(".alert-box").fadeOut(4600);
  $(".errors").fadeOut(4600);

  $('div div.my_huddles').bind('mouseenter',function(){
    $(this).addClass("highlight");
  });
  $('div div.my_huddles').bind('mouseleave',function(){
    $(this).removeClass("highlight");
  });

  $('div div.all_huddles_framing').bind('mouseenter',function(){
    $(this).removeClass('huddles');
    $(this).addClass("huddles_highlight");
  });
  $('div div.all_huddles_framing').bind('mouseleave',function(){
    $(this).addClass('huddles');
    $(this).removeClass("huddles_highlight");
  });

  function poll() {
    setTimeout(function() {
      somethingElse();
    }, 10*1000);
  }

  function somethingElse() {
    var url = "/huddles/" + window.huddleId;

    $.ajax({
      url: url,
      type: "GET",
      success: updateMembersList,
      dataType: "json",
      complete: poll,
      timeout: 2000
    });
  }

  function updateMembersList(data) {
    var users = data.huddle.users;
    var $membersList = $('.members-list');
    $membersList.html('');

    $.each(users, function(index, user) {
      var $user = $('<li>').text(user.email);
      $membersList.append($user);
    });
  }

  poll();


});
