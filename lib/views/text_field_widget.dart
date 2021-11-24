import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.black12,
              contentPadding: EdgeInsets.all(12),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.pink),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
