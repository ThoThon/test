import 'package:v_bhxh/clean/core/data/model/account_info_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/account_info.dart';
import 'package:v_bhxh/shares/mapper/base/base_data_mapper.dart';

class AccountInfoDataMapper
    extends BaseDataMapper<AccountInfoData, AccountInfo> {
  @override
  AccountInfo mapToEntity(AccountInfoData? data) {
    return AccountInfo(
      toChucId: data?.toChucId ?? '',
      tenToChuc: data?.tenToChuc ?? '',
      taxCode: data?.taxCode ?? '',
      maDonVi: data?.maDonVi ?? '',
      maNganSach: data?.maNganSach ?? '',
      diaChiDk: data?.diaChiDk ?? '',
      diaChi: data?.diaChi ?? '',
      maCoQuanQuanLy: data?.maCoQuanQuanLy ?? '',
      tenCoQuanQuanLy: data?.tenCoQuanQuanLy ?? '',
      dienThoai: data?.dienThoai ?? '',
      mailLienLac: data?.mailLienLac ?? '',
      tenNguoiKy: data?.tenNguoiKy ?? '',
      telReceiver: data?.telReceiver ?? '',
      serviceName: data?.serviceName ?? '',
      serviceStartDate: data?.serviceStartDate ?? '',
      serviceExpiredDate: data?.serviceExpiredDate ?? '',
      bankAccount: data?.bankAccount ?? '',
      jobTitle: data?.jobTitle ?? '',
      loaiDoiTuong: data?.loaiDoiTuong ?? '',
      ptNhanKq: data?.ptNhanKq ?? '',
      packageInfo: data?.packageInfo ?? '',
      tenNguoiKeKhai: data?.tenNguoiKeKhai ?? '',
      luongCoSo: data?.luongCoSo ?? 0,
      phuongThucDong: data?.phuongThucDong ?? 1,
      maVung: data?.maVung ?? 0,
    );
  }
}
