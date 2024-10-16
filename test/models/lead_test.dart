// test/models/lead_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/models/lead.dart';

void main() {
  group('Lead Model Tests', () {
    test('Lead.fromJson creates a valid Lead object', () {
      // Arrange: Define a sample JSON map
      final Map<String, dynamic> json = {
        'id': 'lead_123',
        'customerId': 'customer_456',
        'source': 'Referral',
        'status': 'New',
        'createdAt': '2023-10-01T12:34:56.789Z',
        'updatedAt': '2023-10-02T12:34:56.789Z',
      };

      // Act: Deserialize JSON to Lead object
      final lead = Lead.fromJson(json);

      // Assert: Verify that the Lead object has correct properties
      expect(lead.id, 'lead_123');
      expect(lead.customerId, 'customer_456');
      expect(lead.source, 'Referral');
      expect(lead.status, 'New');
      expect(lead.createdAt, DateTime.parse('2023-10-01T12:34:56.789Z'));
      expect(lead.updatedAt, DateTime.parse('2023-10-02T12:34:56.789Z'));
    });

    test('Lead.toJson returns a valid JSON map', () {
      // Arrange: Create a Lead object
      final lead = Lead(
        id: 'lead_789',
        customerId: 'customer_012',
        source: 'Advertisement',
        status: 'Contacted',
        createdAt: DateTime.parse('2023-09-15T08:00:00Z'),
        updatedAt: DateTime.parse('2023-09-16T09:30:00Z'),
      );

      // Act: Serialize Lead object to JSON
      final json = lead.toJson();

      // Assert: Verify that the JSON map has correct key-value pairs
      expect(json, {
        'id': 'lead_789',
        'customerId': 'customer_012',
        'source': 'Advertisement',
        'status': 'Contacted',
        'createdAt': '2023-09-15T08:00:00.000Z',
        'updatedAt': '2023-09-16T09:30:00.000Z',
      });
    });

    test('Lead.fromJson throws a FormatException when createdAt is invalid', () {
      // Arrange: Define a JSON map with invalid createdAt
      final Map<String, dynamic> json = {
        'id': 'lead_101',
        'customerId': 'customer_202',
        'source': 'Website',
        'status': 'Qualified',
        'createdAt': 'invalid_date',
        'updatedAt': '2023-10-02T12:34:56.789Z',
      };

      // Act & Assert: Expect a FormatException to be thrown
      expect(() => Lead.fromJson(json), throwsA(isA<FormatException>()));
    });

    test('Lead.fromJson throws a FormatException when updatedAt is invalid', () {
      // Arrange: Define a JSON map with invalid updatedAt
      final Map<String, dynamic> json = {
        'id': 'lead_303',
        'customerId': 'customer_404',
        'source': 'Email Campaign',
        'status': 'Converted',
        'createdAt': '2023-10-01T12:34:56.789Z',
        'updatedAt': 'invalid_date',
      };

      // Act & Assert: Expect a FormatException to be thrown
      expect(() => Lead.fromJson(json), throwsA(isA<FormatException>()));
    });

    test('Lead.fromJson throws an error when required fields are missing', () {
      // Arrange: Define a JSON map with missing 'status' field
      final Map<String, dynamic> json = {
        'id': 'lead_404',
        'customerId': 'customer_505',
        'source': 'Social Media',
        // 'status' is missing
        'createdAt': '2023-10-01T12:34:56.789Z',
        'updatedAt': '2023-10-02T12:34:56.789Z',
      };

      // Act & Assert: Expect a NoSuchMethodError or TypeError to be thrown
      expect(() => Lead.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Lead.fromJson throws an error when fields have incorrect types', () {
      // Arrange: Define a JSON map with incorrect types
      final Map<String, dynamic> json = {
        'id': 123, // Should be a String
        'customerId': 'customer_606',
        'source': 'Conference',
        'status': 'Interested',
        'createdAt': '2023-10-01T12:34:56.789Z',
        'updatedAt': '2023-10-02T12:34:56.789Z',
      };

      // Act & Assert: Expect a TypeError to be thrown
      expect(() => Lead.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
