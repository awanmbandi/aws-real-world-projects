<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'xxxxx' );

/** Database username */
define( 'DB_USER', 'xxxxx' );

/** Database password */
define( 'DB_PASSWORD', 'xxxxx' );

/** Database hostname */
define( 'DB_HOST', 'xxxxx' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'MMP)Q-6aTsThc^A$3.e91^?ifFWKRZ-fe(~XOJ.~i.$ Qz|tZ>h|Nu3^T !sLa7C');
define('SECURE_AUTH_KEY',  '%]{}>9LSV.J%:%i|+o~Ni^MvGXUSMGLaQ[+ 78H+@LMUWsp;0+Va}R?n=),D<|vg');
define('LOGGED_IN_KEY',    '|^dcvV>q5r1K[!&c,;`v~8vKgo~;o}QC3FaeN-F}4>o1e`G0Z|YdXg+Yvi{((9Og');
define('NONCE_KEY',        ' Mu{cg]*v&$t$na41gW+qxF{vH?_<&qqJ59#@F:}bej&IVoT4zA*!(GAFPd|e93N');
define('AUTH_SALT',        '&V`L/VNG3gK/4KME>Mqo~O/vc5#*+GO[-ZrN/`D@dVbd~$BFb`IkTgu@Z|!ql5Y9');
define('SECURE_AUTH_SALT', '7cWiYv%TG-eX&|arVaUHK^0=D<wW :l|-X3TDYtaZO?%X Z_-|vIzp!Z?Bf^{8T:');
define('LOGGED_IN_SALT',   '+0PRX,+a|6*m9|8@Q@pCj9Z*06Zn-wdi%^<l],`XB$9tB&@jf{.=Y$m5F]8l3]vQ');
define('NONCE_SALT',       'JPp]2xb:PIS+TA_n/1Gu9r@!nwsRX6v+cs_%jaQ++ViU@{Qp]I9kR%S2zeGPaQs-');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';