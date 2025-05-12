// import '../../src.dart';

// class HistoryRegisterDetailControllerICare extends BaseGetxController {
//   late HistoryRegisterModel historyRegisterModel;

//   QuaTrinhXuLy? quaTrinhXuLy1;

//   late final HistoryDetaiRepositoryICare historyDetaiRepository =
//       HistoryDetaiRepositoryICare(this);

//   @override
//   void onInit() async {
//     super.onInit();
//     getArg();

//     //Nếu ở ngoài màn History transaction có data rồi thì call api để lấy về mã kết quả
//     callHistoryDetail();
//   }

//   void callHistoryDetail() async {
//     try {
//       if (historyRegisterModel.soHoSo.isNotEmpty) {
//         showLoading();
//         await searchProcessDocument(isUpdate: false);
//       }
//     } finally {
//       hideLoading();
//     }
//   }

//   void getArg() {
//     final arg = Get.arguments;
//     if (arg is HistoryRegisterModel) {
//       historyRegisterModel = arg;
//     }
//   }
// }
