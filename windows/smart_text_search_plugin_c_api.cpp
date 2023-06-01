#include "include/smart_text_search/smart_text_search_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "smart_text_search_plugin.h"

void SmartTextSearchPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  smart_text_search::SmartTextSearchPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
