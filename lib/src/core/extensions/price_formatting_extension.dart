extension PriceFormatting on int {
  String formatPrice() {
   final priceString = toString();
    var formattedPrice = '';
    var count = 0;

    for (var i = priceString.length - 1; i >= 0; i--) {
      count++;
      formattedPrice = priceString[i] + formattedPrice;
      if (count % 3 == 0 && i != 0) {
        formattedPrice = ' $formattedPrice';
      }
    }

    return formattedPrice;
  }
}
