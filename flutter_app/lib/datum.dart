class Datum {
  Datum({required this.date, required this.close});

  final DateTime date;
  final double close;

  Datum.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['Time']),
        close = json['S1temperature'].toDouble();
}

class Datum2 {
  Datum2({required this.date, required this.close});

  final DateTime date;
  final double close;

  Datum2.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['Time']),
        close = json['S1humidity'].toDouble();
}

class Datum3 {
  Datum3({required this.date, required this.close});

  final DateTime date;
  final double close;

  Datum3.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['Time']),
        close = json['co2ppm'].toDouble();
}