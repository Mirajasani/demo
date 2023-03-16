import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SaveController extends GetxController {
  String dropdownvalue = 'Category A';
  DateTime currentDate = DateTime.now();
  TextEditingController numberofdiamoncontroller = TextEditingController();
  TextEditingController Pricecontroller= TextEditingController();
  String total='';
  var items = [
    'Category A',
    'Category B',
    'Category C',
    'Category D',
  ];
  String finalDate = '';
  void calculation() {
    int multiply = int.parse(numberofdiamoncontroller.text) * int.parse(Pricecontroller.text);
      total = multiply.toString();
     update();
  }
  Future<void> SelectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)

        currentDate = pickedDate;
     update();
  }
  void Dropdownonchange(String? category){
    dropdownvalue=category!;
    update();

  }

}
