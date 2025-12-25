import 'package:client/core/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider<Isar>((ref) {
  return DatabaseService.db;
});
