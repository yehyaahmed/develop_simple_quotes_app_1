import 'package:flutter/material.dart';
import 'services/quotable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late QuotableModel model;

  void getQuotableData() async {
    model = QuotableModel();
    await model.getQuotable();
    setState(() {

    });
  }

  @override
  void initState() {
    getQuotableData();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: model.bg == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(model.bg!),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.8), BlendMode.dstATop),
                      ),
                    ),
                    constraints: const BoxConstraints.expand(),
                    child: Center(child:
                      Column(
                        children: [
                          Text(model.content!),
                          SizedBox(height: 14),
                          Text(model.tags!),
                        ],
                      ),),
                  ),

                  Icon(Icons.replay,color: Colors.blue,),


                ],


              ),
      ),
    );
  }
}
