import 'package:flutter/material.dart';

import 'detail_user_page.dart';
import 'user_api.dart';
import 'user_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<UserModel>>(
          future: UsersApi.getUsersLocally(context),
          builder: (context, snapshot) {
            final users = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  return buildUsers(users!);
                }
            }
          },
        ),
      );

  Widget buildUsers(List<UserModel> users) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          var pageGo1 = users[index].pageGo1;

          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserPage(
                    index: index,
                    user: users,
                    pageGo1: pageGo1,
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.urlAvatar),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          );
        },
      );
}
