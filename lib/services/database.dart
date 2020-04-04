import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  
  
  CollectionReference collection = Firestore.instance.collection("task");
  //update data of subject
  Future updateData(String fid,List<dynamic> list) async {
    var tempList = List();
    for(var str in list){
      tempList.add(str);
    }
    tempList.add("khan");
    try{
      return await collection.document(fid).setData({
        "folders" : tempList,
        "uid": fid,
      });
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  //adding modules to existing subject

  Future addModules(String sid) async {

    try{
      return await collection.document(sid).setData({
        "1": [
          {
            'name':"",
            'link':"",
          },
        ],
        "2": [
          {
            'name':"",
            'link':"",
          },
        ],
        "3": [
          {
            'name':"",
            'link':"",
          },
        ],
        "4": [
          {
            'name':"",
            'link':"",
          },
        ],
        "5": [
          {
            'name':"",
            'link':"",
          },
        ],
      });
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  Stream<QuerySnapshot> get doc {
    return collection.snapshots();
  }



}