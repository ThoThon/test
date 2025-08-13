import 'package:path/path.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/repository/staff_list_607_repository.dart';
import 'package:v_bhxh/modules/declare/staff_list/repository/staff_list_repository.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../base_app/base_app.src.dart';
import '../repository/staff_list_630_repository.dart';

// Chỉ cho phép up tối đa 5 file ảnh
const maxImageAttachments = 5;

class StaffListController extends BaseGetxController {
  final argument = Get.arguments as StaffListArgument;

  late final _repository = StaffListRepository(this);
  late final _repository607 = StaffList607Repository(this);
  late final _repository630 = StaffList630Repository(this);

  final declaredStaffs = const <DeclaredStaffModel>[].obs;

  final listAttachImage = <AttachImageModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getStaffList();
  }

  String get declarationPeriodId => argument.declarationPeriodId;
  ProcedureType get procedureType => argument.procedureType;

  Future<void> pickImage() async {
    try {
      if (listAttachImage.length >= maxImageAttachments) {
        showSnackBar(LocaleKeys.dialog_max5File.tr);
        return;
      }
      final path = await ImageUtils.pickImage();
      if (path != null) {
        await upLoadFile(path);
      }
    } catch (e) {
      showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  Future<void> takePhoto() async {
    try {
      if (listAttachImage.length >= maxImageAttachments) {
        showSnackBar(LocaleKeys.dialog_max5File.tr);
        return;
      }
      final path = await ImageUtils.takePhoto();
      if (path != null) {
        await upLoadFile(path);
      }
    } catch (e) {
      showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void removeImage(int index) {
    listAttachImage.removeAt(index);
  }

  Future<void> _getStaffList() async {
    try {
      showLoading();
      final response = await switch (procedureType) {
        ProcedureType.procedure600 => _repository.getStaffList(
            declarationPeriodId: declarationPeriodId,
          ),
        ProcedureType.procedure607 ||
        ProcedureType.procedure608 ||
        ProcedureType.procedure610 ||
        ProcedureType.procedure612 ||
        ProcedureType.procedure613 =>
          _repository607.getStaffList(
            declarationPeriodId: declarationPeriodId,
          ),
        ProcedureType.procedure630a => _repository630.getListStaff630a(
            declarationPeriodId: declarationPeriodId,
          ),
        ProcedureType.procedure630b => _repository630.getListStaff630b(
            declarationPeriodId: declarationPeriodId,
          ),
      };

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
      final response = await _repository.uploadImage(
        request: UploadImageRequest(
          file: imagePath,
          periodId: declarationPeriodId,
        ),
      );
      if (response.isSuccess) {
        // Vì hiện ảnh lấy từ BE về, nên khi vừa up ảnh xong phải gọi api để lấy link ảnh
        _getStaffList();
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> deleteImage(String fileNameFromUrl, int index) async {
    try {
      showLoadingOverlay();
      final fileName = _getFileNameFromUrl(fileNameFromUrl);
      if (fileName == null || fileName.trim().isEmpty) {
        showSnackBar('Có lỗi xảy ra, không thể xóa ảnh');
        return;
      }

      final response = await _repository.deleteImage(
        declarationPeriodId,
        fileName,
      );
      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declarationPeriodDetail_deleteImageSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );

        listAttachImage.removeAt(index);
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void onTapButtonContinue() {
    // Thủ tục 630a phải đi qua màn "Thông tin khác" nữa
    if (argument.procedureType == ProcedureType.procedure630a ||
        argument.procedureType == ProcedureType.procedure630b) {
      if (declaredStaffs.isEmpty) {
        showSnackBar(LocaleKeys.declarationPeriod_declaredStaffsIsEmpty.tr);
        return;
      }
      Get.toNamed(AppRoutesCl.otherInfo.path, arguments: argument);
    } else {
      saveXml();
    }
  }

  Future<void> saveXml() async {
    if (declaredStaffs.isEmpty) {
      showSnackBar('Chưa có nhân viên nào được khai báo');
      return;
    }

    try {
      showLoadingOverlay();
      final response = await switch (procedureType) {
        ProcedureType.procedure600 => _repository.saveXml(
            declarationPeriodId: declarationPeriodId,
          ),
        ProcedureType.procedure607 ||
        ProcedureType.procedure608 ||
        ProcedureType.procedure610 ||
        ProcedureType.procedure612 ||
        ProcedureType.procedure613 =>
          _repository607.saveXml(
            declarationPeriodId: declarationPeriodId,
          ),
        _ => throw UnimplementedError('Not implemented yet'),
      };

      if (response.isSuccess && response.result != null) {
        Get.toNamed(
          AppRoutesCl.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: declarationPeriodId,
            saveXmlResult: response.result!,
            procedureType: procedureType,
          ),
        );
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  String? _getFileNameFromUrl(String url) {
    return url.split('/').lastOrNull;
  }

  void showDialogDeleteStaff(DeclaredStaffModel staff) {
    ShowDialog.showDialogConfirm2(
      backgroundColorBack: AppColors.basicWhite,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      title: LocaleKeys.staffList_deleteStaffConfirmMessage.tr,
      confirmTitle: LocaleKeys.app_delete.tr,
      onConfirm: () {
        deleteStaff(staffId: staff.id);
      },
    );
  }

  Future<void> deleteStaff({
    required String staffId,
  }) async {
    try {
      showLoadingOverlay();
      final response = await switch (procedureType) {
        ProcedureType.procedure600 => _repository.deleteD02Tk1D01(id: staffId),
        ProcedureType.procedure607 ||
        ProcedureType.procedure608 ||
        ProcedureType.procedure610 ||
        ProcedureType.procedure612 ||
        ProcedureType.procedure613 =>
          _repository.deleteTk1D01(id: staffId),
        ProcedureType.procedure630a => _repository630.delete630a(id: staffId),
        ProcedureType.procedure630b => _repository630.delete630b(id: staffId),
      };

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.staffList_deleteStaffSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        _getStaffList();
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> createStaff() async {
    final path = switch (procedureType) {
      ProcedureType.procedure600 => AppRoutesCl.declareInfo.path,
      ProcedureType.procedure607 ||
      ProcedureType.procedure608 ||
      ProcedureType.procedure610 ||
      ProcedureType.procedure612 ||
      ProcedureType.procedure613 =>
        AppRoutesCl.declareInfo607.path,
      ProcedureType.procedure630a => AppRoutesCl.declareInfo630a.path,
      ProcedureType.procedure630b => AppRoutesCl.declareInfo630b.path,
    };

    final result = await Get.toNamed(
      path,
      arguments: DeclareInfoArgument(
        declarationPeriodId: declarationPeriodId,
        staffId: null,
        action: D02ActionEnum.addStaffFromStaffList,
        procedureType: procedureType,
      ),
    );
    if (result != null) {
      _getStaffList();
    }
  }

  Future<void> updateStaff(DeclaredStaffModel staff) async {
    final path = switch (procedureType) {
      ProcedureType.procedure600 => AppRoutesCl.declareInfo.path,
      ProcedureType.procedure607 ||
      ProcedureType.procedure608 ||
      ProcedureType.procedure610 ||
      ProcedureType.procedure612 ||
      ProcedureType.procedure613 =>
        AppRoutesCl.declareInfo607.path,
      ProcedureType.procedure630a => AppRoutesCl.declareInfo630a.path,
      ProcedureType.procedure630b => AppRoutesCl.declareInfo630b.path,
    };

    final result = await Get.toNamed(
      path,
      arguments: DeclareInfoArgument(
        declarationPeriodId: declarationPeriodId,
        staffId: staff.id,
        action: D02ActionEnum.updateStaffFromStaffList,
        procedureType: procedureType,
      ),
    );
    if (result != null) {
      _getStaffList();
    }
  }
}
