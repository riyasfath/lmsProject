class Module {
  final int id;
  final String name;

  Module({required this.id, required this.name});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      name: json['name'],
    );
  }
}
