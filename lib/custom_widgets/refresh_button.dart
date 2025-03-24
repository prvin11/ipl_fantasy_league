import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({required this.onRefresh, super.key});

  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(55, 37, 110, 1),
        ),
        child: TextButton(
          onPressed: onRefresh,
          child: Text("Refresh Board", style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
