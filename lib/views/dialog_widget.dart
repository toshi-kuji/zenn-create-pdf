import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String initialInput;

  const DialogWidget({Key? key, required this.initialInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _popWithValue(String value) {
      Navigator.pop(context, value);
    }

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(30),
      children: [
        const Text('Press ENTER to change your file name.'),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialInput,
          onFieldSubmitted: _popWithValue,
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.black12,
            filled: true,
          ),
        ),
      ],
    );
  }
}
