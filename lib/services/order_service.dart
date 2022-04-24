import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abctechserviceapp/model/order_created.dart';
import 'package:abctechserviceapp/provider/order_provider.dart';
import '../model/order.dart';

abstract class OrderServiceInterface {
  Future<OrderCreated> createOrder(Order order);
}

class OrderService implements OrderServiceInterface {
  final OrderProviderInterface _orderProvider;

  OrderService(this._orderProvider);

  @override
  Future<OrderCreated> createOrder(Order order) async {
    Response response = await _orderProvider.postOrder(order);
    try {
      if (response.hasError) {
        return Future.error(ErrorDescription('Erro na API'));
      }
      return Future.sync(() => OrderCreated(success: true, message: ""));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro na esperado"));
    }
  }
}
