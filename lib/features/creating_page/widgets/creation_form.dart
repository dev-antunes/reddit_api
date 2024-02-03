// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CreationForm extends StatelessWidget {
  const CreationForm({
    Key? key,
    required this.label,
    this.textCtrl,
    this.initialValue,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final String label;
  final TextEditingController? textCtrl;
  final String? initialValue;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
              child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              counterText: "",
            ),
            controller: textCtrl,
            keyboardType: keyboardType,
            cursorHeight: 25,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
            cursorColor: Colors.grey.shade200,
            onChanged: (value) => onChanged(value),
          )),
        ),
      ),
    );
  }
}
