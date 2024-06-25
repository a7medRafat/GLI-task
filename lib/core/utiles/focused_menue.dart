// import 'package:flutter/material.dart';
//
// class FocusedMenu {
//   Widget focused(context, index) => FocusedMenuHolder(
//         onPressed: () {},
//         menuWidth: MediaQuery.of(context).size.width * 0.50,
//         menuBoxDecoration: const BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.all(Radius.circular(15.0))),
//         duration: const Duration(milliseconds: 2),
//         animateMenuItems: true,
//         openWithTap: true,
//         blurSize: 3.0,
//         bottomOffsetHeight: 100,
//         menuItemExtent: 45,
//         menuItems: <FocusedMenuItem>[
//           FocusedMenuItem(
//               title: Text('Delete',
//                   style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                         fontSize: 13,
//                         color: Colors.white,
//                       )),
//               trailingIcon:
//                   const Icon(IconBroken.Delete, color: Colors.white, size: 20),
//               backgroundColor: Colors.redAccent,
//               onPressed: () {
//                 FeedsCubit.get(context)
//                     .deletePost(di.sl<FeedsCubit>().postId[index]);
//               }),
//         ],
//         child: const Icon(
//           Icons.more_vert,
//           color: Colors.white,
//         ),
//       );
// }
