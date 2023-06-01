
import 'smart_text_search_platform_interface.dart';

class SmartTextSearch {
  Future<String?> getPlatformVersion() {
    return SmartTextSearchPlatform.instance.getPlatformVersion();
  }
}
