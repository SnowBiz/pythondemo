FROM public.ecr.aws/amazonlinux/amazonlinux:latest
USER root
ENV FLASK_ENV=development
ENV FLASK_APP=/app/wsgi.py
RUN mkdir /app
COPY src/ /app
RUN chmod 777 /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh- && \
    # Convert Windows end of line in Unix end of line (CR/LF to LF)
    sed -i 's/\r//g' /app/entrypoint.sh && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

WORKDIR /app
USER 1001
CMD [ "/app/entrypoint.sh" ]