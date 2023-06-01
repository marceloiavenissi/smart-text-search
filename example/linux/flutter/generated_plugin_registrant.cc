//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <smart_text_search/smart_text_search_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) smart_text_search_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartTextSearchPlugin");
  smart_text_search_plugin_register_with_registrar(smart_text_search_registrar);
}
