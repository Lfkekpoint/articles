package com.lfkekpoint.listadapters.presentation.base.list.simple

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.lfkekpoint.listadapters.presentation.base.list.IBaseListAdapter
import com.lfkekpoint.listadapters.presentation.base.list.IBaseListItem

abstract class SimpleListAdapter : RecyclerView.Adapter<RecyclerView.ViewHolder>(), IBaseListAdapter<IBaseListItem> {

    protected val items: ArrayList<IBaseListItem> = ArrayList()

    override fun getItemCount() = items.size
    override fun getItemViewType(position: Int) = items[position].layoutId

    protected fun inflateByViewType(context: Context?, viewType: Int, parent: ViewGroup) =
            LayoutInflater.from(context).inflate(viewType, parent, false)

    override fun add(newItem: IBaseListItem) {
        items.add(newItem)
        notifyDataSetChanged()
    }

    override fun add(newItems: ArrayList<IBaseListItem>?) {

        for (newItem in newItems ?: return) {
            items.add(newItem)
            notifyDataSetChanged()
        }
    }

    override fun addAtPosition(pos: Int, newItem: IBaseListItem) {
        items.add(pos, newItem)
        notifyDataSetChanged()
    }

    override fun clearAll() {
        items.clear()
        notifyDataSetChanged()
    }

    override fun remove(position: Int) {
        items.removeAt(position)
        notifyDataSetChanged()
    }
}