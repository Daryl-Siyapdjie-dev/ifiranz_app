import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/infrastructure/utils/common_import.dart';

final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService();
});

class ImagePickerService {
  final _picker = ImagePicker();

  Future<File?> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source, imageQuality: ImageSource.camera == source ? 30 : 70);
      if (pickedFile != null) {
        File compressedImage = await compressIfNeeded(File(pickedFile.path));
        return compressedImage;
      }
    } catch (_) {}
    return null;
  }

  Future<File> compressIfNeeded(File file) async {
    const int maxSizeInBytes = 2 * 1024 * 1024; // 2 MB

    if (file.lengthSync() > maxSizeInBytes) {
      // Si la taille de l'image est supérieure à 2 Mo, compresser

      return await compressImage(file);
    } else {
      // Sinon, renvoyer l'image originale
      return file;
    }
  }

  Future<File> compressImage(File file) async {
    return file;
  }
}
