import android.view {
    View
}
import android.support.v7.widget {
    RecyclerView
}
abstract shared class GenericViewHolder<Item>(View view) extends RecyclerView.ViewHolder(view) {
    shared formal void bindData(Item item);
}