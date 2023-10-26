import 'package:c_hat_server_manager/model/build_type.dart';

extension StringToBuildType on String {
  BuildType toBuildType() {
    switch(toLowerCase()) {
      case "pre-release":
        return BuildType.preRelease;
      case "alpha":
        return BuildType.alpha;
      case "beta":
        return BuildType.beta;
      case "stable":
        return BuildType.stable;
      default: 
        return BuildType.unknown;
    }
  }
}