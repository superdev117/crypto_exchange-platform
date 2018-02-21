$(document).ready(function(){
  $("#scroll_to_section2").click(function(){
    
    $('html, body').animate({
      scrollTop: $(this).offset().top + 100 + 'px'
    }, 1000);
    return this;
  })

  function showTickerInfo(id, price, change){
    var obj_price = $("#" + id + ">.ticker_price");
    obj_price.text('$ ' + price);
    if(id=='ethbtc')
      obj_price.text(price);
    price = parseFloat(price);
    change = parseFloat(change);
    console.log(price);
    var obj_change = $("#" + id + ">.ticker_change");
    var changed_price, old_price;
    old_price = parseFloat(price / (100 + change)) * 100;
    
    if(change > 0)
    {
      changed_price = price - old_price;
      changed_price = changed_price.toFixed(8);
      obj_change.css('color','green');
      obj_change.append('<i class="fa fa-caret-up"></i>'+ changed_price + '(' + change + '%)');
    }
    else if(change < 0 ){

      changed_price = old_price - price;
      changed_price = changed_price.toFixed(8);
      obj_change.css('color','red');
      obj_change.append('<i class="fa fa-caret-down"></i>'+ changed_price + '(' + change + '%)');
    }
    else{
      changed_price = 0;
      obj_change.css('color','green');
      obj_change.append('<i class="fa fa-caret-up"></i>'+ changed_price + '(' + change + '%)');
    }
  }
  $.ajax({
    url: 'https://api.coinmarketcap.com/v1/ticker/',
    type: 'GET',
    success: function(res){
      console.log(res);
      console.log($("#btcusd.ticker_price"));
      showTickerInfo("btcusd",res[0].price_usd,res[0].percent_change_1h);
      showTickerInfo("ethusd",res[1].price_usd,res[1].percent_change_1h);
      showTickerInfo("ethbtc",res[1].price_btc,res[1].percent_change_1h);
      showTickerInfo("ltcusd",res[7].price_usd,res[7].percent_change_1h);
      showTickerInfo("dshusd",res[11].price_usd,res[11].percent_change_1h);
    },
    error: function(res){
      alert(res);
    }
  });
})