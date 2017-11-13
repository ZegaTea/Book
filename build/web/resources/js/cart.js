/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var cart = {
    init: function () {
        cart.events();
    },
    events: function () {
        $('.add_to_cart_button').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: 'BookShop/shop',
                data: { id: $(this).attr('id')},
                dataType: 'json',
                type: 'GET',
                success: function () {
                    
                        alert("Thêm giỏ hàng thành công");
                },
                error: function (){
                    alert("error")  
                }
            })
        })

        
    }
}

cart.init();

