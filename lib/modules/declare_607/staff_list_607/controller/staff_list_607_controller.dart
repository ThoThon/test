import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/model/model_src.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/repository/staff_list_607_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/utils/image_utils.dart';

class StaffList607Controller extends BaseGetxController {
  final declarationPeriodId = Get.arguments as String;
  late final _repository = StaffList607Repository(this);

  final declaredStaffs = const <DeclaredStaff607Model>[].obs;
  final listAttachImage = <AttachImage607Model>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getStaffList();
  }

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      upLoadFile(path);
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      upLoadFile(path);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void removeImage(int index) {
    listAttachImage.removeAt(index);
  }

  void maximumUploadFile() {
    showSnackBar('Chỉ cho phép chọn tối đa 5 file');
  }

  Future<void> _getStaffList() async {
    try {
      showLoading();
      final response = await _repository.getStaffList(
        declarationPeriodId: declarationPeriodId,
      );
      if (response.isSuccess) {
        declaredStaffs.value = response.result?.staffs ?? [];
        listAttachImage.value = response.result?.image ?? [];
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> upLoadFile(String imagePath) async {
    try {
      showLoading();
      // final response = await _repository.uploadImage(
      //   request: UploadImageRequest(
      //     file: imagePath,
      //     periodId: declarationPeriodId,
      //   ),
      // );
      // if (response.isSuccess) {
      //   // Vì hiện ảnh lấy từ BE về, nên khi vừa up ảnh xong phải gọi api để lấy link ảnh
      //   _getStaffList();
      // } else {
      //   showSnackBar(response.errorMessage);
      // }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  // Future<void> deleteImage(String fileNameFromUrl, int index) async {
  //   try {
  //     final response = await _repository.deleteImage(
  //       declarationPeriodId,
  //       fileNameFromUrl,
  //     );
  //     if (response.isSuccess) {
  //       showSnackBar(
  //         LocaleKeys.declarationPeriodDetail_deleteImageSuccess.tr,
  //         typeAction: AppConst.actionSuccess,
  //       );

  //       listAttachImage.removeAt(index);
  //     }
  //   } catch (e) {
  //     logger.d(e);
  //   }
  // }

  Future<void> saveXml() async {
    if (declaredStaffs.isEmpty) {
      showSnackBar('Chưa có nhân viên nào được khai báo');
      return;
    }

    try {
      showLoadingOverlay();

      // final response = await _repository.saveXml(
      //   declarationPeriodId: declarationPeriodId,
      // );

      // if (response.isSuccess && response.result != null) {
      //   Get.toNamed(
      //     AppRoutes.declarationList.path,
      //     arguments: DeclarationListArgument(
      //       declarationPeriodId: declarationPeriodId,
      //       saveXmlResult: response.result!,
      //     ),
      //   );
      // } else {
      //   showSnackBar(response.errorMessage);
      // }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  // String getFileNameFromUrl(String url) {
  //   return url.split('/').last;
  // }

  // void showDialogDeleteStaff(DeclaredStaffModel staff) {
  //   ShowDialog.showDialogConfirm2(
  //     title: LocaleKeys.staffList_deleteStaffConfirmMessage.tr,
  //     confirmTitle: LocaleKeys.app_delete.tr,
  //     onConfirm: () {
  //       deleteStaff(staffId: staff.id);
  //     },
  //   );
  // }

  // Future<void> deleteStaff({
  //   required String staffId,
  // }) async {
  //   try {
  //     showLoadingOverlay();
  //     final response = await _repository.deleteD02Tk1D01(
  //       id: staffId,
  //     );

  //     if (response.isSuccess) {
  //       showSnackBar(
  //         LocaleKeys.staffList_deleteStaffSuccess.tr,
  //         typeAction: AppConst.actionSuccess,
  //       );
  //       _getStaffList();
  //     } else {
  //       showSnackBar(response.errorMessage);
  //     }
  //   } catch (e) {
  //     logger.e(e);
  //   } finally {
  //     hideLoadingOverlay();
  //   }
  // }

  Future<void> createStaff() async {
    // final result = await Get.toNamed(
    //   AppRoutes.declareInfo.path,
    //   arguments: DeclareInfoArgument(
    //     declarationPeriodId: declarationPeriodId,
    //     staffId: null,
    //     action: D02ActionEnum.addStaffFromStaffList,
    //   ),
    // );
    // if (result != null) {
    //   _getStaffList();
    // }
  }

  // Future<void> updateStaff(DeclaredStaffModel staff) async {
  //   final result = await Get.toNamed(
  //     AppRoutes.declareInfo.path,
  //     arguments: DeclareInfoArgument(
  //       declarationPeriodId: declarationPeriodId,
  //       staffId: staff.id,
  //       action: D02ActionEnum.updateStaffFromStaffList,
  //     ),
  //   );
  //   if (result != null) {
  //     _getStaffList();
  //   }
  // }
}
