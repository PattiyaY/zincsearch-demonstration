# Count the number of products of each brand, could be used to do analytics or dashboard.
curl -X POST http://localhost:4080/api/products/_search \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "search_type": "match_all",
  "aggregations": {
    "brand_count": {
      "terms": {
        "field": "brand"
      }
    }
  },
  "max_results": 0
}'