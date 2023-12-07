import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
            const SizedBox(height: 24),
            Text(picture.name),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _saveToGallery(context, picture.path);
              },
              child: const Text('Save to Gallery'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveToGallery(BuildContext context, String filePath) async {
    try {
      // Read the file and convert it to Uint8List
      Uint8List bytes = File(filePath).readAsBytesSync();
      
      // Save the image to the gallery
      await ImageGallerySaver.saveImage(Uint8List.fromList(bytes), );
      
      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image saved to gallery')),
      );
    } catch (e) {
      // Handle errors, e.g., permission issues
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save image')),
      );
      print('Error saving image: $e');
    }
  }
}
