import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_or_her_message_bumbble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('New Chat 🤯'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child:CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fibe2-1.fna.fbcdn.net/v/t39.30808-6/323434979_495490952708166_4996986831847070854_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGvOfN60hhsk8Fu21-X8brARsBuVmimYNdGwG5WaKZg1-YebgHjgFl4stRoD-_-88wzfSpsmfnX02Jl5e8n-wDB&_nc_ohc=qQm_ygiYuSIQ7kNvgGZcpPp&_nc_ht=scontent.fibe2-1.fna&oh=00_AYCsAYvKjxn34jlwV6i0BvoFnEONuQakArpLZxEYGF-BmQ&oe=66B69FD1'),
          )) 
      ),
      body: _ChatView()
    );  
  }
}




class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message= chatProvider.messagesList[index];
                  return (message.fromWho == FromWho.me)
                    ? MyMessageBubble(message: message,) 
                    : HisOrHerMessageBubble(message: message) ;
                    //return (index%2==0)? const HisOrHerMessageBubble() :const MyMessageBubble();
                },
              )),

            //Caja de Texto
            const SizedBox(height: 3,),
            MessageFieldBox(onValue: chatProvider.sendMessage), //(value)=>  chatProvider.sendMessage(value) ),
            const SizedBox(height: 3)
          ],
        ),
      ),
    );
  }
}


