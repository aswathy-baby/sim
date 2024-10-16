// test/routes/app_routes_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/routes/app_routes.dart';

// Import all the screen widgets
import 'package:erp_solution/views/login/login_screen.dart';
import 'package:erp_solution/views/crm/crm_home.dart';
import 'package:erp_solution/views/crm/customers/customer_list_screen.dart';
import 'package:erp_solution/views/crm/customers/add_edit_customer_screen.dart';
import 'package:erp_solution/views/crm/leads/lead_list_screen.dart';
import 'package:erp_solution/views/crm/leads/add_edit_lead_screen.dart';
// Import other screens as needed

void main() {
  group('AppRoutes', () {
    test('routes map contains all defined routes', () {
      // Arrange
      final expectedRoutes = {
        AppRoutes.login,
        AppRoutes.dashboard,
        AppRoutes.crmHome,
        AppRoutes.customerList,
        AppRoutes.addEditCustomer,
        AppRoutes.leadList,
        AppRoutes.addEditLead,
        // Add other routes here
      };

      // Act
      final actualRoutes = AppRoutes.routes.keys;

      // Assert
      expect(actualRoutes, containsAll(expectedRoutes));
    });

    test('Login route returns LoginScreen', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.login];
      final widget = builder!(null); // Passing null as BuildContext

      // Assert
      expect(widget, isA<LoginScreen>());
    });

    test('CRM Home route returns CrmHome', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.crmHome];
      final widget = builder!(null);

      // Assert
      expect(widget, isA<CrmHome>());
    });

    test('Customer List route returns CustomerListScreen', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.customerList];
      final widget = builder!(null);

      // Assert
      expect(widget, isA<CustomerListScreen>());
    });

    test('Add/Edit Customer route returns AddEditCustomerScreen', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.addEditCustomer];
      final widget = builder!(null);

      // Assert
      expect(widget, isA<AddEditCustomerScreen>());
    });

    test('Lead List route returns LeadListScreen', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.leadList];
      final widget = builder!(null);

      // Assert
      expect(widget, isA<LeadListScreen>());
    });

    test('Add/Edit Lead route returns AddEditLeadScreen', () {
      // Arrange & Act
      final builder = AppRoutes.routes[AppRoutes.addEditLead];
      final widget = builder!(null);

      // Assert
      expect(widget, isA<AddEditLeadScreen>());
    });

    // Add similar tests for other routes
  });
}
