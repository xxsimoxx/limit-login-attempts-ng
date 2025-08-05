=== Limit Login Attempts NG ===
Tags: login, security, authentication
Requires at least: 2.8
Requires CP: 2.0
Requires PHP: 7.4

Limit rate of login attempts, including by way of cookies, for each IP. Fully customizable.

== Description ==

Limit the number of login attempts possible both through normal login as well as using auth cookies.

By default WordPress allows unlimited login attempts either through the login page or by sending special cookies. This allows passwords (or hashes) to be brute-force cracked with relative ease.

Limit Login Attempts blocks an Internet address from making further attempts after a specified limit on retries is reached, making a brute-force attack difficult or impossible.

This plugin is a fork of Limit Login Attempts Copyright 2008 - 2012 Johan Eenfeldt

Features

* Limit the number of retry attempts when logging in (for each IP). Fully customizable
* Limit the number of attempts to log in using auth cookies in same way
* Informs user about remaining retries or lockout time on login page
* Optional logging, optional email notification
* Handles server behind reverse proxy
* It is possible to whitelist IPs using a filter. But you probably shouldn't. :-)

Translations: Bulgarian, Brazilian Portuguese, Catalan, Chinese (Traditional), Czech, Dutch, Finnish, French, German, Hungarian, Norwegian, Persian, Romanian, Russian, Spanish, Swedish, Turkish

Plugin uses standard actions and filters only.

== Installation ==

1. Download and extract plugin files to a wp-content/plugin directory.
2. Activate the plugin through the WordPress admin interface.
3. Customize the settings on the options page, if desired. If your server is located behind a reverse proxy make sure to change this setting.

If you have any questions or problems please make a post here: http://wordpress.org/tags/limit-login-attempts

== Frequently Asked Questions ==

= Why not reset failed attempts on a successful login? =

This is very much by design. Otherwise you could brute force the "admin" password by logging in as your own user every 4th attempt.

= What is this option about site connection and reverse proxy? =

A reverse proxy is a server in between the site and the Internet (perhaps handling caching or load-balancing). This makes getting the correct client IP to block slightly more complicated.

The option default to NOT being behind a proxy -- which should be by far the common case.

= How do I know if my site is behind a reverse proxy? =

You probably are not or you would know. We show a pretty good guess on the option page. Set the option using this unless you are sure you know better.

= Can I whitelist my IP so I don't get locked out? =

First please consider if you really need this. Generally speaking it is not a good idea to have exceptions to your security policies.

That said, there is now a filter which allows you to do it: "limit_login_whitelist_ip".

Example:
function my_ip_whitelist($allow, $ip) {
	 return ($ip == 'my-ip') ? true : $allow;
}
add_filter('limit_login_whitelist_ip', 'my_ip_whitelist', 10, 2);

Note that we still do notification and logging as usual. This is meant to allow you to be aware of any suspicious activity from whitelisted IPs.

= I locked myself out testing this thing, what do I do? =

Either wait, or:

If you know how to edit / add to PHP files you can use the IP whitelist functionality described above. You should then use the "Restore Lockouts" button on the plugin settings page and remove the whitelist function again.

If you have ftp / ssh access to the site rename the file "wp-content/plugins/limit-login-attempts/limit-login-attempts.php" to deactivate the plugin.

If you have access to the database (for example through phpMyAdmin) you can clear the limit_login_lockouts option in the wordpress options table. In a default setup this would work: "UPDATE wp_options SET option_value = '' WHERE option_name = 'limit_login_lockouts'"
