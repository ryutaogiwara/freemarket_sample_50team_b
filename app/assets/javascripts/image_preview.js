$(document).on('turbolinks:load', function(){
  var dropzone = $('.upload-box-container--area')
  var inputs = []; //file情報取得
  var dropZone = document.getElementById("drop_zone");

  function buildImage(imageUri){
    var html = `<div class="image-preview">
                  <div class="image-preview--container">
                    <image src="${imageUri}" class="item-image">
                  </div>
                  <div class="image-preview--edit-delete">
                    <div class="image-edit"> 編集 </div>
                    <a class="image-delete"> 削除 </a>
                  </div>
                </div>`;
    return html
  };
  $(function(){
    function divideFiles(files){
      for(var i = 0; i < files.length; i++){
        (function(){
          inputs.push(files[i]);
          var reader = new FileReader(); //filesのファイルデータ取得
          reader.onload = function(){ //読み込まれたら発火
            var imageUri = reader.result
            console.log(inputs)
            if(inputs.length <=5 ){
              $(buildImage(imageUri)).appendTo("#preview")
            }else if(inputs.length >= 6 || inputs.length <= 10){
              $(buildImage(imageUri)).appendTo("#preview2")
            }
          };
          reader.readAsDataURL(files[i]); //ファイルの読み込みを実行する
          inputCss();
        })();
      }
    };
    dropZone.addEventListener("dragover", function(e){
      e.stopPropagation();
      e.preventDefault();
    }, false);
    dropZone.addEventListener("drop", function(e){
      e.stopPropagation();
      e.preventDefault();
      var files = e.dataTransfer.files;
      divideFiles(files)
    }, false);

    $('input[type=file]').change(function(){
      $('#preview').text('');
      var files = $(this).prop('files')
      divideFiles(files)
      $('input[type=file]').val(null);
    });
  });

  $(document).on('click', '.image-delete', function(){
    var index = $('.image-delete a').index(this);
    inputs.splice(index, 1);
    console.log(inputs)
    $(this).parent().parent().remove();
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
  $('#new_item').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    inputs.forEach(function(file){
      formData.append("images[image][]", file)
    });
    for(value of formData.entries()){
        console.log(value);
    }
    $.ajax({
      url:         '/items',
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
      dataType:    'html'
    })
    .done(function(data){
      console.log('done')
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      console.log('fail')
    });
  });
});
//問題点・・・画像削除時のファイルの中身が違う
      // for(value of form.entries()){
      //   console.log(value);
      // }  formData確認用
