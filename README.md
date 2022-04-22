Capistrano tasks for Shopware6 Production Template
===============================

This gem contains instructions to deploy a [Shopware](https://www.shopware.com) 6 ([Production template](https://github.com/shopware/production)) instance with [Capistrano](https://capistranorb.com/).

Details
-------

Deployment process has the following steps:

* `composer install`
* `bin/console maintenance:enable`
* `bin administration:build`
* `bin storefront:build`
* `bin/console maintenance:disable`
* `bin/console cache:warmup`

Usage
-----

To use this gem add this to your `Gemfile`

`gem "capistrano_shopware6_prod"`

and then this line to your `Capfile`

`require "capistrano/shopware"`

Credits
-----

Based on [Capistrano tasks for Shopware6](https://github.com/giacmir/capistrano-shopware6) by [Giacmir](https://github.com/giacmir)