import 'package:csrankings_core/model/conf.dart';
import 'package:flutter/material.dart';

class Author extends StatefulWidget {
  final String name;
  final String uni;
  double pub;

  double adj;
  List<Conf> conf;

  Author(
      {super.key,
      required this.name,
      required this.uni,
      required this.conf,
      required this.pub,
      required this.adj});

  @override
  State<Author> createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  @override
  void initState() {
    super.initState();
    widget.pub = 0;
    widget.adj = 0;
    widget.conf.forEach((element) {
      widget.pub += element.pub;
      widget.adj += element.adj;
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.conf.length.toString());
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: widget.pub>0 ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.name}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.pub.toStringAsFixed(1)}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.adj.toStringAsFixed(2)}'),
            )
          ],
        ):SizedBox(height: 0, width: 0,),
      ),
    );
  }
}
