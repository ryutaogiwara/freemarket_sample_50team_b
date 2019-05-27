$(document).on('turbolinks:load', function(){
  var itemId = location.pathname.split('/')[2]
  var editImg = document.getElementsByClassName("item-image")
  var edit = document.getElementById('edit_item')
  if(document.location.href.match(`/items/${itemId}/edit`)) {
    var host = location.host
    var newPath = location.pathname
    var dropzone = $('.upload-box-container--area')
    var inputs = []; //file情報取得
    var dropWrap = $('.upload-box-container--items')
    var previewArea = document.getElementsByClassName("image-preview")
    var preInfo = $('.upload-box-container--area-info')
    var dropZone = document.getElementById("drop_zone");
    var readPreview = document.getElementsByClassName("image-preview")
    inputCss();
//    ファイルをばらしてinputsに格納、プレビュー作成
    $(function(){
      //以下、ファイル受け取りとプレビュー作成処理
      function divideFiles(files){
        var previewCount = previewArea.length; //preview数取得
        //画像がない場合のバリデーションを後で追加
        if (files !== null && files !== undefined &&previewCount+files.length <= 10){
          $('#image-num-error-new').hide();
          for (var i = 0; i < files.length; i++) {
            if (!files[i].type.match('image.*')) {
              continue;
            }
              var delPreview = document.getElementsByClassName("image-delete")
              var readPreview = document.getElementsByClassName("image-preview")//preview取得
              var previewNum = readPreview.length;
              var delNum = delPreview.length;
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
                  $("#preview--append").append(html);
                  inputCss();
                };
              })(files[i]);
            reader.readAsDataURL(files[i]);
            }//for文
          var inputCount = document.getElementsByName('images[image][]').length+1;
          var inputClick = `$("#image_input${inputCount}").click();`
          dropZone.setAttribute('onclick', inputClick);

          var nextInput = `<input accept="image/*,.png,.jpg,.jpeg" id="image_input`+ inputCount +`" class="upload-image" name="images[image][]" multiple= "true" type="file" style="display: none;">`
          $("#preview").append(nextInput);
          }//if文
          else{
            $('#image-num-error-new').show();
          }
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
      //file_fieldの情報取得
      $(function(){
        $(document).on('change', 'input[type=file]', function(e){
          var files = e.target.files;
          for ( var i = 0; i < files.length; i++){
            inputs.push(files[i])
          }
          divideFiles(files)
        })
      })
    });
    //ファイル投稿処理ここまで

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
      var previewAppend = document.getElementsByClassName('preview--append')
      if(previewArea.length == 1 || previewArea.length == 6){
        dropzone.css({
          'width': 'calc(100% - 125px)',
          'display': 'block'
        })
      }else if(previewArea.length == 2 || previewArea.length == 7){
        dropzone.css({
          'width': 'calc(100% - 250px)',
          'display': 'block'
        })
      }else if(previewArea.length == 3 || previewArea.length == 8){
        dropzone.css({
          'width': 'calc(100% - 375px)',
          'display': 'block',
          'padding': '35px'
        })
      }else if(previewArea.length == 4 || previewArea.length == 9){
        dropzone.css({
          'width': 'calc(100% - 500px)',
          'display': 'block',
          'padding': '10px'
        })
      }else if(previewArea.length == 10 || previewArea.length >= 10){
        dropzone.css({
          'display': 'none'
        })
      }else{
        dropzone.css({
          'width': '100%',
          'display': 'block',
          'padding': '40px'
        })
      }
    };
    //商品更新
    $("form").submit(function(e){
      e.preventDefault();
      //バリデーションを後で追加
      formValidation();
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
        url:         `/items/${itemId}`,
        type:        "PATCH",
        data:        formData,
        contentType: false,
        processData: false
      })
      .done(function(){
        window.location.href = `/items/${itemId}`
      })
      .fail(function(XMLHttpRequest, textStatus, errorThrown){
        window.location.href = `/items/${itemId}/edit`
        alert('商品編集に失敗しました')
      });
    });
    function formValidation(){
      var formcheck = $('.item-info-form--nametext-textfield').val();
      if( formcheck == "" ){ $('#name-error-new').show();
      location.reload();
      alert('商品名を入力してください') }
      else{ $('#name-error-new').hide();}//name

      var formcheck = $('.item-description-textarea').val();
      if( formcheck == "" ){ $('#description-error-new').show();
      location.reload();
      alert('商品詳細を入力してください') }
      else{ $('#description-error-new').hide();}

      var formcheck = $('#item-category-top').val();
      if( formcheck == "" ){ $('#category-error-new').show();
      location.reload();
      alert('カテゴリーを選択してください') }
      else{ $('#category-error-new').hide();}
      //後でcategory2,3の追加予定
      var formcheck = $('#size-select').val();
      if( formcheck == "" ){ $('#size-error-new').show();
      location.reload();
      alert('サイズを選択してください')}
      else{ $('#size-error-new').hide();}

      var formcheck = $('#state-select').val();
      if( formcheck == "" ){ $('#state-error-new').show();
      location.reload();
      alert('商品の状態を選択してください') }
      else{ $('#state-error-new').hide();}

      var formcheck = $('#postage-select').val();
      if( formcheck == "" ){ $('#postage-error-new').show();
      location.reload();
      alert('配送料の負担を選択してください') }
      else{ $('#postage-error-new').hide();}

      var formcheck = $('#shipping-select').val();
      if( formcheck == "" ){ $('#shipping-error-new').show();
      location.reload();
      alert('配送の方法を選択してください') }
      else{ $('#shipping-error-new').hide();}

      var formcheck = $('#region-select').val();
      if( formcheck == "" ){ $('#region-error-new').show();
      location.reload();
      alert('発送元の地域を選択してください') }
      else{ $('#region-error-new').hide();}

      var formcheck = $('#shipping_date-select').val();
      if( formcheck == "" ){ $('#shipping_date-error-new').show();
      location.reload();
      alert('発送までの日数を選択してください') }
      else{ $('#shipping_date-error-new').hide();}

      var previewCheck = readPreview.length
      if( previewCheck == 0 ){ $('#image-error-new').show();
      location.reload();
      alert('画像を選択してください') }
      else{ $('#image-error-new').hide(); }

      var formCheck = $('#price-input-field').val();
      if( formCheck <= 300 || formCheck >= 9999999 ){ $("#price-error-new").show();
      location.reload();
      alert('価格を入力してください') }
      else{ $('#price-error-new').hide(); }
    };
  }
});

//出品に関しては再現できてると考えられるが、商品編集でviewが崩れる
//これは、サーバーからpreviewを読み込んだ時にlengthとしてjavascript側に認識されてないため
//より完成度を上げる場合はpreviewを数値で捉え、cssを適応させる
//また、fileを配列内で管理、送信時にpreview番号と比較する事でファイルの重複送信は避けられるようになる
//と考えられる。現状はnameと比較してるため重複が起きる
