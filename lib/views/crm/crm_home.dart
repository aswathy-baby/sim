// lib/views/crm/crm_home.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customers/customer_list_screen.dart';
import 'leads/lead_list_screen.dart';
import '/controllers/crm_controller.dart';

class CrmHome extends StatelessWidget {
  static const String routeName = '/crm';

  const CrmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CrmController()..fetchCustomers()..fetchLeads(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRM Module'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CustomerListScreen.routeName);
                },
                child: const Text('Manage Customers'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LeadListScreen.routeName);
                },
                child: const Text('Manage Leads'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
