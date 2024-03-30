// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/state/bloc/get_comments/get_comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentariesNotice extends StatefulWidget {
  const CommentariesNotice({
    Key? key,
    required this.idNews,
  }) : super(key: key);

  final String idNews;

  @override
  State<CommentariesNotice> createState() => _CommentariesNoticeState();
}

class _CommentariesNoticeState extends State<CommentariesNotice> {
  late GetCommentsBloc getCommentsBloc;

  @override
  void initState() {
    SetupBinds.setupBindsComments(widget.idNews);

    getCommentsBloc = binds.get<GetCommentsBloc>();
    getCommentsBloc.add(GetCommentsStarted());
    super.initState();
  }

  @override
  void dispose() {
    SetupBinds.disposeBindsComments();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCommentsBloc, GetCommentsState>(
      bloc: getCommentsBloc,
      builder: (context, stateList) {
        return Column(
          children: [
            Row(
              children: [
                Text("Comments:", style: Style.defaultTextStyle.copyWith(fontSize: 22)),
                const Spacer(),
                ButtonBorderPrimary(
                  // onTap: () => context.pushNamed("notices_edit"),
                  paddingV: 3,
                  child: Row(
                    children: [
                      Text("Add Comment", style: Style.defaultLightTextStyle),
                      8.sizeW,
                      Icon(Icons.message, size: 15, color: ColorsApp.kWhite),
                    ],
                  ),
                ),
              ],
            ),
            15.sizeH,
            if (stateList is GetCommentsProgress) const CircularProgressIndicator(),
            if (stateList is GetCommentsSuccess)
              for (int index = 0; index < stateList.listComments.length; index++)
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  tileColor: ColorsApp.kPrimary,
                  leading: CircleAvatar(
                    backgroundColor: ColorsApp.kWhite,
                    child: Icon(
                      Icons.person,
                      color: ColorsApp.kPrimary,
                    ),
                  ),
                  title: Text(stateList.listComments[index].name,
                      style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 22)),
                  subtitle: Text(stateList.listComments[index].comment, style: Style.defaultLightTextStyle),
                  trailing: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: ColorsApp.kWhite, borderRadius: BorderRadius.circular(10)),
                      child: Text("Edit/Remove", style: Style.primaryTextStyle.copyWith(fontWeight: FontWeight.w500))),
                ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: stateList.listComments.length,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (_, index) {
            //       return ListTile(
            //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            //         tileColor: ColorsApp.kPrimary,
            //         leading: CircleAvatar(
            //           backgroundColor: ColorsApp.kWhite,
            //           child: const Icon(Icons.person),
            //         ),
            //         title: Text(stateList.listComments[index].name,
            //             style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 22)),
            //         subtitle: Text(stateList.listComments[index].comment, style: Style.defaultLightTextStyle),
            //         trailing: Container(
            //             padding: const EdgeInsets.all(5),
            //             decoration: BoxDecoration(color: ColorsApp.kWhite, borderRadius: BorderRadius.circular(10)),
            //             child:
            //                 Text("Edit/Remove", style: Style.primaryTextStyle.copyWith(fontWeight: FontWeight.w500))),
            //       );
            //     }),
            20.sizeH
          ],
        );
      },
    );
  }
}
