

class DataItems {
  String id;
  String date;
  String name;
  DataItems({required this.id,required this.date, required this.name});

  factory DataItems.fromJson(Map<String, dynamic> json) {
    return DataItems(id: json['id'],date: json['date'], name: json['name']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'date': date,
      'name': name
    };
  }
}
