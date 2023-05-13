import 'package:techsterstest/festivals/models/festival_record_mode.dart';

class Festive {
  final List<Record>? records;

  Festive({
    this.records,
  });

  factory Festive.fromJson(Map<String, dynamic> json) => Festive(
        records: json["records"] == null
            ? []
            : List<Record>.from(
                json["records"]!.map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class FestivTwo {
  final List<RecordTwo>? records;

  FestivTwo({
    this.records,
  });

  factory FestivTwo.fromJson(Map<String, dynamic> json) => FestivTwo(
        records: json["records"] == null
            ? []
            : List<RecordTwo>.from(
                json["records"]!.map((x) => RecordTwo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}
