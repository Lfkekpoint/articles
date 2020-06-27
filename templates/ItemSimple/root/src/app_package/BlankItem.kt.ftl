package ${escapeKotlinIdentifiers(packageName)}.presentation.modules.${moduleName}

import ${escapeKotlinIdentifiers(packageName)}.R
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.list.IBaseListItem

class ${itemName}Item(val title: String, val value: String): IBaseListItem {
    override val layoutId = R.layout.${layoutName}
}