
$(document).on('ready page:load', function (event) {

    setupCartFunctions();
});

function setupCartFunctions() {

    $('.cart-product-row i').each(function(){
        $(this).click(function(){
            var productUrl = $(this).parent('.cart-product-row').data('remove-path')
            var $row =  $(this).parent('.cart-product-row');
            $.ajax({
                url: productUrl,
                context: document.body,
                type: 'DELETE',
                data: {
                    quantity: 1
                }
            }).done(function (data) {
                if(data.response == 'success')
                    $row.remove();
            });

        });
    });
}
