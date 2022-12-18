FROM python:3.7-slim
RUN pip install flask
WORKDIR /app
COPY firstapp.py /app/secondapp.py
ENTRYPOINT ["python"]
CMD ["/app/secondapp.py"]