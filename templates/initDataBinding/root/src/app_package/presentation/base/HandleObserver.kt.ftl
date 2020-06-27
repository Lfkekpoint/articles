package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

import androidx.lifecycle.Observer
import im.raketa.greedyCustomer.domain.base.Resource

class HandleObserver<T>(

        private val mView: IBaseView,
        private val handleAction: (data: T) -> Unit

) : Observer<Resource<T>> {

    override fun onChanged(t: Resource<T>?) {
        t?.data?.let { handleAction.invoke(it) } ?: t?.cancelRequest(mView)
    }
}