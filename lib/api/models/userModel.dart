import 'dart:convert';

class User {
  User({
    this.userId,
    this.username,
    this.password,
    this.fullname,
    this.designation,
    this.contact,
    this.accountType,
  });

  int userId;
  String username;
  String password;
  String fullname;
  String designation;
  String contact;
  int accountType;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"]as int,
    username: json["username"]as String,
    password: json["password"]as String,
    fullname: json["fullname"]as String,
    designation: json["designation"] as String,
    contact: json["contact"]as String,
    accountType: json["account_type"]as int,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": username,
    "password": password,
    "full_name": fullname,
    "designation": designation,
    "contact": contact,
    "account_type": accountType,
  };
}

class UserSalary {
  UserSalary({
    this.user_id,
    this.salary_amount,
    this.salary_paid,
    this.salary_due,
    this.salary_month,
    this.paying_date,
  });

  int user_id;
  double salary_amount;
  double salary_paid;
  double salary_due;
  String salary_month;
  String paying_date;

  factory UserSalary.fromJson(Map<String, dynamic> json) => UserSalary(
    user_id: json["user_id"]as int,
    salary_amount: json["salary_amount"]as double,
    salary_paid: json["salary_paid"]as double,
    salary_due: json["salary_due"]as double,
    salary_month: json["salary_month"] as String,
    paying_date: json["paying_date"]as String,
  );

  Map<String, dynamic> toJson() => {
    "user_id": user_id,
    "salary_amount": salary_amount,
    "salary_paid": salary_paid,
    "salary_due": salary_due,
    "salary_month": salary_month,
    "paying_date": paying_date,
  };
}

