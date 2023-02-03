import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/chatUtils/chatCard.dart';
import 'package:travel_app/chatUtils/chatModel.dart';
import 'package:travel_app/widget/custom_appbar.dart';

import '../../utils/constant.dart';
import '../../widget/custom_textfield.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String uid = '';

  List<ChatModel> messageList = [];
  List<ChatModel> searchedList = [];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    uid = FirebaseAuth.instance.currentUser!.uid;
    getChats();
    super.initState();
  }

  getChats() async {
    var x = await FirebaseFirestore.instance.collection('chats').get();
    messageList.clear();
    for (var element in x.docs) {
      print(element.data());
      List<dynamic> chatGroup = element.data()['chatGroup'];
      print(chatGroup);
      if (chatGroup.contains(uid)) {
        messageList.add(ChatModel.fromDocument(element));
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController!.dispose();
    super.dispose();
  }

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(title: 'Inbox')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: TabBar(
                padding: EdgeInsets.zero,
                // labelPadding: EdgeInsets.zero,
                // indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                onTap: (value) {},
                isScrollable: false,
                indicator: BoxDecoration(
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: primary),
                indicatorColor: primary,
                labelColor: black,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                tabs: const [
                  Tab(
                    text: 'Messages',
                  ),
                  Tab(
                    text: 'Notifications',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height(context) * 0.05,
                        width: width(context) * 0.95,
                        child: Theme(
                          data: ThemeData(
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                                  primary: primary,
                                ),
                          ),
                          child: TextField(
                            controller: searchController,
                            onChanged: ((value) {
                              if (searchController.text.isEmpty) {
                                getChats();
                              } else {
                                messageList.forEach(((element) {
                                  searchedList.clear();
                                  if (element.chatGroup.contains(value)) {
                                    searchedList.add(element);
                                  }
                                }));
                                setState(() {
                                  messageList = searchedList;
                                });
                              }
                            }),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              labelText:
                                  'enter trip friend name to see messages',
                              // labelStyle: bodyText14w600(color: primarhy),

                              focusColor: primary,

                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1.0),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primary, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: messageList.length,
                          itemBuilder: (context, i) {
                            return CustomCard(chat: messageList[i]);
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.87,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/inbox1.png'),
                              ),
                              title: Text(
                                'TravelNew booking',
                                style: bodyText18w600(color: black),
                              ),
                              subtitle: Text(
                                'Hey Alexander, Thank you for y.....',
                                style: bodyText12Small(color: black),
                              ),
                              trailing: Text(
                                '10:00am',
                                style: bodyText12Small(color: black),
                              ),
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                            ),
                            if (i == 4)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 8, bottom: 5),
                                child: Text(
                                  'Yesterday',
                                  style: bodyText14w600(
                                      color: black.withOpacity(0.4)),
                                ),
                              ),
                            if (i == 6)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 8, bottom: 5),
                                child: Text(
                                  '12 Aug 2020',
                                  style: bodyText14w600(
                                      color: black.withOpacity(0.4)),
                                ),
                              )
                          ],
                        );
                      }),
                )
              ]),
            )
          ],
        ));
  }
}
