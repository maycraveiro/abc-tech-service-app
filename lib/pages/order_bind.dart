import 'package:abctechserviceapp/controller/order_controller.dart';
import 'package:abctechserviceapp/provider/order_provider.dart';
import 'package:abctechserviceapp/services/geolocation_service.dart';
import 'package:abctechserviceapp/services/order_service.dart';
import 'package:get/get.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() =>
        OrderController(GeolocationService(), OrderService(OrderProvider())));
  }
}
