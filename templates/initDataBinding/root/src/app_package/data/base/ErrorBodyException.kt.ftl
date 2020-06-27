package ${escapeKotlinIdentifiers(packageName)}.data.base

class ErrorBodyException(override val message: String, val code: Int) : Exception()