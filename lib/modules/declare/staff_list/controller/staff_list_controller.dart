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

  final declaredStaffs = const <DeclaredStaffModel>[].obs;

  final listAttachImage = <AttachImageModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    _getStaffList();
  }

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      imagePath.value = path;
      upLoadFile();
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      imagePath.value = path;
      upLoadFile();
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

  Future<void> upLoadFile() async {
    try {
      showLoading();
      final response = await _repository.uploadImage(
        request: UploadImageRequest(
          file: imagePath.value ?? '',
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

  Future<void> deteleImage(String fileNameFromUrl, int index) async {
    try {
      final response = await _repository.deleteImage(
        declarationPeriodId,
        fileNameFromUrl,
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
    }
  }

  Future<void> saveXml() async {
    if (declaredStaffs.isEmpty) {
      showSnackBar('Chưa có nhân viên nào được khai báo');
      return;
    }

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

  String getFileNameFromUrl(String url) {
    return url.split('/').last;
  }
}
