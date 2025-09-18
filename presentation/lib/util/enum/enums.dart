enum DeliveryType {
  pickup('Ridicare la sediu'),
  fanCourier('Fan Courier'),
  dhl('DHL');

const DeliveryType(this.value);
final String value;
}

enum DeliveryTypes {
  fanCourier('fan_courier');

  const DeliveryTypes(this.value);

  final String value;
}

enum ProductListType { saleProducts, newProducts, filteredProducts, allProducts }

enum CheckoutWidgetsType { userContactInfo, deliveryAddressInfo, paymentMethod, voucherCode }
