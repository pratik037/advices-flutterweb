import 'package:advices/app/backend.dart';
import 'package:advices/app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Advices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdvicesBackend>(
          create: (BuildContext context) {
              return AdvicesBackend();
            },
          child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
