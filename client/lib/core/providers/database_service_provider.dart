import 'package:client/core/database/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  final service = DatabaseService();
  // Optionally, you could setup here or call it elsewhere
  return service;
});
