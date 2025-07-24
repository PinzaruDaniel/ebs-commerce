
import 'package:di/data/api_service_injection_container.dart' as api_service;
import 'package:di/data/repo_injection_container.dart' as repo;

Future<void> initData() async{
  api_service.init();
  repo.init();
}
