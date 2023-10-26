import 'package:c_hat_server_manager/model/server_instance.dart';

abstract class VersionEvent {}

class VersionListRequestedEvent extends VersionEvent {}

class ServerDownloadEvent extends VersionEvent {
  final ServerInstance instance;
  ServerDownloadEvent(this.instance);
}