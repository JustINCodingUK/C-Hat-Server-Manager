import 'package:c_hat_server_manager/bloc/event/version_event.dart';
import 'package:c_hat_server_manager/bloc/state/version_state.dart';
import 'package:c_hat_server_manager/repository/version_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VersionBloc extends Bloc<VersionEvent, VersionState>  {
  
  VersionBloc() : super(InitialVersionState()) {
    final repository = VersionListRepository();
    on<VersionListRequestedEvent>((event, emit) async {
      final versionList = await repository.getVersionList();
      emit(VersionListReceivedState(versionList));
    });

    on<ServerDownloadEvent>((event, emit) async {
      emit(DownloadRunningState());
      if(await repository.saveJarToStorage(event.instance)) {
        emit(DownloadCompletedState());
      } else {
        emit(DownloadFailedState());
      }
    });
  }

}