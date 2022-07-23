import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SpellsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream get allSpells => _firestore.collection('Users').doc('u3QDxdYBuvYJ7Z5TFMZ1NPojRGq1').collection('Characters').snapshots();
}
