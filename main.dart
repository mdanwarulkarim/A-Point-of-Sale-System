import 'dart:io';

class MyCart {
  String productName;
  String productDescription;
  double productPrice;
  int? productMaxDiscountPercentage;
  double? productTotalPrice;
  DateTime? purchedTime;

  MyCart({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    this.productTotalPrice,
    this.productMaxDiscountPercentage: 0,
    this.purchedTime,
  });
}

void main() {
  List<MyCart> myCart = [
    MyCart(
        productName: 'Samsung S2',
        productDescription: 'Explore best gaming experience',
        productPrice: 1000.00,
        productMaxDiscountPercentage: 10),
    MyCart(
        productName: 'Lenove S2',
        productDescription: 'Explore best gaming experience',
        productPrice: 750.00),
    MyCart(
        productName: 'iPhone 10',
        productDescription: 'Explore best gaming experience',
        productPrice: 350.00),
    MyCart(
        productName: 'Nokia 5001',
        productDescription: 'Explore best gaming experience',
        productPrice: 800.00,
        productMaxDiscountPercentage: 15),
    MyCart(
        productName: 'Samsung A2',
        productDescription: 'Explore best gaming experience',
        productPrice: 980.00),
    MyCart(
        productName: 'Samsung G8',
        productDescription: 'Explore best gaming experience',
        productPrice: 599.00,
        productMaxDiscountPercentage: 5),
  ];

  print('Welcome to Our Shop');

  for (var i = 0; i < myCart.length; i++) {
    print(
        '${i + 1}. ${myCart[i].productName} (${myCart[i].productDescription}) Price: RM${myCart[i].productPrice}  ${myCart[i].productMaxDiscountPercentage != 0 ? 'and ${myCart[i].productMaxDiscountPercentage}% Discount Available' : 'No Offer Vailable'}');
  }

  print("Chosse to Buy? : ");
  int? choose;
  String? value1 = stdin.readLineSync();
  if (value1 != null) {
    choose = int.parse(value1);
  }

  choose = (choose! - 1);

  print("Chosse Quantity: ");
  int? quantity;
  String? value2 = stdin.readLineSync();
  if (value2 != null) {
    quantity = int.parse(value2);
  }

  double discountPrice = myCart[choose].productPrice -
      (myCart[choose].productPrice /
          100 *
          myCart[choose].productMaxDiscountPercentage!);
  double totalPriceIncludingGST = discountPrice / 100 * 6;

  myCart[choose].purchedTime = DateTime.now();

  print('============ Thanks for Shopping ============');
  print('Purchased Date and Time: ${myCart[choose].purchedTime}');
  print('Product Name: ${myCart[choose].productName}');
  print('Description: ${myCart[choose].productDescription}');
  print('Price: ${myCart[choose].productPrice}');
  print('Discount: ${myCart[choose].productMaxDiscountPercentage}%');

  double discountedPrice = (myCart[choose].productPrice -
          (myCart[choose].productPrice / 100) *
              myCart[choose].productMaxDiscountPercentage!) *
      quantity!;

  myCart[choose].productTotalPrice =
      discountedPrice + ((discountedPrice / 100) * 6);
  print('Total Price with discount: ${discountedPrice.toStringAsFixed(2)}');
  print('Total GST (6%): ${((discountedPrice / 100) * 6).toStringAsFixed(2)}');
  print(
      'Final Total Price : ${myCart[choose].productTotalPrice!.toStringAsFixed(2)}');
}