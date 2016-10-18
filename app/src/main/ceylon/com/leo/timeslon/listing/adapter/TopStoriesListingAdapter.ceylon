import com.leo.timeslon.common {
    GenericRecyclerViewAdapter
}
import com.leo.timeslon.listing.model {
    Result
}
import android.view {
    ViewGroup,
    LayoutInflater {
        from = from
    }
}
import com.leo.timeslon {
    R {
        Layout = layout
    }
}

shared class TopStoriesListingAdapter() extends GenericRecyclerViewAdapter<TopStoriesViewHolder, Result>(){

    shared actual void bindView(TopStoriesViewHolder holder, Result item) {
        holder.bindData(item);
    }

    shared actual TopStoriesViewHolder createHolder(ViewGroup? view) => TopStoriesViewHolder(from(view?.context).inflate(Layout.listing_item, view,false));

}