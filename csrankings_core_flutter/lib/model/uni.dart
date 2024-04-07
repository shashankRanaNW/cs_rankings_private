import 'package:csrankings_core/model/author.dart';
import 'package:flutter/material.dart';

class Uni extends StatefulWidget {
  final String name;
  List<Author> authors;
  int index;
  double adj;
  Uni(
      {super.key,
      required this.index,
      required this.name,
      required this.authors,
      required this.adj});

  @override
  State<Uni> createState() => _UniState();
}

class _UniState extends State<Uni> {
  bool isOpen = false;
  List<Author> auths = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('Loaded ${widget.name}');
    widget.authors.sort((a, b) => ((b.adj - a.adj) * 100).round());
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              // leading: CircleAvatar(
              //   child: Padding(
              //     padding: const EdgeInsets.all(5.0),
              //     child: FittedBox(child: Text('Photo')),
              //   ),
              // ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.index}  ${widget.name}',
                  ),
                  Text(widget.adj.toStringAsFixed(2))
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  isOpen ? Icons.expand_less : Icons.expand_more,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
              ),
            ),
            if (isOpen)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Faculty', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('# Pub', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Adj #', style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                      ),
                      ...widget.authors
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
