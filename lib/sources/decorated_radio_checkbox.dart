import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'form_result_page.dart';

class DecoratedRadioCheckboxPage extends StatefulWidget {
  const DecoratedRadioCheckboxPage({super.key});

  @override
  State<DecoratedRadioCheckboxPage> createState() => _DecoratedRadioCheckboxPageState();
}

class _DecoratedRadioCheckboxPageState extends State<DecoratedRadioCheckboxPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decorated Radio & Checkbox'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // Decorated Radio Buttons
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Your Favorite Color:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderRadioGroup<String>(
                        name: 'favorite_color',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        options: const [
                          FormBuilderFieldOption(
                            value: 'red',
                            child: Row(
                              children: [
                                Icon(Icons.circle, color: Colors.red, size: 20),
                                SizedBox(width: 8),
                                Text('Red'),
                              ],
                            ),
                          ),
                          FormBuilderFieldOption(
                            value: 'blue',
                            child: Row(
                              children: [
                                Icon(Icons.circle, color: Colors.blue, size: 20),
                                SizedBox(width: 8),
                                Text('Blue'),
                              ],
                            ),
                          ),
                          FormBuilderFieldOption(
                            value: 'green',
                            child: Row(
                              children: [
                                Icon(Icons.circle, color: Colors.green, size: 20),
                                SizedBox(width: 8),
                                Text('Green'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Decorated Checkboxes
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Your Interests:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderCheckboxGroup<String>(
                        name: 'interests',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        options: const [
                          FormBuilderFieldOption(
                            value: 'sports',
                            child: Row(
                              children: [
                                Icon(Icons.sports_soccer, color: Colors.orange),
                                SizedBox(width: 8),
                                Text('Sports'),
                              ],
                            ),
                          ),
                          FormBuilderFieldOption(
                            value: 'music',
                            child: Row(
                              children: [
                                Icon(Icons.music_note, color: Colors.purple),
                                SizedBox(width: 8),
                                Text('Music'),
                              ],
                            ),
                          ),
                          FormBuilderFieldOption(
                            value: 'reading',
                            child: Row(
                              children: [
                                Icon(Icons.book, color: Colors.brown),
                                SizedBox(width: 8),
                                Text('Reading'),
                              ],
                            ),
                          ),
                          FormBuilderFieldOption(
                            value: 'travel',
                            child: Row(
                              children: [
                                Icon(Icons.flight, color: Colors.blue),
                                SizedBox(width: 8),
                                Text('Travel'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final formData = _formKey.currentState!.value;
                    debugPrint('Form submitted: $formData');
                    
                    // Navigate to result page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormResultPage(formData: formData),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 