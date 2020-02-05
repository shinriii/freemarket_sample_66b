$(document).on('turbolinks:load', function() {
  const buildImage = (index)=> {
    const html = `<li upload-item="${index}" class="image-list" id="picture${index}">
                    <div class="image">
                      <img id="preview"></img>
                    </div>
                    <div class="image-destroy">
                      削除
                    </div>
                  </li>`
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10]

  $("#image-form").on("change", function(e){
    $(".image-lists").append(buildImage(fileIndex[0]));
    var input_name = (fileIndex[0])
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length -1] + 1)
    $("#picture"+input_name).addClass("active")
  })
})

$(document).on('turbolinks:load', function() {
  const buildFile = (index)=> {
    const html = `<div data_index="${index}" class= "image-box__square pic none" id="up-load${index}">
                    ドラッグアンドドロップ<br>
                    またはクリックしてファイルをアップロード
                    <input type="file" name="item[images_attributes][0][src]" id="image-form">
                  </div>`
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10]

  $("#image-form").on("change", function(e){
    console.log(buildFile)
    $(".image-box").append(buildFile(fileIndex[0]));
    var input_name = (fileIndex[0])
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length -1] + 1)
    $(".pic").removeClass("pic")
    $("#up-load"+input_name).addClass("pic")
  })
})

$(document).on('turbolinks:load', function() {
  $(function(){
      function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#preview').attr('src', e.target.result);
          $("#preview").removeAttr("id")
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $("#image-form").change(function(){
        readURL(this);
        // $(".image-list").addclass("active")
    });
  })
});
$(document).on('turbolinks:load', function() {
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーを表示するビュー
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<select name='item[child_category_id]' class="select-default" id="child-form">
                              <option label="---" data-category="---"></option>
                              ${insertHTML}
                            </select>`
      $('#category').append(childSelectHtml);
    }
    // 孫カテゴリーを表示するビュー
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<select name='item[category_id]' class="select-default" id="grandchild-form">
                                  <option label="---" data-category="---"></option>
                                  ${insertHTML}
                                </select>`;
      $('#category').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択のイベント
    $('#parent-form').on('change', function(){
      var parentCategory = $('option:selected',this).val();
      if (parentCategory != "---"){
        $.ajax({
          url: '/items/get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#child-form').remove();
          $('#grandchild-form').remove();
          var insertHTML = '';
          children.forEach(function(child){
            
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#child-form').remove();
        $('#grandchild-form').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('#category').on('change', "#child-form",function(){
      var childId = $('option:selected',this).val();
      if (childId != "---"){
        $.ajax({
          url: '/items/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchild-form').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild-form').remove();
      }
    });
  });
});