/// class chứa các api để giao tiếp với BE
class AppApi {
  static const String url = "https://testapi.easyhrm.vn/vbhxh-mobile-api";
  static const String version = "";

  static const urlLogin = '/api/Authen/auth';
  static const String urlGetToken = '/EasyCA/GetToken';
  static const String urlGetListTaxCode = '/Organization/GetListTaxcodeByEmail';
  static const String urlGetInfoUnit = '/Organization/GetDataByTaxcode';
  static const String urlGetProvinces = '/Location/GetProvinces';
  static const String urlGetDistricts = '/Location/GetDistricts';
  static const String urlGetWards = '/Location/GetWards';
  static const String urlGetSocialAgency = '/Location/GetCcqlBHXH';
  static const String urlFirstRegister = '/HoSoBHXH/FirstRegisterWithECA';
  static const String urlRegisterService = '/HoSoBHXH/RegisterServiceWithECA';
  static const String urlGetListCertificate = '/EasyCA/GetCertificateList';
  static const String urlGetHistoryRegister = '/HoSoBHXH/GetHistoryRegister';
  static const String urlSearchProcessDocumentByKey =
      '/HoSoBHXH/SearchProcessDocumentByKey';
  static const String urlUpdateHistoryRigister =
      '/HoSoBHXH/UpdateHistoryRegister';
}
