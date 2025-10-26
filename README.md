# 🧭 AI ENGINEERING MASTER ROADMAP (10 Weeks + Parallel Build Track)

<!-- Replace with a banner if available -->

> 🚀 _Outcome:_ Become a **Staff-level AI Engineer** capable of building, fine-tuning, and deploying production-grade GenAI systems integrated with **distributed infra** and **Web3 backends**.

This repository serves as the **wrapper** for your 10-week journey.  
Inside, you'll find **self-contained folders** for each week (`week-1`, `week-2`, ..., `week-10`), each with its own **end-to-end project setup**, including:

- Source code
- Dockerfiles and Compose files
- Poetry environments (or equivalent)
- CI/CD configs (e.g., GitHub Actions)
- Documentation (`README.md` per week)
- Deployment scripts

Each week’s folder is **standalone and runnable** — simply clone the main repo, `cd week-X`, and follow the instructions to build/deploy independently.  
Use the main repo for overarching tracking, shared utilities, or portfolio aggregation.

---

## 🗓️ WEEKLY BREAKDOWN

---

### **Week 1 — “Bootstrapping Your AI Engineering Environment”**

**Goal**  
Set up your complete AI engineering stack and deploy a minimal **Retrieval-Augmented Generation (RAG)** API.

**Learn**

- What is AI Engineering? (vs ML)
- Anatomy of an LLM system (tokenizer → model → embeddings → vector store → API)
- vLLM architecture (optimized inference)
- Vector databases (Qdrant fundamentals)
- FastAPI async APIs

**Stack**  
`FastAPI + vLLM + Qdrant + OpenAI SDK`  
`Docker Compose + Poetry`

**Hands-on Build — Project:** 🧩 _KnowledgeBase AI Assistant_  
Build a FastAPI microservice that answers questions from your own text corpus (e.g., PDFs or blog posts) using RAG.

**Steps**

- Set up Qdrant (local via Docker)
- Ingest and embed docs using OpenAI embeddings API
- Serve answers through FastAPI endpoint: `/ask?query=`
- Host locally, test using curl or Postman

**Repos to Study**

