import 'package:path/path.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../../clean/shared/model/upload_image_request_data.dart';
import '../../../declaration_list/domain/entity/declaration_list_argument.dart';
import '../../../declaration_period/domain/entity/entity_src.dart';

// Chỉ cho phép up tối đa 5 file ảnh
const maxImageAttachments = 5;

class StaffListController extends BaseGetClController {
  final GetStaffList600UseCase _getStaffList600UseCase;
  final GetStaffList607UseCase _getStaffList607UseCase;
  final GetStaffList630aUseCase _getStaffList630aUseCase;
  final GetStaffList630bUseCase _getStaffList630bUseCase;
  final GetStaffList630cUseCase _getStaffList630cUseCase;
  final UploadAttachImageUseCase _uploadAttachImageUseCase;
  final DeleteAttachImageUseCase _deleteAttachImageUseCase;
  final SaveXmlResult600UseCase _saveXml600UseCase;
  final SaveXmlResult607UseCase _saveXmlResult607UseCase;
  final DeleteStaff600UseCase _deleteStaff600UseCase;
  final DeleteTk01UseCase _deleteTk01UseCase;
  final Delete630aUseCase _delete630aUseCase;
  final Delete630bUseCase _delete630bUseCase;
  final Delete630cUseCase _delete630cUseCase;
  final StaffListArgument argument;

  StaffListController(
    this._getStaffList600UseCase,
    this._getStaffList607UseCase,
    this._getStaffList630aUseCase,
    this._getStaffList630bUseCase,
    this._getStaffList630cUseCase,
    this._uploadAttachImageUseCase,
    this._deleteAttachImageUseCase,
    this._saveXml600UseCase,
    this._saveXmlResult607UseCase,
    this._deleteStaff600UseCase,
    this._deleteTk01UseCase,
    this._delete630aUseCase,
    this._delete630bUseCase,
    this._delete630cUseCase, {
    required this.argument,
  });

  // final argument = Get.arguments as StaffListArgument;

  final declaredStaffs = <DeclaredStaff>[].obs;

  final listAttachImage = <AttachedImage>[].obs;

  final scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    _getStaffList();
  }

  String get declarationPeriodId => argument.declarationPeriodId;
  ProcedureType get procedureType => argument.procedureType;

  /// REF: VBHXHMOB-1
  bool checkMaxImageAttachments() {
    final reachedMax = listAttachImage.length >= maxImageAttachments;
    if (reachedMax) {
      nav.showSnackBar(LocaleKeys.dialog_max5File.tr);
    }
    return reachedMax;
  }

  Future<void> pickImage() async {
    try {
      final path = await ImageUtils.pickImage();
      if (path != null) {
        await upLoadFile(path);
      }
    } catch (e) {
      nav.showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  Future<void> takePhoto() async {
    try {
      final path = await ImageUtils.takePhoto();
      if (path != null) {
        await upLoadFile(path);
      }
    } catch (e) {
      nav.showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void removeImage(int index) {
    listAttachImage.removeAt(index);
  }

  Future<void> _getStaffList({bool showLoading = true}) async {
    return buildState(
      showLoading: showLoading,
      action: () async {
        final response = await switch (procedureType) {
          ProcedureType.procedure600 =>
            _getStaffList600UseCase.execute(declarationPeriodId),
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            _getStaffList607UseCase.execute(declarationPeriodId),
          ProcedureType.procedure630a =>
            _getStaffList630aUseCase.execute(declarationPeriodId),
          ProcedureType.procedure630b =>
            _getStaffList630bUseCase.execute(declarationPeriodId),
          ProcedureType.procedure630c =>
            _getStaffList630cUseCase.execute(declarationPeriodId),
        };
        declaredStaffs.value = response.staffs;
        listAttachImage.value = response.image;
      },
    );
  }

  Future<void> upLoadFile(String imagePath) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await _uploadAttachImageUseCase.execute(
          UploadImageRequestData(
            file: imagePath,
            periodId: declarationPeriodId,
          ),
        );
        listAttachImage.add(response);
        _scrollStaffList();
      },
    );
  }

  // REF: VBHXHMOB-119
  void _scrollStaffList() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(
            scrollController.position.maxScrollExtent,
          );
        }
      },
    );
  }

  Future<void> deleteImage(
    String fileNameFromUrl,
    int index,
  ) async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final fileName = _getFileNameFromUrl(fileNameFromUrl);
        if (fileName == null || fileName.trim().isEmpty) {
          nav.showSnackBar(LocaleKeys.staffList_cannotDeleteImage.tr);
          return;
        }

        await _deleteAttachImageUseCase.execute(
          UploadImageRequestData(
            file: fileName,
            periodId: declarationPeriodId,
          ),
        );
        nav.showSnackBar(
          LocaleKeys.declarationPeriodDetail_deleteImageSuccess.tr,
          type: SnackBarType.success,
        );

        listAttachImage.removeAt(index);
      },
    );
  }

  void onTapButtonContinue() {
    // Thủ tục 630 phải đi qua màn "Thông tin khác" nữa
    if (argument.procedureType == ProcedureType.procedure630a ||
        argument.procedureType == ProcedureType.procedure630b ||
        argument.procedureType == ProcedureType.procedure630c) {
      if (declaredStaffs.isEmpty) {
        nav.showSnackBar(LocaleKeys.declarationPeriod_declaredStaffsIsEmpty.tr);
        return;
      }
      nav.toNamed(AppRoutesCl.otherInfo.path, arguments: argument);
    } else {
      saveXml();
    }
  }

  Future<void> saveXml() async {
    if (declaredStaffs.isEmpty) {
      nav.showSnackBar(LocaleKeys.declarationPeriod_declaredStaffsIsEmpty.tr);
      return;
    }

    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await switch (procedureType) {
          ProcedureType.procedure600 => _saveXml600UseCase.execute(
              declarationPeriodId,
            ),
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            _saveXmlResult607UseCase.execute(
              declarationPeriodId,
            ),
          _ => throw UnimplementedError('Not implemented yet'),
        };

        nav.toNamed(
          AppRoutesCl.declarationList.path,
          arguments: DeclarationListArgument(
            declarationPeriodId: declarationPeriodId,
            saveXmlResult: response,
            procedureType: procedureType,
          ),
        );
      },
    );
  }

  String? _getFileNameFromUrl(String url) {
    return url.split('/').lastOrNull;
  }

  void showDialogDeleteStaff(DeclaredStaff staff) {
    nav.showConfirmDialog(
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
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        await switch (procedureType) {
          ProcedureType.procedure600 => _deleteStaff600UseCase.execute(staffId),
          ProcedureType.procedure607 ||
          ProcedureType.procedure608 ||
          ProcedureType.procedure610 ||
          ProcedureType.procedure612 ||
          ProcedureType.procedure613 =>
            _deleteTk01UseCase.execute(staffId),
          ProcedureType.procedure630a => _delete630aUseCase.execute(staffId),
          ProcedureType.procedure630b => _delete630bUseCase.execute(staffId),
          ProcedureType.procedure630c => _delete630cUseCase.execute(staffId),
        };

        nav.showSnackBar(
          LocaleKeys.staffList_deleteStaffSuccess.tr,
          type: SnackBarType.success,
        );
        _getStaffList();
      },
    );
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
      ProcedureType.procedure630c => AppRoutesCl.declareInfo630c.path,
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

  Future<void> updateStaff(DeclaredStaff staff) async {
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
      ProcedureType.procedure630c => AppRoutesCl.declareInfo630c.path,
    };

    final result = await nav.toNamed(
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
