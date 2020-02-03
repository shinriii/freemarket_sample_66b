$(document).on('turbolinks:load', function(){
    const priceInput = '#price-input';
    const feeFeild = '#fee';
    const profitFeild = '#profit';

    // 価格入力時に手数料、利益計算
    $(priceInput).on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
        let fee = Math.floor(input * 0.1);
        let profit = "¥" + (input - fee).toLocaleString();
        $(feeFeild).html("¥" + fee.toLocaleString());
        $(profitFeild).html(profit);
    } else {
        let fee = '-';
        let profit = '-';
        $(feeFeild).html(fee);
        $(profitFeild).html(profit);
    }
    });

    // 編集時の手数料、利益計算
    $(priceInput).ready(function(){
    let input = $(priceInput).val();
    if (input >= 300 && input <= 9999999){
        let fee = Math.floor(input * 0.1);
        let profit = "¥" + (input - fee).toLocaleString();
        $(feeFeild).html("¥" + fee.toLocaleString());
        $(profitFeild).html(profit);
    } else {
        let fee = '-';
        let profit = '-';
        $(feeFeild).html(fee);
        $(profitFeild).html(profit);
    }
    });
});