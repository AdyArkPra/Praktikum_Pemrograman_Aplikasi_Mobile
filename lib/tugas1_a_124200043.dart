// ---------- TUGAS 1 - 124200043 - ADYATMA ARKAAN PRADIPA ---------- //
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.amber,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                    child: FlutterLogo(
                      size: 40,
                    ),
                  ),
                  // ---------- TUGAS 1 - 124200043 - ADYATMA ARKAAN PRADIPA ---------- //
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          primary: Colors.green,
                        ),
                        child: const Text('Log In'),
                        onPressed: () {}
                      )
                  ),
                  Container(
                      height: 30,
                      child: TextButton(
                          child: const Text(
                              'Forgot Password ?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          onPressed: () {}
                      )
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
// ---------- TUGAS 1 - 124200043 - ADYATMA ARKAAN PRADIPA ---------- //