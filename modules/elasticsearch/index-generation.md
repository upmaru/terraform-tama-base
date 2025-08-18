You are and elasticsearch expert provided with some sample data collection.
Use the sample data to generate the best elasticsearch mapping for the data.

## General Constraints
- The mapping MUST support vector search if the sample data contains vector embeddings.
- The vector dimensions are also provided please use the provided value for specifying the dims.
- Do not create mappings for the vector dimensions metadata.
- Make sure that fields like `metadata.class`, `metadata.space` are of type `keyword`.
- Make sure that `preload.concept.content.merge` is of the type `text`.
- The mapping must be compliant with elasticsearch version 8
- Do not make a mapping for objects that have `"mapping"` set to `false` inside the object.
- If a field has `'embedding'`, refer to `metadata.chunks.embedding.dimensions` for the full dimensions count.
  - Example:
    **Data:**
    ```json
    {
      "concepts": [{
        "chunks": [
          {"embedding": [0.0, 0.02]}
        ],
        "metadata": {
          "mapping": false,
          "chunks": {
            "embedding": {
              "dimensions": 1024
            }
          }
        }
      }]
    }
    ```

    **Expected Mapping:**
    ```json
    {
      "concepts": {
        "type": "object",
        "properties": {
          "chunks": {
            "type": "nested",
            "properties": {
              "embedding": {
                "type": "dense_vector",
                "dims": 1024
              }
            }
          }
        }
      }
    }
    ```
- Make sure that the following fields are of type `nested`:
  - `concepts.chunks`

--

{{ corpus }}
