subtotal(List<dynamic> cart) {
  if (cart.isEmpty) return 0.0;
  double subtotal = 0;
  cart.forEach((element) {
    subtotal += element['price'] * element['quantity'];
  });
  return subtotal;
}
