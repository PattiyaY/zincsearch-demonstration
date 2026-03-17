import requests
import random
import json
import time

ZINC_URL = "http://localhost:4080/api/products/_multi"
AUTH = ("admin", "Complexpass#123")

brands = ["Uniqlo", "Nike", "Adidas", "Zara"]
categories = ["T-shirt", "Jacket", "Hoodie", "Pants"]
colors = ["Black", "White", "Blue", "Gray"]

products = []

start_time = time.time()

for i in range(2000):
    brand = random.choice(brands)
    category = random.choice(categories)
    color = random.choice(colors)

    product = {
        "product_id": f"P{i+1}",
        "name": f"{brand} {color} {category}",
        "brand": brand,
        "category": category,
        "color": color,
        "price": random.randint(300, 3000),
        "in_stock": random.choice([True, False]),
        "description": f"{color} {category} from {brand} for everyday wear"
    }

    products.append(json.dumps(product))

data_body = "\n".join(products) + "\n"

requests.post(
    ZINC_URL,
    auth=AUTH,
    data=data_body,
    headers={"Content-Type": "application/x-ndjson"}
)

end_time = time.time()

print(f"Inserted 2000 products in {end_time - start_time:.2f} seconds")
print("Done inserting products :)")