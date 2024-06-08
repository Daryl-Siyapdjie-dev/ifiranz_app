// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../infrastructure/utils/common_import.dart';
//
// @RoutePage()
// class AboutUsScreen extends StatefulWidget {
//   const AboutUsScreen({super.key});
//
//   @override
//   State<AboutUsScreen> createState() => _AboutUsScreenState();
// }
//
// class _AboutUsScreenState extends State<AboutUsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Enable virtual display.
//   }
//
//   bool isLoading = true;
//
//   late final controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },
//         onPageStarted: (String url) {
//           if (mounted) {
//             setState(() {
//               isLoading = true;
//             });
//           }
//         },
//         onPageFinished: (String url) {
//           if (mounted) {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         },
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//           if (!request.url.startsWith('https://sites.google.com')) {
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse('https://sites.google.com/view/traffic-quiz/accueil'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "A propos de Traffic",
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ),
//       body: Stack(
//         children: <Widget>[
//           WebViewWidget(controller: controller),
//           isLoading
//               ? Center(
//                   child: CircularProgressIndicator(
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
