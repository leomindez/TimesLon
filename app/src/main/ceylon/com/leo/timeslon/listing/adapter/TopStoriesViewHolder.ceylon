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
import android.widget {
    TextView,
    ImageView
}

import ceylon.interop.java { javaString }

import com.bumptech.glide {
    Glide
}

shared class TopStoriesViewHolder(View view) extends GenericViewHolder<Result>(view){
    shared actual void bindData(Result item) {
     assert (is TextView titleArticle = view. findViewById(R.Id.article_title));
        titleArticle.text = javaString(item.title);

        assert (is ImageView imageArticle = view.findViewById(R.Id.article_image));
            if(item.multimedia.size() > 0) {
                Glide.with(imageArticle.context).load(item.multimedia.get(3).url).into(imageArticle);
            }
    }

}