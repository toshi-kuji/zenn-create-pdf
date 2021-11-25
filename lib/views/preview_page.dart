import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../services/pdf_creator.dart';
import '../services/save_helper/save_helper.dart';

class PreviewPage extends StatelessWidget {
  final String fileName;

  const PreviewPage(
    this.fileName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: PdfPreview(
        maxPageWidth: 600,
        allowPrinting: true,
        allowSharing: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        loadingWidget: const LinearProgressIndicator(),
        build: (format) async {
          final pdf = await PdfCreator.create();
          return await pdf.save();
        },
        actions: [
          PdfPreviewAction(
            icon: const Icon(Icons.download),
            onPressed: (context, build, format) async {
              await SaveHelper.save(
                bytes: await build(format),
                fileName: fileName,
                platform: Theme.of(context).platform,
              );
            },
          ),
        ],
      ),
    );
  }
}
