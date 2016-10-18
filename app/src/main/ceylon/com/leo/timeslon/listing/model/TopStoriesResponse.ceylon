import java.util {
    ArrayList
}

shared class TopStoriesResponse(status,copyright,section,lastUpdated,numResults,results) {
    shared String status;
    shared String copyright;
    shared String section;
    shared String lastUpdated;
    shared Integer numResults;
    shared ArrayList<Result> results;
}