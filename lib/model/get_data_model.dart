import 'dart:convert';

class GetDataModel {
  String? id;
  String? name;
  Data? data;

  GetDataModel({this.id, this.name, this.data});

  /// Single item
  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
    id: json['id'],
    name: json['name'],
    data: json['data'] == null ? null : Data.fromJson(json['data']),
  );

  /// List of items
  static List<GetDataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => GetDataModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'data': data?.toJson(),
  };
}

class Data {
  String? color;
  String? capacity;
  int? capacityGb;
  double? price;
  String? generation;
  int? year;
  String? cpuModel;
  String? hardDiskSize;
  String? strapColour;
  String? caseSize;
  String? description;
  double? screenSize;

  Data({
    this.color,
    this.capacity,
    this.capacityGb,
    this.price,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.description,
    this.screenSize,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    color: json['color'] ?? json['Color'],
    capacity: json['capacity'] ?? json['Capacity'],
    capacityGb: json['capacity GB'],
    price: json['price'] != null
        ? (json['price'] is int
        ? (json['price'] as int).toDouble()
        : json['price'] is String
        ? double.tryParse(json['price'])
        : json['price'])
        : json['Price'] != null
        ? double.tryParse(json['Price'].toString())
        : null,
    generation: json['generation'] ?? json['Generation'],
    year: json['year'],
    cpuModel: json['CPU model'],
    hardDiskSize: json['Hard disk size'],
    strapColour: json['Strap Colour'],
    caseSize: json['Case Size'],
    description: json['Description'],
    screenSize: json['Screen size']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'color': color,
    'capacity': capacity,
    'capacity GB': capacityGb,
    'price': price,
    'generation': generation,
    'year': year,
    'CPU model': cpuModel,
    'Hard disk size': hardDiskSize,
    'Strap Colour': strapColour,
    'Case Size': caseSize,
    'Description': description,
    'Screen size': screenSize,
  };
}
