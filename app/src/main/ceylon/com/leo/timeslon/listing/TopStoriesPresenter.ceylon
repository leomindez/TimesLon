import com.leo.timeslon.network {
    ServiceNetwork
}
import com.leo.timeslon.listing.model {
    TopStoriesResponse
}
import com.leo.timeslon.listing.view {
    TopStoriesView
}

shared class TopStoriesPresenter() {

    shared void getTopStories(String endpoint, Anything(Exception|TopStoriesResponse?) | TopStoriesView callback ){
        ServiceNetwork serviceNetwork = ServiceNetwork();

        serviceNetwork.getStoriesFrom<TopStoriesResponse>(endpoint, (Exception | TopStoriesResponse? response){
            if(is TopStoriesView callback) {
                callback.showTopStories(response);
            }else {
                callback(response);
            }
        });
    }



}