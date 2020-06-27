package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm

import android.content.Intent
import android.os.Bundle
import android.view.View
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.BaseController

abstract class BaseViewModel : BaseController {

    override var arguments: Bundle? = null
    override var intent: Intent? = null

    override fun saveInstanceState(outState: Bundle?) {}
    override fun fragmentOnViewCreated(view: View?, savedInstanceState: Bundle?) {}
    override fun create(savedState: Bundle?) {}
    override fun activityOnNewIntent() {}
}
