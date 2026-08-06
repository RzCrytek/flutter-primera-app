import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("FOR YOU"),
                Text("READ"),
                Text("LOOK"),
                Text("WATCH"),
              ],
            ),
            const SizedBox(height: 16),
            Image.network(
              "https://thumbs.dreamstime.com/b/la-estatua-de-abraham-lincoln-sentado-en-una-silla-el-monumento-al-centro-comercial-nacional-washington-dc-usa-sentada-estados-302951708.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            Container(
              margin: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "READ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text("What is Lorem Ipsum?"),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London,",
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://picsum.photos/200/300",
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("FOR YOU"),
//               Text("READ"),
//               Text("LOOK"),
//               Text("WATCH"),
//             ],
//           ),
//           SizedBox(height: 16),
//           Image.network(
//             "https://thumbs.dreamstime.com/b/la-estatua-de-abraham-lincoln-sentado-en-una-silla-el-monumento-al-centro-comercial-nacional-washington-dc-usa-sentada-estados-302951708.jpg",
//             width: 250,
//             height: 100,
//             fit: BoxFit.cover,
//           ),
//           Text("READ"),
//           Text("NEED A SECRET SCAPE"),
//           Text("These gateways are presidential"),

//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.network(
//                 "https://i.natgeofe.com/n/e075cb02-6c49-402e-97fa-7bd6e46a47a7/youth-voting-woman-in-front-of-signs.jpg?w=2880&h=1908",
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "READ",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                         letterSpacing: 1.2,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                       textAlign: TextAlign.left,
//                       maxLines: 5,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.normal,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
