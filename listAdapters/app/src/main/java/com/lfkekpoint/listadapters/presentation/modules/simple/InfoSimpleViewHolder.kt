package com.lfkekpoint.listadapters.presentation.modules.simple

import androidx.recyclerview.widget.RecyclerView
import android.view.View
import kotlinx.android.synthetic.main.item_info_simple.view.*

class InfoSimpleViewHolder(view: View) : RecyclerView.ViewHolder(view) {
    val tvTitle = view.tv_info_title
    val tvValue = view.tv_info_value
}