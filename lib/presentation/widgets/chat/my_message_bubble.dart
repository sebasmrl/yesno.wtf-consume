import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size; //dimension del dispositivo



    return Column(
      crossAxisAlignment: CrossAxisAlignment.end ,
      children: [
        Container(
          //height: 10,
          width: size.width*.7,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:   Text(message.text, style: const TextStyle( color: Colors.white)),
          ),
        ),
        const SizedBox( height: 2)
      ],
    );
  }
}