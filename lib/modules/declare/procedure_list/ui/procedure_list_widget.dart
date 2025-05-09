part of 'procedure_list_page.dart';

extension ProcedureListPageWidget on ProcedureListPage {
  Widget _buildBody() {
    return _buildProcedureList();
  }

  Widget _buildProcedureList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Thủ tục ${index + 1}'),
          onTap: () {
            // Handle tap on the procedure
          },
        );
      },
    );
  }

  Widget _buildProcedureItem() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // SDSBuildText(),
              UtilWidget.sizedBoxWidth8,
              Column(
                children: [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
