import 'package:flutter/material.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/models/dummy_data.dart';
import 'package:flutter_midterm/data/repository/cars_helper.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController newID = TextEditingController();
  TextEditingController newBrand = TextEditingController();
  TextEditingController newModel = TextEditingController();
  TextEditingController newYear = TextEditingController();
  TextEditingController newDescription = TextEditingController();
  TextEditingController newUrl = TextEditingController();
  Model_Helper helper = Model_Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Add",
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
                    controller: newUrl,
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
                    controller: newID,
                    decoration:
                        const InputDecoration(hintText: 'Please enter ID'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.contains(RegExp("[1-6]"))) {
                        return "Please, enter a valid ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: newBrand,
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
                    controller: newModel,
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
                    controller: newYear,
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
                    controller: newDescription,
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
                              id: int.parse(newID.text),
                              brand: newBrand.text,
                              model: newModel.text,
                              year: int.parse(newYear.text),
                              description: newDescription.text,
                              imageUrl: newUrl.text,
                            );
                            
                            Model_Helper().addCar(car);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("ADD")),
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
