-----List of payment methods
------ use - character to remove white spaces
{%- set payment_methods = ['credit_card','coupon','bank_transfer','gift_card'] %}

with payments as(
    Select * FROM {{ref('stg_payments')}}
),
pivoted as(
 Select order_id,
    /*Using Jija code*/
    -----Iterate through payment_methods list
    {% for payment_method in payment_methods -%}        
        sum(case when payment_method = '{{payment_method}}' then amount else 0 end) {{payment_method}}_amount
        {%- if not loop.last -%}
            ,
        {%- endif %}
    {% endfor -%}

    /*SQL Form
    sum(case when payment_method = 'credit_card' then amount else 0 end) credit_card_amount,
    sum(case when payment_method = 'coupon' then amount else 0 end) coupon_amount,
    sum(case when payment_method = 'bank_transfer' then amount else 0 end) bank_transfer_amount ,   
    sum(case when payment_method = 'gift_card' then amount else 0 end) gift_card_amount
    */
 FROM payments
 WHERE status = 'success'
 GROUP BY order_id
)

Select * FROM pivoted