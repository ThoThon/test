class ProcessDocumentModel {
  ProcessDocumentModel({
    required this.quaTrinhTiepNhan,
    required this.quaTrinhXuLy,
  });

  final QuaTrinhTiepNhan? quaTrinhTiepNhan;
  final QuaTrinhXuLy? quaTrinhXuLy;

  factory ProcessDocumentModel.fromJson(Map<String, dynamic> json) {
    return ProcessDocumentModel(
      quaTrinhTiepNhan: json["quaTrinhTiepNhan"] == null
          ? null
          : QuaTrinhTiepNhan.fromJson(json["quaTrinhTiepNhan"]),
      quaTrinhXuLy: json["quaTrinhXuLy"] == null
          ? null
          : QuaTrinhXuLy.fromJson(json["quaTrinhXuLy"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "quaTrinhTiepNhan": quaTrinhTiepNhan?.toJson(),
        "quaTrinhXuLy": quaTrinhXuLy?.toJson(),
      };
}

class QuaTrinhTiepNhan {
  QuaTrinhTiepNhan({
    required this.id,
    required this.amndState,
    required this.amndDate,
    required this.amndOfficer,
    required this.amndPrev,
    required this.amndType,
    required this.idCongTy,
    required this.tenToChuc,
    required this.tenChuTheCts,
    required this.tenToChucCks,
    required this.soSerial,
    required this.thoiHanTuNgay,
    required this.thoiHanDenNgay,
    required this.email,
    required this.soDienThoai,
    required this.ngayDangKy,
    required this.dangHoatDong,
    required this.lyDoNgung,
    required this.ngayNgungDichVu,
    required this.maLoi,
    required this.tenLoi,
    required this.duongDanFileNop,
    required this.duongDanFileKetQuaGd,
    required this.daKy,
    required this.daGui,
    required this.thoiGianGuiBhxh,
    required this.soLanGui,
    required this.loaiFile,
    required this.emailNkk,
    required this.diaChiServerFileNop,
    required this.thuMucGocLuuFile,
    required this.thuMucFileNop,
    required this.tenFileHoSo,
    required this.maDonVi,
    required this.maSoThue,
    required this.maCoQuanQl,
    required this.addInfo1,
    required this.addInfo2,
    required this.addInfo3,
    required this.addInfo4,
    required this.addInfo5,
    required this.loaiGiaoDich,
    required this.soCmnd,
    required this.ngayCapCmnd,
    required this.noiCapCmnd,
    required this.nguoiGiaoDich,
    required this.regHnId,
    required this.inProcess,
    required this.serverFileId,
    required this.messid,
  });

  final String id;
  final String amndState;
  final String amndDate;
  final String amndOfficer;
  final String amndPrev;
  final int amndType;
  final String idCongTy;
  final String tenToChuc;
  final String tenChuTheCts;
  final String tenToChucCks;
  final String soSerial;
  final String thoiHanTuNgay;
  final String thoiHanDenNgay;
  final String email;
  final String soDienThoai;
  final String ngayDangKy;
  final bool dangHoatDong;
  final String lyDoNgung;
  final String ngayNgungDichVu;
  final String maLoi;
  final String tenLoi;
  final String duongDanFileNop;
  final String duongDanFileKetQuaGd;
  final String daKy;
  final String daGui;
  final String thoiGianGuiBhxh;
  final String soLanGui;
  final String loaiFile;
  final String emailNkk;
  final String diaChiServerFileNop;
  final String thuMucGocLuuFile;
  final String thuMucFileNop;
  final String tenFileHoSo;
  final String maDonVi;
  final String maSoThue;
  final String maCoQuanQl;
  final String addInfo1;
  final String addInfo2;
  final String addInfo3;
  final String addInfo4;
  final String addInfo5;
  final int loaiGiaoDich;
  final String soCmnd;
  final String ngayCapCmnd;
  final String noiCapCmnd;
  final String nguoiGiaoDich;
  final String regHnId;
  final int inProcess;
  final int serverFileId;
  final String messid;

  factory QuaTrinhTiepNhan.fromJson(Map<String, dynamic> json) {
    return QuaTrinhTiepNhan(
      id: json["id"] ?? "",
      amndState: json["amndState"] ?? "",
      amndDate: json["amndDate"] ?? "",
      amndOfficer: json["amndOfficer"] ?? "",
      amndPrev: json["amndPrev"] ?? "",
      amndType: json["amndType"] ?? 0,
      idCongTy: json["idCongTy"] ?? "",
      tenToChuc: json["tenToChuc"] ?? "",
      tenChuTheCts: json["tenChuTheCts"] ?? "",
      tenToChucCks: json["tenToChucCks"] ?? "",
      soSerial: json["soSerial"] ?? "",
      thoiHanTuNgay: json["thoiHanTuNgay"] ?? "",
      thoiHanDenNgay: json["thoiHanDenNgay"] ?? "",
      email: json["email"] ?? "",
      soDienThoai: json["soDienThoai"] ?? "",
      ngayDangKy: json["ngayDangKy"] ?? "",
      dangHoatDong: json["dangHoatDong"] ?? false,
      lyDoNgung: json["lyDoNgung"] ?? "",
      ngayNgungDichVu: json["ngayNgungDichVu"] ?? "",
      maLoi: json["maLoi"] ?? "",
      tenLoi: json["tenLoi"] ?? "",
      duongDanFileNop: json["duongDanFileNop"] ?? "",
      duongDanFileKetQuaGd: json["duongDanFileKetQuaGd"] ?? "",
      daKy: json["daKy"] ?? "",
      daGui: json["daGui"] ?? "",
      thoiGianGuiBhxh: json["thoiGianGuiBhxh"] ?? "",
      soLanGui: json["soLanGui"] ?? "",
      loaiFile: json["loaiFile"] ?? "",
      emailNkk: json["emailNkk"] ?? "",
      diaChiServerFileNop: json["diaChiServerFileNop"] ?? "",
      thuMucGocLuuFile: json["thuMucGocLuuFile"] ?? "",
      thuMucFileNop: json["thuMucFileNop"] ?? "",
      tenFileHoSo: json["tenFileHoSo"] ?? "",
      maDonVi: json["maDonVi"] ?? "",
      maSoThue: json["maSoThue"] ?? "",
      maCoQuanQl: json["maCoQuanQl"] ?? "",
      addInfo1: json["addInfo1"] ?? "",
      addInfo2: json["addInfo2"] ?? "",
      addInfo3: json["addInfo3"] ?? "",
      addInfo4: json["addInfo4"] ?? "",
      addInfo5: json["addInfo5"] ?? "",
      loaiGiaoDich: json["loaiGiaoDich"] ?? 0,
      soCmnd: json["soCmnd"] ?? "",
      ngayCapCmnd: json["ngayCapCmnd"] ?? "",
      noiCapCmnd: json["noiCapCmnd"] ?? "",
      nguoiGiaoDich: json["nguoiGiaoDich"] ?? "",
      regHnId: json["regHnId"] ?? "",
      inProcess: json["inProcess"] ?? 0,
      serverFileId: json["serverFileId"] ?? 0,
      messid: json["messid"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "amndState": amndState,
        "amndDate": amndDate,
        "amndOfficer": amndOfficer,
        "amndPrev": amndPrev,
        "amndType": amndType,
        "idCongTy": idCongTy,
        "tenToChuc": tenToChuc,
        "tenChuTheCts": tenChuTheCts,
        "tenToChucCks": tenToChucCks,
        "soSerial": soSerial,
        "thoiHanTuNgay": thoiHanTuNgay,
        "thoiHanDenNgay": thoiHanDenNgay,
        "email": email,
        "soDienThoai": soDienThoai,
        "ngayDangKy": ngayDangKy,
        "dangHoatDong": dangHoatDong,
        "lyDoNgung": lyDoNgung,
        "ngayNgungDichVu": ngayNgungDichVu,
        "maLoi": maLoi,
        "tenLoi": tenLoi,
        "duongDanFileNop": duongDanFileNop,
        "duongDanFileKetQuaGd": duongDanFileKetQuaGd,
        "daKy": daKy,
        "daGui": daGui,
        "thoiGianGuiBhxh": thoiGianGuiBhxh,
        "soLanGui": soLanGui,
        "loaiFile": loaiFile,
        "emailNkk": emailNkk,
        "diaChiServerFileNop": diaChiServerFileNop,
        "thuMucGocLuuFile": thuMucGocLuuFile,
        "thuMucFileNop": thuMucFileNop,
        "tenFileHoSo": tenFileHoSo,
        "maDonVi": maDonVi,
        "maSoThue": maSoThue,
        "maCoQuanQl": maCoQuanQl,
        "addInfo1": addInfo1,
        "addInfo2": addInfo2,
        "addInfo3": addInfo3,
        "addInfo4": addInfo4,
        "addInfo5": addInfo5,
        "loaiGiaoDich": loaiGiaoDich,
        "soCmnd": soCmnd,
        "ngayCapCmnd": ngayCapCmnd,
        "noiCapCmnd": noiCapCmnd,
        "nguoiGiaoDich": nguoiGiaoDich,
        "regHnId": regHnId,
        "inProcess": inProcess,
        "serverFileId": serverFileId,
        "messid": messid,
      };
}

class QuaTrinhXuLy {
  QuaTrinhXuLy({
    required this.buoc1,
    required this.buoc2,
    required this.buoc3,
    required this.buoc4,
  });

  final Buoc? buoc1;
  final Buoc? buoc2;
  final Buoc? buoc3;
  final Buoc? buoc4;

  factory QuaTrinhXuLy.fromJson(Map<String, dynamic> json) {
    return QuaTrinhXuLy(
      buoc1: json["buoc1"] == null ? null : Buoc.fromJson(json["buoc1"]),
      buoc2: json["buoc2"] == null ? null : Buoc.fromJson(json["buoc2"]),
      buoc3: json["buoc3"] == null ? null : Buoc.fromJson(json["buoc3"]),
      buoc4: json["buoc4"] == null ? null : Buoc.fromJson(json["buoc4"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "buoc1": buoc1?.toJson(),
        "buoc2": buoc2?.toJson(),
        "buoc3": buoc3?.toJson(),
        "buoc4": buoc4?.toJson(),
      };
}

class Buoc {
  Buoc({
    required this.ngayKetQua,
    required this.maKetQua,
    required this.moTaKetQua,
  });

  final String ngayKetQua;
  final String maKetQua;
  final String moTaKetQua;

  factory Buoc.fromJson(Map<String, dynamic> json) {
    return Buoc(
      ngayKetQua: json["ngayKetQua"] ?? "",
      maKetQua: json["maKetQua"] ?? "",
      moTaKetQua: json["moTaKetQua"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "ngayKetQua": ngayKetQua,
        "maKetQua": maKetQua,
        "moTaKetQua": moTaKetQua,
      };
}
