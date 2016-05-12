#!/usr/bin/env bash

install_blackfire_ext() {
    # special treatment for Blackfire; we enable it if we detect a server id and a server token for it
    # otherwise users would have to have it in their require section, which is annoying in development environments


yaf_version=2.2.9
	

	curl -L "http://pecl.php.net/get/yaf-${yaf_version}.tgz" \
	    | tar xzv
	

	cd yaf-${yaf_version}
	/app/.heroku/php/bin/phpize
	./configure --with-php-config=/app/.heroku/php/bin/php-config
	

	make
	cp modules/yaf.so "$EXT_DIR/yaf.so"
	echo "extension=yaf.so" > "$PREFIX/etc/conf.d/yaf.ini"
}
