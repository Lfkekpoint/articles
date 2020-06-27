package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.tapBar

import android.os.Bundle
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm.BaseBindableFragment
import ${escapeKotlinIdentifiers(packageName)}.presentation.modules.tabBar.TabBarActivity

abstract class TabBarFragment : BaseBindableFragment() {

    var tabBarPosition: Int? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        tabBarPosition = arguments?.getInt(EXTRA_TAB_BAR_POSITION)
    }

    //todo simplify check
    override fun onResume() {
        super.onResume()

        if (activity is TabBarActivity?) {
            tabBarPosition?.let { (activity as TabBarActivity?)?.controller?.accentPosition(it) }
        }
    }

    companion object {
        val EXTRA_TAB_BAR_POSITION = "EXTRA_TAB_BAR_POSITION"
    }
}