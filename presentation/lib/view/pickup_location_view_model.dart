import 'package:presentation/view/base_view_model.dart';

class PickupLocationViewModel extends BaseViewModel {
  final String address;

  PickupLocationViewModel({required this.address});
}

final List<PickupLocationViewModel> pickupLocations = [
  PickupLocationViewModel(address: 'Posta moldovei, Armeneasca 2'),
  PickupLocationViewModel(address: 'Undeva departe'),
  PickupLocationViewModel(address: 'Piata Unirii'),
  PickupLocationViewModel(address: 'Muzeul National de Arta'),
  PickupLocationViewModel(address: 'Gara de Nord'),
  PickupLocationViewModel(address: 'Parcul Herastrau'),
  PickupLocationViewModel(address: 'Universitatea Bucuresti'),
  PickupLocationViewModel(address: 'Bulevardul Magheru 10'),
  PickupLocationViewModel(address: 'Centrul Comercial AFI Cotroceni'),
  PickupLocationViewModel(address: 'Stadionul National'),
  PickupLocationViewModel(address: 'Aeroport Otopeni Terminal 1'),
  PickupLocationViewModel(address: 'Cismigiu Gardens'),
  PickupLocationViewModel(address: 'Teatrul National'),
  PickupLocationViewModel(address: 'Gradina Botanica'),
  PickupLocationViewModel(address: 'Mall Vitan'),
  PickupLocationViewModel(address: 'Strada Lipscani 25'),
  PickupLocationViewModel(address: 'Podul Basarab'),
  PickupLocationViewModel(address: 'Statia de Metrou Piata Victoriei'),
];
