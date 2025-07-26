json.extract! payment, :id, :member_id, :amount, :payment_method, :payment_date, :status, :reference_number, :created_at, :updated_at
json.url payment_url(payment, format: :json)
