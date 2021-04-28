var minCount = 1;
var maxCount = 10;

$(function(){
$('#demo-plus').on('click', function(){
  var inputCount = $('#demo-area .unit').length;
  if (inputCount < maxCount){
    var element = $('#demo-area .unit:last-child').clone(true);
    var inputList = element[0].querySelectorAll('input[type="text"]');
    for (var i = 0; i < inputList.length; i++) {
      inputList[i].value = "";
    }
    $('#demo-area .unit').parent().append(element);
  }
});
$('.demo-minus').on('click', function(){
  var inputCount = $('#demo-area .unit').length;
  if (inputCount > minCount){
    $(this).parents('.unit').remove();
  }
});
});



$(function(){
  $('#demo-pluss').on('click', function(){
    var inputCount = $('#demo-areas .units').length;
    if (inputCount < maxCount){
      var element = $('#demo-areas .units:last-child').clone(true);
      var inputList = element[0].querySelectorAll('input[type="text"]');
      for (var i = 0; i < inputList.length; i++) {
        inputList[i].value = "";
      }
      $('#demo-areas .units').parent().append(element);
    }
  });
  $('.demo-minu').on('click', function(){
    var inputCount = $('#demo-areas .units').length;
    if (inputCount > minCount){
      $(this).parents('.units').remove();
    }
  });
  });


  
