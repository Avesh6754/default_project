import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AuthStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> setLoginStatus(bool isLogin) async {
    await _storage.write(key: 'isLogin', value: isLogin.toString());
  }

  Future<bool> getLoginStatus() async {
    final value = await _storage.read(key: 'isLogin');
    return value == 'true';
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<String> saveFilePermanently(XFile file) async {
    final directory = await getApplicationDocumentsDirectory();
    final newPath = '${directory.path}/${file.name}';
    return File(file.path).copy(newPath).then((f) => f.path);
  }

  Future<List<String>> saveAllImagesPermanently(List<String> paths) async {
    final directory = await getApplicationDocumentsDirectory();
    List<String> savedPaths = [];

    for (var path in paths) {
      final File originalFile = File(path);

      if (await originalFile.exists()) {
        final String filename = path.split('/').last;
        final String newPath = '${directory.path}/$filename';
        final File copiedFile = await originalFile.copy(newPath);
        savedPaths.add(copiedFile.path);
      } else {
        // Optional: add placeholder path or skip
        print('File not found: $path');
      }
    }

    return savedPaths;
  }


}
