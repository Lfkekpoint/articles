package ${escapeKotlinIdentifiers(packageName)}.data.base

class VoidCallException : Exception() {
    override val message = "Response Body is null"
}