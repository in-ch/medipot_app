bool isVersionLowerThan(String version, String currentVersion) {
  List<int> versionParts = version.split('.').map(int.parse).toList();
  List<int> currentVersionParts =
      currentVersion.split('.').map(int.parse).toList();

  for (int i = 0; i < versionParts.length; i++) {
    if (currentVersionParts[i] < versionParts[i]) {
      return true;
    } else if (currentVersionParts[i] > versionParts[i]) {
      return false;
    }
  }
  return false;
}
