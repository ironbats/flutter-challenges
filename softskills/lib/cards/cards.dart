import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softskills/service/listSkills.dart';

import '../main.dart';

class SoftSkillView extends StatelessWidget {
  final List<SearchResult> softSkills;

  SoftSkillView(this.softSkills);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: determineCrossAxisCount(context),
      padding: const EdgeInsets.all(1.5),
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      childAspectRatio: 1.2,
      children: prepareStatements(softSkills),
    );
  }

  List<Widget> prepareStatements(List<SearchResult> searchResult) {
    List<Widget> listWidgets = [];

    for (SearchResult searchResult in softSkills) {
      listWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text(searchResult.name),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(searchResult.cargo),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(searchResult.project),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(searchResult.skills),
            ),
          )
        ]),
      ));
    }
    return listWidgets;
  }

  int determineCrossAxisCount(BuildContext context) {
    int _crossAxisCount = 1;
    final double screenWidthSize = MediaQuery.of(context).size.width;
    if (screenWidthSize > 820) {
      _crossAxisCount = 4;
    } else if (screenWidthSize > 720) {
      _crossAxisCount = 3;
    } else if (screenWidthSize > 520) {
      _crossAxisCount = 2;
    } else {
      _crossAxisCount = 1;
    }

    return _crossAxisCount;
  }
}
