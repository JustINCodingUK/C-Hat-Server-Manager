import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:c_hat_server_manager/model/server_instance.dart';
import 'package:http/http.dart';
import 'package:c_hat_server_manager/dev/ext/str_to_buildtype.dart';
import 'package:path_provider/path_provider.dart';

class VersionListRepository {

  Future<bool> _isServerInstalled(String version) async {
    final appDir = await getApplicationCacheDirectory();
    final serverList = File("${appDir.path}/server_list.json");
    if(await serverList.exists() == false) {
      await serverList.create();
    }

    final List<String> jsonData = jsonDecode(await serverList.readAsString());
    if(jsonData.contains(version)) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ServerInstance>> getVersionList() async {
    final apiResponse = await get(Uri.parse("https://api.github.com/repos/justincodinguk/c-hat-server-v2/releases"));
    final decodedJson = jsonDecode(apiResponse.body);

    final versionList = <ServerInstance>[];

    for(Map<String, dynamic> release in decodedJson){
      final instanceBuildType = (release["tag_name"] as String).toBuildType();
      final instanceVersion = (release["assets"][0]["name"] as String).split("-v").last.replaceAll(".jar", "");
      final url = Uri.parse(release["assets"][0]["browser_download_url"]);

      versionList.add(ServerInstance(version: instanceVersion, buildType: instanceBuildType, url: url, plugins: [], isInstalled: await _isServerInstalled(instanceVersion)));
    }

    return versionList;
  }

  Future<bool> saveJarToStorage(ServerInstance instance) async {
    try {
      
      final applicationDirectory = await getApplicationCacheDirectory();
      final versionDirectory = Directory("${applicationDirectory.path}/${instance.version}");
      
      if(!(await versionDirectory.exists())) {
        versionDirectory.create(recursive: true);
      }

      final libUrl = instance.url.toString().replaceAll("c_hat_server", "libc_hat");

      final serverJar = await get(instance.url);
      final serverLib = await get(Uri.parse(libUrl));

      Directory("${versionDirectory.path}/plugins").create();
      Directory("${versionDirectory.path}/dev").create();

      final pluginsJson = File("${versionDirectory.path}/plugins.json");
      final jar = File("${versionDirectory.path}/server.jar");
      final libJar = File("${versionDirectory.path}/dev/libc_hat.jar");

      await jar.writeAsBytes(serverJar.bodyBytes);
      await libJar.writeAsBytes(serverLib.bodyBytes);
      await pluginsJson.writeAsString("{}");

      

      return true;

    } catch(e) {
      log(e.toString());
      return false;
    }
  } 

}