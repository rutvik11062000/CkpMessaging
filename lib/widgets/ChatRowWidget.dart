import 'package:ckpmessaging/config/Assets.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: Image.asset(Assets.user).image,
        ),
        trailing: Text(
          DateFormat('kk:mm')
              .format(DateTime.fromMillisecondsSinceEpoch(1565888474278)),
        ),
        title: Text("Rutvik"),
        subtitle: Text("hi whatsapp"),
      ),
    );
  }
}

// padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
//   child: Row(
//     children: <Widget>[
//       Expanded(
//         flex: 8,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 30,
//               backgroundImage: Image.asset(
//                 Assets.user,
//               ).image,
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Container(
//                 child: Column(
//                   children: <Widget>[
//                     Text('John Doe', style: Styles.textHeading),
//                     Text(
//                       'What\'s up?',
//                       style: Styles.subHeadingLight,
//                     )
//                   ],
//                 ))
//           ],
//         ),
//       ),
//       Expanded(
//         flex: 2,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               DateFormat('kk:mm').format(
//                   DateTime.fromMillisecondsSinceEpoch(1565888474278)),

//             )
//           ],
//         ),
//       )
//     ],
//   )
