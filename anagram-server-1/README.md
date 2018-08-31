# Anagrams Web Application

## Summary
Sinatra web application backed by a database. Users provide a word, the application accesses the database to retrieve anagrams for that word, and the anagrams are listed for the user.

The purpose of building this application was to be mindful of how data flows between the client and server. The browser sends data via HTTP requests to Sinatra. After the server receives data, a controller route handler will need to ask a model to fetch anagrams. The route handler then renders a view for the data returned by the model. Finally, the server returns that rendered HTML to the browser.