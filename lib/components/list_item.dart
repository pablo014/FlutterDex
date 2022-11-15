import 'package:flutter/material.dart';
import 'package:flutter_dex/api/api_service.dart';

class ListItem extends StatefulWidget {
  final PokeLink link;
  const ListItem(this.link, {Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Text(widget.link.name.toUpperCase(), style: const TextStyle(fontFamily: 'Ethnocentric'),),
    );
  }
}
