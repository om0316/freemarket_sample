window.addEventListener("load",function(){
  setSelectYear();
});

var Now = new Date();
//現在年
var NowYear = Now.getFullYear();
//現在月
var NowMonth = Now.getMonth()+1;
//現在日
var NowDate = Now.getDate();
/*
* 年プルダウン
*/
function setSelectYear(){

  var y = 0;
  
  var option = document.createElement("option");
  option.value = "";
  option.text = "--";
  $('#id_year').append(option);

  for(y = NowYear; y >= NowYear-50; y--){
      option = document.createElement("option");
      option.value = y;
      option.text = y;
      $('#id_year').append(option);
  }
  setSelectMonth();
}

/*
* 月プルダウン
*/
function setSelectMonth(){

  var m = 0;
  
  var option = document.createElement("option");
  option.value = "";
  option.text = "--";
  $('#id_month').append(option);

  //12ヶ月分
  for(m = 1; m <= 12; m++){
      option = document.createElement("option");
      option.value = m;
      option.text = m;
      $('#id_month').append(option);
  }
  setSelectDate();
}

/*
* 日のoptionを更新
*/
function setSelectDate(){

   var option = document.createElement("option");
   option.value = "";
   option.text = "--";
   $('#id_day').append(option);

   //1日から月の最終日まで
   for(d = 1; d <= 31; d++){
      option = document.createElement("option");
      option.value = d;
      option.text = d;
      $('#id_day').append(option);
   }

}

$(function() {
  $(".birthdate").change(function(){
    var year = $('#id_year option:selected').val();
    var month = ('0' + $('#id_month option:selected').val()).slice(-2);
    var day = ('0' + $('#id_day option:selected').val()).slice(-2);
    $('#birth_hidden').val(year + month + day);
  });
});

