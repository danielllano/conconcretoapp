function shoppingCart(){

  var items_map = {};
  var valid_request = true;

  $('#basket').on('click', '#update-cart-btn', function(event){
    event.preventDefault();

    $('#basket .product-qty').each(function(){
      if ($(this).val() < 1) {
        valid_request = false;
        alert("No se ha completado la operación. Has ingresado una cantidad inválida");
      } else {
        items_map[$(this).attr('id')] = $(this).val();
      }
    });

    if (valid_request){
      $.post('/shopping_cart/update_cart', {items_map: items_map}).done(function() {
        location.reload();
      });
    }
  });
}

