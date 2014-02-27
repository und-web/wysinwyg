wysinwyg
========

_What You See Is Not What You Get_

The premise here is pretty simple - we want it to be easy for our CMS users to enter structured data and have it look great on the website. The problem is, a WYSIWYG-style editor can make that kind of difficult. Enter, the table-snippet-XSL-transformed-data-structure.

How this works is:
-	The user chooses an OU Campus snippet for the type of information they want to display. (e.g. a list of faculty)
-	That snippet consists of a table with columns for the faculty member's name, their area of expertise, etc.
-	The table has a specific class pre-assigned; in this case, "wysinwyg-people".
-	On publish, there is an XSL transformation that takes the information in each table cell and puts it where ever it goes in a more complicated HTML structure (e.g. the first cell in each row goes inside a `<h1 class="name" />`, the second goes into a `<div class="background-info />`, etc).
-	The end result is a consistent and perfectly-structured HTML file.
-	

Because the snippets are tables, the WYSIWYG makes it very easy to modify the contents of the snippet without accidentally leaving extra `<div>`s all over the place. Users can easily see what content goes where, and they don't mind that it doesn't look exactly like it will on the published site.
