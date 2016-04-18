json.array!(@issue_categories) do |issue_category|
  json.extract! issue_category, :id, :name
  json.url issue_category_url(issue_category, format: :json)
end
