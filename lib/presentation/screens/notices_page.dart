import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/loading_shimmer_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:coolmovies/presentation/commum_widgets/widgets/button_image_and_title.dart';
import 'package:coolmovies/presentation/state/bloc/get_list_new_notices/get_list_new_notices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({
    super.key,
  });

  @override
  State<NoticesPage> createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage> {
  late GetListNewNoticesBloc getListNewNoticesBloc;
  @override
  void initState() {
    getListNewNoticesBloc = binds.get<GetListNewNoticesBloc>();
    getListNewNoticesBloc.add(GetListNewNoticesStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetListNewNoticesBloc, GetListNewNoticesState>(
        bloc: getListNewNoticesBloc,
        builder: (context, state) {
          return switch (state) {
            GetListNewNoticesInitial() => shimmerNoticePage(),
            GetListNewNoticesProgress() => shimmerNoticePage(),
            GetListNewNoticesFailure() => const Text("Some error happened, try again latter"),
            GetListNewNoticesSuccess() => bodyGetListNotices(state.listNewsNotices),
          };
        },
      ),
    );
  }

  Widget shimmerNoticePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          15.sizeH,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: LoadingShimmerDefault(height: 60),
          ),
          for (int i = 0; i < 10; i++) ...[
            15.sizeH,
            Row(
              children: [
                15.sizeW,
                const Expanded(child: LoadingShimmerDefault(height: 100)),
                15.sizeW,
                const Expanded(child: LoadingShimmerDefault(height: 100)),
                15.sizeW,
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget bodyGetListNotices(List<NewsNotices> listNews) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                30.sizeH,
                for (int i = 0; i < listNews.length; i += 2) ...[
                  30.sizeH,
                  Row(
                    children: [
                      ButtonImageAndTitle(news: listNews[i]),
                      10.sizeW,
                      if (i + 1 < listNews.length) ButtonImageAndTitle(news: listNews[i + 1]),
                    ],
                  )
                ]
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: textfieldDecorationDefault(hintText: "Search category here", endIcon: Icons.search),
                )),
          ),
        ],
      ),
    );
  }
}
