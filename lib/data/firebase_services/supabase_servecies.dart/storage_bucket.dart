import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';

class StorageBucket {
  File? imageFile;
  Future<String> uploadProfilePic() async {
    final supabase = Supabase.instance.client;
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return '0';
    }
    imageFile = File(pickedImage.path);
    String filename = basename(pickedImage.path);
    await supabase.storage
        .from('avatars')
        .upload(
          'profile_pics/$filename',
          imageFile!,
          fileOptions: const FileOptions(upsert: true),
        );

    final imageUrl = supabase.storage
        .from('avatars')
        .getPublicUrl('profile_pics/$filename');

    return imageUrl;
  }
}
