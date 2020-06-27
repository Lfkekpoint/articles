package ${escapeKotlinIdentifiers(packageName)}.data.base

import androidx.lifecycle.MutableLiveData
import im.raketa.greedyCustomer.domain.base.Resource
import im.raketa.greedyCustomer.presentation.base.Const
import im.raketa.greedyCustomer.presentation.base.Const.ERROR_CODE_UNKNOWN_HOST
import retrofit2.HttpException
import java.net.SocketTimeoutException
import java.net.UnknownHostException

object ErrorHelper {

    fun processError(e: Throwable, liveData: MutableLiveData<Resource<*>>) {

        when (e) {
            is ErrorBodyException -> liveData.postValue(Resource(null, e.code, e.message))
            is UnknownHostException -> liveData.postValue(Resource(null, ERROR_CODE_UNKNOWN_HOST, "Нет подключения"))
            is HttpException -> liveData.postValue(Resource(null, 500, "Ошибка сервера"))
            is SocketTimeoutException -> liveData.postValue(Resource(null, 500, "Ошибка соединения"))
            is KotlinNullPointerException -> liveData.postValue(Resource(null, -1, "Ошибка приложения: KNPE"))
            else -> liveData.postValue(Resource(null, -1, "Ошибка приложения"))
        }
    }

    fun processUnknownHostSolvedError(liveData: MutableLiveData<Resource<*>>?) {
        liveData?.postValue(Resource(null, Const.UNDEFINED_INT, "Соединение восстановленно"))
    }
}

/*
* код 500 ошибка сервера
код 403 нет прав
код 401 неавторизован
код 404 url не найден
TODO*/