import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/models/dummy_data.dart';
import 'package:flutter_midterm/presentation/widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> carsList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Cars",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addscreen')
                  .then((_) => setState(() {}));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final car = carsList[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: {
                  "car": car,
                  "index": index,
                }).then((_) => setState((){}));
              },
              onLongPress: () {
                Navigator.pushNamed(context, "/editscreen", arguments: {
                  "car": car,
                  "index": index,
                }).then((_) {
                  setState(() {});
                });
              },
              child: ListItem(
                imageUrl: car.imageUrl,
                brand: car.brand,
                year: car.year.toString(),
              ),
            );
          },
          itemCount: carsList.length,
        ),
      ),
    );
  }
}
