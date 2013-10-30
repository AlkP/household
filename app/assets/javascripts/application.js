// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


function checkSymbol() {
  if (((event.keyCode < 48) || (event.keyCode > 57)) && (event.keyCode != 46 ) && (event.keyCode != 44 ) )
  {
    event.returnValue = false;
  }
  else
  {
    stringTest = document.getElementById ('account_amount').value + String.fromCharCode(event.keyCode)
    test = /^(\w*)?(\.|\,)?(\w*)?$/.test(stringTest);
    if (test)
      true;
    else
      event.returnValue = false;
  }
}