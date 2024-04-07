import 'package:csrankings_core/model/author.dart';
import 'package:csrankings_core/model/conf.dart';
import 'package:csrankings_core/model/uni.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<String>> data = [];
  List<String> uniqueUni = [];
  List<String> profs = [];
  List<Uni> unis = [];
  List<Uni> newUni = [];
  Map<String, Author> authors = Map<String, Author>();

  bool isAStar = true;
  bool isA = true;
  bool isB = true;
  bool isAI = true;
  bool isSystem = true;
  bool isTheory = true;
  bool isInter = true;

  loadAsset() async {
    data = [];
    uniqueUni = [];
    profs = [];
    unis = [];
    newUni = [];
    authors = Map<String, Author>();
    var myData =
        await rootBundle.loadString("assets/generated-author-info.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    csvTable.forEach(
      (element) {
        List<String> row = [];
        element.forEach((e) {
          row.add(e.toString());
        });
        data.add(row);
      },
    );
    data.forEach((element) {
      if (!uniqueUni.contains(element[1])) {
        uniqueUni.add(element[1]);
      }
      // if (!profs.contains(element[0])) {
      //   profs.add(element[0]);
      // }
      if (authors.containsKey(element[0])) {
        authors[element[0]]!.conf.add(Conf(
            name: element[2],
            area: element[8],
            rank: element[7],
            pub: double.parse(element[3]),
            adj: double.parse(element[4])));
        authors[element[0]]!.adj += double.parse(element[4]);
        authors[element[0]]!.pub += double.parse(element[3]);
      } else {
        authors.putIfAbsent(
          element[0],
          () => Author(
            name: element[0],
            uni: element[1],
            adj: double.parse(element[4]),
            pub: double.parse(element[3]),
            conf: [
              Conf(
                  name: element[2],
                  area: element[8],
                  rank: element[7],
                  pub: double.parse(element[3]),
                  adj: double.parse(element[4]))
            ],
          ),
        );
      }
    });

    uniqueUni.forEach(
      (element) {
        List<Author> a = [];
        double adj = 0;
        authors.forEach((key, value) {
          if (element == value.uni) {
            a.add(value);
            adj += value.adj;
          }
        });
        unis.add(Uni(
          index: unis.length + 1,
          authors: a,
          name: element,
          adj: adj,
        ));
      },
    );

    unis.sort((a, b) => ((b.adj - a.adj) * 100).round());

    var i = 1;
    unis.forEach(
      (element) {
        element.index = i;
        i++;
      },
    );

    setState(() {
      debugPrint('Loaded data');
      debugPrint(unis.length.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await loadAsset();
      newUni = List.from(unis);
    });
  }

  void applyFilters() async {
    await loadAsset();
    newUni = List.from(unis);

    if (!isAStar) {
      debugPrint('Not A*');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.rank != 'A*') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;

      });
    }
    if (!isA) {
      debugPrint('Not A');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.rank != 'A') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }
    if (!isB) {
      debugPrint('Not B');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.rank != 'B') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }
    if (!isAI) {
      debugPrint('Not A*');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.area != 'Artificial Intelligence') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }
    if (!isSystem) {
      debugPrint('Not A*');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.area != 'Systems') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }
    if (!isTheory) {
      debugPrint('Not A*');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.area != 'Theory') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }
    if (!isInter) {
      debugPrint('Not A*');
      newUni.forEach((element) {
        double ad = 0.0;
        double pu = 0.0;
        element.authors.forEach((el) {
          List<Conf> newConf = [];
          double adj = 0.0;
          double pub = 0.0;
          el.conf.forEach((elt) {
            if (elt.area != 'Interdisciplinary Subjects') {
              newConf.add(elt);
              adj += elt.adj;
              pub += elt.pub;
            }
          });
          el.adj = adj;
          el.pub = pub;
          ad += adj;
          pu += pub;
          el.conf = List.from(newConf);
        });
        element.adj = ad;
        
      });
    }

    List<Uni> l = [];
    newUni.forEach((element) {
      if (element.adj > 0) {
        l.add(element);
      }
      List<Author> lst = [];
      element.authors.forEach((el) {
        if (el.adj > 0) {
          lst.add(el);
        }
      });
      element.authors = lst;
      element.authors.sort((a, b) => ((a.adj - b.adj) * 100).round());
    });
    newUni = l;
    newUni.sort((a, b) => ((b.adj - a.adj) * 100).round());

    var i = 1;
    newUni.forEach(
      (element) {
        element.index = i;
        i++;
      },
    );
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Conferences'),
            ),
            drawer: Drawer(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('CORE Rankings: '),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('CORE A*'),
                              Checkbox(
                                value: isAStar,
                                onChanged: (value) {
                                  setState(() {
                                    isAStar = !isAStar;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('CORE A'),
                              Checkbox(
                                value: isA,
                                onChanged: (value) {
                                  setState(() {
                                    isA = !isA;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('CORE B'),
                              Checkbox(
                                value: isB,
                                onChanged: (value) {
                                  setState(() {
                                    isB = !isB;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Research Areas: '),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Artificial Intelligence'),
                              Checkbox(
                                value: isAI,
                                onChanged: (value) {
                                  setState(() {
                                    isAI = !isAI;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Systems'),
                              Checkbox(
                                value: isSystem,
                                onChanged: (value) {
                                  setState(() {
                                    isSystem = !isSystem;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Theory'),
                              Checkbox(
                                value: isTheory,
                                onChanged: (value) {
                                  setState(() {
                                    isTheory = !isTheory;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Interdisciplinary Areas'),
                              Checkbox(
                                value: isInter,
                                onChanged: (value) {
                                  setState(() {
                                    isInter = !isInter;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() async {
                          applyFilters();
                        });
                      },
                      child: Text('Apply'))
                ]),
              ),
            ),
            body: ListView(
              children: newUni,
            ),
          ),
        ));
  }
}
