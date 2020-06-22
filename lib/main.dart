import 'package:flutter/material.dart';
import 'package:google_flutter/users.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users; // khởi tạo List danh sách. list danh sách user
  bool _loading; // khai báo loading
  @override
  void initState() {
    super.initState();
    _loading = true; 
    Services.getUsers().then((users) {
      //
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading..." : "Users"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            User user = _users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.phone),
            );
          },
        ),
      ),
    );
  }
}
