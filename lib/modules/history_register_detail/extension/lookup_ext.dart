import '../../src.dart';

extension LookupExt on HistoryRegisterDetailControllerICare {
  Future<void> searchProcessDocument({
    bool isUpdate = true,
  }) async {
    final res = await historyDetaiRepository.searchProcessDocument(
        key: historyRegisterModel.messId);
    if (res.result != null) {
      final ProcessDocumentModel model = res.result!;
      final QuaTrinhTiepNhan receptionProcess = model.quaTrinhTiepNhan!;
      final QuaTrinhXuLy processing = model.quaTrinhXuLy!;
      quaTrinhXuLy1 = processing;

      historyRegisterModel = historyRegisterModel
        ..thoiGianGui = receptionProcess.amndDate
        ..soHoSo = receptionProcess.addInfo1
        ..kqBuoc1 = processing.buoc1?.moTaKetQua ?? ""
        ..kqBuoc2 = processing.buoc2?.moTaKetQua ?? ""
        ..kqBuoc3 = processing.buoc3?.moTaKetQua ?? ""
        ..kqBuoc4 = processing.buoc4?.moTaKetQua ?? "";

      if (isUpdate) {
        await updateHistoryRigister(
          searchSuccess: res.code == AppConst.statusCodeSuccess,
          maKqBuoc1: processing.buoc1?.maKetQua ?? "",
          maKqBuoc2: processing.buoc2?.maKetQua ?? "",
          maKqBuoc3: processing.buoc3?.maKetQua ?? "",
        );
      }
      update();
    }
  }

  Future<void> updateHistoryRigister({
    required String maKqBuoc1,
    required String maKqBuoc2,
    required String maKqBuoc3,
    required bool searchSuccess,
  }) async {
    await historyDetaiRepository.updateHistoryRigister(
      request: UpdateHistoryRigisterRequest(
        id: historyRegisterModel.id,
        kqBuoc1: historyRegisterModel.kqBuoc1,
        kqBuoc2: historyRegisterModel.kqBuoc2,
        kqBuoc3: historyRegisterModel.kqBuoc3,
        kqBuoc4: historyRegisterModel.kqBuoc4,
        soHoSo: historyRegisterModel.soHoSo,
        tiepNhan: historyRegisterModel.tiepNhan,
        maKqBuoc1: maKqBuoc1,
        maKqBuoc2: maKqBuoc2,
        maKqBuoc3: maKqBuoc3,
      ),
    );

    if (searchSuccess) {
      showSnackBar(
        LocaleKeys.historyRegister_lookupSuccess.tr,
        typeAction: AppConst.actionSuccess,
      );
    }
  }
}
