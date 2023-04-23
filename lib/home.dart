import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/login.dart';
import 'package:flutter_firebase_auth/profile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List allUser = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        title: Text(
          "CLIENTS",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.add,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),

      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 10),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          autoClose: true,
                          flex: 1,
                          onPressed: (value) {
                            //  myList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.insert_chart,
                        ),
                        SlidableAction(
                          autoClose: true,
                          flex: 1,
                          onPressed: (value) {
                            // myList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.chat,
                        ),
                        SlidableAction(
                          autoClose: true,
                          flex: 1,
                          onPressed: (value) {
                            // myList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.calendar_today_outlined,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Profile(
                                      imageUrl: document['img_url'],
                                      name: document['name'],
                                      number: document['phone'],
                                      id: document.id.toString(),
                                    )));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CircleAvatar(
                                    child: document['img_url'] != null &&
                                            document['img_url'] != ""
                                        ? Image.network(
                                            document['img_url'],
                                            fit: BoxFit.cover,
                                          )
                                        : Icon(Icons.account_circle),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(document['name']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              height: 15,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     AuthenticationHelper()
      //         .signOut()
      //         .then((_) => Navigator.pushReplacement(
      //               context,
      //               MaterialPageRoute(builder: (contex) => Login()),
      //             ));
      //   },
      //   child: Icon(Icons.logout),
      //   tooltip: 'Logout',
      // ),
    );
  }
}
