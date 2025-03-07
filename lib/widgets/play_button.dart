import 'package:flutter/material.dart';
import 'package:open_media_station_base/apis/base_api.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton.icon(
          onPressed: () async {
            await BaseApi.getRefreshedHeaders();

            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => child,
              ),
            );
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text("Play"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
