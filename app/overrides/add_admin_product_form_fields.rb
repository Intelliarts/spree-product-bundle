Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "product_bundle_admin_product_form_right",
                     :insert_after => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
                     :partial => "spree/admin/products/product_bundle_fields",
                     :disabled => false)
