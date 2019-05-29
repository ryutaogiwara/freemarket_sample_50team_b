$(document).on("turbolinks:load", function(){
var categoryTop    = $('#parent-category')
var categoryMiddle = $('#item-category-middle')
var categoryBottom = $('#item-category-bottom')
var selectMiddle   = $('#category-select1')
var selectBottom   = $('#category-select2')
  function appendCategory1(child) {
    var html1 = `<option value='${child.id}'>${child.name}</option>`
    selectMiddle.append(html1);
  }
  function appendCategory2(grandchild) {
    var html2 = `<option value='${grandchild.id}'>${grandchild.name}</option>`
    selectBottom.append(html2);
  }
  categoryTop.change(function(){//子要素
    selectMiddle.empty();//選択変更時子要素削除
    var parent = categoryTop.val();
    if( categoryTop.val() !== "" ){
      categoryMiddle.show();
    }
    $.ajax({
      type:      'GET',
      url:       '/categories/new',
      data:      { category_id: parent },
      dataType:  'json'
    })
    .done(function(data){
      data.forEach(function(child){
        appendCategory1(child);
      });
    })
    .fail(function(){
      alert('category GET fail');
    });
  })

  $('#category-select1').change(function(){//孫要素
    selectBottom.empty();
    var grandparent = categoryMiddle.val();
    $('#item-category-bottom').show();
    if( categoryMiddle.val() !== "" ){
    }
    $.ajax({
      type:      'GET',
      url:       '/categories/new',
      data:      { category_id: grandparent },
      dataType:  'json'
    })
    .done(function(data){
      console.log(data)
      data.forEach(function(grandchild){
        appendCategory2(grandchild);
      });
    })
    .fail(function(){
      alert('category GET fail');
    });
  })
});
