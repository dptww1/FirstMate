// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $('input.ui-datepicker').AnyTime_picker( { askSecond: false, format: "%Z-%m-%d %H:%i", monthAbbreviations: ["01","02","03","04","05","06","07","08","09","10","11","12"] } );
});
