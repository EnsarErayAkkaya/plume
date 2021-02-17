import 'package:flutter/material.dart';

class CardButtonsTemplate extends StatelessWidget {
  final Function details;
  final Function edit;
  final Function delete;

  final String detailsText;
  final String deleteText;
  final String editText;

  final IconData detailsIcon;
  final IconData deleteIcon;
  final IconData editIcon;

  CardButtonsTemplate({
    this.details, this.edit, this.delete,
    this.detailsText = 'Details', this.deleteText = 'Delete', this.editText = 'Edit',
    this.detailsIcon = Icons.more, this.deleteIcon = Icons.delete, this.editIcon = Icons.edit,
  }) ;

  @override
  Widget build(BuildContext context) {
    //print(', CardButtonsTemplate Builded');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton.icon(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              'Delete',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            onPressed: () => delete(),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            icon: Icon(
              Icons.edit,
              color: Colors.orange,
            ),
            label: const Text(
              'Edit',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            onPressed: edit,
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            icon: Icon(
              Icons.more,
              color: Colors.blue,
            ),
            label: Text(
              'Details',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            onPressed: () => details(),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
