import 'package:flutter/material.dart';
import 'package:pawtal_prototype/widgets/widgets_home/widget_pet_card.dart';
import 'package:pawtal_prototype/widgets/widgets_home/widget_user_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _homePage();
}

class _homePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text("Pawtal - Prototype"),
        leading: IconButton(
            icon: const Icon(
              Icons.pets,
              size: 35,
            ),
            onPressed: () {}),
      ),
      backgroundColor: Colors.purple[100],
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(children: <Widget>[
          UserCard(),
          Row(
            children: [PetCard(), PetCard()],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        tooltip: "App Menu",
        child: const Icon(
          Icons.pets,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
