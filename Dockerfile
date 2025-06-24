# Temel image
FROM node:18

# Uygulama dizinini oluştur
WORKDIR /app

# package.json ve package-lock.json kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Uygulama dosyalarını kopyala
COPY . .

# Uygulama hangi portu dinliyor
EXPOSE 3000

# Uygulamayı başlat
CMD ["npm", "start"]
