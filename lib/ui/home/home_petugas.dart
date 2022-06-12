import 'package:boilerplate/ui/home/list_contact.dart';
import 'package:boilerplate/ui/navbar.dart';
import 'package:boilerplate/ui/schedule/list_schedule.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomePetugasPage extends StatefulWidget {
  const HomePetugasPage({Key? key}) : super(key: key);

  @override
  State<HomePetugasPage> createState() => _HomePetugasPageState();
}

class _HomePetugasPageState extends State<HomePetugasPage> {
  bool isChecked = false;
  final ref = FirebaseDatabase.instance
      .ref()
      .child('jadwal')
      .orderByChild('status')
      .equalTo(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(color: Color(0xff00783E)),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: ListView(
          children: <Widget>[
            const Text(
              "Hi, Petugas!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/home.jpg",
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: const Text(
                  "Aktivitas",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Coming Soon!'),
                          content: const Text(
                              'Fitur ini tersedia di iterasi selanjutnya ^_^'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 70,
                              color: Colors.green,
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.green, spreadRadius: 2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Maps \n",
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ListContactPage()));
                      },
                      child: Container(
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.contacts_outlined,
                              size: 70,
                              color: Colors.green,
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.green, spreadRadius: 2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          "Kontak",
                          textAlign: TextAlign.center,
                        ))
                  ],
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: const Text(
                  "Jadwal Terbaru",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            FirebaseAnimatedList(
                shrinkWrap: true,
                query: ref.limitToFirst(3),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  bool isChecked = snapshot.child('status').value as bool;
                  return InkWell(
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                            title: Text(
                              snapshot.child('instansi').value.toString() +
                                  " - " +
                                  snapshot
                                      .child('penanggungJawab')
                                      .value
                                      .toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle:
                                Text(snapshot.child('alamat').value.toString()),
                            secondary: CircleAvatar(
                                backgroundImage: AssetImage(
                              "assets/images/user_icon.png",
                            )),
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            selected: isChecked,
                            value: isChecked,
                            onChanged: (bool? value) async {
                              setState(() {
                                isChecked = value!;
                              });
                              // await new Future.delayed(const Duration(seconds: 2));
                              var key = snapshot.key;
                              DatabaseReference up =
                                  FirebaseDatabase.instance.ref("jadwal/$key");
                              up.update({
                                "status": true,
                              });
                            })
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
