# Searching for uniqlo products in the "products" index using a match query
curl -X POST http://localhost:4080/api/products/_search \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "search_type": "match",
  "query": {
    "term": "uniqlo",
    "field": "name"
  },
  "from": 0,
  "max_results": 5
  "_source": []
}'
