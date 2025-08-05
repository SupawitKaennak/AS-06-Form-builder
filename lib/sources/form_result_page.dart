import 'package:flutter/material.dart';

class FormResultPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  const FormResultPage({
    super.key,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Results'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Form Submitted Successfully!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total fields: ${formData.length}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Form Data Display
            const Text(
              'Submitted Data:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            // Display all form data
            ...formData.entries.map((entry) {
              return _buildDataCard(entry.key, entry.value);
            }).toList(),

            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Form'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showJsonData(context);
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('View JSON'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(String key, dynamic value) {
    // Format the key for display
    String displayKey = _formatKey(key);
    
    // Format the value for display
    String displayValue = _formatValue(value);

    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Key section
            Row(
              children: [
                Icon(
                  Icons.key,
                  size: 20,
                  color: Colors.blue[600],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    displayKey,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // Value section
            Row(
              children: [
                Icon(
                  Icons.data_usage,
                  size: 20,
                  color: Colors.green[600],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    displayValue,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatKey(String key) {
    // Convert snake_case to Title Case
    return key
        .split('_')
        .map((word) => word.isNotEmpty 
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }

  String _formatValue(dynamic value) {
    if (value == null) {
      return 'Not provided';
    }
    
    if (value is List) {
      if (value.isEmpty) {
        return 'None selected';
      }
      return value.join(', ');
    }
    
    if (value is DateTime) {
      return '${value.day}/${value.month}/${value.year}';
    }
    
    if (value is RangeValues) {
      return '${value.start.round()} - ${value.end.round()}';
    }
    
    if (value is bool) {
      return value ? 'Yes' : 'No';
    }
    
    return value.toString();
  }

  void _showJsonData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('JSON Data'),
          content: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _formatJsonData(formData),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  String _formatJsonData(Map<String, dynamic> data) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln('{');
    
    data.forEach((key, value) {
      String formattedValue;
      if (value is String) {
        formattedValue = '"$value"';
      } else if (value is DateTime) {
        formattedValue = '"${value.toIso8601String()}"';
      } else if (value is RangeValues) {
        formattedValue = '{"start": ${value.start}, "end": ${value.end}}';
      } else {
        formattedValue = value.toString();
      }
      
      buffer.writeln('  "$key": $formattedValue,');
    });
    
    // Remove the last comma
    String result = buffer.toString();
    if (result.endsWith(',\n')) {
      result = result.substring(0, result.length - 2) + '\n';
    }
    
    buffer.clear();
    buffer.write(result);
    buffer.write('}');
    
    return buffer.toString();
  }
} 