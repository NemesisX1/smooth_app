import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smooth/services/base.service.dart';

class Collection {
  static const String clients = "clients";
  static const String flavours = "flavours";
  static const String commands = "commands";
}

class FirestoreService extends BaseService {
  Future<QuerySnapshot> getCollection(String collection) async =>
      await FirebaseFirestore.instance.collection(collection).get();

  Stream<QuerySnapshot> getCollectionAsStream(String collection) =>
      FirebaseFirestore.instance.collection(collection).get().asStream();

  Future<QuerySnapshot> getCollectionByTag(
          String collection, String field, String tag) async =>
      await FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: tag)
          .get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getCollectionById(
          String collection, String field, String id) async =>
      await FirebaseFirestore.instance.collection(collection).doc(id).get();

  updateCollectionDocWithIdByData(
          String collection, String id, Map<String, dynamic> data) async =>
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(id)
          .update(data);

  deleteCollectionDocWithIdByData(
          String collection, String id, Map<String, dynamic> data) async =>
      await FirebaseFirestore.instance.collection(collection).doc(id).delete();

  getCollectionByTagAsStream(String collection, String field, String tag) =>
      FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: tag)
          .get()
          .asStream();

  addMapToCollection(Map<String, dynamic> map, String collection,
      {String? id}) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(map)
        .catchError((e) {
      print("$e");
    });
  }

  addMapToCollectionInCollection(String collection, String id,
          String secondCollection, Map<String, dynamic> data) async =>
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(id)
          .collection(secondCollection)
          .add(data)
          .catchError((e) {
        print("${e.toString()}");
      });

  Future<DocumentSnapshot<Map<String, dynamic>>>
      findMapInCollectionInCollection(String collection,
              String secondCollection, String field, String tag) async =>
          await FirebaseFirestore.instance
              .collection(collection)
              .doc()
              .collection(secondCollection)
              .doc()
              .get();
}
