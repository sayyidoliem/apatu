import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/presentation/cubit/scanner_cubit.dart';
import 'package:scanner/presentation/cubit/scanner_state.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body: BlocProvider(
        create: (context) => ScannerCubit(),
        child: ScannerView(),
      ),
    );
  }
}

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerCubit, ScannerState>(
      listener: (context, state) {
        // Optional: Show a snackbar or handle additional side effects
        
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.imageFile == null
                  ? Text('Select an image to analyze')
                  : Image.file(state.imageFile!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<ScannerCubit>().pickImage();
                },
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              Text(
                state.extractedText.isNotEmpty
                    ? state.extractedText
                    : 'Extracted text will appear here',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
