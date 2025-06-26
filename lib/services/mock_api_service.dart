import 'dart:async';

class MockApiService {
  // Simulates an API call to verify bank account details.
  Future<Map<String, dynamic>> verifyAccount(
      {required String accountNumber}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock logic: verification is successful only if the account number is '0123456789'.
    if (accountNumber == '0123456789') {
      return {'success': true, 'accountName': 'John Doe'};
    } else {
      return {'success': false, 'accountName': null};
    }
  }

  // Simulates initiating a transaction.
  Future<bool> initiateTransaction() async {
    // Simulate network delay for the transaction
    await Future.delayed(const Duration(seconds: 2));

    // For this mock, the transaction is always successful.
    return true;
  }
}

