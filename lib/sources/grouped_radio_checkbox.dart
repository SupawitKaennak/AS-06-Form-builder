import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'form_result_page.dart';

class GroupedRadioCheckboxPage extends StatefulWidget {
  const GroupedRadioCheckboxPage({super.key});

  @override
  State<GroupedRadioCheckboxPage> createState() => _GroupedRadioCheckboxPageState();
}

class _GroupedRadioCheckboxPageState extends State<GroupedRadioCheckboxPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped Radio & Checkbox'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // Personal Information Group
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      FormBuilderTextField(
                        name: 'full_name',
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      
                      FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Preferences Group
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferences',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      const Text(
                        'Gender:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderRadioGroup<String>(
                        name: 'gender',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        options: const [
                          FormBuilderFieldOption(value: 'male', child: Text('Male')),
                          FormBuilderFieldOption(value: 'female', child: Text('Female')),
                          FormBuilderFieldOption(value: 'other', child: Text('Other')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      const Text(
                        'Age Group:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderRadioGroup<String>(
                        name: 'age_group',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        options: const [
                          FormBuilderFieldOption(value: '18-25', child: Text('18-25')),
                          FormBuilderFieldOption(value: '26-35', child: Text('26-35')),
                          FormBuilderFieldOption(value: '36-50', child: Text('36-50')),
                          FormBuilderFieldOption(value: '50+', child: Text('50+')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Interests Group
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Interests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      FormBuilderCheckboxGroup<String>(
                        name: 'hobbies',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        options: const [
                          FormBuilderFieldOption(value: 'reading', child: Text('Reading')),
                          FormBuilderFieldOption(value: 'gaming', child: Text('Gaming')),
                          FormBuilderFieldOption(value: 'cooking', child: Text('Cooking')),
                          FormBuilderFieldOption(value: 'traveling', child: Text('Traveling')),
                          FormBuilderFieldOption(value: 'sports', child: Text('Sports')),
                          FormBuilderFieldOption(value: 'music', child: Text('Music')),
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