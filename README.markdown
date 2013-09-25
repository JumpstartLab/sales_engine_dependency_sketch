## SalesEngine Demo

This very-light skeleton demonstrates on way to connect a merchant to their items. Things to notice:

* `repository_integration_test.rb` has the one test. Run it with `ruby test/repository_integration_test.rb`
* It creates an instance of `SalesEngine`. Look at the `sales_engine.rb` to see that the new `SalesEngine` initializes both a `MerchantRepository` and a `ItemRepository`, but most importantly that it passes those objects `self` which is a reference to the `SalesEngine` instance.
* The initializers of both `MerchantRepository` and `ItemRepository` store that reference as `engine` so they can later reach back up to the SalesEngine they came from
* When `MerchantRepository` creates `Merchant` instances (line 9 in the `merchants` method), it again passes `self` in as a parameter. That `self` is the `MerchantRepository` instance.
* The test calls the `.items` method on a `Merchant` instance. In `merchant.rb` see how the `items` method reaches up to the `repository` (the parent instance of `MerchantRepository`) and asks for the `items_for` and passes itself up to the repo.
* In `MerchantRepository#items_for`, the repo reaches up to the `engine` and calls the `items_for_merchant_id` and passes in the ID number of the `merchant` parameter
* In `SalesEngine`, the `items_for_merchant_id` method just calls `find_all_by_merchant_id` on the `item_repository` instance it instantiated in the initialize
* `ItemRepository#find_all_by_merchant_id` actually does the select, and passes the results back to the `SalesEngine`, which passes them back to the `MerchantRepository`, which passes them back to the `Merchant` instance, which passes them back to the test.
* The test assertion succeeds, having found three items.

No problem, right? :)