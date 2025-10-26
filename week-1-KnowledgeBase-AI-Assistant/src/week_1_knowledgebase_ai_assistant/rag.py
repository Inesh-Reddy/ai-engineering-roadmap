
import os
from dotenv import load_dotenv
from openai import OpenAI
from qdrant_client import QdrantClient

load_dotenv()

QDRANT_URL = os.getenv("QDRANT_URL", "http://localhost:6333")
openai = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
qdrant = QdrantClient(url=QDRANT_URL)
def embed_query(q):
    resp = openai.embeddings.create(model="text-embedding-3-small", input=q)
    return resp.data[0].embedding

def retrieve(query_embedding, collection="knowledge", top_k=4):
    hits = qdrant.search(collection_name=collection, query_vector=query_embedding, limit=top_k)
    return [h.payload["text"] for h in hits]

def build_prompt(query, contexts):
    context_text = "\n\n---\n\n".join(contexts)
    prompt = f"""You are a helpful assistant. Use the following extracted documents to answer the question. If the answer is not present, say you don't know.

Context:
{context_text}

Question: {query}
Answer:"""
    return prompt

def generate_answer(prompt, model="gpt-4o-mini" ):
    # For Week 1: call OpenAI chat/completion API
    resp = openai.responses.create(model=model, input=prompt)
    return resp.output_text if hasattr(resp, "output_text") else resp.text
