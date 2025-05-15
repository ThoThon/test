part of 'nfc_information_user_page.dart';

Widget _buildListGuild(NfcInformationUserController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150, // hoặc bất kỳ chiều rộng mong muốn nào
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.dsGray5,
                    borderRadius: BorderRadius.circular(8), // bo góc nếu muốn
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 48, // hoặc bất kỳ kích thước nào bạn muốn
                      color: Colors.black, // đổi màu nếu cần
                    ),
                  ),
                ),
              ),
              sdsSBHeight12,
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_CARD_INFO_SVG,
                'ID: 0123456789',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                'Tên: A',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                'Họ: Nguyễn',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_GENDER_SVG,
                'Giới tính: Nam',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_MAP_SVG,
                'Quê quán: Phú Thọ',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_MAP_SVG,
                'Nơi thường trú: Phú Thọ',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
                'Quốc tịch: Việt Nam',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_NATION_SVG,
                'Dân tộc: Kinh',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_NATIONALITY_SVG,
                'Tôn giáo: Không',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_PERSON_SVG,
                'Đặc điểm nhận dạng: Nốt ruồi mắt trái',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_BIRTHDAY_SVG,
                'Ngày sinh: 01/01/0001',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_START_DAY_SVG,
                'Ngày làm thẻ: 01/01/0001',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_IC_START_DAY_SVG,
                'Ngày hết hạn: 01/01/0001',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                'Họ tên bố: Nguyễn Văn A',
              ),
              _buildTextAndIcon(
                Assets.ASSETS_ICONS_ICON_USER_NAME_CARD_SVG,
                'Họ tên mẹ: Nguyễn Văn A',
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ),
      ),
      BaseButton(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        text: "Tiếp tục",
        onPressed: () {},
      ),
    ],
  );
}

Widget _buildTextAndIcon(
  String assetName,
  String text,
) {
  return Row(
    children: [
      SDSImageSvg(assetName),
      sdsSBWidth4,
      SDSBuildText(
        text,
      ),
      sdsSBHeight8,
    ],
  );
}
