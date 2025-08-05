import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'sources/conditional_fields.dart';
import 'sources/decorated_radio_checkbox.dart';
import 'sources/dynamic_fields.dart';
import 'sources/grouped_radio_checkbox.dart';
import 'sources/related_fields.dart';
import 'sources/complete_form.dart';
import 'sources/custom_fields.dart';
import 'sources/signup_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Builder Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('th', ''),
      ],
      home: const CodePage(),
    );
  }
}

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExampleCard(
            context,
            'Complete Form',
            'A comprehensive form with all types of fields',
            Icons.assignment,
            Colors.blue,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CompleteFormPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Sign Up Form',
            'User registration form with validation',
            Icons.person_add,
            Colors.green,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupFormPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Conditional Fields',
            'Show/hide fields based on user input',
            Icons.visibility,
            Colors.orange,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ConditionalFieldsPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Related Fields',
            'Dependent dropdown fields',
            Icons.link,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RelatedFieldsPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Dynamic Fields',
            'Add/remove fields dynamically',
            Icons.add_circle,
            Colors.red,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DynamicFieldsPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Decorated Radio & Checkbox',
            'Styled radio buttons and checkboxes',
            Icons.radio_button_checked,
            Colors.teal,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DecoratedRadioCheckboxPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Grouped Radio & Checkbox',
            'Organized form controls in groups',
            Icons.group_work,
            Colors.indigo,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GroupedRadioCheckboxPage()),
            ),
          ),
          _buildExampleCard(
            context,
            'Custom Fields',
            'Custom form field implementations',
            Icons.build,
            Colors.amber,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomFieldsPage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 