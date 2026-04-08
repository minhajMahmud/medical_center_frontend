import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CloudinaryUpload {
  static const String _cloudName = 'dorcxchuf';
  static const String _apiKey = '889137245574349';
  static const String _apiSecret = 'UQARnH8trtIbeFP7Oowva3ILF9M';

  static Uri _uploadUri() =>
      Uri.parse('https://api.cloudinary.com/v1_1/$_cloudName/auto/upload');

  static bool _isPdfName(String fileName) =>
      fileName.toLowerCase().trim().endsWith('.pdf');

  static MediaType _contentTypeForName(String fileName, {required bool isPdf}) {
    if (isPdf) return MediaType('application', 'pdf');
    final name = fileName.toLowerCase().trim();
    if (name.endsWith('.png')) return MediaType('image', 'png');
    if (name.endsWith('.jpg') || name.endsWith('.jpeg')) {
      return MediaType('image', 'jpeg');
    }
    return MediaType('image', 'jpeg');
  }

  static String _sanitizeFileName(String fileName) {
    final trimmed = fileName.trim();
    if (trimmed.isEmpty) {
      return 'upload_${DateTime.now().millisecondsSinceEpoch}';
    }
    return trimmed.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
  }

  /// Generates a Cloudinary signed-upload signature.
  /// params must NOT include api_key or file.
  static String _generateSignature(Map<String, String> params) {
    final sorted = params.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final paramString = sorted.map((e) => '${e.key}=${e.value}').join('&');
    final toSign = '$paramString$_apiSecret';
    return sha1.convert(utf8.encode(toSign)).toString();
  }

  /// Convenience: infer `isPdf` + content-type from `fileName`.
  static Future<String?> uploadAuto({
    required Uint8List bytes,
    required String folder,
    required String fileName,
  }) {
    final safeName = _sanitizeFileName(fileName);
    return uploadBytes(
      bytes: bytes,
      folder: folder,
      fileName: safeName,
      isPdf: _isPdfName(safeName),
    );
  }

  /// Universal uploader for image/PDF bytes using signed upload.
  static Future<String?> uploadBytes({
    required Uint8List bytes,
    required String folder,
    required String fileName,
    bool isPdf = false,
  }) async {
    try {
      final safeName = _sanitizeFileName(fileName);
      final inferredIsPdf = isPdf || _isPdfName(safeName);
      final timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000)
          .toString();
      final signParams = {'folder': folder, 'timestamp': timestamp};
      final signature = _generateSignature(signParams);

      final request = http.MultipartRequest('POST', _uploadUri())
        ..fields['api_key'] = _apiKey
        ..fields['timestamp'] = timestamp
        ..fields['signature'] = signature
        ..fields['folder'] = folder
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            bytes,
            filename: safeName,
            contentType: _contentTypeForName(safeName, isPdf: inferredIsPdf),
          ),
        );

      final streamed = await request.send();
      final resp = await http.Response.fromStream(streamed);

      if (resp.statusCode >= 200 && resp.statusCode < 300) {
        final data = jsonDecode(resp.body);
        final secureUrl = data['secure_url'];
        return secureUrl?.toString();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Convenience: upload base64 string (with or without data-url prefix).
  static Future<String?> uploadBase64({
    required String base64Data,
    required String folder,
    required String fileName,
    bool isPdf = false,
  }) async {
    var s = base64Data.trim();
    if (s.isEmpty) return null;
    if (s.contains(',')) {
      s = s.split(',').last;
    }
    s = s.replaceAll(RegExp(r'\s+'), '');
    try {
      final bytes = base64Decode(s);
      return uploadBytes(
        bytes: bytes,
        folder: folder,
        fileName: fileName,
        isPdf: isPdf,
      );
    } catch (_) {
      return null;
    }
  }
}
