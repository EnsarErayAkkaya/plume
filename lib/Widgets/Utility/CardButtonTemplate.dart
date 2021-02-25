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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 16,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ),
                onPressed: () => delete(),
              ),
              SizedBox(width: size.width * 0.01),
              TextButton.icon(
                icon: Icon(
                  Icons.edit,
                  color: Colors.orange,
                  size: 16,
                ),
                label: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ),
                onPressed: edit,
              ),
              SizedBox(width: size.width * 0.01),
              TextButton.icon(
                icon: Icon(
                  Icons.more,
                  color: Colors.blue,
                  size: 16,
                ),
                label: Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ),
                onPressed: details,
              ),
              const SizedBox(width: 0),
            ],
          ),
    );
  }
}
