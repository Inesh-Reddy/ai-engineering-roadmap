import os
from fastapi import FastAPI, Query
from pydantic import BaseModel
from week_1_knowledgebase_ai_assistant.rag import embed_query, retrieve, build_prompt, generate_answer
import uvicorn

app = FastAPI()

@app.get("/ask")
async def ask(query: str = Query(...), top_k: int = 4):
    emb = embed_query(query)
    contexts = retrieve(emb, top_k=top_k)
    prompt = build_prompt(query, contexts)
    answer = generate_answer(prompt)
    return {"query": query, "answer": answer, "sources": len(contexts)}

def main():
    """Entry point for Poetry `poetry run dev`"""
    print("RAG--Microservice .....")
    uvicorn.run("week_1_knowledgebase_ai_assistant.main:app", host="127.0.0.1", port=8000, reload=True)

if __name__ == "__main__":
    main()
