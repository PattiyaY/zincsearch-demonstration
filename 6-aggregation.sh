# Count the number of products of each brand, could be used to do analytics or dashboard.
curl -X POST http://localhost:4080/api/products/_search \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "search_type": "match_all",
  "aggs": {
    "brand_count": {
      "agg_type": "term",
      "field": "brand"
    }
  },
  "max_results": 0,
  "_source": []
}' > aggregation_results.json