// ignore_for_file: public_member_api_docs, sort_constructors_first
//! https://www.youtube.com/watch?v=Rlf5q2EGHzc
//! https://github.com/JohannesMilke/futurebuilder_example/tree/master
import 'package:flutter/material.dart';

import 'user_model.dart';

class UserPage extends StatefulWidget {
  final List<UserModel> user;
  int? index;
  int? pageGo1;
  UserPage({
    super.key,
    required this.user,
    required this.pageGo1,
    this.index,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var pageGo1 = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.user[widget.index!].username),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.user[widget.index!].urlAvatar),
                radius: 80,
              ),
              const SizedBox(height: 40),
              Text(
                widget.user[widget.index!].username,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 64),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ElevatedButton(
                  child: const Text(
                    'Send Email',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          user: widget.user,
                          index: widget.pageGo1,
                          pageGo1: widget.pageGo1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
