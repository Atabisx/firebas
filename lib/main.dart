import 'dart:collection';
import 'package:firebas/kisi.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var refTest = FirebaseDatabase.instance.ref().child("kisitablo");

  String password = "asddsad";
  final formkey = GlobalKey<FormState>();
  final tmm = " ";

  int _counter = 0;
  String result = " ";
  // String veri_cek = " ";

  // Future<void> kisiSil() async {
  //   refTest.child("-NW95AXOQHu9b6ozEiJk").remove();
  // }

  Future<String> tumkisiler() async {
    refTest.onValue.listen((event) {
      return veri_cek = event.snapshot.value.toString();
    });
  }

  Future<void> kisiEkle() async {
    var bilgi = result; // veri eklleme

    refTest.push().set(bilgi);
  }

// readData() {
//     DocumentReference documenRefarence = Firestore.instance.collection("").document(name)
//     DocumentReference.get().then((value {}));

// }
  void _incrementCounter() {
    //   FirebaseFirestore firestore = FirebaseFirestore.instance;

    //   CollectionReference users = FirebaseFirestore.instance.collection('user');

    // users.add({'test': 'deneme'});
    setState(() {
      // kisiEkle();
      // // kisiEkle();
      // tumkisiler();
      // _incrementCounter();
      tumkisiler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  Text(

            // ),
            Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                child: TextFormField(
                  initialValue: "abubekir", // başlangıçta alacagı değer
                  validator: ((value) {
                    if (value!.length < 3) {
                      return "bilgileri kontrol edin";
                    } else {
                      return null;
                    }
                  }),
                  onSaved: (value) {
                    password = value!;
                  },
                  obscureText: true,
                )),
            Text(password),
            TextField(
              decoration: InputDecoration(suffixIcon: Icon(Icons.class_)),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bool _validate = formkey.currentState!.validate();
                    if (_validate) {
                      formkey.currentState!.save();
                    }
                    result = "$password";
                    Text(result);
                  });
                },
                child: Text("tikla")),
            FutureBuilder(
              builder: (ctx, snapshot) {
                return Center();
              },
              future: tumkisiler(),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
