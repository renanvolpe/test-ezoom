import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/loading_shimmer_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:coolmovies/presentation/commum_widgets/widgets/button_image_and_title.dart';
import 'package:coolmovies/presentation/state/bloc/delete_news_notices/delete_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/get_list_new_notices/get_list_new_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/post_news_notices/post_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/put_news_notices/put_news_notices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return MultiBlocListener(
      listeners: [
        //TO CHECK IF SOMETHING WAS CHANGED, IF CHANGED, CALL AGAIN LIST NOTICES
        BlocListener<PostNewsNoticesBloc, PostNewsNoticesState>(
          bloc: binds.get<PostNewsNoticesBloc>(),
          listener: (context, state) {
            if (state is PostNewsNoticesSuccess) {
              binds.get<PostNewsNoticesBloc>().add(PostNewsNoticesReseted());
              getListNewNoticesBloc.add(GetListNewNoticesStarted());
            }
          },
        ),
        BlocListener<PutNewsNoticesBloc, PutNewsNoticesState>(
          bloc: binds.get<PutNewsNoticesBloc>(),
          listener: (context, state) {
            if (state is PutNewsNoticesSuccess) {
              binds.get<PutNewsNoticesBloc>().add(PutNewsNoticesReseted());
              getListNewNoticesBloc.add(GetListNewNoticesStarted());
            }
          },
        ),
        BlocListener<DeleteNewsNoticesBloc, DeleteNewsNoticesState>(
          bloc: binds.get<DeleteNewsNoticesBloc>(),
          listener: (context, state) {
            if (state is DeleteNewsNoticesSuccess) {
              binds.get<DeleteNewsNoticesBloc>().add(DeleteNewsNoticesReseted());
              getListNewNoticesBloc.add(GetListNewNoticesStarted());
            }
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  60.sizeH,
                  ButtonBorderPrimary(
                    onTap: () => context.pushNamed("notices_edit"),
                    paddingV: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add News", style: Style.defaultLightTextStyle),
                        8.sizeW,
                        Icon(Icons.add_chart_outlined, size: 15, color: ColorsApp.kWhite),
                      ],
                    ),
                  ),
                  for (int i = 0; i < listNews.length; i += 2) ...[
                    20.sizeH,
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
      ),
    );
  }
}
