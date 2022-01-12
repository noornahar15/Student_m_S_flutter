import 'package:flutter/material.dart';
import 'package:student_management_system/model/user.dart';

class UserListPage extends StatelessWidget {
  final String title;
  final User user;
  final bool isLoading;

  const UserListPage({
    Key? key,
    required this.title,
    required this.user,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: isLoading ? user.data!.length : 1,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ListTile(
                title: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text(
                    isLoading ? user.data![index].email! : "Data is not loaded",
                  ),
                ),
                onTap: () {
                  /*Route route = MaterialPageRoute(
                      builder: (context) => Container(model[1]));
                  Navigator.push(context, route);*/
                },
              ),
              !isLoading ? Center(child: CircularProgressIndicator()) : Container(),
            ],
          );
        },
      ),
    );
  }
}
