//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
  {
    $(document).on('submit','#new_comment',function(event){
      // event.preventDefault();
      // console.log($(this).data('postid'));
      // console.log(event);
      $.ajax({
        type: 'post',
        beforeSend: function(xhr) {
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
        url: '/comments',
        data: {
          'content': $('#comment_content').val(),
          'post_id': $(this).data('postid'),
        },
        success: function(response){
          console.log(response);
          // $('.comment-table').prepend("<tr><td>"+$('#comment_content').val()+"</td><td>"+$('.userlogin').text()+"</td></tr>");
          $('.comment-table').prepend("<tr><td>"+response.data.content+"</td><td>"+response.email+"</td></tr>");
          $('#comment_content').val("");
        },
        error: function(response){
          console.log('no');
        }
      });
    });
  }
});
