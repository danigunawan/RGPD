CREATE TABLE IF NOT EXISTS "schema_migrations" 
( 
	"version" VARCHAR NOT NULL PRIMARY KEY 
);CREATE TABLE IF NOT EXISTS "ar_internal_metadata" 
( 
	"key"        VARCHAR NOT NULL PRIMARY KEY, 
	"value"      VARCHAR, 
	"created_at" DATETIME NOT NULL, 
	"updated_at" DATETIME NOT NULL 
);CREATE TABLE IF NOT EXISTS "requests" 
( 
	"id"       INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"title"    VARCHAR, 
	"selected" boolean 
);CREATE TABLE sqlite_sequence 
( 
	name, 
	seq 
);CREATE TABLE IF NOT EXISTS "unsubscriptions" 
( 
	"id"              INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"kind"            VARCHAR, 
	"created_at"      datetime NOT NULL, 
	"updated_at"      datetime NOT NULL, 
	"user_id"         INTEGER, 
	"reason_specific" boolean 
);CREATE TABLE IF NOT EXISTS "users" 
( 
	"id"                INTEGER NOT NULL PRIMARY KEY, 
	"name"              VARCHAR DEFAULT NULL, 
	"surname"           VARCHAR DEFAULT NULL, 
	"email"             VARCHAR DEFAULT NULL, 
	"phone"             VARCHAR DEFAULT NULL, 
	"address"           VARCHAR DEFAULT NULL, 
	"city"              VARCHAR DEFAULT NULL, 
	"zipcode"           VARCHAR DEFAULT NULL, 
	"created_at"        DATETIME NOT NULL, 
	"updated_at"        DATETIME NOT NULL, 
	"unsubscription_id" INTEGER DEFAULT NULL, 
	"request_id"        INTEGER, 
	"archived"          BOOLEAN 
);CREATE INDEX "index_users_on_unsubscription_id" 
ON "users" 
( 
	"unsubscription_id" 
);CREATE INDEX "index_users_on_request_id" 
ON "users" 
( 
	"request_id" 
);CREATE TABLE IF NOT EXISTS "modifications" 
( 
	"id"         INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"name"       VARCHAR, 
	"surname"    VARCHAR, 
	"string"     VARCHAR, 
	"email"      VARCHAR, 
	"phone"      VARCHAR, 
	"address"    VARCHAR, 
	"city"       VARCHAR, 
	"zipcode"    VARCHAR, 
	"created_at" datetime NOT NULL, 
	"updated_at" datetime NOT NULL, 
	"user_id"    INTEGER 
);CREATE INDEX "index_modifications_on_user_id" 
ON "modifications" 
( 
	"user_id" 
);CREATE INDEX "index_unsubscriptions_on_user_id" 
ON "unsubscriptions" 
( 
	"user_id" 
);CREATE TABLE IF NOT EXISTS "choices" 
( 
	"id"                INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"user_id"           INTEGER, 
	"unsubscription_id" INTEGER, 
	"created_at"        datetime NOT NULL, 
	"updated_at"        datetime NOT NULL, 
	"completed"         boolean DEFAULT 0, 
	"specific"          boolean, 
	CONSTRAINT "fk_rails_138b4f93cd" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ,
	CONSTRAINT "fk_rails_64277d03f1" FOREIGN KEY ("unsubscription_id") REFERENCES "unsubscriptions" ("id")
);CREATE INDEX "index_choices_on_user_id" 
ON "choices" 
( 
	"user_id" 
);CREATE INDEX "index_choices_on_unsubscription_id" 
ON "choices" 
( 
	"unsubscription_id" 
);CREATE TABLE IF NOT EXISTS "officers" 
( 
	"id"              INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"firstname"       VARCHAR, 
	"lastname"        VARCHAR, 
	"email"           VARCHAR, 
	"password_digest" VARCHAR, 
	"created_at"      datetime NOT NULL, 
	"updated_at"      datetime NOT NULL, 
	"remember_digest" VARCHAR 
);CREATE UNIQUE INDEX "index_officers_on_email" 
ON "officers" 
( 
	"email" 
);CREATE TABLE IF NOT EXISTS "tokens" 
( 
	"id"         INTEGER PRIMARY KEY autoincrement NOT NULL, 
	"secret"     VARCHAR, 
	"created_at" datetime NOT NULL, 
	"updated_at" datetime NOT NULL, 
	"email"      VARCHAR 
);INSERT INTO "schema_migrations" 
( 
	version 
) 
VALUES 
( 
	'20181114151531' 
) 
, 
( 
	'20181114151532' 
) 
, 
( 
	'20181114154557' 
) 
, 
( 
	'20181116090826' 
) 
, 
( 
	'20181116090924' 
) 
, 
( 
	'20181121105456' 
) 
, 
( 
	'20181212113239' 
) 
, 
( 
	'20181213100819' 
) 
, 
( 
	'20181213210449' 
) 
, 
( 
	'20181214155842' 
) 
, 
( 
	'20181217165010' 
) 
, 
( 
	'20181217213904' 
) 
, 
( 
	'20181218160912' 
) 
, 
( 
	'20181218201740' 
) 
, 
( 
	'20181218210826' 
) 
, 
( 
	'20181224142248' 
) 
, 
( 
	'20190102141018' 
) 
, 
( 
	'20190104143549' 
) 
, 
( 
	'20190112161534' 
);
