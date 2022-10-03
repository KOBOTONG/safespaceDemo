import 'dart:convert';

class UserModel {
  final String no;
   final String username;
    final String fname;
    final String lname;
    final String licsenseplate;
    final String mailuser;
   final String passuser;
    final String phone;
    final String iden;
   final  String vehicle;
  UserModel({
    required this.no,
    required this.username,
    required this.fname,
    required this.lname,
    required this.licsenseplate,
    required this.mailuser,
    required this.passuser,
    required this.phone,
    required this.iden,
    required this.vehicle,
  });
 

  UserModel copyWith({
    String? no,
    String? username,
    String? fname,
    String? lname,
    String? licsenseplate,
    String? mailuser,
    String? passuser,
    String? phone,
    String? iden,
    String? vehicle,
  }) {
    return UserModel(
      no: no ?? this.no,
      username: username ?? this.username,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      licsenseplate: licsenseplate ?? this.licsenseplate,
      mailuser: mailuser ?? this.mailuser,
      passuser: passuser ?? this.passuser,
      phone: phone ?? this.phone,
      iden: iden ?? this.iden,
      vehicle: vehicle ?? this.vehicle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'username': username,
      'fname': fname,
      'lname': lname,
      'licsenseplate': licsenseplate,
      'mailuser': mailuser,
      'passuser': passuser,
      'phone': phone,
      'iden': iden,
      'vehicle': vehicle,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      no: map['no'] ?? '',
      username: map['username'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      licsenseplate: map['licsenseplate'] ?? '',
      mailuser: map['mailuser'] ?? '',
      passuser: map['passuser'] ?? '',
      phone: map['phone'] ?? '',
      iden: map['iden'] ?? '',
      vehicle: map['vehicle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(no: $no, username: $username, fname: $fname, lname: $lname, licsenseplate: $licsenseplate, mailuser: $mailuser, passuser: $passuser, phone: $phone, iden: $iden, vehicle: $vehicle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.no == no &&
      other.username == username &&
      other.fname == fname &&
      other.lname == lname &&
      other.licsenseplate == licsenseplate &&
      other.mailuser == mailuser &&
      other.passuser == passuser &&
      other.phone == phone &&
      other.iden == iden &&
      other.vehicle == vehicle;
  }

  @override
  int get hashCode {
    return no.hashCode ^
      username.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      licsenseplate.hashCode ^
      mailuser.hashCode ^
      passuser.hashCode ^
      phone.hashCode ^
      iden.hashCode ^
      vehicle.hashCode;
  }
}
