import 'package:flutter/material.dart';
import 'package:piatoopronto/src/ui/screens/main/Navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import '../../widgets/coustom_app_widget.dart';
import '../../widgets/helper_widget.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFDF8F6),
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
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
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
