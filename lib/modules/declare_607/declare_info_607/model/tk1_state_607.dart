import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/model_src.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';

class Tk1State607 {
  /// id tk1ts dùng khi update
  String? id;

  final formKey = GlobalKey<FormState>();

  String? idStaffSelect;

  final autoValidateMode = AutovalidateMode.disabled.obs;

  /// Họ và tên *
  final fullNameTextCtrl = TextEditingController();

  /// Mã số bảo hiểm xã hội
  final bhxhTextCtrl = TextEditingController();

  /// Mã số CCCD *
  final cccdTextCtrl = TextEditingController();

  /// Loại ngày sinh
  final birthType = BirthTypeEnum.defaultValue.obs;

  /// Ngày sinh
  final dateOfBirthTextCtrl = TextEditingController();

  /// Giới tính *
  final gender = Gender.female.obs;

  /// Dân tộc *
  /// Luôn khởi tạo Dân tộc là "Kinh"
  final selectedEthnic = Rxn<EthnicModel>(
    AppData.instance.ethnics.firstWhereOrNull((ethnics) => ethnics.value == 1),
  );

  /// Quốc tịch *
  /// Luôn khởi tạo Quốc tịch là "VIỆT NAM"
  final selectedNationality = Rxn<NationModel>(AppData.instance.nations
      .firstWhereOrNull((nations) => nations.value == "VN"));

  /// Tỉnh khai sinh *
  final provinceOfBirth = Rxn<ProvinceModel>();

  /// Huyện khai sinh *
  final districtOfBirth = Rxn<DistrictModel>();

  /// Xã khai sinh *
  final wardOfBirth = Rxn<WardModel>();

  /// Địa chỉ khai sinh *
  final birthAddressTextCtrl = TextEditingController();

  /// Trùng địa chỉ khai sinh
  final isDuplicateBirthAddress = false.obs;

  /// Tỉnh nơi nhận *
  final provinceReceive = Rxn<ProvinceModel>();

  /// Huyện nơi nhận *
  final districtReceive = Rxn<DistrictModel>();

  /// Xã nơi nhận *
  final wardReceive = Rxn<WardModel>();

  /// Địa chỉ nơi nhận *
  final addressReceiveTextCtrl = TextEditingController();

  /// Tỉnh nơi KCB *
  final provinceKCB = Rxn<ProvinceModel>();

  /// Bệnh viện nơi KCB *
  final hospitalKCB = Rxn<Hospital>();

  /// Nội dung thay đổi *
  final contentChangesTextCtrl = TextEditingController();

  /// Hồ sơ kèm theo
  final attachedProfileTextCtrl = TextEditingController();

  /// Nhận kết quả hồ sơ
  final receiveResult =
      Rx<ReceiveProfileResultEnum>(ReceiveProfileResultEnum.electronic);

  /// Tỉnh nhận hồ sơ giấy
  final provinceReceivePaper = Rxn<ProvinceModel>();

  /// Huyện nhận hồ sơ giấy
  final districtReceivePaper = Rxn<DistrictModel>();

  /// Xã nhận hồ sơ giấy
  final wardReceivePaper = Rxn<WardModel>();

  /// Địa chỉ thường trú
  final addressReceivePaperTextCtrl = TextEditingController();

  /// SĐT liên hệ
  final contactPhoneNumberTextCtrl = TextEditingController();

  /// Người tham gia là chủ hộ
  final isParticipantHeadOfHousehold = false.obs;

  /// Họ và tên chủ hộ
  final headOfHouseholdTextCtrl = TextEditingController();

  /// Số CCCD/ĐDCN của chủ hộ
  final headOfHouseholdCCCDTextCtrl = TextEditingController();

  /// Tỉnh thường trú
  final provinceTT = Rxn<ProvinceModel>();

  /// Huyện thường trú
  final districtTT = Rxn<DistrictModel>();

  /// Xã thường trú
  final wardTT = Rxn<WardModel>();

  /// Địa chỉ thường trú
  final addressTTTextCtrl = TextEditingController();

  /// Danh sách thành viên trong gia đình
  final familyMembers = <FamilyMember>[].obs;

