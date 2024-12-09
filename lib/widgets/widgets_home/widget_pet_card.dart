import 'package:flutter/material.dart';

class PetCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _petCard();
}

class _petCard extends State<PetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 100,
          child: const Column(
            children: [
              Icon(
                Icons.pets,
                color: Colors.white,
                size: 40,
              ),
              Text(
                "Pet Name",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                "Pet Breed",
                style: TextStyle(color: Colors.white),
                )
            ],
          ),
        ),
      ),
    );
  }
}
