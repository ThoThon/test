import 'package:flutter/material.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/shares/package/export_package.dart';
import 'package:image_picker/image_picker.dart';

import '../../declaration_tax_code/models/info_company_response.dart';
import '../models/model_src.dart';

abstract class TransactionControllerICare extends BaseGetxController {
  final taxCodeController = TextEditingController();

  final companyNameController = TextEditingController();

  final unitCodeController = TextEditingController();

  final phoneController = TextEditingController();

  final addressRegisterController = TextEditingController();

  final addressTransactionController = TextEditingController();

  final nameRepresentController = TextEditingController();

  final positionController = TextEditingController();

  final orderItemDropDown = 0.obs;

  final representativeController = TextEditingController();

  final phoneContactController = TextEditingController();

  final emailContactController = TextEditingController();

  final fileIncludeController = TextEditingController();

  final businessIndustryController = TextEditingController();

  final GlobalKey<FormState> formKeyTabGeneral = GlobalKey<FormState>();

  final GlobalKey<FormState> formKeyTabRegister = GlobalKey<FormState>();

  final listImage = <XFile>[].obs;

  final picker = ImagePicker();

  final listProvince = <ProvinceResponse>[].obs;

  final listDistrict = <DistrictResponse>[].obs;

  final listWard = <WardResponse>[].obs;

  final listSocialAgency = <SocialAgencyResponse>[].obs;

  final searchSocialAgencyController = TextEditingController();

  final searchProvinceController = TextEditingController();

  final searchDistrictController = TextEditingController();

  final searchWardController = TextEditingController();

  final Rx<ProvinceResponse?> selectedProvince = Rx<ProvinceResponse?>(null);

  final Rx<DistrictResponse?> selectedDistrict = Rx<DistrictResponse?>(null);

  final Rx<WardResponse?> selectedWard = Rx<WardResponse?>(null);

  final Rx<SocialAgencyResponse?> selectedSocialAgency =
      Rx<SocialAgencyResponse?>(null);

  final currentSelectedProvince = ''.obs;

  final currentSelectedDistrict = ''.obs;

  late InfoCompanyResponse itemInfoCompany;

  final isUnitInfoEdit = false.obs;

  final isAddressInfoEdit = false.obs;

  final isRepresentInfoEdit = false.obs;

  final isDecisionInfoEdit = false.obs;

  final isContentInfoEdit = false.obs;

  late final registerInfoTabRepository = RegisterInfoTabRepositoryICare(this);

  final indexedStackInfoTab = 0.obs;
}
