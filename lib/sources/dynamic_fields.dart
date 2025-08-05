import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'form_result_page.dart';

class DynamicFieldsPage extends StatefulWidget {
  const DynamicFieldsPage({super.key});

  @override
  State<DynamicFieldsPage> createState() => _DynamicFieldsPageState();
}

class _DynamicFieldsPageState extends State<DynamicFieldsPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Map<String, dynamic>> _dynamicFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Fields Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // Static fields
              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(
                  labelText: 'Form Title',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 16),
              
              // Dynamic fields section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Dynamic Fields',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: _addField,
                            icon: const Icon(Icons.add),
                            label: const Text('Add Field'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Display dynamic fields
                      ..._dynamicFields.asMap().entries.map((entry) {
                        final index = entry.key;
                        final field = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: FormBuilderTextField(
                                  name: 'dynamic_field_$index',
                                  decoration: InputDecoration(
                                    labelText: field['label'],
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () => _removeField(index),
                                icon: const Icon(Icons.delete, color: Colors.red),
                                tooltip: 'Remove field',
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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

  void _addField() {
    setState(() {
      _dynamicFields.add({
        'label': 'Field ${_dynamicFields.length + 1}',
        'type': 'text',
      });
    });
  }

  void _removeField(int index) {
    setState(() {
      _dynamicFields.removeAt(index);
    });
  }
} 