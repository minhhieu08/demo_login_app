import 'package:agribank_app/models/branch.dart';

class Store {
  final String id;
  final String city;
  final Branch branch;

  const Store({
    required this.id,
    required this.city,
    required this.branch,
  });
}
