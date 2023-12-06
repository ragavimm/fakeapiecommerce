import 'dart:convert';

import 'package:fakeapiecommerce/class.dart';
import 'package:fakeapiecommerce/dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../homepage.dart';

class ProductDetails extends StatefulWidget {
  String id;
  ProductDetails({required this.id}); // MenShoe({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState(id: id);
}

class _ProductDetailsState extends State<ProductDetails> {

  String id;
  _ProductDetailsState({required this.id});

  List<String> shoe = [
    "https://cdn09.nnnow.com/web-images/medium/styles/KTDP2DTUXKQ/1683610487559/1.jpg",
    "https://images.meesho.com/images/products/222676468/kucb2_512.jpg",
    "https://inc5shop.com/cdn/shop/files/15304TAN.jpg?v=1699613684&width=533",
    "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/24582706/2023/8/21/35daa73f-5236-4b5f-a75e-42e651edee891692634052883PROVOGUEMenTANFauxLeatherCasualSlipOnSandals1.jpg",
    "https://assets.ajio.com/medias/sys_master/root/20210701/v6Nr/60dcd807aeb269a9e33283ad/-473Wx593H-450141186-tan-MODEL.jpg"
  ];
  var currentIndex = 0;
  var itemCount = 1;
  String dropdownvalue = "Blue";
  var items = ["Blue", "Green", "Black", "White"];
var showCart=false;
  var product={};
  Future category() async{
    showLoader(context);
    try{
      print("try");
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/${id}"));
      var data=jsonDecode(response.body);



      if(response.statusCode==200){
        print(data);
        setState(() {
          product= data;
        });
      }else{
        print(data);
      }


    }
    catch(e){
      print(e);
    }
    Navigator.pop(context);
  }


  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,() async{

      category();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: showCart?Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        //  width:Size. ,
        // alignment:Alignment.topCenter,
        // margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(30))),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quantity",
                        style:
                        TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: size.height*0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            )),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:size.height*0.05,
                              padding:
                              EdgeInsets.symmetric(horizontal: 6),
                              alignment: Alignment.centerLeft,
                              // width: 20,
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              // decoration: BoxDecoration(
                              //   color: Colors.black,
                              //      shape: BoxShape.rectangle,
                              //      border:BoxBorder.,
                              // ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: size.height*0.05,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17),
                                  alignment: Alignment.centerLeft,
                                  color: Colors.blueGrey,
                                  // width: 20,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // decoration: BoxDecoration(
                                  //   color: Colors.black,
                                  //      shape: BoxShape.rectangle,
                                  //      border:BoxBorder.,
                                  // ),
                                ),
                                Container(
                                  height: size.height*0.05,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius:
                                      BorderRadius.horizontal(
                                          right:
                                          Radius.circular(10))),
                                  // width: 20,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // decoration: BoxDecoration(
                                  //   color: Colors.black,
                                  //      shape: BoxShape.rectangle,
                                  //      border:BoxBorder.,
                                  // ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "color",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: size.height*0.05,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid)),
                          child: DropdownButton(
                            isExpanded: true,
                            dropdownColor: Colors.black,
                            underline: SizedBox(),
                            value: dropdownvalue,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.grey,
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
         MyButton(title: " Add to Cart ")


            // Row( child:Icon(Icons.shopping_cart_checkout_outlined),),

         ],

        ),
      ):SizedBox(),
      body: Container(
        height: size.height,
        width: size.width,
        child:SingleChildScrollView(
          child:
          product.isNotEmpty?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                      height: size.height * 0.5,
                      width: size.width,
                      color: Colors.white,
                      child: PageView.builder(
                        itemCount: product.length,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemBuilder: (c, index) {
                          return Image.network(
                            product["image"], fit: BoxFit.cover,
                            // height: size.height * 0.4,
                            // width: size.width,
                          );
                        },
                      )),
                  Positioned(
                      left: 20,
                      bottom: 20,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          // color: Colors.black.withOpacity(0.3),
                          child: Text(
                            "${currentIndex + 1}/${product.length}",
                            style: TextStyle(color: Colors.white),
                          ))),
                  Positioned(
                      bottom: 10,
                      child: Row(
                        children: shoe.map((e) {
                          int index = shoe.indexWhere((element) => element == e);
                          return Icon(
                            Icons.circle,
                            size: 15,
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.purple,
                          );
                        }).toList(),
                      )),
                  Positioned(
                    top: 50,
                    right: 15,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          showCart=!showCart;
                        });
                      },
                      child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: showCart?Colors.red : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1.5),
                              blurRadius: 6,
                              spreadRadius: 3)
                        ],
                      ),
                      child: Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: showCart?Colors.white : Colors.red,


                      ),

                                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1.5),
                                    blurRadius: 6,
                                    spreadRadius: 3)
                              ],
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1.5),
                                    blurRadius: 6,
                                    spreadRadius: 3)
                              ],
                            ),
                            child: Icon(
                              Icons.share,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 50,
                      left: 15,
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.red,
                        ),
                        onTap: (){

                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>MyHomePage()));
                        },
                      )
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //
              //       Container(
              //         height: 45,
              //         width: 45,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.white,
              //           boxShadow:[
              //             BoxShadow(
              //               color: Colors.grey[300]!,
              //               offset: Offset(0,1),
              //               blurRadius: 3,
              //               spreadRadius: 5
              //             )
              //           ],
              //         ),
              //         child:Icon(
              //           Icons.favorite_border,
              //           color: Colors.red,
              //         ),
              //       ),
              //       SizedBox(width: 10,),
              //       Container(
              //         height: 45,
              //         width: 45,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.white,
              //           boxShadow:[
              //             BoxShadow(
              //                 color: Colors.grey[300]!,
              //                 offset: Offset(0,1),
              //                 blurRadius: 3,
              //                 spreadRadius: 5
              //             )
              //           ],
              //         ),
              //         child:Icon(
              //           Icons.share,
              //           color: Colors.red,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  '\$ ${product["price"]} USD ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  '${product["title"]}  ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  '${product["category"]}',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('${product["rating"]["rate"]}/5',
                  style: TextStyle(color: Colors.redAccent, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('${product["description"]}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 20),

            ],
          ):SizedBox(),
        ),
      ),
    );
  }
}
