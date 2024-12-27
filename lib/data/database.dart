import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final myBox = Hive.box('mybox');

  // Create initial data
  void createInitialData() {
    toDoList = [
      ["Welcome to ToDoApp", false],
    ];
    updateData();
  }

  // Load data with validation
  void loadData() {
    var data = myBox.get("TODOLIST", defaultValue: []);
    if (data is List) {
      toDoList = data.map((item) {
        if (item is List &&
            item.length == 2 &&
            item[0] is String &&
            item[1] is bool) {
          return item;
        } else {
          return ["Invalid Task", false];
        }
      }).toList();
    } else {
      toDoList = [];
    }
  }

  // Update data
  void updateData() {
    myBox.put("TODOLIST", toDoList);
  }
}
