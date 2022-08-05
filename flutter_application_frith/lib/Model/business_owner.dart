class business_owner {
  String BusinessName;
  String BusinessABN;
  String BusinessEmail;
  String ManagerFirstName;
  String ManagerLastName;
  String BusinessNumber;

  //constructor
  business_owner(
      {required this.BusinessName,
      required this.BusinessABN,
      required this.BusinessEmail,
      required this.ManagerFirstName,
      required this.ManagerLastName,
      required this.BusinessNumber});

  //convert from JSON
  factory business_owner.fromJSON(Map<String, dynamic> json) {
    return business_owner(
        BusinessName: json["BusinessName"],
        BusinessABN: json["BusinessABN"],
        BusinessEmail: json["BusinessEmail"],
        ManagerFirstName: json["ManagerFirstName"],
        ManagerLastName: json["ManagerLastName"],
        BusinessNumber: json["BusinessNumber"]);
  }

  //convert to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["BusinessName"] = BusinessName;
    data["BusinessABN"] = BusinessABN;
    data["BusinessEmail"] = BusinessEmail;
    data["ManagerFirstName"] = ManagerFirstName;
    data["ManagerLastName"] = ManagerLastName;
    data["BusinessNumber"] = BusinessNumber;

    return data;
  }
}
