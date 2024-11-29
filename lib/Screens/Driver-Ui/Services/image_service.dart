import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;

Future<File?> pickImage() async {
  try {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}

Future<String?> saveCompressedImage(File imageFile) async {
  try {
    final bytes = await imageFile.readAsBytes();
    img.Image? originalImage = img.decodeImage(bytes);
    if (originalImage != null) {
      // Resize and compress the image
      img.Image resizedImage = img.copyResize(originalImage, width: 300); // Adjust width as needed
      List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 85); // Adjust quality as needed

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);

      final compressedImageFile = File('${appDir.path}/$fileName');
      await compressedImageFile.writeAsBytes(compressedBytes);

      return compressedImageFile.path;
    } else {
      return null;
    }
  } catch (e) {
    print('Error compressing image: $e');
    return null;
  }
}
