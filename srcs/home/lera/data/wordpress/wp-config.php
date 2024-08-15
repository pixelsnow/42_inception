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
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',          'U4fWP[_QIb+qj=6VzPM,91n_;4ZSfbKb$B0hz#f YY!5t~Dn5iC%tDx<K0&R<OQK' );
define( 'SECURE_AUTH_KEY',   'G4 @6~_:Ahz.E}F5#r]~k83U]WWJ.IShScHKE}y{HH;o.p$kU2=-qFym(AX|t-PV' );
define( 'LOGGED_IN_KEY',     '7]jf<u_G9i&jHAiYp)1-~xH=:nKwJMRem-[qS{3]H^jsuYGFId|ofMtO*]9F2Rj?' );
define( 'NONCE_KEY',         'Mokbox;xs~<.Rb#YsH2Zk/~Jci}AoC4f,tRA9~bjZ4OhU8,rO7)ge[O}<lJ)%P*L' );
define( 'AUTH_SALT',         '&`tj{.o=GjwDsnX:Cz@f%BoPAyC:6 W(xzp]`*g:FDH&,yI,`>|p~HhIbx}kUJ*8' );
define( 'SECURE_AUTH_SALT',  'Z={h0y:`Rn5Ihszkh 7&Y!j`y|r6gN+}I@=S1gt:gT[4+{yxMaz,Hjx]z(_#It+]' );
define( 'LOGGED_IN_SALT',    'Vu*uXV.>@yDo{*N0_oEMKx5[`,(U}~PSRt3JvX>AlqGNo^~WxS.DYnESq/O1^}!K' );
define( 'NONCE_SALT',        'mT|n|F$8*(4Rp|#dP<:9)TN=+o(FHIC2}n?<.oL.Tq%.tnwU_,(hI%)eAd(ZvEzR' );
define( 'WP_CACHE_KEY_SALT', 'z/bBZ>eTySV}d6m91@J}z1p?EU:Pf;)vu{@5V:4g6}M1T[h_6MzcV&Pc&`;_)|6#' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
