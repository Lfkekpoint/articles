package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

import androidx.lifecycle.LifecycleObserver
import android.content.Intent
import android.os.Bundle
import android.view.View

interface BaseController : LifecycleObserver {

    var arguments: Bundle?
    var intent: Intent?

    fun saveInstanceState(outState: Bundle?)
    fun create(savedState: Bundle?)
    fun activityOnNewIntent()
    fun fragmentOnViewCreated(view: View?, savedInstanceState: Bundle?)
}