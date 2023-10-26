import 'package:c_hat_server_manager/model/build_type.dart';
import 'package:c_hat_server_manager/model/plugin.dart';

class ServerInstance {
  final String name;
  final String version;
  final BuildType buildType;
  final Uri url;
  final List<Plugin> plugins;
  final bool isInstalled;

  const ServerInstance({
    this.name = "INSTALLED=FALSE",
    required this.version,
    required this.buildType,
    required this.url,
    required this.plugins,
    required this.isInstalled
  });

  @override
  String toString() {
    return "ServerInstance:{name: $name, version: $version, buildType: $buildType, url: $url, plugins: $plugins, isInstalled: $isInstalled}";
  }
}