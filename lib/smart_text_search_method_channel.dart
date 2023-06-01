import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'smart_text_search_platform_interface.dart';

/// An implementation of [SmartTextSearchPlatform] that uses method channels.
class MethodChannelSmartTextSearch extends SmartTextSearchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('smart_text_search');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
