<?php

if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
    die;
}

$limit_login_options = [
	'limit_login_allowed_lockouts',
	'limit_login_allowed_retries',
	'limit_login_client_type',
	'limit_login_cookies',
	'limit_login_lockout_duration',
	'limit_login_lockout_notify',
	'limit_login_long_duration',
	'limit_login_notify_email_after',
	'limit_login_valid_duration',
	'limit_login_retries',
	'limit_login_retries_valid',
	'limit_login_lockouts',
	'limit_login_lockouts_total',
	'limit_login_logged',
];

foreach ($options as $option) {
	delete_option($option);
}
