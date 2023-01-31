import 'dart:convert';

class PessoaModel {
  int? id;
  String name;
  String document;
  String dtBirth;
  String email;
  String phone;
  PessoaModel({
    this.id,
    required this.name,
    required this.document,
    required this.dtBirth,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'document': document,
      'dtBirth': dtBirth,
      'email': email,
      'phone': phone,
    };
  }

  factory PessoaModel.fromMap(Map<String, dynamic> map) {
    return PessoaModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      document: map['document'] ?? '',
      dtBirth: map['dtBirth'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaModel.fromJson(String source) =>
      PessoaModel.fromMap(json.decode(source));
}
