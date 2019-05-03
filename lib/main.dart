import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fa_14nguyentacthanhcong/page/read_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '14 Nguyên Tắc Thành Công',
      home: new MainPage(),
    );
  }
}
class MainPage extends StatelessWidget{
  TextStyle _textStyle = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
  TextStyle _textMenu = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  TextStyle _titleStyle = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.blue
  );
  Color _iconColor = Colors.blue;
  double _iconSize  = 26.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('14 Nguyên Tắc Thành Công'),
      ),
      drawer: new Drawer(
        child: Column(
          children: <Widget>[
            new DrawerHeader(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.book, color: Colors.white,size: 50.0,),
                    new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text('14 Nguyên Tắc',
                            style: TextStyle(color: Colors.white,fontSize: 26.0, fontWeight: FontWeight.w400),),
                          new Text('Thành Công',
                            style: TextStyle(color: Colors.red,fontSize: 26.0, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
            decoration: BoxDecoration(color: Colors.blue),
            ),
            new ListTile(
              leading: Icon(Icons.get_app,color: Colors.blue,),
              title: Text('Ứng dụng khác',style: _textMenu,),
              onTap: () async{
                const urlEagle = "https://play.google.com/store/apps/developer?id=EagleTeam";
                if(await canLaunch(urlEagle)){
                  await launch(urlEagle);
                }
              },
            ),
            new ListTile(
              leading: Icon(Icons.star,color: Colors.blue,),
              title: Text('Đánh giá ứng dụng',style: _textMenu,),
              onTap: () async{
                const urlApp = "https://play.google.com/store/apps/details?id=com.vsond.fa14nguyentacthanhcong";
                if(await canLaunch(urlApp)){
                  await launch(urlApp);
                }
              },
            ),
            new ListTile(
              leading: Icon(Icons.contacts,color: Colors.blue,),
              title: Text('Hỗ trợ',style: _textMenu,),
              onTap: () async {
                const urlMess = "https://www.facebook.com/duongvansonit";
                if(await canLaunch(urlMess)){
                  await launch(urlMess);
                }
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Text("Phiên bản 1.0.1",style: _textMenu,)
                    ),
                    Divider(),
                    Text("Nguồn www.bwportal.com"),
                    Text("(Principles of Success)"),
                  ],
                )
              )
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Stack(
              alignment: Alignment(1.0, 1.0),
              children: <Widget>[
                new Image(image: AssetImage('images/main.jpg')),
                new Container(
                  decoration: BoxDecoration(color: Color.fromARGB(125, 0, 0, 0)),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0,bottom: 15.0),
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: <Widget>[
                    Text('" Thất bại thì có lý do\n Thành công phải có phương pháp. "',
                      style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    Align(
                      alignment: FractionalOffset.centerRight,
                      child: Text('-Khuyết danh-',
                          style: TextStyle(fontSize: 24.0,color: Colors.white, fontStyle: FontStyle.italic)),
                    )
                    ],
                  ),
                )
              ],
            ),
            new SafeArea(
              child: new Wrap(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Text('GIỚI THIỆU',
                      style: TextStyle(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.w600),),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Text('Brian Tracy là một trong số các tác giả hàng đầu thế giới với những cuốn sách viết về bí quyết thành công trong cuộc sống và kinh doanh.\nNhững bài nói chuyện hay hội thảo của ông về kỹ năng lãnh đạo, kỹ năng bán hàng, kinh nghiệm quản lý và chiến lược kinh doanh luôn cung cấp những ý tưởng thiết thực và chiến lược khôn ngoan mà người ta có thể vận dụng để đạt được nhiều kết quả tốt đẹp hơn trong mọi lĩnh vực cuộc sống.',
                        style: TextStyle(fontSize: 18.0),textAlign: TextAlign.justify),
                  )
                ],
              )
            ),
            new Divider(),
            _createdChap(1, ' MỘT CUỘC SỐNG CĂN BẰNG', context),new Divider(),
            _createdChap(2, ' HÀNH XỬ VỚI LÒNG TỰ TRỌNG', context),new Divider(),
            _createdChap(3, ' NUÔI DƯỠNG LÒNG TỰ TRỌNG', context),new Divider(),
            _createdChap(4, ' TRAO QUYỀN CHO NGƯỜI KHÁC', context),new Divider(),
            _createdChap(5, ' NGƯỜI BÁN HÀNG THÀNH CÔNG', context),new Divider(),
            _createdChap(6, ' XÂY DỰNG HÌNH ẢNH BẢN THÂN', context),new Divider(),
            _createdChap(7, ' TẠO NĂNG LƯỢNG CHO BẢN THÂN', context),new Divider(),
            _createdChap(8, ' LÀ NHÀ LÃNH ĐẠO THỰC THỤ', context),new Divider(),
            _createdChap(9, ' TẬN DỤNG TỪNG PHÚT GIÂY', context),new Divider(),
            _createdChap(10, ' ĐỐI MẶT VỚI NHỮNG BIẾN ĐỘNG TRONG CUỘC SỐNG', context),new Divider(),
            _createdChap(11, ' QUẢN LÝ THỜI GIAN', context),new Divider(),
            _createdChap(12, ' SỨC MẠNH CỦA QUYỀN UY', context),new Divider(),
            _createdChap(13, ' BIẾT ƯU TIÊN LÀM NHỮNG VIỆC QUAN TRỌNG', context),new Divider(),
            _createdChap(14, ' SUY NGHĨ TÍCH CỰC', context),new Divider(),
          ],
        ),
      ),
    );
  }

  void _viewPage(int i, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> ReadMain(i)));
  }
  Widget _createdChap(int index, String title, BuildContext context){
    return ListTile(
      contentPadding: EdgeInsets.all(2.0),
      leading: Text('NGUYÊN TẮC $index:', style: _titleStyle,),
      title: Text('$title', style: _textStyle,),
      onTap: ()=>_viewPage(index, context),
    );
  }
}