// lib/routes/app_routes.dart

import '../views/login/login_screen.dart';
import '../views/crm/dashboard/dashboard_screen.dart'; // Import DashboardScreen
import '../views/crm/crm_home.dart';
import '../views/crm/customers/customer_list_screen.dart';
import '../views/crm/customers/add_edit_customer_screen.dart';
import '../views/crm/leads/lead_list_screen.dart';
import '../views/crm/leads/add_edit_lead_screen.dart';
// Import other screens as needed

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String crmHome = '/crm';
  static const String customerList = '/crm/customers';
  static const String addEditCustomer = '/crm/customers/add_edit';
  static const String leadList = '/crm/leads';
  static const String addEditLead = '/crm/leads/add_edit';

  static final routes = {
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(), // Added DashboardScreen
    crmHome: (context) => const CrmHome(),
    customerList: (context) => const CustomerListScreen(),
    addEditCustomer: (context) => const AddEditCustomerScreen(),
    leadList: (context) => const LeadListScreen(),
    addEditLead: (context) => const AddEditLeadScreen(),
    // Add other routes here
  };
}
