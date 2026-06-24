import 'package:flutter_test/flutter_test.dart';

import 'package:portafolio/main.dart';

void main() {
  testWidgets('App shows welcome text', (WidgetTester tester) async {
    await tester.pumpWidget(const PortafolioApp());

    expect(find.text('¡Bienvenido a mi Portafolio!'), findsOneWidget);
  });
}
