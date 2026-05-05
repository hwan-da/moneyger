-- CreateTable
CREATE TABLE "users" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "provider" VARCHAR(10) NOT NULL,
    "providerId" VARCHAR(20) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "accounts" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "currency" VARCHAR(30) NOT NULL,
    "isActive" VARCHAR(30) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "holdings" (
    "id" BIGSERIAL NOT NULL,
    "accountId" BIGINT NOT NULL,
    "symbol" VARCHAR(10) NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "avgPrice" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "holdings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transactions" (
    "id" BIGSERIAL NOT NULL,
    "accountId" BIGINT NOT NULL,
    "holdingId" BIGINT,
    "type" VARCHAR(30) NOT NULL,
    "amount" INTEGER,
    "quantity" INTEGER,
    "price" INTEGER,
    "date" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "holdings" ADD CONSTRAINT "holdings_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_holdingId_fkey" FOREIGN KEY ("holdingId") REFERENCES "holdings"("id") ON DELETE SET NULL ON UPDATE CASCADE;
