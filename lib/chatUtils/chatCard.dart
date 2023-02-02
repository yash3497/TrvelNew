

import 'package:flutter/material.dart';
import 'package:travel_app/chatUtils/chatModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required Key key, required this.chatModel, required this.sourchat}) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourchat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (contex) => IndividualPage(
        //               chatModel: chatModel,
        //               sourchat: sourchat,
        //             )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset(
                chatModel.isGroup ? "assets/2nd.png" : "assets/3rd.png",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.chatId,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  chatModel.message,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}