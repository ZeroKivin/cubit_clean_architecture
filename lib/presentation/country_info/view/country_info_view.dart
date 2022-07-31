import 'package:cubit_clean_architecture/presentation/component/component.dart';
import 'package:cubit_clean_architecture/utility/types/types.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CountryInfoView extends StatelessWidget {
  const CountryInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Json;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              child: CountryCard(
                flag: data['flag'],
                name: data['name'],
              ),
            ),
            const SizedBox(height: 20),
            const Text('description').tr(),
          ],
        ),
      ),
    );
  }
}
