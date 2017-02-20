import java.util {
    List
}

shared class Result (section,subsection,title,abstract,url,byline,itemType,updatedDate,createdDate,publishedDate,materialTypeFacet,kicker,desFacet,orgFacet,perFacet,geoFacet,multimedia) {

    shared String section;
    shared String subsection;
    shared String title;
    shared String abstract;
    shared String url;
    shared String byline;
    shared String itemType;
    shared String updatedDate;
    shared String createdDate;
    shared String publishedDate;
    shared String materialTypeFacet;
    shared String kicker;
    shared List<String> desFacet;
    shared List<String> orgFacet;
    shared List<String> perFacet;
    shared List<String> geoFacet;
    shared List<Multimedium> multimedia;

    shared Boolean matches(String searchString) =>
        searchString in title.lowercased;

}