import 'package:get/get.dart';
import 'package:abctechserviceapp/services/assistance_service.dart';
import 'package:abctechserviceapp/model/assistance.dart';

class AssistanceController extends GetxController
    with StateMixin<List<Assistance>> {
  late AssistanceServiceInterface _service;

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistanceServiceInterface>();
    getAssistanceList();
  }

  void getAssistanceList() {
    change([], status: RxStatus.loading());
    _service
        .getAssists()
        .then((value) => change(value, status: RxStatus.success()))
        .onError((error, stackTrace) =>
            change([], status: RxStatus.error(error.toString())));
  }
}
