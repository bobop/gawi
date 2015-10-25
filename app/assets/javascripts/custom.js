$(document).ready(function(){
  var config = {
    '#search_category' : {disable_search_threshold:10}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
});