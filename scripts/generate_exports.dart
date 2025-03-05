import 'dart:io';

void main() {
  const String libraryPath = 'lib'; // Change to your library path
  const String exportFile = '$libraryPath/library.dart';

  Directory dir = Directory(libraryPath);
  List<FileSystemEntity> files = dir.listSync(recursive: true);

  List<String> exports = [];

  for (var file in files) {
    if (file is File && file.path.endsWith('.dart') && !file.path.endsWith('library.dart')) {
      String relativePath = file.path.replaceFirst('lib/', '');
      exports.add("export '$relativePath';");
    }
  }

  File(exportFile).writeAsStringSync(exports.join('\n'));

  print('Generated $exportFile with ${exports.length} exports.');
}
