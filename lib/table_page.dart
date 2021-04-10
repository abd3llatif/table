import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:table/models/fome.dart';
import 'package:table/scrolling_text.dart';

import 'models/operation.dart';

class TablePage extends StatefulWidget {
  final List<Operation> operations;
  final Forme forme = Forme();

  TablePage(this.operations);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
        centerTitle: true,
      ),
      body: _buildContent(context, this.widget.operations),
    );
  }

  Widget _buildContent(BuildContext context, List<Operation> operations) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: HorizontalDataTable(
              leftHandSideColumnWidth: MediaQuery.of(context).size.width / 3,
              rightHandSideColumnWidth: 600,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: operations.length,
              rowSeparatorWidget: const Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: Colors.lightBlue.withOpacity(0.5),
              rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
              verticalScrollbarStyle: const ScrollbarStyle(
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
              horizontalScrollbarStyle: const ScrollbarStyle(
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height / 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "DETAIL DE PIECES DE RECHANGES EN CAS DE MAINTENANCE CORRECTIVE:"),
        ),
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.lightBlue.withOpacity(0.2)),
          child: TextField(
            maxLines: 4,
            onChanged: (value) {
              widget.forme.details = value;
            },
            decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: "DETAIL..."),
          ),
          ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("REMARQUE:"),
        ),
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.lightBlue.withOpacity(0.2)),
          child: TextField(
            maxLines: 4,
            onChanged: (value) {
              widget.forme.remarques = value;
            },
            decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: "REMARQUE..."),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              widget.forme.operations = widget.operations;
              print('${widget.forme.toJson()}');
            },
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
        )
      ],
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('OPERATION', MediaQuery.of(context).size.width / 3),
      _getTitleItemWidget('CONFORME', 90),
      _getTitleItemWidget('NON CONFORME', 90),
      _getTitleItemWidget('INTERVENTIONS CORRECTIVES REALISEES', 400),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      color: Colors.lightBlue.withOpacity(0.5),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: ScrollingText(
        text: widget.operations[index].name,
      ),
      width: MediaQuery.of(context).size.width / 3,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Center(
            child: Radio(
              value: widget.operations[index].conforme,
              onChanged: (value) {
                setState(() {
                  widget.operations[index].conforme =
                      !widget.operations[index].conforme;
                });
              },
              groupValue: true,
            ),
          ),
          width: 90,
          height: 52,
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Center(
            child: Radio(
              value: widget.operations[index].conforme,
              onChanged: (value) {
                setState(() {
                  widget.operations[index].conforme =
                      !widget.operations[index].conforme;
                });
              },
              groupValue: false,
            ),
          ),
          width: 90,
          height: 52,
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: TextField(
            onChanged: (value) {
              widget.operations[index].intervention = value;
            },
          ),
          width: 400,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
