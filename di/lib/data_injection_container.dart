import 'package:di/data/api_service_injection_container.dart' as api_service;
import 'package:di/data/repo_injection_container.dart' as repo;
import 'package:di/data/local_source_injection_container.dart' as local;

Future<void> initData() async{
  local.init();
  api_service.init();
  repo.init();
}
