$(document).ready(function(){
  $(".notice").fadeOut(4600);
  $(".alert-box").fadeOut(4600);

//   function refreshHuddleMembers(id) {


//     $.get("/huddles/" + id + ".json", updateHtml);
//   }

//   function updateHtml(huddle){
//     $('div#huddle_display').html(huddle.huddleMembers);
//   }

//   function startHuddleRefresher() {
//     setInterval(refreshHuddleMembers(9), 3000);
//   }

//   startHuddleRefresher();


// });


  function poll() {
    setTimeout(function() {
      somethingElse();
    }, 10*1000);
  }

  function somethingElse() {
    $.ajax({
      url: "/huddles/9",
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
