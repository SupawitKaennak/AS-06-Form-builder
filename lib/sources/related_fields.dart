import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'form_result_page.dart';

class RelatedFieldsPage extends StatefulWidget {
  const RelatedFieldsPage({super.key});

  @override
  State<RelatedFieldsPage> createState() => _RelatedFieldsPageState();
}

class _RelatedFieldsPageState extends State<RelatedFieldsPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _selectedCountry;
  String? _selectedState;
  String? _selectedCity;

  final Map<String, List<String>> _statesByCountry = {
    'USA': ['California', 'New York', 'Texas', 'Florida'],
    'Canada': ['Ontario', 'Quebec', 'British Columbia', 'Alberta'],
    'UK': ['England', 'Scotland', 'Wales', 'Northern Ireland'],
  };

  final Map<String, List<String>> _citiesByState = {
    'California': ['Los Angeles', 'San Francisco', 'San Diego'],
    'New York': ['New York City', 'Buffalo', 'Rochester'],
    'Texas': ['Houston', 'Dallas', 'Austin'],
    'Florida': ['Miami', 'Orlando', 'Tampa'],
    'Ontario': ['Toronto', 'Ottawa', 'Mississauga'],
    'Quebec': ['Montreal', 'Quebec City', 'Laval'],
    'British Columbia': ['Vancouver', 'Victoria', 'Surrey'],
    'Alberta': ['Calgary', 'Edmonton', 'Red Deer'],
    'England': ['London', 'Manchester', 'Birmingham'],
    'Scotland': ['Edinburgh', 'Glasgow', 'Aberdeen'],
    'Wales': ['Cardiff', 'Swansea', 'Newport'],
    'Northern Ireland': ['Belfast', 'Derry', 'Lisburn'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Related Fields Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              // Country Selection
              FormBuilderDropdown<String>(
                name: 'country',
                decoration: const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.public),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                items: _statesByCountry.keys
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                    _selectedState = null;
                    _selectedCity = null;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              // State Selection (depends on country)
              if (_selectedCountry != null) ...[
                FormBuilderDropdown<String>(
                  name: 'state',
                  decoration: const InputDecoration(
                    labelText: 'State/Province',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  items: _statesByCountry[_selectedCountry]!
                      .map((state) => DropdownMenuItem(
                            value: state,
                            child: Text(state),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedState = value;
                      _selectedCity = null;
                    });
                  },
                ),
                const SizedBox(height: 16),
              ],
              
              // City Selection (depends on state)
              if (_selectedState != null) ...[
                FormBuilderDropdown<String>(
                  name: 'city',
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  items: _citiesByState[_selectedState]!
                      .map((city) => DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
              ],
              
              // Address fields (only show when city is selected)
              if (_selectedCity != null) ...[
                FormBuilderTextField(
                  name: 'street_address',
                  decoration: const InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 16),
                
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'postal_code',
                        decoration: const InputDecoration(
                          labelText: 'Postal Code',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'phone',
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
              
              // Submit button
              if (_selectedCity != null) ...[
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
            ],
          ),
        ),
      ),
    );
  }
} 