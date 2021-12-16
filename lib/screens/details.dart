import 'package:surf_seeker/configs/location.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Location product;
  const DetailsPage({ Key? key, required this.product }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<dynamic> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Image.asset(widget.product.imageURL, fit: BoxFit.cover,)
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Transform.translate(
                offset: Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ),
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.product.name,
                              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                            ),
                            SizedBox(height: 5,),
                            Text(widget.product.city, style: TextStyle(color: Colors.blueAccent.shade400, fontSize: 14,),),
                          ],
                        ),
                        Text("\$ " +widget.product.price.toString() + '.00',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam iaculis tempus turpis vel volutpat. Donec pharetra eros nec libero cursus tempor. Proin euismod pharetra dui vel facilisis. In nibh ligula, aliquam fermentum risus vel, vehicula congue ipsum.",
                      style: TextStyle(height: 1.5, color: Colors.grey.shade800, fontSize: 15,),
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.blue[800],
                      child: Center(
                        child: Text("Contact", style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    )
                  ],
                )
              )
            ])
          ),
        ]
      ),
    );
  }
}