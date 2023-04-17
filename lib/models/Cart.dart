
import 'package:ecoprice/models/product.dart';

class Cart{
  static Map<Product, int> cart = Map();

  static double savings = 0;

  static void addProductQuantity(Product product){

      if(cart.keys.contains(product)){
        cart[product]= (cart[product]!+1);
      }
      else{
        cart[product] = 1;
      }
      savings += product.originalPrice - product.currentPrice;
  }

  static void removeProductQuantity(Product product){
    if(cart[product]==1){
      cart[product] = cart[product]! - 1;
      cart.remove(product);
    }
    else{
      cart[product] = cart[product]! - 1;
    }
    savings -= product.originalPrice - product.currentPrice;
  }

  static int getProductQuantity(Product product){
    return cart[product] ?? 0;
    //[product] ?? 0;
  }

}