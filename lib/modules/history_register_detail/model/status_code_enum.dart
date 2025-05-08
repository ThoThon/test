class StatusCodeEnum {
  //Thành công gửi hồ sơ vào cổng tiếp nhận hồ sơ BHXH. Vui lòng kiểm tra lại kết quả tiếp nhận hồ sơ.
  static const String sendProfileSuccess = '001';

  //Thành công tiếp nhận hồ sơ BHXH. Thông báo tiếp nhận thành công sẽ được gửi về email.
  static const String receiveProfileSuccess = '002';

  //Gửi mail thành công.
  static const String sendEmailSuccess = '003';

  //Tra cứu thành công.
  static const String lookupSuccess = '004';

  //Hồ sơ hợp lệ.
  static const String profileValid = '006';

  //Hồ sơ đã xử lý xong.
  static const String profileProcessed = '007';

  //Mã kích hoạt đã được gửi về địa chỉ mail đăng ký. Vui lòng gửi lại mã kích hoạt để hoàn tất việc đăng ký dịch vụ.
  static const String activationCodeSent = '100';

  //Hoàn tất thủ tục thành công.
  static const String completeProcedureSuccess = '101';

  //Thay đổi thông tin đơn vị thành công.
  static const String updateUnitInfoSuccess = '102';

  //Ngừng tham gia GDĐT thành công.
  static const String stopGddtSuccess = '103';

  //Kiểm tra tham số đầu vào khi tiếp nhận hồ sơ - Hợp lệ.
  static const String success = '200';

  static List<String> get validCodes => [
        sendProfileSuccess,
        receiveProfileSuccess,
        sendEmailSuccess,
        lookupSuccess,
        profileValid,
        profileProcessed,
        activationCodeSent,
        completeProcedureSuccess,
        updateUnitInfoSuccess,
        stopGddtSuccess,
        success,
      ];
  static bool isValidCode(String maKetQua) => validCodes.contains(maKetQua);
}
