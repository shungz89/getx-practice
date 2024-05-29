import 'package:get/get.dart';
import 'api/api.dart';
import 'api/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);

    Get.put(
        ApiRepository(
          apiProviderFj: Get.find(),
        ),
        permanent: true);
  }
}
