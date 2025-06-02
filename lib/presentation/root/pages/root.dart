import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        picture: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return SizedBox(
      height: 148,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.homeTopPattern),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 90),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AppImages.homeArtist),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
      labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      indicatorColor: Theme.of(context).primaryColor,
      tabAlignment: TabAlignment.center,
      tabs: [
        const Text('News'),
        const Text('Videos'),
        const Text('Artists'),
        const Text('Podcasts'),
      ],
    );
  }
}
