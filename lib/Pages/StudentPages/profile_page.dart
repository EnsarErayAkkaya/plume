import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
    return Text('Profile Student');
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CircleButton extends StatelessWidget {
  final Function press;
  final IconData icon;
  final Color color;

  const CircleButton({Key key, this.press, this.icon, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: press,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: color,//Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                )
            ),
            SizedBox(width: size.width * 0.01,),
          ],
        )
    );
  }
}
