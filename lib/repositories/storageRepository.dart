import 'dart:io';

import 'package:ckpmessaging/providers/storageProvider.dart';

class StorageRepository{
  StorageProvider storageProvider = StorageProvider();
  Future<String> uploadImage(File file, String path) => storageProvider.uploadImage(file, path);
} 