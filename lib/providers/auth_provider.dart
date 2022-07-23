import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dingo/models/spells.dart';

import '../src/authentication.dart';
import '../src/spells_service.dart';
import '../src/characters_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChanges;
});

final databaseProvider = Provider.autoDispose<SpellsService?>((ref) {
  final auth = ref.watch(authStateProvider);

  if (auth.asData?.value?.uid != null) {
    return SpellsService();
  }
  return null;
});

final spellsFuture = FutureProvider((ref) async {
  return getSpells();
});
