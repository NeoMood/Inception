<?php
define('DB_NAME', 'Neo');
define('DB_USER', 'Neo02');
define('DB_PASSWORD', 'neomood02');
define('DB_HOST', 'mysql');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY',         'neo123..');
define('SECURE_AUTH_KEY',  'neo123..');
define('LOGGED_IN_KEY',    'neo123..');
define('NONCE_KEY',        'neo123..');
define('AUTH_SALT',        'neo123..');
define('SECURE_AUTH_SALT', 'neo123..');
define('LOGGED_IN_SALT',   'neo123..');
define('NONCE_SALT',       'neo123..');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
