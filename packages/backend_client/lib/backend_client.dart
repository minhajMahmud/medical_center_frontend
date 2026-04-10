export 'src/protocol/protocol.dart';
export 'package:serverpod_client/serverpod_client.dart';
import 'package:backend_client/backend_client.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cross-platform auth key storage.
///
/// Stores the Serverpod authentication key (JWT) in SharedPreferences.
/// Works for mobile/desktop/web.
// ignore: deprecated_member_use
class PrefsAuthenticationKeyManager extends AuthenticationKeyManager {
  static const _key = 'serverpod_auth_key';

  @override
  Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(_key);
    if (v == null || v.isEmpty) return null;
    return v;
  }

  @override
  Future<void> put(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, key);
  }

  @override
  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  @override
  Future<String?> toHeaderValue(String? key) async {
    final v = key?.trim();
    if (v == null || v.isEmpty) return null;
    // Serverpod expects Authorization: Bearer <authKey>
    return 'Bearer $v';
  }
}

late Client client;
late PrefsAuthenticationKeyManager authKeyManager;

const _defaultProductionUrl =
    'https://medicalcenterbackend-production.up.railway.app/';

String _normalizeServerUrl(String raw) {
  var url = raw.trim();
  if (url.isEmpty) return _defaultProductionUrl;

  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    url = 'https://$url';
  }

  if (!url.endsWith('/')) {
    url = '$url/';
  }

  return url;
}

bool _isLocalDevUrl(String url) {
  final u = url.toLowerCase();
  return u.contains('localhost') ||
      u.contains('127.0.0.1') ||
      u.contains('0.0.0.0');
}

void initServerpodClient() {
  const configuredServerUrl = String.fromEnvironment(
    'SERVERPOD_URL',
    defaultValue: _defaultProductionUrl,
  );

  var serverUrl = _normalizeServerUrl(configuredServerUrl);

  if (kReleaseMode && _isLocalDevUrl(serverUrl)) {
    // Safety net: release builds should never point to localhost.
    serverUrl = _defaultProductionUrl;
  }

  authKeyManager = PrefsAuthenticationKeyManager();
  client = Client(
    serverUrl,
    // ignore: deprecated_member_use_from_same_package
    authenticationKeyManager: authKeyManager,
  );

  print('Serverpod client initialized → $serverUrl');
}
