// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


//$(function() {
//  var pusher = new Pusher(pusher_key, pusher_channel);
//  
//  $('button#start_btn').click(function(){
//    
//    pusher.bind('rider_start', function(rider) {
//      $("tr#" + rider.id).children("#td_start").text(rider.start_time);
//      console.log('start button pressed');
//    });
//    
//  });
//
//});
//
//$(function() {
//  var pusher = new Pusher(pusher_key, pusher_channel);
//  
//  $('button#finish_btn').click(function(){
//    
//    pusher.bind('rider_finish', function(rider) {
//    $("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
//    console.log('finish button pressed');
//    });
//  });
//  
//});
//
//$(function() {
//  var pusher = new Pusher(pusher_key, pusher_channel);
//  
//  $('button#clear_btn').click(function(){
//    
//    pusher.bind('rider_finish', function(rider) {
//      $("tr#" + rider.id).children("#td_start").text(rider.start_time);
//      $("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
//      $("tr#" + rider.id).children("#td_rider_time").text(rider.rider_time);
//      console.log('clear button pressed');
//    });
//  });
//  
//});
  









$(function(){
  var pusher = new Pusher(pusher_key, pusher_channel);
  
  pusher.bind('cleartime', function(rider) {
    $("tr#" + rider.id).children("#td_start").text(rider.start_time);
    $("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
    $("tr#" + rider.id).children("#td_rider_time").text(rider.rider_time);
      console.log('Hit cleartime')
    
  });
  

});



$(function(){
    var pusher = new Pusher(pusher_key, pusher_channel);
    //var s_time = ChronicDuration.output(rider.start_time)
  pusher.bind('rider_start', function(rider) {
     console.log('Hit start');
     $("tr#" + rider.id).children("#td_start").text(rider.start_time);
     //$("tr#" + rider.id).children("#td_rider_time").replaceHtml('<small>started</small>');
     //$("tr#" + rider.id).children("#td_finish").text(rider.finish_time.to_i);
    //    var x = (rider.finish_time.to_i - rider.start_time.to_i);
     //$("tr#" + rider.id).children("#td_rider_time").text(x);
   });

   
});

$(function(){
    var pusher = new Pusher(pusher_key, pusher_channel);
  
  pusher.bind('rider_finish', function(rider) {
     console.log('Hit finish');
     //$("tr#" + rider.id).children("#td_start").text(rider.start_time.to_i);
     $("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
       
     //$("tr#" + rider.id).children("#td_rider_time").replaceWith("<small>Finished</small>");
   });
  
});

