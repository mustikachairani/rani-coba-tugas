// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuai/model/equipment_rent_model.dart';
import 'package:yuai/view/home_view.dart';
import 'package:yuai/view/loginaku_view.dart';
import 'package:yuai/view/payment_view.dart';
import 'package:yuai/view_model/loginaku_view_model.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Menggunakan ChangeNotifierProvider untuk menyediakan instance EquipmentRent
    return ChangeNotifierProvider(
      create: (context) => EquipmentRent(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        // Menentukan rute aplikasi
        routes: {
          '/': (context) => LoginViewKuKu(viewModel: LoginViewKuKuModel()),
          '/home': (context) => HomeView(),
        },
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context) => LoginViewKuKu(viewModel: LoginViewKuKuModel()),
    //     '/home': (context) => HomeView(),
    //   },
    // );
  }
}



//========================================================== buat visual =========================
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Judul'),
//               SizedBox(height: 10),
//               Text('deskripsi app'),
//               SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   fillColor: Color.fromARGB(255, 220, 220, 220),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Password', // Ganti dengan 'Password'
//                   fillColor: Color.fromARGB(255, 220, 220, 220),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomePage(),
//                     ),
//                   );
//                 },
//                 child: Text('Login'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//==============================================Sampe sini =======================================