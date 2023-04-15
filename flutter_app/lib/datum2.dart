class Datum2 {
  Datum2({required this.date, required this.close});

  final DateTime date;
  final double close;

  Datum2.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['Time']),
        close = json['S1humidity'].toDouble();
}


