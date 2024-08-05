import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
  });



  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode(); // colocarlo cuando un elemeto necesita un foco


    //final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );


    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: 'Finaliza tu mensaje con un "?"',
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },)
      );



    return TextFormField(
      onTapOutside: (e){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration:  inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },  
      keyboardType: TextInputType.text ,
      //keyboardType:, //tipo admisible de dato
      /* onChanged: (value){
      }, */
    );
  }
}




        //OutlineInputBorder(
        //  borderSide: BorderSide(color: colors.primary),
        //  borderRadius: BorderRadius.circular(20)
        //),