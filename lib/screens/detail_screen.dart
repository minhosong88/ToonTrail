import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toontrail/models/webtoon_detail_model.dart';
import 'package:toontrail/models/webtoon_episode_model.dart';
import 'package:toontrail/services/api_service.dart';
import 'package:toontrail/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: IconButton(
              onPressed: onHeartTap,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline,
              ),
            ),
          ),
        ],
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                        width: 250,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(5, 5),
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ], borderRadius: BorderRadius.circular(15)),
                        child: Image.network(widget.thumb)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
