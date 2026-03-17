# Create an index named "products" with specific mappings for product data
curl -X POST http://localhost:4080/api/index \
-u 'admin:Complexpass#123' \
-H "Content-Type: application/json" \
-d '{
  "name": "products",
  "storage_type": "disk",
  "shard_num": 1,
  "mappings": {
    "properties": {
      "product_id": { "type": "keyword" },
      "name": { "type": "text", "highlightable": true },
      "brand": { "type": "keyword", "aggregatable": true },
      "category": { "type": "keyword", "aggregatable": true },
      "color": { "type": "keyword", "aggregatable": true },
      "price": { "type": "numeric", "aggregatable": true },
      "in_stock": { "type": "bool" },
      "description": { "type": "text" }
    }
  }
}'