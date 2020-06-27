package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

interface BaseRootView : IBaseView {
    val layoutId: Int
    val controller: BaseController?
}