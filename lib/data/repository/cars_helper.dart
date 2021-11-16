import 'package:flutter/cupertino.dart';
import 'package:flutter_midterm/data/models/car_model.dart';
import 'package:flutter_midterm/data/models/dummy_data.dart';

class Model_Helper {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void removeCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, {car});
  }
}
