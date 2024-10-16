// lib/views/crm/customers/add_edit_customer_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/crm_controller.dart';
import '/models/customer.dart';

class AddEditCustomerScreen extends StatefulWidget {
  final Customer? customer;

  const AddEditCustomerScreen({super.key, this.customer});

  @override
  _AddEditCustomerScreenState createState() => _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState extends State<AddEditCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _phone;
  late String _address;

  @override
  void initState() {
    super.initState();
    _name = widget.customer?.name ?? '';
    _email = widget.customer?.email ?? '';
    _phone = widget.customer?.phone ?? '';
    _address = widget.customer?.address ?? '';
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      CrmController controller = Provider.of<CrmController>(context, listen: false);

      Customer customer = Customer(
        id: widget.customer?.id ?? '',
        name: _name,
        email: _email,
        phone: _phone,
        address: _address,
        createdAt: widget.customer?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      bool success;
      if (widget.customer == null) {
        success = await controller.addCustomer(customer);
      } else {
        success = await controller.updateCustomer(customer);
      }

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.customer == null ? 'Customer added successfully.' : 'Customer updated successfully.')),
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
    bool isEditing = widget.customer != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Customer' : 'Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Field
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Please enter the name' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 10),
              // Email Field
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter the email';
                  final regex = RegExp(r'^\S+@\S+\.\S+$');
                  if (!regex.hasMatch(value)) return 'Enter a valid email';
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 10),
              // Phone Field
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Please enter the phone number' : null,
                onSaved: (value) => _phone = value!,
              ),
              const SizedBox(height: 10),
              // Address Field
              TextFormField(
                initialValue: _address,
                decoration: const InputDecoration(labelText: 'Address'),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? 'Please enter the address' : null,
                onSaved: (value) => _address = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? 'Update Customer' : 'Add Customer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
