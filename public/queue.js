'use strict';
$(document).ready(function() {
  $('#send').click(function(e) {
    push_msg();
  });
});

function push_msg() {
  var msg = $('#msg').val();
  var number = $('#number').val();
  var msgs = [];
  for (var i = 0; i < number; i++) {
    msgs.push(msg + ' ' + i);
  }
  $.post('/messages', {msg: msgs}, function() {
    $('#results').append('<div class="alert alert-success" role="alert">Message Queued</div>');
  });
}