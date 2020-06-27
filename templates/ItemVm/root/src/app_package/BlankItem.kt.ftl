package ${escapeKotlinIdentifiers(packageName)}.presentation.modules.${moduleName}

import ${escapeKotlinIdentifiers(packageName)}.R
import ${escapeKotlinIdentifiers(packageName)}.BR
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.list.mvvm.IBaseItemVm

class ${itemName}Item : IBaseItemVm {

    override val brVariableId = BR.vm${itemName}
    override val layoutId = R.layout.${layoutName}
}