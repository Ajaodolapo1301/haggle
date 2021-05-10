
import 'package:hive/hive.dart';
part 'user.g.dart';




@HiveType()
class User extends HiveObject{
  @HiveField(0)
  String email;
  @HiveField(1)
  String id;
  @HiveField(2)
  String phonenumber;
  @HiveField(3)
  String token;
  @HiveField(4)
  bool emailVerified;
  @HiveField(5)
  String username;
  @HiveField(6)
  String country;



  User({this.phonenumber, this.email, this.id, this.token, this.emailVerified, this.username, this.country});


  User.fromJson(Map<String, dynamic>json) {
    email = json["register"]["user"]["email"];
    id = json["register"]["user"]["_id"];
    phonenumber = json["register"]["user"]["phonenumber"];
    token = json["register"]["token"];
    emailVerified = json["register"]["user"]["emailVerified"];
    country = json["register"]["user"]["profile"]["country"];
    username = json["register"]["user"]["username"];
  }

  User.fromJson2(Map<String, dynamic>json) {
     email = json["login"]["user"]["email"];
     id = json["login"]["user"]["_id"];
     phonenumber = json["login"]["user"]["phonenumber"];
     token = json["login"]["token"];
     emailVerified = json["login"]["user"]["emailVerified"];
     country = json["login"]["user"]["profile"]["country"];
     username = json["login"]["user"]["username"];
   }


}
