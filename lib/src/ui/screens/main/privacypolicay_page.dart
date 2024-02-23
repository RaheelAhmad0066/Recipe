import 'package:flutter/material.dart';
import 'package:piatoopronto/src/ui/screens/main/Navbar.dart';

import '../../../constants/colors.dart';
import '../../widgets/coustom_app_widget.dart';
import '../../widgets/helper_widget.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: mq.height * 0.1,
          ),
          Center(
            child: Container(
              height: mq.height * 0.2,
              width: mq.width * 0.5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: Offset(1, 2),
                    )
                  ],
                  color: Color(0xffFDF8F6),
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset('assets/images/privacyimage.png'),
            ),
          ),
          SizedBox(
            height: mq.height * 0.1,
          ),
          SizedBox(
            width: mq.width * 0.8,
            height: mq.height * 0.3,
            child: Text(
              'PiattoPronto è l\'app ideale per chi ama il risparmio e la sostenibilità.Aiuta a ridurre gli sprechi alimentari, suggerendo ricette creative basate su ciò che hai già in dispensa',
              style: TextStyle(color: Colors.grey, fontSize: 19),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
              height: 55,
              width: mq.width * 0.7,
              child: Button(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: ((context) => Navbar())),
                        (route) => false);
                  },
                  txtButton: 'Continua',
                  color: bgcolor))
        ],
      ),
    );
  }
}
