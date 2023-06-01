import 'package:flutter_test/flutter_test.dart';
import 'package:smart_text_search/smart_text_search.dart';
import 'package:smart_text_search/smart_text_search_platform_interface.dart';
import 'package:smart_text_search/smart_text_search_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSmartTextSearchPlatform
    with MockPlatformInterfaceMixin
    implements SmartTextSearchPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SmartTextSearchPlatform initialPlatform = SmartTextSearchPlatform.instance;

  test('$MethodChannelSmartTextSearch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSmartTextSearch>());
  });

  test('getPlatformVersion', () async {
    SmartTextSearch smartTextSearchPlugin = SmartTextSearch();
    MockSmartTextSearchPlatform fakePlatform = MockSmartTextSearchPlatform();
    SmartTextSearchPlatform.instance = fakePlatform;

    expect(await smartTextSearchPlugin.getPlatformVersion(), '42');
  });
}
