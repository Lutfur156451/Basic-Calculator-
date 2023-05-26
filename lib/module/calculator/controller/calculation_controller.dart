import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNum = 0.0.obs;
  var secondNum = 0.0.obs;
  var result = 0.0.obs;
 final TextEditingController firstValueController=TextEditingController();
 final TextEditingController lastValueController=TextEditingController();
 final TextEditingController total=TextEditingController();


  void add()=> result.value = firstNum.value + secondNum.value;
  void subtract() => result.value = firstNum.value - secondNum.value;
  void multiply() => result.value = firstNum.value * secondNum.value;
  void divide() => result.value = firstNum.value / secondNum.value;

  void clear() {
    firstNum.value = 0.0;
    secondNum.value = 0.0;
    result.value = 0.0;
    firstValueController.clear();
    lastValueController.clear();
  }
}