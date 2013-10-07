# Product Bundle

Create a bundle which is composed of other products.

## Installation

Add the following line to your Gemfile

    gem "spree_product_bundle", github: "spree/spree-product-bundle", branch: "2-0-stable"

Run bundle install as well as the extension intall command to copy and run migrations and
append spree_product_bundle to your js manifest file

    bundle install
    rails g spree_product_bundle:install

# Use

To build a bundle you'd need to first check the "Can be part"
flag on each product you want to be part of the bundle. Then create a product
and add parts to it. By doing that you're making that product an bundle.

It's VERY changed version spree-product-assembly for our specific case. Please look at the original gem.

Contributing
------------

Spree is an open source project and we encourage contributions. Please see the
[contributors guidelines](http://spreecommerce.com/documentation/contributing_to_spree.html)
before contributing.
