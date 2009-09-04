/*
*  The SearchControl manages searchers and draws a UI for them.  However,
*  searchers can be used by themselves without the SearchControl.  This is
*  called using a "Raw Searcher".  When doing this, you must handle and draw
*  the search results manually.
*/

google.load('search', '1');

var webSearch;

function addPaginationLinks() {
  // The cursor object has all things to do with pagination
  var cursor = webSearch.cursor;
  var curPage = cursor.currentPageIndex; // check what page the app is on
  var pagesDiv = document.createElement('div');
  for (var i = 0; i < cursor.pages.length; i++) {
    var page = cursor.pages[i];
    if (curPage == i) { // if we are on the curPage, then don't make a link
      var label = document.createTextNode(' ' + page.label + ' ');
      pagesDiv.appendChild(label);
    } else {
      // If we aren't on the current page, then we want a link to this page.
      // So we create a link that calls the gotoPage() method on the searcher.
      var link = document.createElement('a');
      link.href = 'javascript:webSearch.gotoPage('+i+');';
      link.innerHTML = page.label;
      link.style.marginRight = '2px';
      pagesDiv.appendChild(link);
    }
  }

  var contentDiv = document.getElementById('content');
  contentDiv.appendChild(pagesDiv);
}

function searchComplete() {
  // Check that we got results
  if (webSearch.results && webSearch.results.length > 0) {
    // Grab our content div, clear it.
    var contentDiv = document.getElementById('content');
    contentDiv.innerHTML = '';

    // Loop through our results, printing them to the page.
    var results = webSearch.results;
    for (var i = 0; i < results.length; i++) {
      // For each result write it's title and image to the screen
      var result = results[i];
      var resultContainer = document.createElement('div');

      var title = document.createElement('div');
      // We use titleNoFormatting so that no HTML tags are left in the title
      title.innerHTML = result.titleNoFormatting;

      resultContainer.appendChild(title);

      // Put our title + image in the content
      contentDiv.appendChild(resultContainer);
    }

    // Now add the paging links so the user can see more results.
    addPaginationLinks(webSearch);
  }
}

function OnLoad() {
  // Our ImageSearch instance.
  webSearch = new google.search.WebSearch();

  // Restrict to extra large images only
  webSearch.setSiteRestriction("insight.commandc.com");

  // Here we set a callback so that anytime a search is executed, it will call
  // the searchComplete function and pass it our ImageSearch searcher.
  // When a search completes, our ImageSearch object is automatically
  // populated with the results.
  webSearch.setSearchCompleteCallback(this, searchComplete, null);

	google.search.Search.getBranding(document.getElementById("google_branding"));
	

	// Cheat by using some jQuery
	$("#google_search_form").submit( function(event) {
		webSearch.execute($("input#search").val());
		event.preventDefault();
	})

}
google.setOnLoadCallback(OnLoad);