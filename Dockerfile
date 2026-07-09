# Imagem minima so para exercitar build + push no Magalu Container Registry.
FROM alpine:3.20

LABEL org.opencontainers.image.title="trouble-se1" \
      org.opencontainers.image.source="https://github.com/reinaldosaraiva/trouble-se1-git-actions" \
      org.opencontainers.image.description="Teste de conectividade e push no Magalu CR br-se1"

RUN echo "hello from trouble-se1-git-actions" > /hello.txt

CMD ["cat", "/hello.txt"]
