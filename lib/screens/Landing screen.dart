import 'package:complexui6/custom/BorderBox.dart';
import 'package:complexui6/utils/contants.dart';
import 'package:complexui6/utils/custom_functions.dart';
import 'package:complexui6/utils/sample_data.dart';
import 'package:complexui6/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LandingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;
   final ThemeData themeData = Theme.of(context);
   final double padding = 25;


   final sidePadding = EdgeInsets.symmetric(horizontal: padding );

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding:sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderBox(
                        height: 50,
                          width: 50,
                          child: Icon(Icons.menu,color: COLOR_BLACK,),
                      ),
                      BorderBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.settings,color: COLOR_BLACK,),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text('City',style:themeData.textTheme.bodyText2,),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: sidePadding,
                  child: Text('Indore,(M.P.)',style:themeData.textTheme.headline1,
                ),),

                Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: padding,
                      color: COLOR_GREY,
                  ),
                ),
                addVerticalSpace(10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                  .map((filter)=> Choiceoption(text: filter)).toList(),
                    ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(itemCount:RE_DATA.length,itemBuilder:(context,index) {
                      return RealEstateItem(itemData: RE_DATA[index]);
                    }

                    ),
                  ),
                ), ],
            ),
        ),
      ),
    );
  }
}

class Choiceoption extends StatelessWidget {
final String text;

  const Choiceoption({Key key,@required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(text,style: themeData.textTheme.headline5,),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({Key key,@required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData["image"])),
              Positioned(
                  top: 15,
                right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                child: Icon(Icons.favorite_border,color: COLOR_BLACK,),
              )),
            ],
          ),
addVerticalSpace(15),
          Row(
            children: [
              Text("${formatCurrency(itemData["amount"])}",style: themeData.textTheme.headline1,),
          addHorizontalSpace(10),
           Text("${itemData["address"]}",
           style: themeData.textTheme.bodyText2,
           )
            ],
          ),
          addVerticalSpace(10),
          Text("${itemData["bedrooms"]}bedrooms/${itemData["bathrooms"]}bathrooms/${itemData["area"]}sqft",
        style: themeData.textTheme.headline5,
          ),

        ],
      ) ,
    );
  }
}

