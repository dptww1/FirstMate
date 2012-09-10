//= require jquery
//= require jquery-ui
//= require_tree .
//= require_self

$(function() {
    $('input.ui-datepicker').AnyTime_picker( {
                                               askSecond: false,
                                               format: "%Z-%m-%d %H:%i",
                                               monthAbbreviations: ["01","02","03","04","05","06","07","08","09","10","11","12"]
                                             } );
});
