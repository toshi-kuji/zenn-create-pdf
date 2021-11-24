import 'package:flutter/material.dart';
import 'package:pdf_test/views/dialog_widget.dart';

class FileNameWidget extends StatefulWidget {
  final String fileType;

  const FileNameWidget({Key? key, required this.fileType}) : super(key: key);

  @override
  State<FileNameWidget> createState() => FileNameWidgetState();
}

class FileNameWidgetState extends State<FileNameWidget> {
  String fileName = 'sample';

  void _showDialog() async {
    final input = await showDialog<String?>(
      context: context,
      builder: (context) {
        return DialogWidget(initialInput: fileName);
      },
    );
    if (input != null) {
      setState(() => fileName = input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: _showDialog,
        ),
        Text(
          fileName,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(width: 30),
        Text('.' + widget.fileType),
      ],
    );
  }
}
