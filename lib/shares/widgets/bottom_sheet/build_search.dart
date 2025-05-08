import 'package:tiengviet/tiengviet.dart';

import '../../../modules/src.dart';

class BottomSheetSearch<T> extends StatelessWidget {
  BottomSheetSearch({
    super.key,
    required this.listFilter,
    required this.display,
    required this.title,
    required this.itemSelect,
    required this.onAccept,
  }) {
    listResult.addAll(listFilter);
  }

  final List<T> listFilter;
  final String title;
  final String Function(T) display;
  final Function(T?) onAccept;

  final TextEditingController textEditingController = TextEditingController();
  final Rx<T?> itemSelect;
  final RxList<T> listResult = RxList<T>([]);

  @override
  Widget build(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: title,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                buildSearch(
                  hintSearch: LocaleKeys.transaction_inputSocialAgency.tr,
                  textEditingController: textEditingController,
                  function: onChanged,
                  isClear: true.obs,
                  borderColor: AppColors.dsGray3,
                  autofocus: false,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      itemCount: listResult.length,
                      itemBuilder: (context, index) {
                        final item = listResult[index];
                        return _buildItem(item);
                      },
                      separatorBuilder: (context, index) =>
                          UtilWidget.buildDividerDefault(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BaseButton(
            text: LocaleKeys.certificate_confirm,
            onPressed: () {
              onAccept(itemSelect.value);

              Get.back();
            },
            padding: EdgeInsets.zero,
          ),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  Widget buildSearch({
    required TextEditingController textEditingController,
    String? hintSearch,
    required Function function,
    required RxBool isClear,
    Color? hintColor,
    Color? borderColor,
    bool? autofocus,
    Color? backgroundColor,
    double? padding,
  }) {
    hintSearch ??= LocaleKeys.transaction_search.tr;
    isClear.value = textEditingController.text.isNotEmpty;
    return UtilWidget.buildTextInput(
      height: AppDimens.sizeDialogNotiIcon,
      controller: textEditingController,
      hintText: hintSearch,
      textColor: AppColors.colorBlack,
      hintColor: hintColor ?? AppColors.dsGray2,
      borderColor: borderColor ?? AppColors.colorWhite,
      autofocus: autofocus,
      fillColor: backgroundColor ?? AppColors.colorWhite,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      onChanged: (v) {
        function();
        isClear.value = textEditingController.text.isNotEmpty;
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.mainColors,
        size: AppDimens.sizeIconMedium,
      ),
      suffixIcon: Obx(() => Visibility(
            visible: isClear.value,
            child: IconButton(
              onPressed: () {
                textEditingController.clear();
                isClear.value = false;
                function();
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.mainColors,
              ),
            ).paddingOnly(bottom: AppDimens.paddingSmall),
          )),
    ).paddingSymmetric(vertical: padding ?? AppDimens.paddingSmall);
  }

  Widget _buildItem(T item) {
    return Obx(
      () {
        final isSelected = itemSelect.value == item;

        return InkWell(
          onTap: () {
            itemSelect.value = item;
          },
          child: Row(
            children: [
              TextUtils(
                text: display(item),
                availableStyle: StyleEnum.bodyRegular,
              ).paddingSymmetric(
                vertical: AppDimens.paddingSmall,
              ),
              if (isSelected) ...[
                Spacer(),
                Icon(
                  Icons.check_outlined,
                  color: AppColors.primaryColor,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void onChanged() {
    final query =
        TiengViet.parse(textEditingController.text.trim().toLowerCase());
    if (query.isEmpty) {
      listResult.clear();
      listResult.addAll(listFilter);
    } else {
      final filteredList = listFilter
          .where(
            (value) => TiengViet.parse(display(value).trim().toLowerCase())
                .contains(query),
          )
          .toList();
      listResult.clear();
      listResult.addAll(filteredList);
    }
  }
}
