import 'package:abctechserviceapp/controller/assistance_controller.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistanceController>(() => AssistanceController());
  }
}
