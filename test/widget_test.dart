import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:form_pendaftaran_707012400091_ppbl/navigation/kerangka_navigasi.dart';

void main() {
  testWidgets('Aplikasi dapat menampilkan halaman utama', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: KerangkaNavigasi()));

    expect(find.text('Formulir'), findsWidgets);
  });
}
