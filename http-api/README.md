# An Accepting API

This challenge builds on the HTTP server you produced in the HTTP Server Challenge. If you haven't finished it, you'll need to complete that challenge before starting this one.

Ready? Let's begin.

Right now your HTTP server only sends HTML, which is handy for browsers, but not as useful for people writing tools that use your server. HTTP isn't just used for web browsers. Many kinds of software use HTTP that never even touch a web browser.

Let's build just such a piece of software. We want to write a command-line tool that does this:

```
$./user-visits matt
matt has hit the server 31 times.
```


## chmod +x
To be clear, `user-vists` is a command line tool we're going to write. To make a ruby script executable follow these steps:

* We typically _remove_ the extension `.rb`
* Add `#!/usr/bin/env ruby` to the top of your file
* `chmod +x my_file`
* `./my_file`

## Release 1, Beginning of the API Endpoint

Before we can build a client, we need to add a resource on our server that our command-line tool can access to get the visit count.

Let's add a resource at `/api/visits`. It should take a query parameter `user`, the username of the user for which we'd like to fetch the number of times they've visited the site.

We want to use this resource for code, and HTML isn't a very easy format to consume in code (just see Nokogiri). JSON is a better choice, since it's easy to parse and Ruby has a built-in JSON parser.

Add the resource `/api/visits` and have it return some JSON with the user and visit count. You should be able to use it with `curl` like this:

```
$ curl http://127.0.0.1:2000/api/visits?user=matt
{"user":"matt", "count":31}
```

## Release 2, Switch Hitter
Of course, if a _browser_ hits that API route, we'd like to show HTML instead of JSON. We're just that nice.

But how do we do it?

**A different HTTP method?**
Regardless of what format we want, this is still a simple `GET` action on that resource. So we don't want this to be a different HTTP method.

**How about the User-Agent?**
First, user agents aren't particularly reliable. They can be set to anything, and they don't make a lick of sense anyway:

```
Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36
```

> _"During the first browser war, many web servers were configured to only send web pages that required advanced features to clients that were identified as some version of Mozilla. Other browsers were considered to be older products such as Mosaic, Cello or Samba and would be sent a bare bones HTML document."_ —[User Agent: Format For Human-Operated Browser](http://en.wikipedia.org/wiki/User_agent)

Ah, the first browser war. We lost many a good soul.

Even if we did detect the client, we can't _assume_ they want HTML or JSON. I might want to use `curl` to get the HTML version some day. So the user agent's out.

**Query parameter?**
That's not such a bad idea, but before we go down that road, let's ask ourselves: _could sending data back in different formats be a common problem in HTTP? If so, has the problem already been solved?_

You bet it has.

### Be Accepting

HTTP has a way for clients to specify the _format_ they want the information about a resource in. A client can say "I'd like JSON" or "I'd like HTML".

Clients issuing HTTP requests can use the `Accept` header to specify the format they want, and the server can set `Content-Type` in the response header to let the client know what kind of content is coming back. You'll want to read up on those:

- [HTTP Request Headers](http://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_fields)
- [HTTP Response Headers](http://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_fields)

If the client's `Accept` header indicates a requested content-type of `application/json` then the server should return a JSON response containing the number of times that user has requested a page.

If the client's `Accept` header is `text/html` (or if the header isn't there) then provide an HTML representation of the user/visits information.

For example, a client requesting `/api/visits?user=matt` as `application/json` might get:

```
{"user":"matt", "count":31}
```

And a client requesting `/api/visits?user=matt` as `text/html` might get:

```
<html>
<head>
  <title>matt Visit Count</title>
</head>
<body>
  <h1>Visits</h1>
  <p>31</p>
</body>
</html>
```

You can test it with your favorite HTTP swiss army knife:

```
$ curl -H "Accept: application/json" -X GET http://127.0.0.1:2000/api/visits?user=matt
{"user":"matt", "count":31}

$ curl -H "Accept: text/html" -X GET http://127.0.0.1:2000/api/visits?user=matt
<html>
<head>
  <title>matt Visit Count</title>
</head>
<body>
  <h1>Visits</h1>
  <p>31</p>
</body>
</html>
```

Make sure the code that handles providing different response formats based on `Accept` is tested.

## Release 3, The Client
Ok, our server's set up with a resource that represents the visit count for a given user. It also lets use retrieve that count as JSON or HTML depending on the `Accept` header.

Now let's build our command-line app. Remember, our end result is a script like this:

```
$./user-visits matt
matt has hit the server 31 times.
```

You have two choices on this:

### The hard way
[TCPSocket](http://ruby-doc.org/stdlib-1.9.3/libdoc/socket/rdoc/TCPSocket.html) is Ruby's client complement to TCPServer. You can use it to make a simple HTTP request to your server by hand.

### The easier way
You've already written HTTP requests by hand a few times when you tested your server with netcat. Instead of doing an HTTP request over TCP manually, you can use Ruby's HTTP client, Net::HTTP.

### Either way
Your client will hit `/api/visits` and provide the 'user' query parameter from the command-line argument. It will to need the pass the right headers to produce a valid request as well as retrieve JSON from the server. When it comes back, parse the JSON and provide the sample output.
