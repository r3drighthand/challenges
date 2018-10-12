# Defense against the dark arts

![trust no one](http://i.imgur.com/Ptikz8a.jpg)

Before you begin, at least one other group needs to have completed the *HTTP Server Challenge* in its entirety.

In this challenge, each group will attempt to exploit another group's server. You will not have access to their code — your attack is coming "from the outside".

No need to switch workstations, you will access the other group's servers by their machine's IP.

## Connecting
Each group should run `ifconfig en0 | grep inet` at the command line to pull their local IP. You'll get output that looks like this:

```
  inet6 fe80::bae8:56ff:fe44:c69a%en0 prefixlen 64 scopeid 0x4
  inet 192.168.0.102 netmask 0xffffff00 broadcast 192.168.0.255
```

You're looking for the inet address (`192.168.0.102` on my machine), not the inet6 address.

If you don't see an inet address, try running the command with `en1` instead of `en0`.

The address you get is the address of your workstation. The group attempting to exploit your server should access your server from their machine using that IP. For example, you would attack my server at `http://192.160.0.102:2000` (note that I started my server on port 2000).

## Exploit 1, Identity Crisis
Register a new user at `/register`. When you hit `/profile` you should see a page greeting you by name.

Your goal is to be logged in as another user. In other words, you should be able to hit `/profile` and see someone _else's_ username. This is like getting access to someone else's account on Facebook.

Brainstorm how to do this, but don't share your solution with the other groups. Let everyone have a chance to think about (and wrestle with) their own solutions. This first exploit will not require Javascript.

Some food for thought:

- What is your goal in this exploit?
- What is the server using to determine who you are?
- How is the server doing that?
- What do _you_ control in this process?
- How can you use what you control to trick the server into doing what you want?

**Don't jump ahead**. The point is for you to derive this exploit yourself.

### Securing

Now it's time to fix the vulnerability. How are you going to protect against this exploit? After you implement your solution, find out how Rails handles this issue and include an explanation of it, as well as your own, in a file called `notes.txt`.

## Exploit 2, Trust Issues
**Before we continue, clear all your cookies.**

Content Delivery Networks, or CDNs, are common in the web application world. They're dedicated services with reliable servers across the globe designed to serve static files quickly. Akamai and Amazon Cloud Front are two you might have heard of.

Since CDNs are great at serving things quickly, folks often use CDN hosted versions of common libraries like jQuery so they don't have to host it themselves. You've almost certainly done this [yourself](http://jquery.com/download/#using-jquery-with-a-cdn) with jQuery's code hosted on MaxCDN.

### Setup
Each group will need to do a few things first. You'll need to run through the steps below to prep your server.

#### Clear Cookies
All groups should clear their cookies before proceeding

#### Simulate User Activity
- Add `<meta http-equiv="refresh" content="10">` to the `<head>` of `/welcome`
 - This simulates users browsing a site
- Log in to your server and visit `/welcome`, which will start reloading every 10 seconds.
 - This ensures that a session cookie will be present while `/welcome` is continuously reloading
- Let the tab with `/welcome` run in the background

#### Simulate a CDN
We'll be using our own "CDN" in this next part. The person you are attacking will be linking to a version of jQuery on your CDN server via a `<script>` tag the same way you've done in the past with MaxCDN.

To produce your pseudo-CDN, do the following:

- Create a folder that will store the contents of your CDN
- `cd` to the folder and boot a simple http server: `python -m SimpleHTTPServer`, this will boot an HTTP server serving static files in this directory on port 8000.
- Tell the person under attack to include a script tag to your version of jQuery at `http://your.ip:8000/jquery.js`

This setup simulates unwitting developers including third-party javascript on servers they don't control.

In the end, your `/welcome` page will look something like this:

```html
<html>
<head>
<title>Welcome</title>
<!-- meta refresh to simulate a user actively using the site -->
<meta http-equiv="refresh" content="10">

<!-- the url to jQuery on a "compromised CDN" at 10.0.0.1:8000 -->
<script src="https://10.0.0.1:8000/jquery.2.1.min.js"></script>
</head>
<body>
<h1>Welcome</h1>
<p>Welcome to the world's simplest web server.</p>
<ul>
#{users.map{|u| "<li>#{u[:user]}</li>"}.join("\n")}
</ul>
<p><img src='http://i.imgur.com/A3crbYQ.gif'></p>
</body>
</html>

```

#### Setup Complete?
After setup, the situation looks like this:

- The group you are attacking is including jQuery from a location you control in their layout (your python HTTP server)
- The group you are attacking is currently logged into their own site on their own machine. They're on the `/welcome` page.
- The `/welcome` page that includes jQuery is refreshing every 10 seconds, pulling in any changes you make to the Javascript they're including. They've left this window running in the background.

### The Goal
Your goal is once again to access `/profile` on their server, this time as the user they're _currently logged in as_ on their machine. This won't be as easy as last time, the cookies are encrypted and you don't know how. Once again, ask yourself:

- What is your goal in this exploit?
- What is the server using to determine who you are?
- How is the server doing that?
- What do _you_ control in this process?
- How can you use what you control to trick the server into doing what you want?

Answer the questions above, think it through, brainstorm.

### Securing
You've been hacked again, it's time to protect against this kind of exploit. This time the solution is easy — don't trust third-party Javascript. The more trustworthy the host, the more people will be determined to compromise it. Replace the script tag referencing the compromised "CDN" with a tag pointing to your own branch.

## Exploit 3, Hardly Sanitary
By now the server you're attacking isn't using third-party JS, and it should be encrypting its cookies too. However your goal remains the same: gain access to another user's account, and prove it by going to `/profile`.

As before, you'll need to do the following to setup your server to be attacked by another group:

- Clear cookies
- Log in as a user
- Visit `/welcome` if you haven't already and leave it refreshing in the background

And once again, consider:

- What is your goal in this exploit?
- What is the server using to determine who you are?
- How is the server doing that?
- What do _you_ control in this process?
- How can you use what you control to trick the server into doing what you want?

This will be the last of the exploits.

### Securing
After your server is succesfully exploited, discuss and implement a solution to protect against it in the future. Once again, find out how Rails addresses this kind of attack. Add your explanation on Rails' approach, as well as your own, to your `notes.txt` file.

## In Conclusion

### Never trust cookies
Cookies are never tamper proof. Remember from your own implementation of the cookie headers:

- The browser sends its version of the cookie jar back to the server in the form of headers on every request.
- The server must take those cookies on faith, and has no way of knowing if the browser altered some of the cookies or not.

This is the motivation behind encrypting cookies that contain sensitive data. The client may alter the cookie before sending it back with the next request, but if we make the contents of the cookies impossible to decode people can't exploit the sensitive information inside.

Of course, [there are exceptions to every rule](https://talks.devbootcamp.com/hacking-dbc-a-tale-of-cookies-and-cryptography).

### Never trust third party servers
By linking to Javascript outside your server you're effectively saying that you will execute someone else's code sight unseen. This means you're putting an enormous amount of trust in the third party host you're pulling code from. The only way to be certain is to not link to third-party code (or CSS for that matter) to begin with.

### Never trust user input
The best and safest assumption you can make is that all your users can and will attempt to hack you. That means you don't trust user input (or the user's cookies), and write your code accordingly.

The timeless [SQL Injection](http://www.unixwiz.net/techtips/sql-injection.html) exploit is another example of your users trying to make your life miserable.

### Trust no one
Sufficiently paranoid? Good. Stay that way.

![listen to taylor swift](http://i.imgur.com/A8TyuQN.jpg)
—[@swiftonsecurity](https://twitter.com/SwiftOnSecurity)
