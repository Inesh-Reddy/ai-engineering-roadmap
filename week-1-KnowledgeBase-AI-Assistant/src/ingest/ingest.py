import os
import math
import uuid
from openai import OpenAI
from qdrant_client import QdrantClient
from qdrant_client.http.models import PointStruct
from pathlib import Path
from ingest.utils import extract_text, chunk_text

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
QDRANT_URL = os.getenv("QDRANT_URL", "http://localhost:6333")

client = OpenAI(api_key=OPENAI_API_KEY)
qdrant = QdrantClient(url=QDRANT_URL)

def embed_text(text):
    resp = client.embeddings.create(model="text-embedding-3-small", input=text)
    return resp.data[0].embedding

def upsert_docs(collection_name="knowledge"):
    qdrant.recreate_collection(collection_name, vector_size=1536, distance="Cosine")
    for path in Path("data").glob("*"):
        text = extract_text(path)
        chunks = chunk_text(text, chunk_size=800, overlap=100)
        points = []
        for i, chunk in enumerate(chunks):
            vec = embed_text(chunk)
            pid = str(uuid.uuid4())
            payload = {"text": chunk, "source": str(path), "chunk": i}
            points.append(PointStruct(id=pid, vector=vec, payload=payload))
        qdrant.upsert(collection_name=collection_name, points=points)

if __name__ == "__main__":
    upsert_docs()
