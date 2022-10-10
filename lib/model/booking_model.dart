import 'dart:convert';

class BookingModel {
  final String nobook;
  final String usernamebook;
  final String fnamebook;
  final String lnamebook;
  final String lisenbook;
  final String stmonth;
  final String styear;
  final String tomonth;
  final String toyear;
  final String resultmy;
  final String status;
  BookingModel({
    required this.nobook,
    required this.usernamebook,
    required this.fnamebook,
    required this.lnamebook,
    required this.lisenbook,
    required this.stmonth,
    required this.styear,
    required this.tomonth,
    required this.toyear,
    required this.resultmy,
    required this.status,
  });

  BookingModel copyWith({
    String? nobook,
    String? usernamebook,
    String? fnamebook,
    String? lnamebook,
    String? lisenbook,
    String? stmonth,
    String? styear,
    String? tomonth,
    String? toyear,
    String? resultmy,
    String? status,
  }) {
    return BookingModel(
      nobook: nobook ?? this.nobook,
      usernamebook: usernamebook ?? this.usernamebook,
      fnamebook: fnamebook ?? this.fnamebook,
      lnamebook: lnamebook ?? this.lnamebook,
      lisenbook: lisenbook ?? this.lisenbook,
      stmonth: stmonth ?? this.stmonth,
      styear: styear ?? this.styear,
      tomonth: tomonth ?? this.tomonth,
      toyear: toyear ?? this.toyear,
      resultmy: resultmy ?? this.resultmy,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nobook': nobook,
      'usernamebook': usernamebook,
      'fnamebook': fnamebook,
      'lnamebook': lnamebook,
      'lisenbook': lisenbook,
      'stmonth': stmonth,
      'styear': styear,
      'tomonth': tomonth,
      'toyear': toyear,
      'resultmy': resultmy,
      'status': status,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      nobook: map['nobook'] ?? '',
      usernamebook: map['usernamebook'] ?? '',
      fnamebook: map['fnamebook'] ?? '',
      lnamebook: map['lnamebook'] ?? '',
      lisenbook: map['lisenbook'] ?? '',
      stmonth: map['stmonth'] ?? '',
      styear: map['styear'] ?? '',
      tomonth: map['tomonth'] ?? '',
      toyear: map['toyear'] ?? '',
      resultmy: map['resultmy'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) => BookingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookingModel(nobook: $nobook, usernamebook: $usernamebook, fnamebook: $fnamebook, lnamebook: $lnamebook, lisenbook: $lisenbook, stmonth: $stmonth, styear: $styear, tomonth: $tomonth, toyear: $toyear, resultmy: $resultmy, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BookingModel &&
      other.nobook == nobook &&
      other.usernamebook == usernamebook &&
      other.fnamebook == fnamebook &&
      other.lnamebook == lnamebook &&
      other.lisenbook == lisenbook &&
      other.stmonth == stmonth &&
      other.styear == styear &&
      other.tomonth == tomonth &&
      other.toyear == toyear &&
      other.resultmy == resultmy &&
      other.status == status;
  }

  @override
  int get hashCode {
    return nobook.hashCode ^
      usernamebook.hashCode ^
      fnamebook.hashCode ^
      lnamebook.hashCode ^
      lisenbook.hashCode ^
      stmonth.hashCode ^
      styear.hashCode ^
      tomonth.hashCode ^
      toyear.hashCode ^
      resultmy.hashCode ^
      status.hashCode;
  }
}
