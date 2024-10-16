// lib/views/crm/leads/lead_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/crm_controller.dart';
import 'add_edit_lead_screen.dart';

class LeadListScreen extends StatelessWidget {
  static const String routeName = '/crm/leads';

  const LeadListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leads'),
      ),
      body: Consumer<CrmController>(
        builder: (context, controller, child) {
          if (controller.isLoadingLeads) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.leadError != null) {
            return Center(child: Text('Error: ${controller.leadError}'));
          }

          if (controller.leads.isEmpty) {
            return const Center(child: Text('No leads found.'));
          }

          return ListView.builder(
            itemCount: controller.leads.length,
            itemBuilder: (context, index) {
              final lead = controller.leads[index];
              return ListTile(
                title: Text('Lead from ${lead.source}'),
                subtitle: Text('Status: ${lead.status}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditLeadScreen(lead: lead),
                        ),
                      );
                    } else if (value == 'delete') {
                      _confirmDelete(context, controller, lead.id);
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
              builder: (context) => const AddEditLeadScreen(),
            ),
          );
        },
        tooltip: 'Add Lead',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _confirmDelete(BuildContext context, CrmController controller, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Lead'),
          content: const Text('Are you sure you want to delete this lead?'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                bool success = await controller.deleteLead(id);
                if (success) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lead deleted successfully.')),
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to delete lead.')),
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
