# Establece la imagen base
FROM golang:1.20.1

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el código fuente al directorio de trabajo
COPY . .

# Compila la aplicación Go
RUN go mod download
RUN go build -o server

# Expone el puerto en el que se ejecutará el servidor
EXPOSE 8090

# Ejecuta el servidor cuando se inicie el contenedor
CMD ["./server"]