- [langchain-ai/langchain-template](https://github.com/langchain-ai/langchain-template)
- [qdrant/qdrant-demo](https://github.com/qdrant/qdrant-demo)
- [vllm-project/vllm](https://github.com/vllm-project/vllm)

📁 **Folder:** `week-1/` – Includes Docker Compose, Poetry lock, sample PDFs, and API tests.

---

### **Week 2 — “Deep Dive into AI APIs & Embeddings”**

**Goal**  
Understand embeddings, vector similarity, and create a modular AI API.

**Learn**

- How embeddings are generated
- Cosine similarity and vector math
- Async API design
- LangChain vs LlamaIndex vs custom chaining
- Tokenization & text preprocessing

**Hands-on Build — Project:** 🧩 _Embeddings-as-a-Service_  
Create a reusable embeddings microservice supporting multiple providers (OpenAI, Mistral, Ollama).

**Deliverables**

- `/embed` endpoint: `POST → text → embeddings`
- Qdrant integration
- Containerized API
- GitHub Actions for auto-testing

**Repos to Study**

- [openai/tiktoken](https://github.com/openai/tiktoken)
- [microsoft/semantic-kernel](https://github.com/microsoft/semantic-kernel)

📁 **Folder:** `week-2/` – Includes multi-provider configs, test payloads, and GitHub Actions YAML.

---

### **Week 3 — “Building an Inference Service at Scale”**

**Goal**  
Serve LLMs with **low latency** and **distributed inference**.

**Learn**

- vLLM architecture (continuous batching)
- Ray Serve for scaling inference
- Async pipelines for batched model requests
- gRPC for model RPC between nodes

**Hands-on Build — Project:** 🧩 _AI Inference Cluster_  
Deploy a vLLM model (Llama 3 / Mistral) via Ray Serve.  
Implement autoscaling, gRPC APIs, and load testing with Locust.

**Repos to Study**

- [ray-project/ray](https://github.com/ray-project/ray)
- [vllm-project/vllm](https://github.com/vllm-project/vllm)
- [bentoml/BentoML](https://github.com/bentoml/BentoML)

📁 **Folder:** `week-3/` – Includes Ray configs, gRPC protos, Locust scripts, and scaling tests.

---

### **Week 4 — “Fine-Tuning & Adaptation”**

**Goal**  
Learn **LoRA / PEFT** fine-tuning for domain specialization.

**Learn**

- Parameter-efficient fine-tuning (LoRA, QLoRA)
- Token classification tasks (NER, summarization)
- Dataset curation & preprocessing pipelines
- HuggingFace datasets + transformers

**Hands-on Build — Project:** 🧩 _Fine-tune Mistral on Crypto Tweets_

- Collect 10k crypto-related tweets
- Fine-tune Mistral or Falcon-7B using LoRA
- Serve fine-tuned model via inference API

**Repos to Study**

- [huggingface/peft](https://github.com/huggingface/peft)
- [Axolotl](https://github.com/OpenAccess-AI-Collective/axolotl)

📁 **Folder:** `week-4/` – Includes dataset scripts, LoRA configs, and fine-tuned model serving code.

---

### **Week 5 — “RAG Systems + Agents”**

**Goal**  
Go beyond simple QA — chain reasoning steps using **LangGraph** or **LlamaIndex**.

**Learn**

- Retrieval-Augmented Generation (RAG)
- Context building
- Document chunking strategies
- Multi-step reasoning agents

**Hands-on Build — Project:** 🧩 _Solana Knowledge Agent_

- Ingest Solana documentation & RPC guides
- Build an agent that answers developer questions using RAG + LangGraph
- Add memory persistence via Redis

**Repos to Study**

- [langchain-ai/langgraph](https://github.com/langchain-ai/langgraph)
- [jerryjliu/llama_index](https://github.com/jerryjliu/llama_index)

📁 **Folder:** `week-5/` – Includes Solana doc ingestion scripts, Redis configs, and agent workflows.

---

### **Week 6 — “Monitoring, Logging, and Evaluation”**

**Goal**  
Make your models **observable and measurable**.

**Learn**

- Prompt logging (LangFuse / Weights & Biases)
- Telemetry with OpenTelemetry
- Model eval metrics (BLEU, ROUGE, perplexity)
- Tracing & debugging LLM chains

**Hands-on Build — Project:** 🧩 _LLM Eval Dashboard_

- Build monitoring dashboard for your AI APIs
- Integrate metrics (latency, token usage, accuracy)
- Serve dashboard with Grafana / Streamlit

**Repos to Study**

- [langfuse/langfuse](https://github.com/langfuse/langfuse)
- [wandb/wandb](https://github.com/wandb/wandb)

📁 **Folder:** `week-6/` – Includes eval scripts, telemetry traces, and dashboard Docker setup.

---

### **Week 7 — “AI Meets Distributed Systems”**

**Goal**  
Integrate AI microservices into **distributed infra** (Kafka, Redis, queues).

**Learn**

- Event-driven inference pipelines
- Redis Streams / Kafka topics for async processing
- Message-driven model orchestration
- Scaling RAG and inference tasks

**Hands-on Build — Project:** 🧩 _AI Inference Orchestrator_

- Create Kafka-based message system
- Auto-scale inference jobs using Ray workers
- Stream results via WebSocket

**Repos to Study**

- [confluentinc/kafka-go](https://github.com/confluentinc/kafka-go)
- [prefecthq/prefect](https://github.com/prefecthq/prefect)

📁 **Folder:** `week-7/` – Includes Kafka topics, Ray worker scripts, and WebSocket endpoints.

---

### **Week 8 — “Deploying & Serving AI in Production”**

**Goal**  
Production-grade serving with **Docker, K8s, and CI/CD**.

**Learn**

- Docker best practices for ML images
- Kubernetes deployments with Helm
- Ray Serve scaling on K8s
- GitHub Actions + ArgoCD pipeline

**Hands-on Build — Project:** 🧩 _AI Inference Service on K8s_

- Containerize fine-tuned model
- Deploy on Render or GCP with Helm
- Auto-update via CI/CD pipeline

**Repos to Study**

- [bentoml/BentoML](https://github.com/bentoml/BentoML)
- [ray-project/kuberay](https://github.com/ray-project/kuberay)

📁 **Folder:** `week-8/` – Includes Helm charts, K8s manifests, and ArgoCD configs.

---

### **Week 9 — “AI x Solana / Crypto Intelligence”**

**Goal**  
Fuse **AI reasoning** with **on-chain intelligence**.

**Learn**

- Solana RPC, logs, and account inspection
- Token & transaction embeddings
- AI agents for contract analysis

**Hands-on Build — Project:** 🧩 _On-Chain AI Analyst_

- Pull real-time Solana data
- Use embeddings to classify/summarize on-chain activity
- Generate human-readable summaries

**Repos to Study**

- [drift-labs/protocol-v2](https://github.com/drift-labs/protocol-v2)
- [solana-developers/solana-cookbook](https://github.com/solana-developers/solana-cookbook)

📁 **Folder:** `week-9/` – Includes Solana RPC clients, embedding pipelines, and summary generators.

---

### **Week 10 — “Capstone: Full AI Stack”**

**Goal**  
Design, build, and deploy your own **AI-powered SaaS**.

**Project:** 🧩 _AI Assistant for Web3 Devs_

- LLM backend (FastAPI + vLLM)
- Custom embeddings via Qdrant
- RAG pipeline over Solana & Rust docs
- Full observability + CI/CD
- Deploy on Render / Modal / GCP

**Repos to Reference**

- [modal-labs/modal-client](https://github.com/modal-labs/modal-client)
- [openai/openai-cookbook](https://github.com/openai/openai-cookbook)

📁 **Folder:** `week-10/` – Integrates elements from all prior weeks; includes full-stack deployment scripts.

---

## 🧱 FINAL DELIVERABLES

✅ 10 GitHub Projects (1 per week)  
✅ All containerized with Docker  
✅ Automated eval metrics  
✅ Deployed microservices  
✅ Portfolio-ready for Staff-level interviews

---

## ⚙️ GETTING STARTED

```bash
# Clone this repo
git clone https://github.com/yourusername/ai-engineering-roadmap.git
cd ai-engineering-roadmap

# Setup any week's environment
cd week-X
make setup  # or follow per-week README
```
