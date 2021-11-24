import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class SaveHelper {
  static Future<void> save({
    required List<int> bytes,
    required String fileName,
    required TargetPlatform platform,
  }) async {
    if (platform == TargetPlatform.macOS) {
      final path = (await getDownloadsDirectory())?.path;
      File('$path/$fileName')
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
    }
  }
}
