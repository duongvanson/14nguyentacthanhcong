import 'package:flutter/material.dart';
void main()=>runApp(ReadMain(1));

class ReadMain extends StatefulWidget{
  String title = 'Quay lại';
  final String data = 'Read content';
  String id = '1';
  String img = 'nguyentac';
  ReadMain(index){
    this.id = index>9?'$index':'0$index';
    img += id;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReadMainState();
  }
}
class ReadMainState extends State<ReadMain>{
  double _fontSize = 18.0;
  Color _txtColor = Colors.black;
  Color _bgColor = Colors.white;
  TextStyle _txtMenu = new TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.remove,),
                onPressed: (){
                  setState(() {
                    if(_fontSize >= 12.0) _fontSize-=2;
                  });
                }),
          IconButton(icon: Icon(Icons.add),
              onPressed: (){
            setState(() {
              if(_fontSize <= 32) _fontSize += 2;
            });
              })
        ],
      ),
      body: new Container(
          child:
          FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('docs/nguyentac${widget.id}.txt'),
            builder: (context, datas){
              if(datas.hasData){
                String data = datas.data.toString();
                String title = data.substring(0, data.indexOf(';'));
                String subtitle = title.substring(0,title.indexOf(':'));
                title = title.substring(title.indexOf(':')+1);
                data = data.substring(data.indexOf(';')+1);
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            new Stack(
                              alignment: const Alignment(1.0, 1.0),
                              children: <Widget>[
                                new Image(image: AssetImage('images/img${widget.id}.jpg')),
                                new Container(
                                  decoration: BoxDecoration(color: Color.fromARGB(125, 0, 0, 0)),
                                  padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0,bottom: 15.0),
                                  alignment: AlignmentDirectional.center,
                                  child: Text('$subtitle\n$title',
                                    style: TextStyle(fontSize: 22.0,color: Colors.white),
                                    textAlign: TextAlign.center,),
                                ),
                              ],
                            ),
                            new Container(
                              decoration: BoxDecoration(color: _bgColor),
                              padding: EdgeInsets.all(5.0),
                              child: Text('$data',
                                style: TextStyle(fontSize: _fontSize, color: _txtColor),textAlign: TextAlign.justify,),
                            ),
                          ],
                        )
                    )
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }

            }),
        ),
        //FLOAT BOTTOM
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (BuildContext bc){
                return Container(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  padding: EdgeInsets.all(10.0),
                  height: 150.0,
                  child: Wrap(
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Màu chữ: ', style: _txtMenu,),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.green,),
                                  onPressed: (){setState(() {_txtColor = _getColor(0);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.red,),
                                  onPressed: (){setState(() {_txtColor = _getColor(1);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.blue,),
                                  onPressed: (){setState(() {_txtColor = _getColor(2);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.orange,),
                                  onPressed: (){setState(() {_txtColor = _getColor(3);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.black,),
                                  onPressed: (){setState(() {_txtColor = _getColor(4);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.white,),
                                  onPressed: (){setState(() {_txtColor = _getColor(5);});}),
                              IconButton(
                                  icon: Icon(Icons.format_color_text, color: Colors.grey,),
                                  onPressed: (){setState(() {_txtColor = _getColor(6);});}),
                            ],
                          ),
                          Text('Màu nền: ', style: _txtMenu,),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.green,),
                                  onPressed: (){setState(() {_bgColor = _getColor(0);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.red,),
                                  onPressed: (){setState(() {_bgColor = _getColor(1);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.blue,),
                                  onPressed: (){setState(() {_bgColor = _getColor(2);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.orange,),
                                  onPressed: (){setState(() {_bgColor = _getColor(3);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.black,),
                                  onPressed: (){setState(() {_bgColor = _getColor(4);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.white,),
                                  onPressed: (){setState(() {_bgColor = _getColor(5);});}),
                              IconButton(
                                  icon: Icon(Icons.view_carousel, color: Colors.grey,),
                                  onPressed: (){setState(() {_bgColor = _getColor(6);});}),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              });
        }),
    );
  }
  Color _getColor(int index){
    switch(index){
      case 0: return Colors.green; break;
      case 1: return Colors.red; break;
      case 2: return Colors.blue; break;
      case 3: return Colors.orange; break;
      case 4: return Colors.black; break;
      case 5: return Colors.white; break;
      case 6: return Colors.grey; break;
    }
    return Colors.black;
  }
}