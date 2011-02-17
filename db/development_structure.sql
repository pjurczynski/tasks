CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "img_name" text, "created_at" datetime, "updated_at" datetime, "active" boolean);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "person_id" integer, "desc" text, "active" boolean, "date_start" date, "date_finish" date, "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20101129201440');

INSERT INTO schema_migrations (version) VALUES ('20101129201608');

INSERT INTO schema_migrations (version) VALUES ('20101129203914');

INSERT INTO schema_migrations (version) VALUES ('20101129204353');

INSERT INTO schema_migrations (version) VALUES ('20101129204401');

INSERT INTO schema_migrations (version) VALUES ('20110127155017');