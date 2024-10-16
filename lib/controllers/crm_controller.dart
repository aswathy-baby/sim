// lib/controllers/crm_controller.dart
import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../models/lead.dart';
import '../services/crm_service.dart';

class CrmController with ChangeNotifier {
  final CrmService _crmService = CrmService();

  // Customers
  List<Customer> _customers = [];
  bool _isLoadingCustomers = false;
  String? _customerError;

  List<Customer> get customers => _customers;
  bool get isLoadingCustomers => _isLoadingCustomers;
  String? get customerError => _customerError;

  // Leads
  List<Lead> _leads = [];
  bool _isLoadingLeads = false;
  String? _leadError;

  List<Lead> get leads => _leads;
  bool get isLoadingLeads => _isLoadingLeads;
  String? get leadError => _leadError;

  // Fetch Customers
  Future<void> fetchCustomers() async {
    _isLoadingCustomers = true;
    notifyListeners();

    try {
      _customers = await _crmService.fetchCustomers();
      _customerError = null;
    } catch (e) {
      _customerError = e.toString();
    }

    _isLoadingCustomers = false;
    notifyListeners();
  }

  // Create Customer
  Future<bool> addCustomer(Customer customer) async {
    try {
      Customer newCustomer = await _crmService.createCustomer(customer);
      _customers.add(newCustomer);
      notifyListeners();
      return true;
    } catch (e) {
      _customerError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Update Customer
  Future<bool> updateCustomer(Customer customer) async {
    try {
      Customer updatedCustomer = await _crmService.updateCustomer(customer);
      int index = _customers.indexWhere((c) => c.id == customer.id);
      if (index != -1) {
        _customers[index] = updatedCustomer;
        notifyListeners();
      }
      return true;
    } catch (e) {
      _customerError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Delete Customer
  Future<bool> deleteCustomer(String id) async {
    try {
      bool success = await _crmService.deleteCustomer(id);
      if (success) {
        _customers.removeWhere((c) => c.id == id);
        notifyListeners();
      }
      return success;
    } catch (e) {
      _customerError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Fetch Leads
  Future<void> fetchLeads() async {
    _isLoadingLeads = true;
    notifyListeners();

    try {
      _leads = await _crmService.fetchLeads();
      _leadError = null;
    } catch (e) {
      _leadError = e.toString();
    }

    _isLoadingLeads = false;
    notifyListeners();
  }

  // Create Lead
  Future<bool> addLead(Lead lead) async {
    try {
      Lead newLead = await _crmService.createLead(lead);
      _leads.add(newLead);
      notifyListeners();
      return true;
    } catch (e) {
      _leadError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Update Lead
  Future<bool> updateLead(Lead lead) async {
    try {
      Lead updatedLead = await _crmService.updateLead(lead);
      int index = _leads.indexWhere((l) => l.id == lead.id);
      if (index != -1) {
        _leads[index] = updatedLead;
        notifyListeners();
      }
      return true;
    } catch (e) {
      _leadError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Delete Lead
  Future<bool> deleteLead(String id) async {
    try {
      bool success = await _crmService.deleteLead(id);
      if (success) {
        _leads.removeWhere((l) => l.id == id);
        notifyListeners();
      }
      return success;
    } catch (e) {
      _leadError = e.toString();
      notifyListeners();
      return false;
    }
  }
}
