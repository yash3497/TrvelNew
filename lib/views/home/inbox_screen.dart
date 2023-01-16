import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widget/custom_appbar.dart';

import '../../utils/constant.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController!.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You have no unread messages',
                      style: bodyText18w600(color: black),
                    ),
                    addVerticalSpace(4),
                    Text(
                      'When you connect with other travellers and friends you’ll find your conversations here.',
                      style: bodyText13normal(spacing: 1.4, color: black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height(context) * 0.87,
                child: ListView.builder(
                    itemCount: 10,
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
      ),
    );
  }
}
