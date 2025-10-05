import 'package:flutter/material.dart';

class CustomizationScreen extends StatefulWidget {
  @override
  _CustomizationScreenState createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _engravingText = '';
  bool _giftBox = false;
  bool _expressDelivery = false;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Function to show date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Jewelry'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Engraving Text',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    _engravingText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _giftBox,
                    onChanged: (value) {
                      setState(() {
                        _giftBox = value ?? false;
                      });
                    },
                  ),
                  Text('Include Gift Box'),
                ],
              ),
              Row(
                children: [
                  Switch(
                    value: _expressDelivery,
                    onChanged: (value) {
                      setState(() {
                        _expressDelivery = value;
                      });
                    },
                  ),
                  Text('Express Delivery'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Select Delivery Date'
                        : 'Date: ${_selectedDate!.toString().split(' ')[0]}',
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () => _pickDate(context),
                    child: Text('Pick Date'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    _selectedTime == null
                        ? 'Select Delivery Time'
                        : 'Time: ${_selectedTime!.format(context)}',
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () => _pickTime(context),
                    child: Text('Pick Time'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String dateStr = _selectedDate == null
                        ? 'Not selected'
                        : _selectedDate!.toString().split(' ')[0];
                    String timeStr = _selectedTime == null
                        ? 'Not selected'
                        : _selectedTime!.format(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Engraving: $_engravingText, Gift Box: $_giftBox, '
                          'Express Delivery: $_expressDelivery, Date: $dateStr, Time: $timeStr',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}