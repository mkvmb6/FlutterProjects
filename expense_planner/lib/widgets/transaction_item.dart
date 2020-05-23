import 'dart:math';

import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransaction,
    @required Function deleteTransaction,
  })  : _userTransaction = userTransaction,
        _deleteTransaction = deleteTransaction,
        super(key: key);

  final Transaction _userTransaction;
  final Function _deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [Colors.blue, Colors.red, Colors.purple, Colors.black];
  Color _bgColor;

  @override
  void initState() {
    _bgColor = colors[Random().nextInt(colors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
                    '₹${widget._userTransaction.amount.toStringAsFixed(2)}')),
          ),
          radius: 30,
        ),
        title: Text(
          widget._userTransaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat().add_yMMMd().format(widget._userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () =>
                    widget._deleteTransaction(widget._userTransaction.id),
                icon: Icon(Icons.delete_forever),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () =>
                    widget._deleteTransaction(widget._userTransaction.id),
              ),
      ),
    );
  }
}
