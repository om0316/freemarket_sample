$(function() {

  function buildFileField(index){
    const html = `<div class="js-file_group" , data-id=${index}>
                    <input type="file" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image" class="js-file" data-id=${index}>
                  </div>`;
    return html;
  }

  function buildImg(index, url){
    const html = `<div class="item-image", data-id=${index}>
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="btn_wrapper">
                      <label for="item_images_attributes_${index}_image">編集</label>
                      <span data-index="${index}" class="js-remove">削除</span>
                    </div>
                  </div>`
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = 0;
  let indexHozon = [];
  let bool = false;

  $('#image-box').on('change', ".js-file", function(e) {
    
    var file = e.target.files[0];    
    
    //ボタンを押したfiled_forのidを取得
    let id = $(this).data("id")

    //編集ボタンを押したら画像のみ編集
    //今までカウントしたfileIndexと取得したidを比較あれば修正
    $.each(indexHozon,function(index,val){
        if (val == id){
          bool  = true
        }
    });

    //urlの取得
    blobUrl = window.URL.createObjectURL(file);
  
    if (bool == true){
      // fileIndexのついたimgタグがあれば(編集)
      let hensyuu_image = $(`img[data-index=${id}]`);
      hensyuu_image.attr('src', blobUrl);
    }else {
      // 新規追加
      $('.previews').append(buildImg(fileIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      indexHozon.push(fileIndex);
      fileIndex = fileIndex + 1
      $('#image-box').append(buildFileField(fileIndex));
      //ラベルのインデックスを変更する
      $('.uploadInfo').attr('for', `item_images_attributes_${fileIndex}_image`);
    }
    bool = false;
  });

  $(".previews").on('click', '.js-remove', function() {
    
　　　//フレックスラップCSS

     let id = $(this).data("index")
    
    $(`.js-file_group[data-id=${id}]`).remove();

    // let image = $(".item-image")
    // let arr = [];
    // console.log(image)
  
    // image.each(function(i,ele)
    // {
        
    // //  });

    $(this).parent().parent().remove();
    //  console.log(arr)
    // // 画像入力欄が0個にならないようにしておく
    // if ($('.js-file').length == 0) {
    //   $('#image-box').append(buildFileField(fileIndex[0]));
    // }
  });

});
