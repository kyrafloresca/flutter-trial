import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginpage(),
    );
  }
}

/*class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

 /* Future<FirebaseApp> _initFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      body: loginpage(),
        /*body: FutureBuilder(
          future: _initFirebase(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return loginpage();
            }
            return const Center(
              child: CircularProgressIndicator(

              ),
            );
          },
        )
    );
  }*/
    )
}*/

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override

  /*static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth  auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInwithEmailAndPassword(email:email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("User does not exist")
      }
    }
    return user;
  }*/


  Widget build(BuildContext context) {

    //TextEditingController _emailController = TextEditingController();
    //TextEditingController _passController = TextEditingController();


    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text('Welcome to Catalog Basics',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text('LOGIN TO CONTINUE',
            style: TextStyle(
              fontSize: 20,
              //fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 44
          ),

          const TextField(
            //controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "email address",
              prefixIcon: Icon(Icons.mail)
            ),
            
          ),
          const TextField(
            //controller: _passController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "password",
              prefixIcon: Icon(Icons.lock)
            ),
          ),

          const SizedBox(
              height: 22
          ),

          Container(
            child: RawMaterialButton(
              fillColor: Colors.blue,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              onPressed: (){
                //USer? user = await loginUsingEmailPassword(email: _emailController.text, password: _passController.text, context: context);
                //print(user);
                //if(user!=null){
                Navigator.push(context,MaterialPageRoute(builder: (context) => catalogList()));
                //}
              },
              child: const Text('LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                  )
              ),
            ),
          )


        ],
      ),
      ),
    );
  }
}

class catalogList extends StatefulWidget{
  @override
  catalogListState createState() => catalogListState();
}

class catalogListState extends State<catalogList> {
  final _pieces = ['Sample Product 1', 'Sample Product 2', 'Sample Product 3', 'Sample Product 4','Sample Product 5','Sample Product 6','Sample Product 7','Sample Product 8','Sample Product 9','Sample Product 10','Sample Product 11'];
  final _savedPieces = Set();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _pieces.length * 2, //*2 for dividers
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;
          return _buildRow(_pieces[index]);
        }
    );
  }

  Widget _buildRow(String catalogPiece) {
    final inCart = _savedPieces.contains(catalogPiece);

    return ListTile(
      title: Text(catalogPiece),
      trailing: Icon(
          inCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart
      ),
      onTap: () {
        setState(() {
          if (inCart) {
            _savedPieces.remove(catalogPiece);
          } else {
            _savedPieces.add(catalogPiece);
          }
        });
      },
    );
  }

  void _pushCart() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) {
              final Iterable<ListTile> tiles = _savedPieces.map((catalogPiece) {
                return ListTile(
                  title: Text(catalogPiece),
                );
              });

              final List<Widget> divided = ListTile.divideTiles(
                  context: context, tiles: tiles).toList();

              return Scaffold(
                appBar: AppBar(
                  title: Text('SHOPPING CART'),
                ),
                body: ListView(children: divided),
              );
            }
        )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CATALOG'.toUpperCase()),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: _pushCart,
          )
        ],
      ),
      body: _buildList(),
    );
  }
}

