enum DeliveryType { pickup, fanCourier, dhl }
enum PaymentMethod {
  paypal,
  cash,
}

enum DeliveryTypes {
  fanCourier('fan_courier');

  const DeliveryTypes(this.value);

  final String value;
}

enum ProductListType { saleProducts, newProducts, filteredProducts, allProducts }

enum CheckoutWidgetsType { userContactInfo, deliveryAddressInfo, paymentMethod, voucherCode }
