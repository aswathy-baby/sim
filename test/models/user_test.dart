// test/models/user_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/models/user.dart';

void main() {
  group('User Model Tests', () {
    test('User.fromJson creates a valid User object', () {
      // Arrange: Define a sample JSON map
      final Map<String, dynamic> json = {
        'id': 'user_123',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'role': 'Admin',
      };

      // Act: Deserialize JSON to User object
      final user = User.fromJson(json);

      // Assert: Verify that the User object has correct properties
      expect(user.id, 'user_123');
      expect(user.name, 'John Doe');
      expect(user.email, 'john.doe@example.com');
      expect(user.role, 'Admin');
    });

    test('User.toJson returns a valid JSON map', () {
      // Arrange: Create a User object
      final user = User(
        id: 'user_456',
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        role: 'User',
      );

      // Act: Serialize User object to JSON
      final json = user.toJson();

      // Assert: Verify that the JSON map has correct key-value pairs
      expect(json, {
        'id': 'user_456',
        'name': 'Jane Smith',
        'email': 'jane.smith@example.com',
        'role': 'User',
      });
    });

    test('User.fromJson throws an error when required fields are missing', () {
      // Arrange: Define a JSON map with a missing 'email' field
      final Map<String, dynamic> json = {
        'id': 'user_789',
        'name': 'Alice Brown',
        // 'email' is missing
        'role': 'Manager',
      };

      // Act & Assert: Expect a TypeError to be thrown
      expect(() => User.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('User.fromJson throws an error when fields have incorrect types', () {
      // Arrange: Define a JSON map with incorrect data types
      final Map<String, dynamic> json = {
        'id': 789, // Should be a String
        'name': 'Bob White',
        'email': 'bob.white@example.com',
        'role': 'Guest',
      };

      // Act & Assert: Expect a TypeError to be thrown
      expect(() => User.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
