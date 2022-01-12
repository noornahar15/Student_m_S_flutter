import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_management_system/model/user.dart';
import 'package:student_management_system/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User user = User();
  bool _isLoading = false;

  Future<bool> _getUser() async {
    String serviceUrl = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(serviceUrl));
    setState(() {
      user = userFromJson(response.body.toString());
      _isLoading = true;
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListPage(
        title: 'Home Page',
        user: user,
        isLoading: _isLoading,
      ),
    );
  }
}
