with payments as (
    /*
    select
        ORDERID as order_id,
        SUM(AMOUNT) Amount
    from RAW.STRIPE.PAYMENT
    group by 1
    */
    SELECT id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
    {{cents_to_dollars('amount')}} as amount,
    created as created_at
    from {{ source('src', 'payment') }}
)

select * from payments
<<<<<<< HEAD
{{limit_data_in_dev('created_at', 2000)}}
=======
>>>>>>> 1088817c913a7e70b306ecb441b8a1d03cba13fc
