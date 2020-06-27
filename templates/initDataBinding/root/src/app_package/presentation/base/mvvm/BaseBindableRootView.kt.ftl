package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm

import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.BaseRootView

interface BaseBindableRootView : BaseRootView {
    val variableId: Int
    override val controller: BaseViewModel?
}