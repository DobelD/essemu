import 'package:get/get.dart';

class CartController extends GetxController {
  int counter = 1;
  int price = 0;

  void incrementCounter(int value) {
    counter++;
    price += value;
    update();
  }

  void decrementCounter(int value) {
    if (counter > 1) {
      counter--;
      price -= value;
      update();
    }
  }
}
