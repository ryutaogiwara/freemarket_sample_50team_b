$(document).on('turbolinks:load', function(){
  var itemId = location.pathname.split('/')[2]
  var editImg = document.getElementsByClassName("item-image")
  var edit = document.getElementById('edit_item')
  if((document.location.href.match("/items/new"))) {
    var host = location.host
    var newPath = location.pathname
    var dropzone = $('.upload-box-container--area')
    var inputs = []; //file情報取得
    var dropZone = document.getElementById("drop_zone");//取得確認
//    ファイルをばらしてinputsに格納、プレビュー作成
    $(function(){
      //以下、ファイル受け取りとプレビュー作成処理
      function divideFiles(files){//e.target.filesと同じ状態
        var previewArea = document.getElementsByClassName("image-preview")//preview取得
        var previewCount = previewArea.length; //preview数取得
        //画像がない場合のバリデーションを後で追加
        if (files !== null && files !== undefined &&previewCount+files.length <= 10){
          for (var i = 0; i < files.length; i++){
            if (!files[i].type.match('image.*')){
              continue;
            }
              var delPreview = document.getElementsByClassName("image-delete")
              var readPreview = document.getElementsByClassName("image-preview")//preview取得
              var previewNum = readPreview.length;
              var delNum = delPreview.length;
              // var imgFile = files[i]
              var reader = new FileReader();
              reader.onload = (function(theFile) {
                var fileName = theFile.name;
                return function(evt){
                  var html = `<div class="image-preview" data-num="`+ Number(previewNum++) +`">
                                 <div class="image-preview--container">
                                   <image  class="item-image" src="`+ evt.target.result +`" data-file="`+ fileName +`">
                                 </div>
                                 <div class="image-preview--edit-delete">
                                   <div class="image-edit"> 編集 </div>
                                   <a class="image-delete" num="`+ Number(delNum++) +`"> 削除 </a>
                                 </div>
                               </div>`
                  $("#preview").append(html);
                };
              })(files[i]);
            reader.readAsDataURL(files[i]);
            }//for文
          var inputCount = document.getElementsByName('images[image][]').length+1;
          // var labelFor = dropZone.htmlFor; 属性for書き換え
          var inputClick = `$("#image_input${inputCount}").click();`
          dropZone.setAttribute('onclick', inputClick);

          var nextInput = `<input accept="image/*,.png,.jpg,.jpeg" id="image_input`+ inputCount +`" class="upload-image" name="images[image][]" multiple= "true" type="file" style="display: none;">`
          $("#preview").append(nextInput);
          }//if文
        }
        //プレビュー作成ここまで
      //以下、ファイル投稿時処理
      //ドロップゾーン
      dropZone.addEventListener("dragover", function(e){
        e.stopPropagation();
        e.preventDefault();
      }, false);
      dropZone.addEventListener("drop", function(e){
        e.stopPropagation();
        e.preventDefault();
        var files = e.dataTransfer.files;
        for ( var i = 0; i < files.length; i++){
          inputs.push(files[i])
        }
        divideFiles(files)
      }, false)
      //file_field
      $(function(){
        // var inputField = $('.upload-image')
        $(document).on('change', 'input[type=file]', function(e){
          // var files = $fileField.prop('files') これだとターゲット指定できない
          var files = e.target.files;
          for ( var i = 0; i < files.length; i++){
            inputs.push(files[i])
          }
          divideFiles(files)
            // $('input[type=file]').val(null); ファイルリセット(いらない)
        })
      })
    });
    //ファイル投稿処理ここまで

// preview削除（不完全、ファイルが一致しない場合がある
    $(document).on('click', '.image-delete', function(e){
      e.preventDefault();
      //previewのhtml削除処理
      var num = $(this).attr('num');
      $(this).parent().parent().remove();
      //edit時の削除
      var editDelTarget = $("#item_images_attributes_"+ num +"__destroy")
      editDelTarget.prop("checked", true);
      inputCss();
    });

    function inputCss(){
      if(inputs.length == 1 || inputs.length == 6){
        dropzone.css({
          'width': 'calc(100% - 125px)',
          'display': 'block'
        })
      }else if(inputs.length == 2 || inputs.length == 7){
        dropzone.css({
          'width': 'calc(100% - 250px)',
          'display': 'block'
        })
      }else if(inputs.length == 3 || inputs.length == 8){
        dropzone.css({
          'width': 'calc(100% - 375px)',
          'display': 'block'
        })
      }else if(inputs.length == 4 || inputs.length == 9){
        dropzone.css({
          'width': 'calc(100% - 500px)',
          'display': 'block'
        })
      }else if(inputs.length == 10 || inputs.length >= 10){
        dropzone.css({
          'display': 'none'
        })
      }else{
        dropzone.css({
          'width': '100%',
          'display': 'block'
        })
      }
    };
    //出品情報送信
    $('#new_item').on('submit', function(e){
      e.preventDefault();
      //バリデーションを後で追加
      var formData = new FormData($(this).get(0));
      formData.delete('images[image][]');//画像リセット
      var previewImg = document.getElementsByClassName("item-image")
      var nodeList = document.getElementsByName("images[image][]")
      //データ比較用、一致物のみformDataへ送る
      for (var i = 0; i < previewImg.length; i++){
        var previewName = previewImg[i].getAttribute('data-file')
        inputs.forEach(function(file){
          if (previewName == file.name){
            formData.append("images[image][]", file);
          }
        })
      }
      $.ajax({
        url:         '/items',
        type:        "POST",
        data:        formData,
        contentType: false,
        processData: false,
        dataType:    'html'
      })
      .done(function(){
        window.location.href =`http://${host}`
      })
      .fail(function(XMLHttpRequest, textStatus, errorThrown){
        window.location.href = `http://${host}/${newItem}`
      });
    });
  }
});
//       for(value of form.entries()){
//         console.log(value);
//       }  formData確認用
