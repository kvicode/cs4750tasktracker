import 'package:cs4750tasktracker/components/TaskTile.dart';
import 'package:cs4750tasktracker/components/addtask.dart';
import 'package:cs4750tasktracker/components/tasknamecreation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  List tasksTodayList = [
    //[name, completed]

  ];

  void checkBoxTap(bool? value, int index){
    setState(() {
      tasksTodayList[index][1] = value;
    });
  }
  final _newTaskNameController = TextEditingController();
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return newTaskName(
            controller: _newTaskNameController,
            onCancel: cancelNewTask,
            onSave: saveNewTask,
          );
        },
    );
  }

  void saveNewTask(){
    setState(() {
      tasksTodayList.add([_newTaskNameController.text, false]);
    });
    _newTaskNameController.clear();
    Navigator.of(context).pop();
  }

  void cancelNewTask(){

    _newTaskNameController.clear();
    Navigator.of(context).pop();
  }

  void openTaskSettings(int index){
    showDialog(
      context: context,
      builder: (context){
        return newTaskName(
            controller: _newTaskNameController,
            onCancel: cancelNewTask,
            onSave: () => saveExistingTask(index),
        );
      },
    );
  }

  void saveExistingTask(int index){
    setState(() {
      tasksTodayList[index][0] = _newTaskNameController.text;
    });
    _newTaskNameController.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index){
    setState(() {
      tasksTodayList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        elevation: 0,
      ),
      floatingActionButton: AddTaskButton(onPressed: createNewTask),
      body: ListView.builder(
        itemCount: tasksTodayList.length,
        itemBuilder: (context, index){
          return TaskTile(
              taskName: tasksTodayList[index][0],
              taskCompleted: tasksTodayList[index][1],
              onChanged: (value) => checkBoxTap(value, index),
              settingsTap: (context) => openTaskSettings(index),
              deleteTap: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}