  /// Sinh dữ liệu D01-TS
  final isGenerateD01Data = false.obs;

  void mapFromTk1Detail(DeclareInfoDetailResponse607 detail) {
    final tk1Ts = detail.tk1Ts;
    final members = detail.familyMembers;

    id = tk1Ts.id;

    if (tk1Ts.hoTen != null) {
      fullNameTextCtrl.text = tk1Ts.hoTen!.trim();
    }

    if (tk1Ts.maSoBhxh != null) {
      bhxhTextCtrl.text = tk1Ts.maSoBhxh!.trim();
    }

    if (tk1Ts.cmnd != null) {
      cccdTextCtrl.text = tk1Ts.cmnd!.trim();
    }

    birthType.value = tk1Ts.chiCoNamSinh;

    if (tk1Ts.ngaySinh != null) {
      dateOfBirthTextCtrl.text =
          convertDateToStringSafe(tk1Ts.ngaySinh, birthType.value.pattern) ??
              '';
    }

    if (tk1Ts.gioiTinh != null) {
      gender.value = tk1Ts.gioiTinh ?? Gender.defaultValue;
    }

    if (tk1Ts.danToc != null) {
      selectedEthnic.value = tk1Ts.danToc;
    }

    if (tk1Ts.quocTich != null) {
      selectedNationality.value = tk1Ts.quocTich;
    }

    if (tk1Ts.khaiSinhTinh != null) {
      provinceOfBirth.value = tk1Ts.khaiSinhTinh;
    }

    if (tk1Ts.khaiSinhHuyen != null) {
      districtOfBirth.value = tk1Ts.khaiSinhHuyen;
    }

    if (tk1Ts.khaiSinhXa != null) {
      wardOfBirth.value = tk1Ts.khaiSinhXa;
    }

    if (tk1Ts.diaChiKhaiSinh != null) {
      birthAddressTextCtrl.text = tk1Ts.diaChiKhaiSinh!.trim();
    }

    isDuplicateBirthAddress.value = tk1Ts.trungDiaChiKhaiSinh;

    if (tk1Ts.noiNhanTinh != null) {
      provinceReceive.value = tk1Ts.noiNhanTinh;
    }

    if (tk1Ts.noiNhanHuyen != null) {
      districtReceive.value = tk1Ts.noiNhanHuyen;
    }

    if (tk1Ts.noiNhanXa != null) {
      wardReceive.value = tk1Ts.noiNhanXa;
    }

    if (tk1Ts.noiNhanDiaChiChiTiet != null) {
      addressReceiveTextCtrl.text = tk1Ts.noiNhanDiaChiChiTiet!.trim();
    }

    if (tk1Ts.benhVienTinh != null) {
      provinceKCB.value = tk1Ts.benhVienTinh;
    }

    if (tk1Ts.benhVien != null) {
      hospitalKCB.value = tk1Ts.benhVien;
    }

    if (tk1Ts.dienThoaiLienHe != null) {
      contactPhoneNumberTextCtrl.text = tk1Ts.dienThoaiLienHe!.trim();
    }

    if (tk1Ts.noiDungThayDoi != null) {
      contentChangesTextCtrl.text = tk1Ts.noiDungThayDoi!.trim();
    }

    if (tk1Ts.hoSoKemTheo != null) {
      attachedProfileTextCtrl.text = tk1Ts.hoSoKemTheo!.trim();
    }

    receiveResult.value = tk1Ts.dangKyNhanKetQua;

    if (tk1Ts.nhanBanGiayTinh != null) {
      provinceReceivePaper.value = tk1Ts.nhanBanGiayTinh;
    }

    if (tk1Ts.nhanBanGiayHuyen != null) {
      districtReceivePaper.value = tk1Ts.nhanBanGiayHuyen;
    }

    if (tk1Ts.nhanBanGiayXa != null) {
      wardReceivePaper.value = tk1Ts.nhanBanGiayXa;
    }

    if (tk1Ts.diaChiNhanBanGiay != null) {
      addressReceivePaperTextCtrl.text = tk1Ts.diaChiNhanBanGiay!.trim();
    }

    isParticipantHeadOfHousehold.value = tk1Ts.laChuHo;

    if (tk1Ts.hoTenChuHo != null) {
      headOfHouseholdTextCtrl.text = tk1Ts.hoTenChuHo!.trim();
    }

    if (tk1Ts.chuHoSoCccd != null) {
      headOfHouseholdCCCDTextCtrl.text = tk1Ts.chuHoSoCccd!.trim();
    }

    if (tk1Ts.chuHoThuongTruTinh != null) {
      provinceTT.value = tk1Ts.chuHoThuongTruTinh;
    }

    if (tk1Ts.chuHoThuongTruHuyen != null) {
      districtTT.value = tk1Ts.chuHoThuongTruHuyen;
    }

    if (tk1Ts.chuHoThuongTruXa != null) {
      wardTT.value = tk1Ts.chuHoThuongTruXa;
    }

    if (tk1Ts.diaChiThuongTruChuHo != null) {
      addressTTTextCtrl.text = tk1Ts.diaChiThuongTruChuHo!.trim();
    }

    isGenerateD01Data.value = tk1Ts.xuatD01;

    if (members.isNotEmpty) {
      familyMembers.value =
          members.map((e) => FamilyMember.fromResponse(e)).toList();
    }
  }

