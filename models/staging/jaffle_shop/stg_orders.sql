with orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('src', 'orders') }}
)

select * from orders
<<<<<<< HEAD
--{{limit_data_in_dev('order_date')}}
=======
>>>>>>> 1088817c913a7e70b306ecb441b8a1d03cba13fc
