import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  static const String collectionName = "Tasks";
  String? id;
  String? title;
  String? description;
  Timestamp? date;
  bool? isDone;

  Task({this.id , this.date  ,this.title , this.description , this.isDone = false});

  Task.fromFireStore(Map<String , dynamic>? data){
    id = data?["id"];
    title = data?["title"];
    description = data?["description"];
    date = data?['date'];
    isDone = data?['isDone'];
  }

  Map<String ,dynamic> toFireStore(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isDone":isDone
    };
  }
}