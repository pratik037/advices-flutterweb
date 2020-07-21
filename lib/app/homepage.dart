import 'package:advices/app/advicesPage.dart';
import 'package:advices/app/backend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Advices, for you"),
        // centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _textEditingController.clear();
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                    "Reset Successful",
                    style: TextStyle(color: Colors.black),
                  ),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.greenAccent,
                ));
              })
        ],
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter a keyword for advice"),
          ),
          
        ),
        SizedBox(height: 20,),
        RaisedButton(
          onPressed: () {
            if (_textEditingController.text.isEmpty) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Please enter a keyword to search"),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.redAccent,
              ));
            }
            // If keyword is present, process here further

            else {
              Provider.of<AdvicesBackend>(context, listen:false )
                  .handleSearchAdvice(_textEditingController.text.trim());
              print("Data sent");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consumer(
                      builder: (BuildContext context, AdvicesBackend value, _) {
                        return AdvicesPage(advicesData: value);
                      },
                    ),
                    fullscreenDialog: true
                  ));
            }
          },
          child: Text("Advise Me"),
          color: Theme.of(context).primaryColor,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )
      ])),
    );
  }
}
