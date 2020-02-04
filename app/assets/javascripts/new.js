$(document).on('turbolinks:load', function() {
  $(function(){
      function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $("#image-form").change(function(){
      console.log(this)
        readURL(this);
        $(".image-list").css("display","block")
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