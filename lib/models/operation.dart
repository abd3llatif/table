class Operation {
  String name;
  bool conforme;
  String intervention;

  Operation({this.name, this.conforme, this.intervention});

  Operation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    conforme = json['conforme'];
    intervention = json['intervention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['conforme'] = this.conforme;
    data['intervention'] = this.intervention;
    return data;
  }
}