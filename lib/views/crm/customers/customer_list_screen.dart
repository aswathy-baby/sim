// lib/views/crm/customers/customer_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/crm_controller.dart';
import 'add_edit_customer_screen.dart';

class CustomerListScreen extends StatelessWidget {
  static const String routeName = '/crm/customers';

  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: Consumer<CrmController>(
        builder: (context, controller, child) {
          if (controller.isLoadingCustomers) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.customerError != null) {
            return Center(child: Text('Error: ${controller.customerError}'));
          }

          if (controller.customers.isEmpty) {
            return const Center(child: Text('No customers found.'));
          }

          return ListView.builder(
            itemCount: controller.customers.length,
            itemBuilder: (context, index) {
              final customer = controller.customers[index];
              return ListTile(
                title: Text(customer.name),
                subtitle: Text('${customer.email} | ${customer.phone}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditCustomerScreen(customer: customer),
                        ),
                      );
                    } else if (value == 'delete') {
                      _confirmDelete(context, controller, customer.id);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Edit', 'Delete'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice.toLowerCase(),
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
                onTap: () {
                  // Optionally navigate to a detailed view
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditCustomerScreen(),
            ),
          );
        },
        tooltip: 'Add Customer',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(BuildContext context, CrmController controller, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Customer'),
          content: const Text('Are you sure you want to delete this customer?'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                bool success = await controller.deleteCustomer(id);
                if (success) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Customer deleted successfully.')),
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to delete customer.')),
                  );
                }
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
