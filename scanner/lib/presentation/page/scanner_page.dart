import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/presentation/cubit/scanner_cubit.dart';
import 'package:scanner/presentation/cubit/scanner_state.dart';
import 'package:scanner/presentation/page/saved_screen.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Image Recognition With AI'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedScreen()),
              );
            },
            icon: Icon(Icons.person_2_rounded),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => ScannerCubit(),
        child: ScannerView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SavedScreen()),
          );
        },
        child: Icon(Icons.list),
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
                  : Image.file(
                      state.imageFile!,
                      height: 70,
                      width: double.infinity,
                    ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<ScannerCubit>().pickImage();
                },
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 16.0),
                child: Text(
                  state.extractedText.isNotEmpty
                      ? state.extractedText
                      : 'Extracted text will appear here',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (state.imageFile != null && state.extractedText.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    context.read<ScannerCubit>().saveToSupabase(context);
                  },
                  child: Text('Save'),
                )
            ],
          ),
        );
      },
    );
  }
}
