import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
int? size;

class MyApp extends StatelessWidget{

  const MyApp({Key? key}): super(key:Key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title : 'flutter Demo',
      theme : ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title:' Super Draw'),


    );
  }
}
class MyHomePage extends StatefulWidget{

  const MyHomePage ({Key? key,required this.title}): super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

Widget box = Container(
  width: 30,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(width: 2,color: Colors.white,style:BorderStyle.solid ),
    borderRadius: BorderRadius.circular(4),
    color: Colors.blue,
  ),
);
List<Widget>? row =[];
List<List<Widget>>? square = [];

class _MyHomePageState extends State<MyHomePage>{
  void _drowRow (){
    row!.clear();
    square!.clear();
    size = 3;
    for( int i =0; i<=size! ; i++)
      {
        for(int j =0;j< size! ;j++){
          row!.add(box);

        }
        square!.add(<Widget>[]);
        for( int c=0;c< size!;c++){
          square![i].add(row![c]);

        }
        row!.clear();

      }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Draw'),
          leading: IconButton(
            onPressed: _drowRow,
            icon: const Icon(Icons.power_outlined),

          ),
      ),
      body:Center(
        child: Column(
          children: [
            size != null ? Text(" Sqare size $size"): Container(),
            square!.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemBuilder: (context,index)=> Container(
                child: Row(children:square![index]),
    ),
    itemCount: square!.length,
    ),
            )

                :Container()
          ],
        ),
      ),
    );
  }
}
