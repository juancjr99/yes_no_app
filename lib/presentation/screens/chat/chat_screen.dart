import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/domain/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(padding:  EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://es.wikipedia.org/wiki/Archivo:Ana_de_Armas_at_the_2024_Toronto_International_Film_Festival_02_(cropped).jpg'),
        ),),
        title: const Text('Mi amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatPRovider>();
    return SafeArea(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messagesList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messagesList[index];
              return (message.fromWho == FromWho.mine)
              ? MyMessageBubble(message: message,)
              : HerMessageBubble(message: message);
            },),
            ),
            MassegeFielBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}