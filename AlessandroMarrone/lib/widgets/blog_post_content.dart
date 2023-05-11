import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/blog_model.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/cards/card_post_blog.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';
import 'package:offertelavoroflutter_it_app/widgets/open_container_wrapper.dart';
import 'package:offertelavoroflutter_it_app/widgets/web_view_wrapper_widget.dart';

class BlogPostContent extends StatelessWidget {
  const BlogPostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 20.0,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        background: _background(context),
      ),
    );
  }

  Widget _background(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: _body(context),
            ),
            const SizedBox(
              height: 18.0,
            ),
          ],
        ),
      );

  Widget _header(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)?.title_tips ?? "title_tips",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
            ),
            OpenContainerWrapper(
              closedBuilder: (context, openContainer) => InkWell(
                onTap: openContainer,
                child: Text(
                  AppLocalizations.of(context)?.title_see_all ??
                      "title_see_all",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: K.secondaryColor,
                  ),
                ),
              ),
              transitionType: ContainerTransitionType.fadeThrough,
              child: _buildPostsView(
                context,
                body: const WebViewWrapperWidget(url: K.blogFudeoBaseUrl),
              ),
            ),
          ],
        ),
      );

  Widget _body(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogPosts.length,
          itemBuilder: (context, index) => OpenContainerWrapper(
            closedBuilder: (context, openContainer) => CardPostBlog(
              title: blogPosts[index].title,
              image: blogPosts[index].image,
              url: blogPosts[index].url,
              openContainer: openContainer,
            ),
            transitionType: ContainerTransitionType.fadeThrough,
            child: _buildPostsView(
              context,
              body: WebViewWrapperWidget(
                url: blogPosts[index].url,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 16.0,
          ),
        ),
      );

  Widget _buildPostsView(BuildContext context, {required Widget body}) =>
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.title_view_blog ??
              "title_view_blog"),
          leading: IconItem(
            icon: LucideIcons.x,
            onTap: () => context.router.pop(),
          ),
        ),
        body: body,
      );
}
