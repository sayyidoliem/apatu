import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanner/presentation/cubit/scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerState());

  final ImagePicker _imagePicker = ImagePicker();

  // Pick an image from the camera
  Future<void> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      emit(ScannerState(imageFile: File(pickedFile.path)));
      processImage(File(pickedFile.path));
    }
  }

  // Process image to extract text
  Future<void> processImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);
    emit(ScannerState(imageFile: imageFile, extractedText: recognizedText.text));
  }
}