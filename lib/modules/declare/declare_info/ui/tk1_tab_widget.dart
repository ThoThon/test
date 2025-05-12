part of 'declare_info_page.dart';

extension Tk1TabWidget on DeclareInfoPage {
  Widget _buildTk1TabBody() {
    return Column(
      children: [
        _buildScanIDButton(
          onTap: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Tk1 Tab Content',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
