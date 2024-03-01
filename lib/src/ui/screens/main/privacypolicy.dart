import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../widgets/coustom_app_widget.dart';

class privacypolicy extends StatelessWidget {
  const privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Dichiarazione sulla protezione dei dati',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            for (String paragraph in dataProtectionText.split('\n\n\n\n'))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  paragraph,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
