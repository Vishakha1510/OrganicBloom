import 'package:flutter/material.dart';

int selectbottomitemindex = 0;


class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                    title: TextButton(
                           onPressed: (){},
                           child: Text(
                                 "364, Street... v",
                                 style: TextStyle(fontSize: 18,color: Color(0xFF1E1E1E)),
                                 ),
                                 ),
                    actions: [
                        IconButton(
                        onPressed:(){
                          Navigator.of(context).pushNamed('cart');
                        } ,
                        icon:Icon(Icons.shopping_bag_rounded,color: Color(0xFF1E1E1E),))
                ],
                     ),
       body: Column(
                    children: [
                      SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                              children: [
                               SizedBox(width: 20),
                                     Container(
                                     height: 200,
                                     width: 350,
                                     decoration: BoxDecoration(
                                     color:  Colors.lightGreen[100],
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            SizedBox(width: 10),
                                            Column(
                                                spacing: 7,
                                              children: [
                                                SizedBox(height: 40),
                                                Text("Upto 30% offer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                Text("Enjoy our big offer",style: TextStyle(fontSize: 16, color: Color(0xFFA5CC65),fontWeight: FontWeight.bold)),
                                                Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                            color:  Colors.green,
                                                            borderRadius: BorderRadius.circular(10)
                                                                   ),
                                                    child: Center(child: Text("Shop Now",style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),)),               
                                                         )
                                              ],
                                            ),
                                             Container(
                                                height:120,
                                                width: 200,
                                                child: Image.network("https://media.istockphoto.com/id/182756426/photo/basket-of-healthy-vegetables-xxxl.webp?b=1&s=612x612&w=0&k=20&c=nhd522C_w1de5Au3h3ouLeAeBVL_tQ_fdNVF9aUZ2eY=",
                                                                   fit: BoxFit.contain,
                                                                   ),
                                             ) 
                                        ],
                                     )
                                  ),
                               SizedBox(width: 20), 
                                    Container(
                                     height: 200,
                                     width: 350,
                                     decoration: BoxDecoration(
                                     color:  Colors.lightGreen[100],
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            SizedBox(width: 10),
                                            Column(
                                                spacing: 7,
                                              children: [
                                                SizedBox(height: 40),
                                                Text("Upto 50% off",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                Text("Enjoy our big offer",style: TextStyle(fontSize: 16, color: Color(0xFFA5CC65),fontWeight: FontWeight.bold)),
                                                Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                            color:  Colors.green,
                                                            borderRadius: BorderRadius.circular(10)
                                                                   ),
                                                    child: Center(child: Text("Shop Now",style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),)),               
                                                         )
                                              ],
                                            ),
                                             Container(
                                                height:120,
                                                width: 200,
                                                child: Image.network("https://images.pexels.com/photos/50593/coca-cola-cold-drink-soft-drink-coke-50593.jpeg?auto=compress&cs=tinysrgb&w=600",
                                                                   fit: BoxFit.contain,
                                                                   ),
                                             ) 
                                        ],
                                     )
                                  ),
                               SizedBox(width: 20), 
                                         Container(
                                     height: 200,
                                     width: 350,
                                     decoration: BoxDecoration(
                                     color:  Colors.lightGreen[100],
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            SizedBox(width: 10),
                                            Column(
                                                spacing: 7,
                                              children: [
                                                SizedBox(height: 40),
                                                Text("Upto 30% offer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                                Text("Enjoy our big offer",style: TextStyle(fontSize: 16, color: Color(0xFFA5CC65),fontWeight: FontWeight.bold)),
                                                Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                            color:  Colors.green,
                                                            borderRadius: BorderRadius.circular(10)
                                                                   ),
                                                    child: Center(child: Text("Shop Now",style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),)),               
                                                         )
                                              ],
                                            ),
                                             Container(
                                                height:120,
                                                width: 200,
                                                child: Image.network("https://media.istockphoto.com/id/175176230/photo/fresh-fruits.jpg?b=1&s=612x612&w=0&k=20&c=PFL1L96SeAoETacqfrhLnSmD3iwI7svC-_6W5HYjdH0=",
                                                                   fit: BoxFit.contain,
                                                                   ),
                                             ) 
                                        ],
                                     )
                                  ),
                               SizedBox(width: 20),
                    ],
                   ),
                  ),
              SizedBox(height: 10),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                             Text(
                              "Categories",
                              style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),
                              ),
                              SizedBox(width: 200),
                             TextButton(
                                onPressed: (){},
                               child: Text(
                                "See all",
                                style: TextStyle(fontSize: 15,color:Color(0xFFA5CC65),fontWeight: FontWeight.bold ),
                               ),
                             ) 
                      ],
                     ),
               SizedBox(height: 5),      
               SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                 child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://images.freeimages.com/variants/LEaaNndzfhZ6sjLuf4seiqxk/f4a36f6589a0e50e702740b15352bc00e4bfaf6f58bd4db850e167794d05993d?fmt=webp&w=500"
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Fruits",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                                  ]
                                ),
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://media.istockphoto.com/id/2184147652/photo/various-fresh-dairy-products.webp?b=1&s=612x612&w=0&k=20&c=Y1QF4FMb5uTrowvEnFCwGL4mt2RAG07qwHxuy2jJZqQ="
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Dairy",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                              ]
                          ),
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://images.freeimages.com/images/large-previews/579/vegetables-basket-1460409.jpg?fmt=webp&w=500"
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Vegetables",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                              ]
                          ),
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://media.istockphoto.com/id/1005836940/photo/fruit-juice-selection-by-the-sea.webp?b=1&s=612x612&w=0&k=20&c=cxGT4OCV_CXmqNeigb9gU8C2irPuZoV2HEYfRNU1c7M="
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Beverages",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                              ]
                          ),
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://images.freeimages.com/images/large-previews/d4a/bowl-of-popcorn-1329429.jpg?fmt=webp&w=500"
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Snacks",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                              ]
                          ),
                          Column(
                              children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ClipOval(
                                    child: CircleAvatar(
                                    backgroundColor: Color(0xFF595959),
                                    radius: 35, 
                                     backgroundImage: NetworkImage(
                                                         "https://images.freeimages.com/images/large-previews/313/eggs-1196288.jpg?fmt=webp&w=500"
                                                   ),
                                                 ),
                                                 ),
                                        ),
                                  Text("Eggs",style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)      
       
                              ]
                          ),
                    ],
                 ),
               ),
              SizedBox(height: 10),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                             Text(
                              "Fruits",
                              style: TextStyle(fontSize: 15,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),
                              ),
                              SizedBox(width: 200),
                             TextButton(
                                onPressed: (){},
                               child: Text(
                                "See all",
                                style: TextStyle(fontSize: 15,color:Color(0xFFA5CC65),fontWeight: FontWeight.bold ),
                               ),
                             ) 
                      ],
                     ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            SizedBox(width: 10),
                                     Container(
                                     height: 240,
                                     width: 180,
                                     decoration: BoxDecoration(
                                     color:  Colors.white38,
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Column(
                                        spacing: 8,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                Container(
                                                    height: 120,width: 180,
                                                    child: Container(
                                                             height: 110,width: 180,
                                                            child: Image.network("https://images.freeimages.com/images/large-previews/7dd/bananas-1326090.jpg?fmt=webp&w=500",fit: BoxFit.cover,),
                                                              ),
                                                            ),
                                                         Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                          Text("Banana",style: TextStyle(fontSize: 20,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),
                                                          IconButton(onPressed: (){}, icon:Icon(Icons.add,color: Color(0xFF1E1E1E),))
                                                              ],
                                                           ),
                                                            Text("⭐ 4.8 (287)",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),       
                                                            Text(" Rs.58",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)
                                                              ],),    
                                                          ),
                                    Container(
                                     height: 240,
                                     width: 180,
                                     decoration: BoxDecoration(
                                     color:  Colors.white38,
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Column(
                                        spacing: 8,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                Container(
                                                    height: 120,width: 180,
                                                    child: Container(
                                                             height: 110,width: 180,
                                                            child: Image.network("https://images.freeimages.com/images/large-previews/772/apples-1325980.jpg?fmt=webp&w=500",fit: BoxFit.cover,),
                                                              ),
                                                            ),
                                                         Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                          Text("Apples",style: TextStyle(fontSize: 20,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),
                                                          IconButton(onPressed: (){}, icon:Icon(Icons.add,color: Color(0xFF1E1E1E),))
                                                              ],
                                                           ),
                                                            Text("⭐ 4.8 (287)",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),       
                                                            Text(" Rs.100",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)
                                                              ],),    
                                                          ),  
                                        Container(
                                     height: 240,
                                     width: 180,
                                     decoration: BoxDecoration(
                                     color:  Colors.white38,
                                     borderRadius: BorderRadius.circular(10)
                                         ),
                                     child: Column(
                                        spacing: 8,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                Container(
                                                    height: 120,width: 180,
                                                    child: Container(
                                                             height: 110,width: 180,
                                                            child: Image.network("https://images.freeimages.com/images/large-previews/ffe/oranges-r-not-the-only-fruit-1322853.jpg?fmt=webp&w=500",fit: BoxFit.cover,),
                                                              ),
                                                            ),
                                                         Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                          Text("Oranges",style: TextStyle(fontSize: 20,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),
                                                          IconButton(onPressed: (){}, icon:Icon(Icons.add,color: Color(0xFF1E1E1E),))
                                                              ],
                                                           ),
                                                            Text("⭐ 4.8 (287)",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),),       
                                                            Text(" Rs.110",style: TextStyle(fontSize: 17,color:Color(0xFF1E1E1E),fontWeight: FontWeight.bold ),)
                                                              ],),    
                                                          ),                                              
                                                          
                                        ],
                                ),
                  ),           
                ],
             ),
bottomNavigationBar: NavigationBar(
      selectedIndex: selectbottomitemindex,
      onDestinationSelected: (val) {
        setState(() {
          selectbottomitemindex = val;
          switch (selectbottomitemindex) {
        case 0:
          Navigator.of(context).pushNamed('/'); 
          break;
        case 1:
          Navigator.of(context).pushNamed('favourite'); 
          break;
        case 2:
          Navigator.of(context).pushNamed('search');
          break;
        case 3:
          Navigator.of(context).pushNamed('profile');
          break;
        case 4:
          Navigator.of(context).pushNamed('menu'); 
          break;
      }
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          label: 'Favourite',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_pin),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
    ),
  );  
  }
}