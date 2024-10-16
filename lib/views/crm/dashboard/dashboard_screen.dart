import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';

  const DashboardScreen({super.key}); // Define the route name as a constant

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildCrmButton(context, 'View Customers', Icons.people, () {
              // Navigate to view customers screen
              Navigator.pushNamed(context, '/view_customers');
            }),
            _buildCrmButton(context, 'Add Customer', Icons.add, () {
              // Navigate to add customer screen
              Navigator.pushNamed(context, '/add_customer');
            }),
            _buildCrmButton(context, 'Manage Interactions', Icons.message, () {
              // Navigate to manage interactions screen
              Navigator.pushNamed(context, '/manage_interactions');
            }),
            _buildCrmButton(context, 'Reports', Icons.assessment, () {
              // Navigate to reports screen
              Navigator.pushNamed(context, '/reports');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCrmButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}