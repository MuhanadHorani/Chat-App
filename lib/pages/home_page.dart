import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:flutter_chat_bubble/chat_bubble.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        List<Message> messageList = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
        }

        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 52,
                    width: 52,
                  ),
                  const Text("Scholar Chat"),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: messageList.length,
                  reverse: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return (snapshot.data!.docs.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            child: messageList[index].userId == email
                                ? ChatBubble(
                                    backGroundColor: kPrimaryColor,
                                    alignment: Alignment.centerRight,
                                    clipper: ChatBubbleClipper3(
                                        type: BubbleType.sendBubble),
                                    child: Text(
                                      messageList[index].message,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : ChatBubble(
                                    alignment: Alignment.centerLeft,
                                    clipper: ChatBubbleClipper3(
                                        type: BubbleType.receiverBubble),
                                    child: Text(
                                      messageList[index].message,
                                      style: const TextStyle(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                          )
                        : const CircularProgressIndicator();
                  },
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: messageController,
                    keyboardType: TextInputType.text,
                    onSubmitted: (data) {
                      message.add(
                        {
                          'message': data,
                          'createdAt': DateTime.now(),
                          'userId': email,
                        },
                      );
                      messageController.clear();
                      _scrollController.animateTo(
                          _scrollController.position.minScrollExtent,
                          duration: const Duration(seconds: 10),
                          curve: Curves.bounceIn);
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                        color: kPrimaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
