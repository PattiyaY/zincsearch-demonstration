# Zinc Search Demonstration

This folder contains a step-by-step demonstration of [Zinc Search](https://zincsearch-docs.zinc.dev/), a lightweight search engine. The demonstration shows how to set up Zinc Search using Docker, create an index, insert sample product data, and perform various search operations.

## Prerequisites

- Docker installed and running
- curl command-line tool
- Python 3.x with `requests` library (for data generation)

## Quick Start

Follow these scripts in order:

### 1. Start Zinc Search with Docker

```bash
bash 1-start-docker.sh
```

This launches Zinc Search in a Docker container with:

- Admin credentials: `admin` / `Complexpass#123`
- Web UI accessible at: `http://localhost:4080`
- Data persistence in the local `data/` directory

### 2. Create Index

```bash
bash 2-create-index.sh
```

Creates a `products` index with the following field mappings:

- `product_id`: keyword (unique identifier)
- `name`: text field with highlighting
- `brand`: keyword with aggregation support
- `category`: keyword with aggregation support
- `color`: keyword with aggregation support
- `price`: numeric field with aggregation support
- `in_stock`: boolean field
- `description`: text field

### 3. Get Index Information

```bash
bash GET-index_name.sh
```

To check if an Index `products` create successfully or not

### 4. Generate and Insert Sample Data

```bash
python3 generate-product.py
```

Generates and inserts 2,000 sample product records with:

- Random brands: Uniqlo, Nike, Adidas, Zara
- Categories: T-shirt, Jacket, Hoodie, Pants
- Colors: Black, White, Blue, Gray
- Prices: $300-$3,000
- In-stock status: randomly true/false

### 5. Search Products

```bash
bash 3-searching.sh
```

Demonstrates a basic match query searching for "uniqlo" in the product name field. Returns up to 5 results.

### 6. Search with Filters

```bash
bash 4-search-with-filter.sh
```

Demonstrates searching for "jacket" while filtering results to only show items where the color is "Black".

### 7. Aggregation

```bash
bash 5-aggregation.sh
```

Demonstrates data aggregation by counting the number of products for each brand. Useful for analytics and dashboards.

Retrieves information about the created index.

## API Details

All requests use the Zinc Search REST API with basic authentication:

- **Base URL**: `http://localhost:4080/api`
- **Authentication**: Basic auth with `admin:Complexpass#123`
- **Content-Type**: `application/json` or `application/x-ndjson`

### Common Endpoints Used:

- `POST /index` - Create a new index
- `POST /{index}/_multi` - Insert multiple documents (NDJSON format)
- `POST /{index}/_search` - Search documents with filters and aggregations

## Data Storage

- Index data is stored in the `data/` directory
- The directory is mounted as a Docker volume for data persistence
- Data survives container restarts

## Architecture

The demonstration uses Zinc Search's core features:

- **Full-text search**: Text fields use analyzers for keyword matching
- **Keyword search**: Exact matching for brand, category, color
- **Filtering**: Results can be filtered by specific field values
- **Aggregation**: Statistical analysis using terms aggregation
- **Persistence**: Data stored on disk using Bluge indexing

## Notes

- All scripts use hardcoded credentials from environment variables set in the Docker container
- The sample data uses random generation to simulate real product data
- Search queries are limited to 5 results by default (configurable with `max_results`)
- Performance times may vary depending on Docker and system resources

## Troubleshooting

- **Connection refused**: Ensure Docker container is running with `docker ps`
- **Permission denied on scripts**: Make them executable with `chmod +x *.sh`
- **Python errors**: Install requests library with `pip install requests`
- **Index already exists**: Delete the container and data directory, then restart from step 1

## Next Steps

Try modifying the scripts to:

- Change search queries and filters
- Adjust the number of generated products
- Add new fields to the index mappings
- Experiment with different aggregation types
