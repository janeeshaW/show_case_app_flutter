import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/Images_repo.dart';
import '../../resources/string_values.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

class ArViewHome extends StatefulWidget {
  const ArViewHome({Key? key}) : super(key: key);

  @override
  State<ArViewHome> createState() => _ArViewHomeState();
}


class _ArViewHomeState extends State<ArViewHome> {

 late ARSessionManager arSessionManager;
 late ARObjectManager arObjectManager;
  ARNode? localObject;
  ARNode? webObject;


@override
  void dispose() {
  localObject = null;
  webObject = null;
  // arSessionManager = null;
  // arObjectManager = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.lblArView),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                //height: 70.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ARView(onARViewCreated: arViewCreated),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h),
                  child: ElevatedButton(onPressed: onLocalButtonPressed, child: const Text("Add/Remove local object"),),
                )),
                Expanded(child: Padding(
                  padding: EdgeInsets.only(top: 1.h,bottom: 1.h,left: 1.h),
                  child: ElevatedButton(onPressed: onWebObjectButtonPressed, child: const Text("Add/Remove web object"),),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
  void arViewCreated (ARSessionManager arSessionManager,ARObjectManager arObjectManager,ARAnchorManager arAnchorManager,ARLocationManager arLocationManager  ){
     this.arSessionManager = arSessionManager;
     this.arObjectManager = arObjectManager;

     this.arSessionManager.onInitialize(
       showFeaturePoints: false,
       showPlanes: true,
       customPlaneTexturePath: ImagesRepo.proPic,
       showWorldOrigin: true,
       handleTaps: false

     );
     this.arObjectManager.onInitialize(


     );

  }
  void onLocalButtonPressed () async{
     if(localObject != null){
       arObjectManager.removeNode(localObject!);
       localObject = null;
     } else {
       var newNode = ARNode(type: NodeType.fileSystemAppFolderGLB, uri:"v2.glb");
      // localObject = newNode;
       bool? didAddLocalNode = await arObjectManager.addNode(newNode);
       if(didAddLocalNode!){
         localObject = newNode;
       } else {
         localObject = null;
       }
     }
  }
  void onWebObjectButtonPressed () async{
    if(webObject != null){
      arObjectManager.removeNode(webObject!);
      webObject = null;
    } else {
      var newNode = ARNode(type: NodeType.webGLB, uri: "https://sketchfab.com/3d-models/space-shuttle-d6c588b68a5c4989a52182e368e044a7");
      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      if(didAddLocalNode!){
        webObject = newNode;
      } else {
        webObject = null;
      }
    }
  }
}
