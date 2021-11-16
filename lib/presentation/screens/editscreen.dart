import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/repository/cars_helper.dart';

class EditScreen extends StatefulWidget {
     EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController carID;
  late TextEditingController carBrand;
  late TextEditingController carModel;
  late TextEditingController carYear;
  late TextEditingController carDescription;
  late TextEditingController carUrl;

  @override
  Widget build(BuildContext context) {
    final Map parseData = ModalRoute.of(context)!.settings.arguments as Map;
    final Car car = parseData["car"];
    final int index = parseData["index"];
    carID = TextEditingController(text: car.id.toString());
    carBrand = TextEditingController(text: car.brand);
    carModel = TextEditingController(text: car.model);
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description);
    carUrl = TextEditingController(text: car.imageUrl);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: carUrl,
                    decoration: const InputDecoration(
                        hintText: 'Please enter image URL'),
                    keyboardType: TextInputType.url,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid URL";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carID,
                    decoration:
                        const InputDecoration(hintText: 'Please enter ID'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carBrand,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Brand'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid Brand";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carModel,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Model'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid Model";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carYear,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Year'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid Year";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: carDescription,
                    decoration: const InputDecoration(
                        hintText: 'Please enter Description'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please, enter a valid Description";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        clipBehavior: Clip.antiAlias,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('BACK')),
                    ElevatedButton(
                        clipBehavior: Clip.antiAlias,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Car car = Car(
                              id: int.parse(carID.text),
                              brand: carBrand.text,
                              model: carModel.text,
                              year: int.parse(carYear.text),
                              description: carDescription.text,
                              imageUrl: carUrl.text,
                            );
                            
                            Model_Helper().editCar(car, index);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("EDIT")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
