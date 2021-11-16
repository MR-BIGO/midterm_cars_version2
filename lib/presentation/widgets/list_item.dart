import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.imageUrl,
      required this.brand,
      required this.year})
      : super(key: key);

  final dynamic imageUrl;
  final String brand;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: Column(
            children: [
              FadeInImage(
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/car_placeholder.png'),
                  image: NetworkImage(imageUrl)),
              Text(
                brand,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                year,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
