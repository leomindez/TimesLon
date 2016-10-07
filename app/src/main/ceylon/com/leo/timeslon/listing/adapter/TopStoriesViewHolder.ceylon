import com.leo.timeslon.common {
    GenericViewHolder
}
import com.leo.timeslon.listing.model {
    Result
}
import android.view {
    View
}

import com.leo.timeslon { R }
import com.facebook.drawee.view {
    SimpleDraweeView
}
shared class TopStoriesViewHolder(View view) extends GenericViewHolder<Result>(view){
    shared actual void bindData(Result? item) {
     /*   assert (is TextView titleArticle = view ?. findViewById(R.Id.article_title));
        titleArticle.text = item ?. title;*/
        assert(is SimpleDraweeView articleImage = view.findViewById(R.Id.article_image));
            articleImage.setImageURI(item?.multimedia?.get(3)?.url);
    }

}