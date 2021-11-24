// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';

class SaveHelper {
  static Future<void> save({
    required List<int> bytes,
    required String fileName,
    required TargetPlatform platform,
  }) async {
    final element = AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}');
    element.setAttribute('download', fileName);
    element.click();
  }
}
