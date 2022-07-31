import 'package:cubit_clean_architecture/presentation/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  testGoldens(
    'CountryCard has expected styling',
    tags: ['golden'],
    (widgetTester) async {
      await mockNetworkImages(
        () async {
          final builder = DeviceBuilder()
            ..addScenario(
              widget: const Scaffold(
                body: Center(
                  child: CountryCard(
                    name: 'Country',
                    flag: 'country-flag-url',
                  ),
                ),
              ),
            );

          await widgetTester.pumpDeviceBuilder(
            builder,
            wrapper: materialAppWrapper(
              platform: TargetPlatform.iOS,
            ),
          );
        },
      );

      await screenMatchesGolden(widgetTester, 'country_card');
    },
  );

  testWidgets('Tap on CountryCard', tags: ['widget'], (widgetTester) async {
    int counter = 0;

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CountryCard(
              name: 'Country',
              flag: 'country-flag-url',
              onTap: () => counter++,
            ),
          ),
        ),
      ),
    );

    await widgetTester.tap(find.byType(CountryCard));
    expect(counter, 1);
  });
}
