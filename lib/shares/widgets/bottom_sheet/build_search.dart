import 'package:tiengviet/tiengviet.dart';

import '../../../modules/src.dart';

class BottomSheetSearch<T> extends StatefulWidget {
  const BottomSheetSearch({
    super.key,
    required this.listFilter,
    required this.display,
    required this.title,
    this.hintText,
    this.selectedItem,
    required this.onAccept,
    this.maxLength,
    this.height,
  });

  final List<T> listFilter;
  final String title;
  final String? hintText;
  final String Function(T) display;
  final Function(T?) onAccept;
  final int? maxLength;
  final double? height;
  final T? selectedItem;

  @override
  State<BottomSheetSearch<T>> createState() => _BottomSheetSearchState<T>();
}

class _BottomSheetSearchState<T> extends State<BottomSheetSearch<T>> {
  final textEditingController = TextEditingController();

  late final itemSelect = Rxn<T>(widget.selectedItem);
  late final listResult = widget.listFilter.obs;

  @override
  Widget build(BuildContext context) {
    return UtilWidget.baseBottomSheet(
      title: widget.title,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                buildSearch(
                  maxLength: widget.maxLength,
                  height: widget.height,
                  hintSearch: widget.hintText,
                  textEditingController: textEditingController,
                  function: onChanged,
                  isClear: true.obs,
                  borderColor: AppColors.thumbColorSwitch,
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
          sdsSBHeight20,
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.paddingVerySmall,
        vertical: AppDimens.defaultPadding,
      ),
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
    int? maxLength,
    double? height,
  }) {
    hintSearch ??= LocaleKeys.unitInfo_search.tr;
    isClear.value = textEditingController.text.isNotEmpty;
    return UtilWidget.buildTextInput(
      inputFormatters: [
        RegexpEmojiUtil.allowCommonCharacters,
      ],
      maxLength: maxLength,
      height: height,
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
      prefixIcon: SizedBox(
        height: AppDimens.sizeIconDefault,
        width: AppDimens.sizeIconDefault,
        child: Center(
          child: SDSImageSvg(
            Assets.ASSETS_ICONS_IC_SEARCH_SVG,
            color: AppColors.thumbColorSwitch,
          ),
        ),
      ),
      suffixIcon: Obx(
        () => Visibility(
            visible: isClear.value,
            child: IconButton(
              onPressed: () {
                textEditingController.clear();
                isClear.value = false;
                function();
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.primaryColor,
              ),
            )),
      ),
    ).paddingSymmetric(vertical: padding ?? AppDimens.paddingSmall);
  }

  Widget _buildItem(T item) {
    return Obx(
      () {
        final isSelected = itemSelect.value == item;

        return InkWell(
          onTap: () {
            itemSelect.value = item;
            Get.back();
            widget.onAccept(itemSelect.value);
          },
          child: Row(
            children: [
              Expanded(
                child: SDSBuildText(
                  widget.display(item),
                ).paddingSymmetric(
                  vertical: AppDimens.paddingSmall,
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_outlined,
                  color: AppColors.primaryColor,
                ),
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
      listResult.addAll(widget.listFilter);
    } else {
      final filteredList = widget.listFilter
          .where(
            (value) =>
                TiengViet.parse(widget.display(value).trim().toLowerCase())
                    .contains(query),
          )
          .toList();
      listResult.clear();
      listResult.addAll(filteredList);
    }
  }
}
