package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

interface AdditionalFragmentView {

    fun setSystemBarColor(color: Int)
    fun hideKeyboardIfNeed()
}