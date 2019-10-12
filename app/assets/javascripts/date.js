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

  var selectElement = document.getElementById("id_year");
  var y = 0;
  
  var option = document.createElement("option");
  option.value = "";
  option.text = "--";
  selectElement.appendChild(option);
  
  for(y = NowYear; y >= NowYear-70; y--){
      option = document.createElement("option");
      option.value = y;
      option.text = y;
      selectElement.appendChild(option);
  }
  setSelectMonth();
}

/*
* 月プルダウン
*/
function setSelectMonth(){

  var m = 0;
  var selectElement = document.getElementById("id_month");
  var child;

  while(child = selectElement.firstChild){
      selectElement.removeChild(child);
  }

  var option = document.createElement("option");
  option.value = "";
  option.text = "--";
  selectElement.appendChild(option);
  //12ヶ月分
  for(m = 1; m <= 12; m++){
      option = document.createElement("option");
      option.value = m;
      option.text = m;
      selectElement.appendChild(option);
  }
  setSelectDate();
}

/*
* 日のoptionを更新
*/
function setSelectDate(){
  
  var selectElement = document.getElementById("id_day");
  var child;

   while(child = selectElement.firstChild){
      selectElement.removeChild(child);
   }

   var option = document.createElement("option");
   option.value = "";
   option.text = "--";
   selectElement.appendChild(option);

   //1日から月の最終日まで
   for(d = 1; d <= 31; d++){
      option = document.createElement("option");
      option.value = d;
      option.text = d;
      selectElement.appendChild(option);
   }

}
