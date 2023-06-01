#ifndef FLUTTER_PLUGIN_SMART_TEXT_SEARCH_PLUGIN_H_
#define FLUTTER_PLUGIN_SMART_TEXT_SEARCH_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace smart_text_search {

class SmartTextSearchPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SmartTextSearchPlugin();

  virtual ~SmartTextSearchPlugin();

  // Disallow copy and assign.
  SmartTextSearchPlugin(const SmartTextSearchPlugin&) = delete;
  SmartTextSearchPlugin& operator=(const SmartTextSearchPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace smart_text_search

#endif  // FLUTTER_PLUGIN_SMART_TEXT_SEARCH_PLUGIN_H_
