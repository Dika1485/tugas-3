import 'dart:async';
import 'package:tugas_3/sidemenu.dart';
import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List<Map<String, String>> dataMahasiswa = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    dataMahasiswa = [
      {
        'name': "Dika",
        'major': "Informatics",
        'address': "Cilacap",
        'date of birth': "March 13th, 2004",
      },
      {
        'name': "Yizhuo",
        'major': "Cybersecurity",
        'address': "Harbin",
        'date of birth': "October 23th, 2002",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data of Students'),
        ),
        drawer: const SideMenu(),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: dataMahasiswa.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataMahasiswa[index]['name']!),
                  subtitle: Text(dataMahasiswa[index]['major']!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title:
                                        Text('${dataMahasiswa[index]['name']}'),
                                    content: DataTable(
                                      columns: [
                                        DataColumn(label: Text('Field')),
                                        DataColumn(label: Text('Value')),
                                      ],
                                      rows: [
                                        DataRow(cells: [
                                          DataCell(Text('Major',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                          DataCell(Text(
                                              dataMahasiswa[index]['major']!)),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(Text('Address',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                          DataCell(Text(dataMahasiswa[index]
                                              ['address']!)),
                                        ]),
                                        DataRow(cells: [
                                          DataCell(Text('Date of Birth',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                          DataCell(Text(dataMahasiswa[index]
                                              ['date of birth']!)),
                                        ]),
                                      ],
                                    )
                                    // actions: [
                                    //   TextButton(
                                    //     child: const Text('OK'),
                                    //     onPressed: () {
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const HomePage(),
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    //   ],
                                    );
                              });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]));
  }
}
