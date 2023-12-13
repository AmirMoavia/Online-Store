import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppChatScreen extends StatelessWidget {
  //final String phoneNumber;

  WhatsAppChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  openwhatsapp();
        sendsms();
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.green, // Change the border color as desired
            width: 4.0,
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            'assets/pngwing.com.png', // Replace with the actual path to your WhatsApp logo image
            height: 30.0,
            width: 60.0,
          ),
          SizedBox(width: 10.0),
          Text(
            'ORDER NOW',
            style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold,
              color: Colors.black, // Change the text color as desired
            ),
          )
        ]),
      ),
    );
  }

  //sms send on whatsapp
  void sendsms() {
    String url = "https://wa.me/+923358104747";
    launchUrl(Uri.parse(url));
  }
}
