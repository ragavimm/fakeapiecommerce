import 'dart:convert';
import 'package:fakeapiecommerce/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var iMAC = TextEditingController();
  TextEditingController id=TextEditingController();
  TextEditingController title=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController image=TextEditingController();
  TextEditingController rating=TextEditingController();
  var categorylist1 = [
    {
      "image":
          "https://cdn09.nnnow.com/web-images/medium/styles/KTDP2DTUXKQ/1683610487559/1.jpg",
      "offerprice": '\$120',
      "price": '\$180',
      "title": "Men's shoes"
    },
    {
      "image": 'https://etimg.etb2bimg.com/photo/78764427.cms',
      "offerprice": '\$200',
      "price": "\$280",
      "title": 'Laptop',
    },
    {
      "image":
          'https://www.secureeshop.com/public/uploads/all/CFwLs7jipd6OoFr1EaNIClOitkv7NDW1AOWejo5n.png',
      "offerprice": "\$10",
      "price": '\$16',
      "title": 'Grocessery',
    },
    {
      "image":
          'https://content3.jdmagicbox.com/comp/def_content/toy-dealers/shutterstock-615041207-toy-dealers-6-qhb57.jpg',
      "offerprice": "\$5",
      "price": '\$8',
      "title": 'Toys',
    },
    {
      "image": 'https://m.media-amazon.com/images/I/51bR6Jr6pzL.jpg',
      "offerprice": "\$20",
      "price": '\$30',
      "title": 'Mobiles',
    },
  ];
  var categorylist2 = [
    {
      "image":
      "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",

      "price": '\$250',
      "title": "Watch"
    },
    {
      "image": 'https://media.istockphoto.com/id/1335374517/vector/black-bluetooth-speaker-with-power-blue-lead-on-white-background-eps10-vector-illusration.jpg?s=612x612&w=0&k=20&c=FJHzQf24mszeen0xJJz_NQdrm89sGau_CiYJM-_-y9o=',

      "price": "\$280",
      "title": 'Wifi-Speaker',
    },
    {
      "image":'https://yafaint.com/wp-content/uploads/2019/04/Yafa-T-shirt-1.jpg',

      "price": '\$20',
      "title": 'T-Shirt',
    },
    {
      "image":
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCupxaXfv0MkuYZDhhnkMrf93Hbx0hPZYZoDcQhUDTY5FVsCHMND95aV_pEfIIYpu2R-M&usqp=CAU',

      "price": '\$200',
      "title": 'Leather Bag',
    },
    {
      "image": 'https://www.shutterstock.com/image-photo/top-view-new-black-genuine-260nw-1500309866.jpg',

      "price": '\$30',
      "title": 'Wallet',
    },
  ];
   var list=[];
   var list1=[];
 Future dataFromInternet() async{
    try{
      print("try");
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products"));
      var data=jsonDecode(response.body);

      //{userId: 1, id: 1, title: delectus aut autem, completed: false}

      if(response.statusCode==200){
        print(data);
        setState(() {
          list= data;
        });
      }else{
        print(data);
      }


    }
    catch(e){
      print(e);
   }
 }
  Future category1() async{
    try{
      print("try");
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/categories"));
      var data=jsonDecode(response.body);



      if(response.statusCode==200){
        print(data);
        setState(() {
          list1= data;
        });
      }else{
        print(data);
      }


    }
    catch(e){
      print(e);
    }
  }

  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() async{
      dataFromInternet();
      category1();
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    // padding: EdgeInsets.symmetric(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black, style: BorderStyle.solid)),
                    child: TextField(
                      controller: iMAC,
                      onChanged: (val) {
                        setState(() {
                          iMAC.text;
                        });
                      },
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: "iMAC"),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(),
                  child: Icon(Icons.shopping_cart_outlined),
                )
              ],
            ),
          ),
              Container(
            height: 150,
            // child: Image.network(
            //   "https://img.freepik.com/free-vector/ecommerce-web-page-concept-illustration_114360-8204.jpg?w=2000",
            // ),
            decoration: BoxDecoration(
                image: DecorationImage(

                  image: NetworkImage('https://img.freepik.com/free-vector/ecommerce-web-page-concept-illustration_114360-8204.jpg?w=2000'),

                ),
                borderRadius: BorderRadius.circular(15)
            ),),

               Container(
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Expanded(
                  child: Text(
                "Hot deals",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              Spacer(),
              Expanded(
                  child: Text(
                "View all",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ))
            ]),
          ),
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(c,index){
                        return Column(
                            children: [
                              Container(
                                height:100,
                                width: 100,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                               image: DecorationImage(
                                image: NetworkImage('${list1[index]}'),
                                  fit: BoxFit.cover,
                              ),
                                  borderRadius: BorderRadius.circular(15)
                            ),),
                              RichText(
                                text: TextSpan(

                                    children: [
                                      // TextSpan(text: '${list[index]["offerprice"]}  ',style: TextStyle(color: Colors.redAccent,fontSize: 15)),

                                      TextSpan(text: '${list1[index]}',style: TextStyle(color: Colors.black,fontSize: 15,decoration: TextDecoration.lineThrough)),

                                    ]
                                ),
                              ),
                              Container(
                                child: Text('${list1[index]}',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ),


                            ],
                        );
                    },
                  itemCount: list1.length,
                    ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(children: [
                  Expanded(
                      child: Text(
                        "Weekly top",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                  Spacer(),
                  Expanded(
                      child: Text(
                        "View all",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ))
                ]),
              ),
              Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(c,index){
                    return Container(
                      width: 200,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [

                            InkWell(
                              child: Container(
                                height:100,
                                width: 100,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage('${list[index]["image"]}'),
                                      fit: BoxFit.cover,
                                    ),


                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                              onTap: () {
                                // Navigator.of(context).push();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>ProductDetails(id: list[index]["id"].toString(),)));
                              },
                            ),


                          RichText(
                            text: TextSpan(

                                children: [
                                  TextSpan(text: '${list[index]["price"]}  ',style: TextStyle(color: Colors.redAccent,fontSize: 15)),
                                ]
                            ),
                          ),
                          Container(
                            child: Text(
                              '${list[index]["title"]}',
                              style: TextStyle(color: Colors.black,fontSize: 15,overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          ),


                        ],
                      ),
                    );
                  },
                  itemCount: list.length,

                ),
              ),

        ],

            )

        ),

      ),
    );
  }
}
