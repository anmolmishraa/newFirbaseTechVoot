import 'package:flutter/material.dart';

import 'calendar.dart';
import 'clients.dart';
import 'home.dart';
import 'invoices.dart';
import 'message.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int pageIndex = 1;

  final pages = [Clients(), Home(), Message(), Calendar(), Invoices()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: Material(
          elevation: 20,
          child: Container(
            height: 60,
            // decoration: BoxDecoration(
            //   color: Theme.of(context).primaryColor,
            //   borderRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(20),
            //     topRight: Radius.circular(20),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(
                          Icons.home_filled,
                          color: Colors.blue,
                          size: 35,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 35,
                        )
                      : const Icon(
                          Icons.person_outline,
                          color: Colors.blue,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Icon(
                          Icons.message,
                          color: Colors.blue,
                          size: 35,
                        )
                      : const Icon(
                          Icons.message_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? const Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                          size: 35,
                        )
                      : const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  icon: pageIndex == 4
                      ? const Icon(
                          Icons.insert_chart,
                          color: Colors.blue,
                          size: 35,
                        )
                      : const Icon(
                          Icons.insert_chart_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
