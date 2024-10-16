// test/models/customer_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/models/customer.dart';

void main() {
  group('Customer Model Test', () {
    test('fromJson should return a valid Customer object', () {
      // Arrange
      final json = {
        'id': '1',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'phone': '1234567890',
        'address': '123 Main St',
        'createdAt': '2024-01-01T12:00:00Z',
        'updatedAt': '2024-01-02T12:00:00Z',
      };

      // Act
      final customer = Customer.fromJson(json);

      // Assert
      expect(customer.id, '1');
      expect(customer.name, 'John Doe');
      expect(customer.email, 'john.doe@example.com');
      expect(customer.phone, '1234567890');
      expect(customer.address, '123 Main St');
      expect(customer.createdAt, DateTime.parse('2024-01-01T12:00:00Z'));
      expect(customer.updatedAt, DateTime.parse('2024-01-02T12:00:00Z'));
    });

    test('toJson should return a valid JSON map', () {
      // Arrange
      final customer = Customer(
        id: '2',
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        phone: '0987654321',
        address: '456 Elm St',
        createdAt: DateTime.parse('2024-02-01T08:30:00Z'),
        updatedAt: DateTime.parse('2024-02-02T09:45:00Z'),
      );

      // Act
      final json = customer.toJson();

      // Assert
      expect(json['id'], '2');
      expect(json['name'], 'Jane Smith');
      expect(json['email'], 'jane.smith@example.com');
      expect(json['phone'], '0987654321');
      expect(json['address'], '456 Elm St');
      expect(json['createdAt'], '2024-02-01T08:30:00.000Z');
      expect(json['updatedAt'], '2024-02-02T09:45:00.000Z');
    });
  });
}
