import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuedu_hd/db/BookSourceBean.dart';
import 'package:yuedu_hd/ui/widget/space.dart';


///书源手动编辑
class PageSourceInput extends StatefulWidget{

  @override
  _PageSourceInputState createState() => _PageSourceInputState();

}

class _PageSourceInputState extends State<PageSourceInput> {

  BookSourceBean _sourceBean;
  var page = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        appBar: AppBar(title: Text('添加书源规则'),),
        body: Container(
          padding: EdgeInsets.all(16),
          child: PageView(
            controller: page,
            children: [
              _PSourceName(_sourceBean,(){
                _next();
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _next(){
    page.jumpToPage(page.page.toInt()+1);
  }
}

///输入书源名
class _PSourceName extends StatefulWidget{

  final BookSourceBean sourceBean;
  final nextAction;

  const _PSourceName(this.sourceBean,this.nextAction,{Key key,}) : super(key: key);

  @override
  __PSourceNameState createState() => __PSourceNameState();
}

class __PSourceNameState extends State<_PSourceName> {

  var linkController = TextEditingController(text: 'http://');
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('网站链接'),
            HSpace(16),
            Expanded(child: TextField(controller: linkController,)),
          ],
        ),
        Row(
          children: [
            Text('网站名称'),
            HSpace(16),
            Expanded(child: TextField(controller: nameController,)),
          ],
        ),
        VSpace(16),
        RaisedButton(onPressed: (){
          widget.sourceBean.bookSourceUrl = linkController.text;
          widget.sourceBean.bookSourceName = nameController.text;
          widget.nextAction();
        }, child: Text('下一步'))
      ],
    );
  }

  void _check(){

  }

}