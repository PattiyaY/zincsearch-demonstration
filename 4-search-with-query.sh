# Searching for "jacket" where the color is "black"
curl -X POST http://localhost:4080/api/products/_search \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "search_type": "querystring",
  "query": {
    "term": "+category: Jacket +color: Black"
  },
  "from": 0,
  "max_results": 5,
  "_source": []
}' > search_results_with_filter.json