import 'dart:async';

import 'package:v_bhxh/clean/core/data/model/model_src.dart';
import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/first_time_register_request.dart';
import '../repository/register_code_repository.dart';

class FirstTimeRegisterUseCase
    extends UseCase<FirstTimeRegisterRequest, BaseResponseCl<bool>> {
  final RegisterCodeRepository _registerCodeRepository;

  FirstTimeRegisterUseCase(this._registerCodeRepository);
  @override
  Future<BaseResponseCl<bool>> execute(FirstTimeRegisterRequest input) {
    return _registerCodeRepository.firstTimeRegister(
      request: FirstTimeRegisterRequest(
        coQuanBHXHQuanLy: input.coQuanBHXHQuanLy,
        coQuanBHXHTinh: input.coQuanBHXHTinh,
        credentialID: input.credentialID,
        diaChi: input.diaChi,
        diaChiHuyen: input.diaChiHuyen,
        diaChiTinh: input.diaChiTinh,
        diaChiXa: input.diaChiXa,
        diaChiDangKyKinhDoanh: input.diaChiDangKyKinhDoanh,
        dienThoai: input.dienThoai,
        dienThoaiLienHe: input.dienThoaiLienHe,
        email: input.email,
        hoSoKemTheo: input.hoSoKemTheo,
        loaiDoiTuong: input.loaiDoiTuong,
        loaiHinhDonVi: input.loaiHinhDonVi,
        maSoThue: input.maSoThue,
        nganhNgheSX: input.nganhNgheSX,
        ngayDangKy: input.ngayDangKy,
        ngayLap: input.ngayLap,
        nguoiGiaoDich: input.nguoiGiaoDich,
        noiCapQuyetDinh: input.noiCapQuyetDinh,
        noiDung: input.noiDung,
        phuongThucDong: input.phuongThucDong,
        phuongThucNhanKetQua: input.phuongThucNhanKetQua,
        soQuyetDinh: input.soQuyetDinh,
        tenDonVi: input.tenDonVi,
        userId: input.userId,
        phuongThucNhan: input.phuongThucNhan,
      ),
    );
  }

  @override
  void cancel() {
    _registerCodeRepository.cancelAllRequests();
  }
}
