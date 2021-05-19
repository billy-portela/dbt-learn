{% docs order_status %}
	
One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}

{% docs payment_method %}	
One of the following values: 

| payment method | definition                                   |
|----------------|----------------------------------------------|
| credit_card    | Credit Card                                  |
| coupon         | Coupon provided by a business                |
| bank_transfer  | Bank Transfer                                |
| gift_card      | Gift Card issue byknown associate businesses |
{% enddocs %}