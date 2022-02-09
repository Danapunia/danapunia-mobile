part of '../../pages/view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) => !_.isLoading
          ? Scaffold(
              body: Column(
                children: [
                  const HomePageAppBar(),
                  // HomePagePuniaSearch(),
                  const HomePagePuniaFilter(),
                  Expanded(
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: _.fetchApi,
                      onLoading: _.loadNextData,
                      header: const MaterialClassicHeader(),
                      controller: _.refreshController,
                      child: const SingleChildScrollView(
                        child: HomePagePuniaList(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const HomePageShimmerEffect(),
    );
  }
}
