class business_owner {
  String BusinessID;
  String BusinessName;
  String BusinessABN;
  String BusinessEmail;
  String ManagerFirstName;
  String ManagerLastName;
  String BusinessNumber;

  //constructor
  business_owner(
      {required this.BusinessID,
      required this.BusinessName,
      required this.BusinessABN,
      required this.BusinessEmail,
      required this.ManagerFirstName,
      required this.ManagerLastName,
      required this.BusinessNumber});

  //convert from JSON
  factory business_owner.fromJSON(Map<String, dynamic> json) {
    return business_owner(
        BusinessID: json["BusinessID"],
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

class LoggedInBusiness {
  late business_owner logged_in_business = business_owner(
      BusinessID: "",
      BusinessName: "",
      BusinessABN: "",
      BusinessEmail: "",
      ManagerFirstName: "",
      ManagerLastName: "",
      BusinessNumber: "");

  void setLoggedInBusinessValue(business_owner current_business) {
    logged_in_business = current_business;
  }

  business_owner getLoggedInBusinessValue() {
    return logged_in_business;
  }
}
