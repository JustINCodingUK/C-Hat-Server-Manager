import 'package:flutter/material.dart';

class VersionListElement extends StatelessWidget {

  final String version;
  final Uri url;

  const VersionListElement({required this.version, required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:64.0,right:64.0, top:16),
      child: Container(
        height: 48,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)
                ),
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(version, style: TextStyle(color:Colors.white),),
                  ),
                ),
              ),
            ),
    
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
                child: Container(
                  color: Colors.cyan,
                  child: Center(
                    child: InkWell( 
                      onTap: () {
                        // TODO: Implement functionality in bloc  
                      },
                      child: Text(url.toString(), style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}