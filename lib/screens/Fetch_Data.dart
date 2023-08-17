import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {

  var _firestoreInstance=FirebaseFirestore.instance;

  final List<String> _carouselImages=[];
  List _products=[];


  fetchProducts()async{
    QuerySnapshot qn=await _firestoreInstance.collection("products").get();
    setState(() {
      for(int i =0;i<qn.docs.length;i++){
        _products.add(
            {
              "product-name": qn.docs[i]["product-name"],
              "product-image": qn.docs[i]["product-image"],
              "product-price": qn.docs[i]["product-price"],


            }
        );
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Home',style: TextStyle(fontSize: 17),),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    decoration:const InputDecoration(
                        fillColor: Colors.deepOrange,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Colors.grey
                            )
                        ),
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: "search product here",
                        hintStyle: TextStyle(fontSize: 15)


                    ),
                    onTap: (){},
                  ),
                ),
                const SizedBox(height: 10,),

                const SizedBox(height: 16,),
                const Row(
                  children:
                  [
                    SizedBox(width: 6,),
                    Text('Pouplar Product',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                    SizedBox(width: 193,),
                    Text('see more',style: TextStyle(fontSize: 17,color: Colors.grey)),
                  ],
                ),
                Expanded(
                    child: GridView.builder(

                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
                        itemBuilder:(_,index)
                        {return GestureDetector(
                          onTap: (){},
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio:2,
                                    child: Container(
                                        color: const Color(0xffFF8B40),
                                        child:
                                        Image.network(_products[index]["product-image"][0],))),
                                const SizedBox(height: 7,),
                                Text("${_products[index]["product-name"]}"),
                                SizedBox(height: 5,),
                                Text(_products[index]["product-price"].toString()),

                              ],
                            ),

                          ),
                        );

                        }
                    )
                ),
              ],))
    );
  }
}
