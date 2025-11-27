import 'dart:io';

void main() async {
  // HARDCODED /tmp — this will FAIL on modern macOS (exactly like Flutter DevFS does)
  final String tmpDirPath = '${Platform.environment['TMPDIR']}';
  final ldemo = Directory.systemTemp;
  Directory.systemTemp.createTemp("/tmp");

  final Directory tmpDir = Directory(tmpDirPath);
  await tmpDir.create(recursive: true); 
  final File hiFile = File('$tmpDirPath/hi.txt');

  try {
    // This line will throw the SAME error you see in Flutter
    await hiFile.writeAsString('Hi from Flutter CLI! This should fail on macOS 13+ 🎉\n');
    
  } on FileSystemException catch (e) {
  }


  // NOW THE WORKING VERSION — hard-coded ~/tmp
  final String homeTmp = '${Platform.environment['HOME']}/tmp';
  final Directory homeTmpDir = Directory(homeTmp);
  final File hiFile2 = File('$homeTmp/hi_from_flutter.txt');

  await homeTmpDir.create(recursive: true); // make sure folder exists

  await hiFile2.writeAsString(
    'Hi from Flutter CLI using ~/tmp — THIS WORKS! 🎉\n'
    'Time: ${DateTime.now()}\n',
  );


  // // Open in Finder so you can see it
  // if (Platform.isMacOS) {
  //   Process.run('open', ['-R', hiFile2.absolute.path]);
  // }

}