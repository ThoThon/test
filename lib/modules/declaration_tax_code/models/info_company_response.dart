class InfoCompanyResponse {
  InfoCompanyResponse({
    this.id = "",
    this.orgId = "",
    this.isActive = false,
    this.orgName = "",
    this.orgType = 0,
    this.userName = "",
    this.address = "",
    this.districtCode = "",
    this.provinceCode = "",
    this.phoneNumber = "",
    this.email = "",
    this.representative = "",
    this.startDate = "",
    this.endDate = "",
    this.taxCode = "",
    this.isTaxCode = false,
    this.businessType = "",
    this.unitCode = "",
    this.title = "",
    this.registedAddress = "",
    this.recieverType = "",
    this.budgetCode = "",
    this.createTime = "",
    this.creator = "",
    this.updater = "",
    this.signer = "",
    this.bankAccount = "",
    this.bankName = "",
    this.bankBranch = "",
    this.bankAddress = "",
    this.contactPhone = "",
    this.objectType = "",
    this.salaryCoefficients = 0,
    this.groupObject = "",
    this.optionPackage = "",
    this.connectionInfo = "",
  });

  String id;
  String orgId;
  bool isActive;
  String orgName;
  int orgType;
  String userName;
  String address;
  String districtCode;
  String provinceCode;
  String phoneNumber;
  String email;
  String representative;
  String startDate;
  String endDate;
  String taxCode;
  bool isTaxCode;
  String businessType;
  String unitCode;
  String title;
  String registedAddress;
  String recieverType;
  String budgetCode;
  String createTime;
  String creator;
  String updater;
  String signer;
  String bankAccount;
  String bankName;
  String bankBranch;
  String bankAddress;
  String contactPhone;
  String objectType;
  int salaryCoefficients;
  String groupObject;
  String optionPackage;
  String connectionInfo;

  factory InfoCompanyResponse.fromJson(Map<String, dynamic> json) {
    return InfoCompanyResponse(
      id: json["id"] ?? "",
      orgId: json["orgId"] ?? "",
      isActive: json["isActive"] ?? false,
      orgName: json["orgName"] ?? "",
      orgType: json["orgType"] ?? 0,
      userName: json["userName"] ?? "",
      address: json["address"] ?? "",
      districtCode: json["districtCode"] ?? "",
      provinceCode: json["provinceCode"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      email: json["email"] ?? "",
      representative: json["representative"] ?? "",
      startDate: json["startDate"] ?? "",
      endDate: json["endDate"] ?? "",
      taxCode: json["taxCode"] ?? "",
      isTaxCode: json["isTaxCode"] ?? false,
      businessType: json["businessType"] ?? "",
      unitCode: json["unitCode"] ?? "",
      title: json["title"] ?? "",
      registedAddress: json["registedAddress"] ?? "",
      recieverType: json["recieverType"] ?? "",
      budgetCode: json["budgetCode"] ?? "",
      createTime: json["createTime"] ?? "",
      creator: json["creator"] ?? "",
      updater: json["updater"] ?? "",
      signer: json["signer"] ?? "",
      bankAccount: json["bankAccount"] ?? "",
      bankName: json["bankName"] ?? "",
      bankBranch: json["bankBranch"] ?? "",
      bankAddress: json["bankAddress"] ?? "",
      contactPhone: json["contactPhone"] ?? "",
      objectType: json["objectType"] ?? "",
      salaryCoefficients: json["salaryCoefficients"] ?? 0,
      groupObject: json["groupObject"] ?? "",
      optionPackage: json["optionPackage"] ?? "",
      connectionInfo: json["connectionInfo"] ?? "",
    );
  }
}
