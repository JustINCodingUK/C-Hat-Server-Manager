enum BuildType {
  alpha,
  beta,
  preRelease,
  stable,
  unknown;

  @override
  String toString() {
    switch(this) {
      
      case BuildType.alpha:
        return "Alpha";
      case BuildType.beta:
        return "Beta";
      case BuildType.preRelease:
        return "Pre Release";
      case BuildType.stable:
        return "Stable";
      case BuildType.unknown:
        return "Unknown";
    }
  }
}