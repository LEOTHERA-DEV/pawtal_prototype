import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _userCard();
}

class _userCard extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          "User Name",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "user.email",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
