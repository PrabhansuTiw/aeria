import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.onSubmitted,
    required this.onGenerate,
    required this.validated,
  });

  final bool validated;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      validated ? 'Enter number (5-25)' : "Enter a number",
                  border: OutlineInputBorder(),
                ),
                // validator: _validateCount,
                onFieldSubmitted: onSubmitted,
                validator: validated ? _validateCount : null,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(onPressed: onGenerate, child: const Text('Generate')),
        ],
      ),
    );
  }

  String? _validateCount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a number';
    }
    final n = int.tryParse(value.trim());
    if (n == null) {
      return 'Only numeric values allowed';
    }
    if (n < 5 || n > 25) {
      return 'Number must be between 5 and 25';
    }
    return null;
  }
}
