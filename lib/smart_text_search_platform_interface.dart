import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'smart_text_search_method_channel.dart';

abstract class SmartTextSearchPlatform extends PlatformInterface {
  /// Constructs a SmartTextSearchPlatform.
  SmartTextSearchPlatform() : super(token: _token);

  static final Object _token = Object();

  static SmartTextSearchPlatform _instance = MethodChannelSmartTextSearch();

  /// The default instance of [SmartTextSearchPlatform] to use.
  ///
  /// Defaults to [MethodChannelSmartTextSearch].
  static SmartTextSearchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SmartTextSearchPlatform] when
  /// they register themselves.
  static set instance(SmartTextSearchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
