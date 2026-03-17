# Searching for "jacket" in the "name" field, but allowing for some fuzziness (e.g., "jacket", "jacket", "jacket", etc.)
curl -X POST http://localhost:4080/api/products/_search \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "search_type": "fuzzy",
  "query": {
    "term": "jaket",
    "field": "name"
  },
  "from": 0,
  "max_results": 5,
  "_source": []
}' > fuzzy_search_results.json