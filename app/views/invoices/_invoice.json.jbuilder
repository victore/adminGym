json.extract! invoice, :id, :member_id, :total_amount, :due_date, :status, :invoice_number, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
