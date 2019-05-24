// $(document).on('turbolinks:load', function(){

//   //新規出品
//   $("#new_item").on("submit", function(e){
//     e.priventDefault();
//     var formData = new FormData(this);
//     formData.delete('images[image][]');
//     var preview = document.getElementsByClassName("upload-box-container--items")
//     var nodeList = document.getElementsByName("images[image][]");

//     {for(var h = 0; h < preview.length; h++ )
//       {loop: for(var i = 0; i < nodeList.length; i++)
//         { for(var j = 0; j < nodeList[i].files.length; j++)
//           { var tmpFile = nodeList[i].files[j];
//             formData.append('images[image][]', tmpFile);
//             break loop;
//           }
//         }
//       }
//     }
//     $.ajax({
//       type:         'POST',
//       url:          '/items',
//       contentType:  false,
//       processData:  false,
//       data:         formData
//     })
//     .done(function(){
//       console.log("done")
//     })
//     .fail(function(){
//       console.log('fail')
//     })
//   })
// });

// $(function(){
//   $fileField = $('upload-image')

//   $(document).on('change', $fileField, function(evt){
//     var files = evt.target.files;
//     var previewArea = document.getElementsByClassName('image-preview');
//     var previewCount = previewArea.length;
//     var reader = new FileReader();
//     reader.onload = (function(theFile){
//       return function(e) {
//         var src = e.target.result;
//         console.log(src)
//         var fileName = escape(theFile.name)
//         var html = `<div class="image-preview">
//               <div class="image-preview--container">
//                 <image src="`+ src +`" class="item-image" data-file="`+ fileName +`">
//               </div>
//               <div class="image-preview--edit-delete">
//                 <div class="image-edit"> 編集 </div>
//                 <a class="image-delete"> 削除 </a>
//               </div>
//             </div>`;
//         var reference = document.querySelector('.upload-box-container--area');
//         document.getElementById('drop_zone').insertBefore(html, reference);

//       }
//     })
//   })
// })
