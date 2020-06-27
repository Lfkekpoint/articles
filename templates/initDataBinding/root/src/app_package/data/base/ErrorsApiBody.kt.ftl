package ${escapeKotlinIdentifiers(packageName)}.data.base

class ErrorsApiBody {
    var errors: ArrayList<ErrorApi>? = null
}

class ErrorApi {
    var detail: String? = null
    var title: String? = null
}