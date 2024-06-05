class CatogeryData {
  int? id;
  String? name;
  String? descraotion;
  CatogeryData.fromJason(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    descraotion = data['descraption'];
  }

  Map<String, dynamic> toJason() {
    return {'id': id, 'name': name, 'descraotion': descraotion};
  }
}
