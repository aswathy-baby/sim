// lib/views/crm/leads/add_edit_lead_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/crm_controller.dart';
import '/models/lead.dart';

class AddEditLeadScreen extends StatefulWidget {
  final Lead? lead;

  const AddEditLeadScreen({super.key, this.lead});

  @override
  _AddEditLeadScreenState createState() => _AddEditLeadScreenState();
}

class _AddEditLeadScreenState extends State<AddEditLeadScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _customerId;
  late String _source;
  late String _status;

  @override
  void initState() {
    super.initState();
    _customerId = widget.lead?.customerId ?? '';
    _source = widget.lead?.source ?? '';
    _status = widget.lead?.status ?? 'New';
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      CrmController controller = Provider.of<CrmController>(context, listen: false);

      Lead lead = Lead(
        id: widget.lead?.id ?? '',
        customerId: _customerId,
        source: _source,
        status: _status,
        createdAt: widget.lead?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      bool success;
      if (widget.lead == null) {
        success = await controller.addLead(lead);
      } else {
        success = await controller.updateLead(lead);
      }

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.lead == null ? 'Lead added successfully.' : 'Lead updated successfully.')),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Operation failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.lead != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Lead' : 'Add Lead'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Customer ID Field
              TextFormField(
                initialValue: _customerId,
                decoration: const InputDecoration(labelText: 'Customer ID'),
                validator: (value) => value!.isEmpty ? 'Please enter the customer ID' : null,
                onSaved: (value) => _customerId = value!,
              ),
              const SizedBox(height: 10),
              // Source Field
              TextFormField(
                initialValue: _source,
                decoration: const InputDecoration(labelText: 'Source'),
                validator: (value) => value!.isEmpty ? 'Please enter the lead source' : null,
                onSaved: (value) => _source = value!,
              ),
              const SizedBox(height: 10),
              // Status Field
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: ['New', 'Contacted', 'Qualified', 'Converted', 'Lost']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                onSaved: (value) => _status = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? 'Update Lead' : 'Add Lead'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