  void mapFromStaffDetail(StaffDetailResponse staff) {
    // Với logic chọn nhân viên thì sẽ ghi đè dữ liệu hiện tại
    idStaffSelect = staff.id ?? '';

    fullNameTextCtrl.text = staff.hoTen?.trim() ?? '';

    bhxhTextCtrl.text = staff.maSoBHXH?.trim() ?? '';

    cccdTextCtrl.text = staff.soCCCD?.trim() ?? '';

    dateOfBirthTextCtrl.text =
        convertDateToStringSafe(staff.ngaySinh, PATTERN_1) ?? '';

    gender.value = staff.gioiTinh ?? Gender.female;

    selectedEthnic.value = staff.danToc;

    selectedNationality.value = staff.quocTich;

    provinceOfBirth.value = staff.khaiSinhTinh;

    districtOfBirth.value = staff.khaiSinhHuyen;

    wardOfBirth.value = staff.khaiSinhXa;

    birthAddressTextCtrl.text = staff.diaChiKhaiSinh?.trim() ?? '';

    provinceReceive.value = staff.noiNhanTinh;

    districtReceive.value = staff.noiNhanHuyen;

    wardReceive.value = staff.noiNhanXa;

    addressReceiveTextCtrl.text = staff.diaChiNoiNhan?.trim() ?? '';

    provinceKCB.value = staff.benhVienTinh;

    hospitalKCB.value = staff.benhVien;

    contactPhoneNumberTextCtrl.text = staff.dienThoaiLienHe?.trim() ?? '';

    headOfHouseholdTextCtrl.text = staff.hoTenChuHo?.trim() ?? '';

    headOfHouseholdCCCDTextCtrl.text = staff.chuHoSoCCCD?.trim() ?? '';

    provinceTT.value = staff.chuHoThuongTruTinh;

    districtTT.value = staff.chuHoThuongTruHuyen;

    wardTT.value = staff.chuHoThuongTruXa;

    addressTTTextCtrl.text = staff.diaChiThuongTruChuHo?.trim() ?? '';

    final members = staff.danhSachThanhViens;

    familyMembers.value =
        members.map((e) => FamilyMember.fromStaff(e)).toList();
  }

  void dispose() {
    fullNameTextCtrl.dispose();
    bhxhTextCtrl.dispose();
    cccdTextCtrl.dispose();
    dateOfBirthTextCtrl.dispose();
    birthAddressTextCtrl.dispose();
    addressReceiveTextCtrl.dispose();
    contentChangesTextCtrl.dispose();
    attachedProfileTextCtrl.dispose();
    addressReceivePaperTextCtrl.dispose();
    contactPhoneNumberTextCtrl.dispose();
    headOfHouseholdTextCtrl.dispose();
    headOfHouseholdCCCDTextCtrl.dispose();
    addressTTTextCtrl.dispose();
  }
}
