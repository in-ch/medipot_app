import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() async {
    focusNode.requestFocus();
    super.onInit();
  }
}
