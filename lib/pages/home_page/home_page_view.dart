part of '../../pages/view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) => !_.isLoadingInit
          ? Scaffold(
              body: Column(
                children: [
                  const HomePageAppBar(),
                  const HomePagePuniaFilter(),
                  Expanded(
                    child: _smartRefresher(
                      controller: _,
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

  SmartRefresher _smartRefresher({
    required HomePageController controller,
    required Widget child,
  }) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: controller.refreshData,
      onLoading: controller.loadNextData,
      header: const MaterialClassicHeader(),
      footer: CustomFooter(
        builder: (ctx, mode) => mode == LoadStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox(),
      ),
      controller: controller.refreshController,
      child: child,
    );
  }
}
