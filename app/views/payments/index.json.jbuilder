json.array!(@payments) do |payment|
  json.extract! payment, :id, :client_id, :event_id, :ad_id, :listing_id, :amount, :valid_from, :valid_to, :reference_code, :payment_received, :initial_start_date
  json.url payment_url(payment, format: :json)
end
