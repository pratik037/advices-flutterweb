import 'package:advices/app/backend.dart';
import 'package:flutter/material.dart';

class AdvicesPage extends StatefulWidget {
  final AdvicesBackend advicesData;

  const AdvicesPage({Key key, this.advicesData}) : super(key: key);
  @override
  _AdvicesPageState createState() => _AdvicesPageState();
}

class _AdvicesPageState extends State<AdvicesPage> {
  @override
  Widget build(BuildContext context) {
    var advicesData = this.widget.advicesData;
    return Scaffold(
      appBar: AppBar(),
      body: advicesData.isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
            child: ListView.builder(
              
                itemCount: advicesData.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(advicesData.advices[index].aid),
                  title: Text(advicesData.advices[index].advice),
                  subtitle: Text(advicesData.advices[index].date),
                  trailing: Icon(Icons.star_border),
                ),
              ),
          ),
    );
  }
}
