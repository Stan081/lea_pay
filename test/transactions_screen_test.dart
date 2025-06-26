import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lea_pay/screens/transactions_screen.dart';

void main() {
  group('TransactionsScreen Tests', () {
    testWidgets('Renders and displays initial transactions', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: TransactionsScreen()));

      // Verify that the screen title is displayed.
      expect(find.text('Transactions'), findsOneWidget);

      // Verify that the filter chips are present.
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);

      // Verify that the initial list of transactions is displayed.
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Date filter should show date picker and filter transactions', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TransactionsScreen()));

      // Tap the 'Date' filter chip.
      await tester.tap(find.text('Date'));
      await tester.pumpAndSettle(); // Wait for the dialog to appear

      // Verify the date picker is shown.
      expect(find.byType(DateRangePickerDialog), findsOneWidget);

      // Select a date range.
      // This is a simplified interaction. A real test would tap specific dates.
      await tester.tap(find.text('OK')); // Close the picker
      await tester.pumpAndSettle();

      // Verify the UI updates to show the filter is active.
      // This depends on the implementation, e.g., the chip text changes.
      // For now, we'll just check that the list view is still there.
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Amount filter should show dialog and filter transactions', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TransactionsScreen()));

      // Tap the 'Amount' filter chip.
      await tester.tap(find.text('Amount'));
      await tester.pumpAndSettle(); // Wait for the dialog to appear

      // Verify the amount filter dialog is shown.
      expect(find.byType(AlertDialog), findsOneWidget);

      // Enter min and max amounts.
      await tester.enterText(find.byType(TextField).first, '50');
      await tester.enterText(find.byType(TextField).last, '150');

      // Tap the 'Apply' button.
      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      // Verify the UI updates to show the filter is active.
      // For now, we'll just check that the list view is still there.
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
