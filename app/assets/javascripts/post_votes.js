// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  {
    $(document).on('click','.button_vote',function(event){
      event.preventDefault();
      // alert("submitted");
      $.ajax({
        type: 'post',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/post_votes/' + $(this).data('id'),
        success: function(response){
          // alert("success!");
          // console.log(response);
          num_votes = $('#hihi').text();
          num_votes++;
          $('#hihi').text(num_votes);
        }
      });
    });
  }
});
