import 'package:flutter/material.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({super.key});

  @override
  PinCodeInputState createState() => PinCodeInputState();
}

class PinCodeInputState extends State<PinCodeInput> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _controllers = List.generate(6, (index) => TextEditingController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  if (index < 5) {
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  }
                } else {
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
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
