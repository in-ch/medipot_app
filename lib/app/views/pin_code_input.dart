import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:medipot_app/app/controllers/controllers.dart';

class PinCodeInput extends GetView<PhoneController> {
  const PinCodeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        6,
        (index) => Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              style: const TextStyle(
                fontSize: 12,
              ),
              controller: controller.pinControllers[index],
              focusNode: controller.focusPinNodes[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  if (index < 5) {
                    FocusScope.of(context)
                        .requestFocus(controller.focusPinNodes[index + 1]);
                  }
                } else {
                  if (index > 0) {
                    FocusScope.of(context)
                        .requestFocus(controller.focusPinNodes[index - 1]);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
