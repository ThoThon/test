import 'dart:io';

import 'package:path/path.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/repository/staff_list_repository.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../base_app/base_app.src.dart';

class StaffListController extends BaseGetxController {
  final declarationPeriodId = Get.arguments as String;

  late final _repository = StaffListRepository(this);

  final imagePath = Rxn<String>();

  final listImage = <String>[].obs;

  final declaredStaffs = const <DeclaredStaffModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getStaffList();
  }

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      imagePath.value = path;
      listImage.add(path);
      upLoadFile();
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      imagePath.value = path;
      listImage.add(path);
      upLoadFile();
    }
  }

  String getImageSize(File imageFile) {
    final int sizeInBytes = imageFile.lengthSync();
    final double sizeInKB = sizeInBytes / 1024;
    if (sizeInKB < 1024) {
      return '${sizeInKB.toStringAsFixed(2)} KB';
    } else {
      final double sizeInMB = sizeInKB / 1024;
      return '${sizeInMB.toStringAsFixed(2)} MB';
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void removeImage(int index) {
    listImage.removeAt(index);
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
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> upLoadFile() async {
    try {
      final response = await _repository.uploadFile(
        request: UploadAttachmentsRequest(
          file: listImage,
          periodId: declarationPeriodId,
        ),
      );
      if (!response.isSuccess) {
        showSnackBar(LocaleKeys.staffList_attachFileErorr.tr);
      }
    } catch (e) {
      logger.d(e);
    } finally {}
  }

  Future<void> saveXml() async {
    try {
      showLoadingOverlay();

      final response = await _repository.saveXml(
        declarationPeriodId: declarationPeriodId,
      );

      if (response.isSuccess && response.result != null) {
        Get.toNamed(
          AppRoutes.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: declarationPeriodId,
            saveXmlResult: response.result!,
          ),
        );
      } else {
        showSnackBar(response.errorMessage);

        Get.toNamed(
          AppRoutes.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: declarationPeriodId,
            saveXmlResult: const SaveXmlResult(),
          ),
        );
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }
}
