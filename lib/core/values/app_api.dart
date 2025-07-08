/// class chứa các api để giao tiếp với BE
class AppApi {
  // Url test chưa ký được
  static const String url = "https://testapi.easyhrm.vn/vbhxh-mobile-api";
  // Base URL test có thể ký
  static const String urlSign = "https://vbhxh-mobile-api.easyhrm.vn";

  static const String version = "";

  static const urlLogin = '/api/Authen/auth';
  static const String urlGetToken = '/EasyCA/GetToken';
  static const String urlGetListTaxCode = '/Organization/GetListTaxcodeByEmail';
  static const String urlGetInfoUnit = '/Organization/GetDataByTaxcode';
  static const String urlFirstRegister = '/HoSoBHXH/FirstRegisterWithECA';
  static const String urlRegisterService = '/HoSoBHXH/RegisterServiceWithECA';
  static const String urlGetListCertificate = '/EasyCA/GetCertificateList';
  static const String urlSearchProcessDocumentByKey =
      '/HoSoBHXH/SearchProcessDocumentByKey';
  static const String urlUpdateHistoryRigister =
      '/HoSoBHXH/UpdateHistoryRegister';
  //
  static const String urlGetAccountInfo = '/api/Authen/get-account-info';
  static const String urlUpdateAccountInfo = '/api/Authen/update-account-info';
  static const String urlGetHistoryDeclare = '/api/History/get-histories';
  static const String urlGetListProcedure = '/api/Categories/get-thu-tuc';
  static const String urlAddDeclarationPeriod = '/api/Document/add-kykekhai';
  static const String urlGetListDeclarationPeriod =
      '/api/Document/get-kykekhai';
  static const String urlLookupC12 = '/api/TraCuu/files-c12';
  static const String urlGetFileNumber = '/api/TraCuu/tien-do-tiep-nhan';
  static const String urlLookupProgressHistory =
      '/api/TraCuu/qua-trinh-xu-ly-ho-so';
  static const String urlGetListProcedureHistory =
      '/api/History/get-thu-tuc-history';
  static const String urlGetD02Categories = '/api/HoSoD02/get-d02-categories';
  static const String urlGetDistricts = '/api/Categories/get-districts';
  static const String urlGetWards = '/api/Categories/get-wards';
  static const String urlGetHospitals = '/api/Categories/get-benh-vien';
  static const String urlGetDetailStaff = '/api/Categories/get-detail-staff';

  /// API lưu nháp khi kê khai thông tin
  static const String urlAddD02 = '/api/HoSoD02/add-d02';

  static const String urlUpdateD02 = '/api/HoSoD02/update-d02';

  /// API lấy danh sách lao động theo kỳ kê khai
  static const String urlGetStaffList = '/api/HoSoD02/get-d02-list';

  static const String urlUpLoadImage = '/api/Upload/images';

  static const String urlSaveXml = '/api/HoSoD02/save-xml';
  static const String urlSignDocument = '/api/Document/sign-ho-so';
  static const String urlGetPreviewPdf = '/api/HoSoD02/preview-pdf';
  static const String urlGetStaffListSelect = '/api/Categories/get-list-staff';
  static const String urlGetD02Detail = '/api/HoSoD02/get-d02-detail';
  static const String urlDeleteMember = '/api/HoSoD02/delete-thanhvien';
  static const String urlDeleteForm = '/api/HoSoD02/delete-d01';
  static const String urlDeleteDeclarationPeriod =
      '/api/Document/delete-kykekhai';
  static const String urlGetNotification = '/api/Notification/page';
  static const String urlReadNotification = '/api/Notification/read';
  static const String urlReadAllNotification = '/api/Notification/read-all';
  static const String urlGetNotificationUnread =
      '/api/Notification/total-unread';

  static const String urlDeleteD02Tk1D01 = '/api/HoSoD02/delete-d02tk1-d01';
  static const String urlGetListCert =
      '/api/RegisterService/get-list-credentials';

  static const String urlFetchRegisterServiceInfo =
      '/api/RegisterService/get-registration-info';
  static const String urlRegisterNewService =
      '/api/RegisterService/register-new-service';
  static const String urlCancelRegister =
      '/api/RegisterService/cancel-register';
  static const String urlChangeInfo = '/api/RegisterService/change-info';
  static const String urlGetHistoryRegister =
      '/api/History/get-histories-register';
  static const String urlLookupHistoryRegister = '/api/TraCuu/tien-do-dang-ky';
  static const String urlGetRegisterFirstCategories =
      '/api/RegisterService/get-dkld-categories';
  static const String urlRegisterFirstForCode =
      '/api/RegisterService/first-register';
  static const String urlForgotPassword = '/api/Authen/forgot-password';
  static const String urlDeleteListNotification =
      '/api/Notification/delete-list';
  static const String urlDeleteAllNotification = '/api/Notification/delete-all';

  // === Danh sách các api liên quan đến thủ tục 607 ===
  static const String urlGetStaffList607 = '/api/HoSoTk1/get-list';
  static const String urlSaveXml607 = '/api/HoSoTk1/save-xml';
  static const String urlDeleteDeclarationPeriod607 =
      '/api/HoSoTk1/delete-tk1-d01';
  static const String urlAddTk1 = '/api/HoSoTk1/add-tk1';
  static const String urlGetTk1Detail = '/api/HoSoTk1/get-detail';
  static const String urlUpdateTk1 = '/api/HoSoTk1/update-tk1';

  // === Kết thúc các api liên quan đến thủ tục 607 ===
}
