json.array!(@package_lines) do |package_line|
  json.extract! package_line, :id, :package_id, :listing_id, :time
  json.url package_line_url(package_line, format: :json)
end
