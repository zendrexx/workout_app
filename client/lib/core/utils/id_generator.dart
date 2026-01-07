import 'package:uuid/uuid.dart';

class IdGenerator {
  // Singleton pattern so you can reuse the same instance
  static final IdGenerator _instance = IdGenerator._internal();
  factory IdGenerator() => _instance;
  IdGenerator._internal();

  final Uuid _uuid = Uuid();

  String getId() => _uuid.v4(); // generate a random UUID
}
