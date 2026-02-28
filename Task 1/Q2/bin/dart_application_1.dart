void main(List<String> arguments) {
  double productPrice = 100.0;
  bool isPremium = true;
  bool hasCoupon = false;

  double finalPrice = discountPrice(
    productprice: productPrice,
    isPremium: isPremium,
    hasCoupon: hasCoupon,
  );
  print("Final price: \$${finalPrice.toStringAsFixed(2)}");
}

double discountPrice({
  required double productprice,
  required bool isPremium,
  required bool hasCoupon,
}) {
  double finalPrice = productprice;
  if (isPremium || hasCoupon) {
    finalPrice -= finalPrice * 0.15;
  }
  return finalPrice;
}
