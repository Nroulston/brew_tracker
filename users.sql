BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL,
	"name"	varchar,
	"password_digest"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "users" VALUES (1,'nroulston','$2a$12$s/VTGhGrkVy6AESitlBr3uUNb8XgRjKq8orbcI5dQDUKUGj2kydsO','2020-07-18 03:00:51.689098','2020-07-18 03:00:51.689098');
COMMIT;
