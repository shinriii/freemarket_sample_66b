$(function()  {
    // タブのDOM要素を取得し、変数で定義
    let tabs = $(".menu_item1");
  
    // クラスの切り替えをtabSwitch関数で定義
    function tabSwitch() {
      // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
      $('.active1').removeClass("active1");
  
      // クリックしたタブにactiveクラスを追加
  
      $(this).addClass("active1");
  
      // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
      const index = tabs.index(this);
  
      // クリックしたタブに対応するshowクラスを追加する
      $(".content1").removeClass("show1").eq(index).addClass("show1");
    }
  
    // タブがクリックされたらtabSwitch関数を呼び出す
    tabs.click(tabSwitch);    
});

$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".menu_item2");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $('.active2').removeClass("active2");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active2");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".content2").removeClass("show2").eq(index).addClass("show2");
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});