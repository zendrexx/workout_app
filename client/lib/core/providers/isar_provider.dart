import 'package:client/core/database/database_service.dart';
import 'package:client/core/providers/database_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

// final isarProvider = FutureProvider<Isar>((ref) async {
//   final dbService = ref.read(databaseServiceProvider);
//   await dbService.setup(); // ensures DB is opened
//   return dbService.isar;
// });
