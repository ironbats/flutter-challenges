import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:softskills/service/listSkills.dart';

import 'cards/cards.dart';

void main() => runApp(SoftSkillApp());

class SoftSkillApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SkillsList(),
      theme: ThemeData.dark(),
    );
  }
}

final TextEditingController campo1 = new TextEditingController();
final TextEditingController campo2 = new TextEditingController();
final TextEditingController campo3 = new TextEditingController();
final TextEditingController campo4 = new TextEditingController();

// ignore: must_be_immutable
class SkillsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AtualizaSoftSkillsState();
  }
}

class AtualizaSoftSkillsState extends State<SkillsList> {
  final List<SearchResult> softSkillsList = List();
  Future<List<SearchResult>> future;

  @override
  void initState() {
    super.initState();
    future = callApiSoftSkills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Soft Skills List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<SearchResult>>(
            future: future,
            builder: (context, index) {
              if (index.data == null) {
                return CircularProgressIndicator();
              }
              return SoftSkillView(index.data);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            cleanFields();
            final Future<SoftSkills> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListOfSoftSkills();
            }));

            future.then((softskill) {
              if (softskill != null) {
                debugPrint(softskill.toString());
                // softSkillsList2.add(softskill);
              }
            });
          },
        ));
  }
}

class ListOfSoftSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Soft Skills'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                // working only with WidgetStateful
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: campo1,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                    labelText: 'Nome', hintText: 'Joao da Silva'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: campo2,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                    labelText: 'Cargo', hintText: 'Developer? SM ?'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: campo3,
                style: TextStyle(fontSize: 14.0),
                decoration:
                    InputDecoration(labelText: 'Projeto', hintText: 'Keyrus'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: campo4,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                    labelText: 'Skills Tecnicos',
                    hintText: 'Java,Flutter,Scrum,Go Lang,Android,React ?'),
                keyboardType: TextInputType.text,
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () => createSoftSkills(context),
              )
            ],
          ),
        ));
  }

  void createSoftSkills(BuildContext context) {
    debugPrint("Printou !");
    String value1 = campo1.text;
    String value2 = campo2.text;
    String value3 = campo3.text;
    String value4 = campo4.text;

    SoftSkills soft = SoftSkills(value1, value2, value3, value4);
    Navigator.pop(context, soft);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SoftSkillApp();
    }));
  }
}

class SoftSkills {
  final String nome;
  final String cargo;
  final String projeto;
  final String softskills;

  SoftSkills(this.nome, this.cargo, this.projeto, this.softskills);

  String getNome() {
    return this.nome;
  }

  String getSoftSkills() {
    return this.softskills;
  }

  String getCargo() {
    return this.cargo;
  }

  String getProjeto() {
    return this.projeto;
  }

  @override
  String toString() {
    return "Nome [" +
        nome +
        "]" +
        " Cargo [" +
        cargo +
        "]" +
        " Projeto [" +
        projeto +
        "]" +
        " SoftSkills [" +
        softskills +
        "]";
  }
}

void cleanFields() {
  campo1.text = '';
  campo2.text = '';
  campo3.text = '';
  campo4.text = '';
}
