CREATE TABLE "accounts"(
    "id" BIGINT NOT NULL,
    "owner" VARCHAR(255) NOT NULL,
    "balance" BIGINT NOT NULL,
    "currency" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITH TIME zone NOT NULL
);
CREATE INDEX "account_owner_index" ON
    "accounts"("owner");
ALTER TABLE
    "accounts" ADD PRIMARY KEY("id");
CREATE TABLE "entries"(
    "id" INTEGER NOT NULL,
    "account_id" BIGINT NULL,
    "amount" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITH TIME zone NOT NULL
);
CREATE INDEX "entries_account_id_index" ON
    "entries"("account_id");
ALTER TABLE
    "entries" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "entries"."amount" IS 'can be negative or positive';
CREATE TABLE "transfers"(
    "id" INTEGER NOT NULL,
    "from_account_id" BIGINT NOT NULL,
    "to_account_id" BIGINT NOT NULL,
    "amount" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITH TIME zone NOT NULL
);
CREATE INDEX "transfers_from_account_id_index" ON
    "transfers"("from_account_id");
CREATE INDEX "transfers_to_account_id_index" ON
    "transfers"("to_account_id");
ALTER TABLE
    "transfers" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "transfers"."amount" IS 'must be positive';
ALTER TABLE
    "entries" ADD CONSTRAINT "entries_account_id_foreign" FOREIGN KEY("account_id") REFERENCES "accounts"("id");
ALTER TABLE
    "transfers" ADD CONSTRAINT "transfers_from_account_id_foreign" FOREIGN KEY("from_account_id") REFERENCES "accounts"("id");
ALTER TABLE
    "transfers" ADD CONSTRAINT "transfers_to_account_id_foreign" FOREIGN KEY("to_account_id") REFERENCES "accounts"("id");