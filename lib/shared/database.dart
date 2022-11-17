import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Database {
  static final _db = FirebaseFirestore.instance;
  static final usersCollection = _db.collection('users');
  static final coursesCollection = _db.collection('courses');
  static final domainsCollection = _db.collection('domains');
  static final resourcesCollection = _db.collection('resources');
}
