FROM python:3.10-slim
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY . .
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD python -c "import httpx; httpx.get('http://127.0.0.1:7860/v1/healthz').raise_for_status()"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
