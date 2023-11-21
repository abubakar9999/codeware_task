import 'package:codeware/models/product_model.dart';

class Reprository {
  List<AndroidVerison> mydatalist(List<dynamic> data) {
    List<AndroidVerison> androidVersions = [];
    for (var element in data) {
      if (element is Map<String, dynamic>) {
        element.forEach((key, value) {
          var versionMap = value as Map<String, dynamic>;
          androidVersions.add(
              AndroidVerison(id: versionMap['id'], title: versionMap['title']));
        });
      } else if (element is List<dynamic>) {
        for (var versionMap in element) {
          androidVersions.add(
              AndroidVerison(id: versionMap['id'], title: versionMap['title']));
        }
      }
    }

    return androidVersions;
  }
}
