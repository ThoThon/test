import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/register_code/clean/data/model/first_time_register_request_data.dart';
import 'package:v_bhxh/modules/register_code/clean/domain/entity/first_time_register_request.dart';

class FirstTimeRegisterRequestDataMapper extends BaseDataMapper<
    FirstTimeRegisterRequestData,
    FirstTimeRegisterRequest> with DataMapperMixin {
  @override
  FirstTimeRegisterRequest mapToEntity(FirstTimeRegisterRequestData? data) {
    return FirstTimeRegisterRequest(
      coQuanBHXHQuanLy: data?.coQuanBHXHQuanLy ?? '',
      coQuanBHXHTinh: data?.coQuanBHXHTinh ?? '',
      credentialID: data?.credentialID ?? '',
      diaChi: data?.diaChi ?? '',
      diaChiHuyen: data?.diaChiHuyen ?? '',
      diaChiTinh: data?.diaChiTinh ?? '',
      diaChiXa: data?.diaChiXa ?? '',
      diaChiDangKyKinhDoanh: data?.diaChiDangKyKinhDoanh ?? '',
      dienThoai: data?.dienThoai ?? '',
      dienThoaiLienHe: data?.dienThoaiLienHe ?? '',
      email: data?.email ?? '',
      hoSoKemTheo: data?.hoSoKemTheo ?? '',
      loaiDoiTuong: data?.loaiDoiTuong ?? '',
      loaiHinhDonVi: data?.loaiHinhDonVi ?? '',
      maSoThue: data?.maSoThue ?? '',
      nganhNgheSX: data?.nganhNgheSX ?? '',
      ngayDangKy: data?.ngayDangKy ?? '',
      ngayLap: data?.ngayLap ?? '',
      nguoiGiaoDich: data?.nguoiGiaoDich ?? '',
      noiCapQuyetDinh: data?.noiCapQuyetDinh ?? '',
      noiDung: data?.noiDung ?? '',
      phuongThucDong: data?.phuongThucDong ?? '',
      phuongThucNhanKetQua: data?.phuongThucNhanKetQua ?? '',
      soQuyetDinh: data?.soQuyetDinh ?? '',
      tenDonVi: data?.tenDonVi ?? '',
      userId: data?.userId ?? '',
      phuongThucNhan: data?.phuongThucNhan ?? '',
      imageFilePath: data?.imageFilePath ?? const [],
    );
  }

  @override
  FirstTimeRegisterRequestData mapToData(FirstTimeRegisterRequest entity) {
    return FirstTimeRegisterRequestData(
      coQuanBHXHQuanLy: entity.coQuanBHXHQuanLy,
      coQuanBHXHTinh: entity.coQuanBHXHTinh,
      credentialID: entity.credentialID,
      diaChi: entity.diaChi,
      diaChiHuyen: entity.diaChiHuyen,
      diaChiTinh: entity.diaChiTinh,
      diaChiXa: entity.diaChiXa,
      diaChiDangKyKinhDoanh: entity.diaChiDangKyKinhDoanh,
      dienThoai: entity.dienThoai,
      dienThoaiLienHe: entity.dienThoaiLienHe,
      email: entity.email,
      hoSoKemTheo: entity.hoSoKemTheo,
      loaiDoiTuong: entity.loaiDoiTuong,
      loaiHinhDonVi: entity.loaiHinhDonVi,
      maSoThue: entity.maSoThue,
      nganhNgheSX: entity.nganhNgheSX,
      ngayDangKy: entity.ngayDangKy,
      ngayLap: entity.ngayLap,
      nguoiGiaoDich: entity.nguoiGiaoDich,
      noiCapQuyetDinh: entity.noiCapQuyetDinh,
      noiDung: entity.noiDung,
      phuongThucDong: entity.phuongThucDong,
      phuongThucNhanKetQua: entity.phuongThucNhanKetQua,
      soQuyetDinh: entity.soQuyetDinh,
      tenDonVi: entity.tenDonVi,
      userId: entity.userId,
      phuongThucNhan: entity.phuongThucNhan,
      imageFilePath: entity.imageFilePath,
    );
  }
}
