import com.leo.timeslon.listing.model {
    TopStoriesResponse
}
shared interface TopStoriesView {
    formal shared void showTopStories(Exception|TopStoriesResponse? response);
}