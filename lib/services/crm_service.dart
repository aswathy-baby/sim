// lib/services/crm_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/customer.dart';
import '../models/lead.dart';

class CrmService {
  final String baseUrl = 'https://your-backend-api.com/api'; // Replace with your actual API URL

  // Fetch Customers
  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((customer) => Customer.fromJson(customer)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  // Create Customer
  Future<Customer> createCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('$baseUrl/customers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(customer.toJson()),
    );

    if (response.statusCode == 201) {
      return Customer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create customer');
    }
  }

  // Fetch Leads
  Future<List<Lead>> fetchLeads() async {
    final response = await http.get(Uri.parse('$baseUrl/leads'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((lead) => Lead.fromJson(lead)).toList();
    } else {
      throw Exception('Failed to load leads');
    }
  }

  // Create Lead
  Future<Lead> createLead(Lead lead) async {
    final response = await http.post(
      Uri.parse('$baseUrl/leads'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(lead.toJson()),
    );

    if (response.statusCode == 201) {
      return Lead.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create lead');
    }
  }

  // Update Customer (Add implementation)
  Future<Customer> updateCustomer(Customer customer) async {
    final response = await http.put(
      Uri.parse('$baseUrl/customers/${customer.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(customer.toJson()),
    );

    if (response.statusCode == 200) {
      return Customer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update customer');
    }
  }

  // Delete Customer (Add implementation)
  Future<bool> deleteCustomer(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/customers/$id'));

    return response.statusCode == 204; // No content
  }

  // Update Lead (Add implementation)
  Future<Lead> updateLead(Lead lead) async {
    final response = await http.put(
      Uri.parse('$baseUrl/leads/${lead.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(lead.toJson()),
    );

    if (response.statusCode == 200) {
      return Lead.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update lead');
    }
  }

  // Delete Lead (Add implementation)
  Future<bool> deleteLead(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/leads/$id'));

    return response.statusCode == 204; // No content
  }
}
