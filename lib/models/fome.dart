import 'package:table/models/operation.dart';

class Forme {
  List<Operation> operations;
  String details;
  String remarques;

  Forme({this.operations, this.details, this.remarques});

  Forme.fromJson(Map<String, dynamic> json) {
    if (json['operations'] != null) {
      operations = [];
      json['operations'].forEach((v) {
        operations.add(Operation.fromJson(v));
      });
    }
    details = json['details'];
    remarques = json['remarques'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.operations != null) {
      data['operations'] = this.operations.map((v) => v.toJson()).toList();
    }
    data['details'] = this.details;
    data['remarques'] = this.remarques;
    return data;
  }
}