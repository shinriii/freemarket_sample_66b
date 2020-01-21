$(function()  {
    let tabs = $(".menu_item1");
  
    function tabSwitch() {
      $('.active1').removeClass("active1");
  
      $(this).addClass("active1");
  
      const index = tabs.index(this);
  
      $(".content1").removeClass("show1").eq(index).addClass("show1");
    }
  
    tabs.click(tabSwitch);    
});

$(function()  {
  let tabs = $(".menu_item2");

  function tabSwitch() {
    $('.active2').removeClass("active2");

    $(this).addClass("active2");

    const index = tabs.index(this);

    $(".content2").removeClass("show2").eq(index).addClass("show2");
  }

  tabs.click(tabSwitch);    
});