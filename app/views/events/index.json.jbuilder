json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :client_id, :subcategorization_id, :start_time, :end_time, :fee, :dress_code, :featured, :keywords, :reference_code, :link, :duration
  json.url event_url(event, format: :json)
end
