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
	pagesDiv.setAttribute("id","search_results_pagination");
	if (curPage > 0) {
		var link = document.createElement('a');
    link.href = 'javascript:webSearch.gotoPage('+ (curPage-1) +');';
    link.innerHTML = "<< Prev";
    link.style.marginRight = '2px';
    pagesDiv.appendChild(link);
	}
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
	if (curPage < (cursor.pages.length-1)) {
		var link = document.createElement('a');
    link.href = 'javascript:webSearch.gotoPage('+ (curPage+1) +');';
    link.innerHTML = "Next >>";
    link.style.marginRight = '2px';
    pagesDiv.appendChild(link);
	}

  var contentDiv = document.getElementById('search_results_container');
  contentDiv.appendChild(pagesDiv);
}

function searchComplete() {
	// Grab our content div, clear it.
  var contentDiv = document.getElementById('search_results_container');
  contentDiv.innerHTML = '';

  // Check that we got results
  if (webSearch.results && webSearch.results.length > 0) {
   
    // Loop through our results, printing them to the page.
    var results = webSearch.results;
		var resultsContainer = document.createElement('div');
		resultsContainer.setAttribute("id","search_results");
    for (var i = 0; i < results.length; i++) {
      // For each result write it's title and image to the screen
      var result = results[i];
      var resultContainer = document.createElement('div');
			resultContainer.setAttribute("class","search_result");

      var title = document.createElement('div');
			title.setAttribute("class","search_result_title");
			
			var link = document.createElement('a');
			link.href = result.unescapedUrl;
			link.target = "_blank";
			
      // We use titleNoFormatting so that no HTML tags are left in the title
      link.innerHTML = result.titleNoFormatting;
			title.appendChild(link);

      resultContainer.appendChild(title);

			content = document.createElement('div');
			content.setAttribute("class","search_result_content");
			content.innerHTML = result.content;
			
			resultContainer.appendChild(content);

      // Put our title + image in the content
			
      resultsContainer.appendChild(resultContainer);
    }
		contentDiv.appendChild(resultsContainer);
    // Now add the paging links so the user can see more results.
    addPaginationLinks(webSearch);
  } else {
		contentDiv.innerHTML = "<div id=\"no_search_result\">There were no results for your search.</div>";
	}
	// Add close button
	var closeDiv = document.createElement('div');
	var closeLink = document.createElement('a');
	closeLink.setAttribute("id","close_search_results");
	closeLink.innerHTML = "[X] close";
	closeDiv.appendChild(closeLink);
	contentDiv.appendChild(closeDiv);
	$("#close_search_results").click( function(event) {
		$("#search_results_container").hide().html("");
	});
	// cheat with jQuery to show results
	$(contentDiv).show();
}

function OnLoad() {
  // Our ImageSearch instance.
  webSearch = new google.search.WebSearch();
	webSearch.setResultSetSize(google.search.Search.LARGE_RESULTSET);

  // Restrict to extra large images only
  // webSearch.setSiteRestriction("insight.commandc.com");

  // Here we set a callback so that anytime a search is executed, it will call
  // the searchComplete function and pass it our ImageSearch searcher.
  // When a search completes, our ImageSearch object is automatically
  // populated with the results.
  webSearch.setSearchCompleteCallback(this, searchComplete, null);

	google.search.Search.getBranding(document.getElementById("google_branding"));
	

	// Cheat by using some jQuery
	$("#google_search_form").bind("submit", function(event) {
		webSearch.execute($("input#search").val());
		event.preventDefault();
	})

}
google.setOnLoadCallback(OnLoad);