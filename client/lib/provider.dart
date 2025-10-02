import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError("Isar must be initialized before runApp()");
});
