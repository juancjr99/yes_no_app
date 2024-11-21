import 'package:flutter/material.dart';

class MassegeFielBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MassegeFielBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final focusNode = FocusNode();
    final textControll = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"' ,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon:  IconButton(
        onPressed: (){
          final textValue = textControll.value.text;
          onValue(textValue);
          textControll.clear();  
        },
        icon: const Icon(Icons.send_outlined))
      );


    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event){
        focusNode.unfocus();
      },
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textControll.clear();
        onValue(value);
        focusNode.requestFocus();
      },
    );
  }
}