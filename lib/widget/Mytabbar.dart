import 'package:flutter/material.dart';

class Mytab extends StatelessWidget {
  const Mytab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Tab Bar Widget"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.call),
                text: 'Call',
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: 'Video Call',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
