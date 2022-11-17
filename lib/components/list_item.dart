import 'package:flutter/material.dart';
import 'package:flutter_dex/api/api_service.dart';

class ListItem extends StatefulWidget {
  final PokeLink link;
  final int index;
  const ListItem(this.link, this.index, {Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[600]),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Text(
          '${widget.index}. ${widget.link.name.toUpperCase()}',
        ),
      ),
    );
  }
}
