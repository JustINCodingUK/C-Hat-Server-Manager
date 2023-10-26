import 'package:c_hat_server_manager/model/server_instance.dart';

abstract class VersionState {}

class InitialVersionState extends VersionState {}

class VersionListReceivedState extends VersionState {
  final List<ServerInstance> versionList;
  VersionListReceivedState(this.versionList);
}

class DownloadRunningState extends VersionState {}

class DownloadCompletedState extends VersionState {}

class DownloadFailedState extends VersionState {}