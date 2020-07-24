
DB = {:conn => SQLite3::Database.new("./db/development.sqlite")}


sql = <<-SQL
INSERT INTO "users" VALUES (1,'nroulston','$2a$12$s/VTGhGrkVy6AESitlBr3uUNb8XgRjKq8orbcI5dQDUKUGj2kydsO','2020-07-18 03:00:51.689098','2020-07-18 03:00:51.689098');
INSERT INTO "recipes" VALUES (1,1,'Black is Beautiful','all grain','60','5','5.5','','1.016','1.081',NULL,NULL,'','Mash grains at 154*F for 60 minutes or until conversion is complete','2020-07-23 23:29:30.010634','2020-07-23 23:29:30.046270','Imperial Stout');
INSERT INTO "recipes" VALUES (2,1,'Dunkelweizendoppelbock','all grain','90','5','6.5','','1.018','1.101',NULL,NULL,'','Dough in at approximately 113°F (45°C) for a 30-minute hydration and beta-glucanase rest. To mitigate subsequent lautering problems, it is also advisable to add about 10% of the dry malt weight in rice hulls at dough-in.  After the cytolytic rest, infuse the mash with hot brewing liquor to raise the temperature to 122°F (50°C) for a proteolytic rest of 30 minutes at the peak-performance temperature of protease.  Next, raise the mash to 149°F (65°C), the peak-performance temperature of beta amylase. This ensures the production of plenty of fermentables, and thus of alcohol. Allow 30 minutes for this diastatic rest.  Repeat the temperature rise a final time to reach the alpha amylase peak temperature of 162°F (72°C). Rest the mash again, this time for 15 minutes, to convert the remaining starches into unfermentable dextrins for extra body in the finished beer.  The large grain bill, in conjunction with the many hot-water infusions, is also likely to fill the mash tun to the limit of its capacity.  Recirculate the wort thoroughly for perhaps 30 minutes. Then sparge and lauter simultaneously. Use the hot sparge liquor to raise the grain bed temperature to the mash-out temperature of 170°F (77°C). The run-off is likely to be slow! Stop sparging as soon as the kettle gravity is about 1.086 (20.8°P), assuming a 10% evaporation rate during a 90-minute kettle boil.  In some mash tun configurations, because of aspect ratios and false-bottom designs, a kettle gravity of 1.086 may not be possible to achieve. In this case, simply sparge until the kettle is full. Then extend the boil until the net kettle gravity of 24°P is reached through evaporation. When weighing out the hop additions, adjust quantities to the projected actual net kettle volume.','2020-07-23 23:45:45.387506','2020-07-23 23:45:45.415962','Doppelbock');
INSERT INTO "recipes" VALUES (3,1,'SMaSH Citra IPA','all grain','90','5','6','','1.018','1.066',NULL,NULL,'','Mash for 60 minutes at 151°F (66°C)','2020-07-23 23:59:07.839340','2020-07-23 23:59:07.878141','India Pale Ale');
INSERT INTO "fermentables" VALUES (1,'2 Row','2020-07-23 23:29:30.138774','2020-07-23 23:29:30.138774');
INSERT INTO "fermentables" VALUES (2,'Oat, flaked','2020-07-23 23:30:05.474473','2020-07-23 23:30:05.474473');
INSERT INTO "fermentables" VALUES (3,'Chocolate malt','2020-07-23 23:32:39.388890','2020-07-23 23:32:39.388890');
INSERT INTO "fermentables" VALUES (4,'Barley, flaked','2020-07-23 23:33:58.726710','2020-07-23 23:33:58.726710');
INSERT INTO "fermentables" VALUES (5,'Crystal 120 malt','2020-07-23 23:34:29.746236','2020-07-23 23:34:29.746236');
INSERT INTO "fermentables" VALUES (6,'Roasted barley','2020-07-23 23:34:53.984276','2020-07-23 23:34:53.984276');
INSERT INTO "fermentables" VALUES (7,'Chocolate rye malt','2020-07-23 23:35:31.609859','2020-07-23 23:35:31.609859');
INSERT INTO "fermentables" VALUES (8,'Black (Patent) malt','2020-07-23 23:35:56.159730','2020-07-23 23:35:56.159730');
INSERT INTO "fermentables" VALUES (9,'Weyermann® Barke® Pilsner Malt','2020-07-23 23:45:45.474188','2020-07-23 23:45:45.474188');
INSERT INTO "fermentables" VALUES (10,'Weyermann® Pale Wheat Malt ','2020-07-23 23:46:56.371569','2020-07-23 23:46:56.371569');
INSERT INTO "fermentables" VALUES (11,'Weyermann® Dark Wheat Malt','2020-07-23 23:47:46.022713','2020-07-23 23:47:46.022713');
INSERT INTO "fermentables" VALUES (12,'Weyermann® Carawheat® Malt','2020-07-23 23:48:18.601144','2020-07-23 23:48:18.601144');
INSERT INTO "fermentables" VALUES (13,'Weyermann® Acidulated Malt','2020-07-23 23:48:43.062395','2020-07-23 23:48:43.062395');
INSERT INTO "fermentables" VALUES (14,'Weyermann® Roasted Chocolate Wheat Malt','2020-07-23 23:50:41.484823','2020-07-23 23:50:41.484823');
INSERT INTO "fermentables" VALUES (15,'Maris Otter','2020-07-23 23:59:07.922492','2020-07-23 23:59:07.922492');
INSERT INTO "yeasts" VALUES (1,'White Labs WLP001','2020-07-23 23:29:30.187010','2020-07-23 23:29:30.187010');
INSERT INTO "yeasts" VALUES (2,'Fermentis WB-06 or Fermentis Safbrew Abbaye','2020-07-23 23:45:45.502332','2020-07-23 23:45:45.502332');
INSERT INTO "yeasts" VALUES (3,'White Labs WLP041','2020-07-23 23:59:07.982855','2020-07-23 23:59:07.982855');
INSERT INTO "other_ingredients" VALUES (1,'Dextrose','2020-07-23 23:29:30.218595','2020-07-23 23:29:30.218595');
INSERT INTO "other_ingredients" VALUES (2,'','2020-07-23 23:45:45.530912','2020-07-23 23:45:45.530912');
INSERT INTO "recipe_hops" VALUES (1,1,1,NULL,1,1,1,'2020-07-23 23:29:30.079348','2020-07-23 23:29:30.130893');
INSERT INTO "recipe_hops" VALUES (2,2,1,NULL,6,1,3,'2020-07-23 23:32:39.342089','2020-07-23 23:32:39.353609');
INSERT INTO "recipe_hops" VALUES (3,2,1,NULL,8,1,1,'2020-07-23 23:33:58.666337','2020-07-23 23:33:58.689399');
INSERT INTO "recipe_hops" VALUES (4,3,2,NULL,1,5,18,'2020-07-23 23:45:45.441962','2020-07-23 23:50:41.418679');
INSERT INTO "recipe_hops" VALUES (5,4,2,NULL,8,5,19,'2020-07-23 23:46:56.343182','2020-07-23 23:50:41.427269');
INSERT INTO "recipe_hops" VALUES (6,4,2,NULL,17,5,20,'2020-07-23 23:47:45.937283','2020-07-23 23:50:41.437532');
INSERT INTO "recipe_hops" VALUES (7,5,3,NULL,1,1,1,'2020-07-23 23:59:07.900168','2020-07-23 23:59:07.914322');
INSERT INTO "recipe_hops" VALUES (8,5,3,NULL,23,1,1,'2020-07-24 00:00:08.097464','2020-07-24 00:00:08.113100');
INSERT INTO "recipe_hops" VALUES (9,5,3,NULL,6,1,1,'2020-07-24 00:00:30.162347','2020-07-24 00:00:30.175286');
INSERT INTO "recipe_hops" VALUES (10,5,3,NULL,8,1,1,'2020-07-24 00:00:53.092703','2020-07-24 00:00:53.098483');
INSERT INTO "recipe_hops" VALUES (11,5,3,NULL,27,1,3,'2020-07-24 00:01:32.189407','2020-07-24 00:01:32.207463');
INSERT INTO "recipe_fermentables" VALUES (1,1,1,NULL,2,2,2,'2020-07-23 23:29:30.157979','2020-07-23 23:29:30.178450');
INSERT INTO "recipe_fermentables" VALUES (2,2,1,NULL,2,2,3,'2020-07-23 23:30:05.496847','2020-07-23 23:30:05.509311');
INSERT INTO "recipe_fermentables" VALUES (3,3,1,NULL,2,2,1,'2020-07-23 23:32:39.393112','2020-07-23 23:32:39.398295');
INSERT INTO "recipe_fermentables" VALUES (4,4,1,NULL,2,1,4,'2020-07-23 23:33:58.731257','2020-07-23 23:33:58.741448');
INSERT INTO "recipe_fermentables" VALUES (5,5,1,NULL,2,1,4,'2020-07-23 23:34:29.761378','2020-07-23 23:34:29.771032');
INSERT INTO "recipe_fermentables" VALUES (6,6,1,NULL,2,1,4,'2020-07-23 23:34:53.995256','2020-07-23 23:34:54.001716');
INSERT INTO "recipe_fermentables" VALUES (7,7,1,NULL,2,1,8,'2020-07-23 23:35:31.626034','2020-07-23 23:36:34.335785');
INSERT INTO "recipe_fermentables" VALUES (8,8,1,NULL,2,1,7,'2020-07-23 23:35:56.169045','2020-07-23 23:35:56.184264');
INSERT INTO "recipe_fermentables" VALUES (9,9,2,NULL,2,2,10,'2020-07-23 23:45:45.484198','2020-07-23 23:45:45.495211');
INSERT INTO "recipe_fermentables" VALUES (10,10,2,NULL,2,2,12,'2020-07-23 23:46:56.375297','2020-07-23 23:46:56.384821');
INSERT INTO "recipe_fermentables" VALUES (11,11,2,NULL,2,2,14,'2020-07-23 23:47:46.028343','2020-07-23 23:47:46.085057');
INSERT INTO "recipe_fermentables" VALUES (12,12,2,NULL,2,2,1,'2020-07-23 23:48:18.608604','2020-07-23 23:48:18.616985');
INSERT INTO "recipe_fermentables" VALUES (13,13,2,NULL,2,2,1,'2020-07-23 23:48:43.071530','2020-07-23 23:50:41.476851');
INSERT INTO "recipe_fermentables" VALUES (14,14,2,NULL,2,2,1,'2020-07-23 23:50:41.491753','2020-07-23 23:50:41.499697');
INSERT INTO "recipe_fermentables" VALUES (15,15,3,NULL,2,2,4,'2020-07-23 23:59:07.967029','2020-07-23 23:59:07.975184');
INSERT INTO "recipe_yeasts" VALUES (1,1,1,NULL,2,3,1,'2020-07-23 23:29:30.198368','2020-07-23 23:29:30.211374');
INSERT INTO "recipe_yeasts" VALUES (2,2,2,NULL,2,1,1,'2020-07-23 23:45:45.512782','2020-07-23 23:45:45.523513');
INSERT INTO "recipe_yeasts" VALUES (3,3,3,NULL,2,3,1,'2020-07-23 23:59:08.002275','2020-07-23 23:59:08.010196');
INSERT INTO "recipe_other_ingredients" VALUES (1,1,1,NULL,14,2,1,'2020-07-23 23:29:30.232669','2020-07-23 23:36:34.392411');
INSERT INTO "recipe_other_ingredients" VALUES (2,2,2,NULL,21,4,21,'2020-07-23 23:45:45.540973','2020-07-23 23:50:41.536391');
INSERT INTO "recipe_other_ingredients" VALUES (3,2,3,NULL,28,4,26,'2020-07-23 23:59:08.024195','2020-07-24 00:01:32.268788');
INSERT INTO "time_addeds" VALUES (1,60,'2020-07-23 23:29:30.108423','2020-07-23 23:29:30.108423');
INSERT INTO "time_addeds" VALUES (2,NULL,'2020-07-23 23:29:30.163667','2020-07-23 23:29:30.163667');
INSERT INTO "time_addeds" VALUES (3,NULL,'2020-07-23 23:29:30.237818','2020-07-23 23:29:30.237818');
INSERT INTO "time_addeds" VALUES (4,NULL,'2020-07-23 23:29:40.048937','2020-07-23 23:29:40.048937');
INSERT INTO "time_addeds" VALUES (5,NULL,'2020-07-23 23:30:05.539013','2020-07-23 23:30:05.539013');
INSERT INTO "time_addeds" VALUES (6,20,'2020-07-23 23:32:39.345994','2020-07-23 23:32:39.345994');
INSERT INTO "time_addeds" VALUES (7,NULL,'2020-07-23 23:32:39.430682','2020-07-23 23:32:39.430682');
INSERT INTO "time_addeds" VALUES (8,10,'2020-07-23 23:33:58.680447','2020-07-23 23:33:58.680447');
INSERT INTO "time_addeds" VALUES (9,NULL,'2020-07-23 23:33:58.770999','2020-07-23 23:33:58.770999');
INSERT INTO "time_addeds" VALUES (10,NULL,'2020-07-23 23:34:29.805064','2020-07-23 23:34:29.805064');
INSERT INTO "time_addeds" VALUES (11,NULL,'2020-07-23 23:34:54.033977','2020-07-23 23:34:54.033977');
INSERT INTO "time_addeds" VALUES (12,NULL,'2020-07-23 23:35:31.674610','2020-07-23 23:35:31.674610');
INSERT INTO "time_addeds" VALUES (13,NULL,'2020-07-23 23:35:56.226718','2020-07-23 23:35:56.226718');
INSERT INTO "time_addeds" VALUES (14,NULL,'2020-07-23 23:36:34.380639','2020-07-23 23:36:34.380639');
INSERT INTO "time_addeds" VALUES (15,NULL,'2020-07-23 23:45:45.545679','2020-07-23 23:45:45.545679');
INSERT INTO "time_addeds" VALUES (16,NULL,'2020-07-23 23:46:56.420407','2020-07-23 23:46:56.420407');
INSERT INTO "time_addeds" VALUES (17,5,'2020-07-23 23:47:45.958777','2020-07-23 23:47:45.958777');
INSERT INTO "time_addeds" VALUES (18,NULL,'2020-07-23 23:47:46.112467','2020-07-23 23:47:46.112467');
INSERT INTO "time_addeds" VALUES (19,NULL,'2020-07-23 23:48:18.649617','2020-07-23 23:48:18.649617');
INSERT INTO "time_addeds" VALUES (20,NULL,'2020-07-23 23:48:43.114554','2020-07-23 23:48:43.114554');
INSERT INTO "time_addeds" VALUES (21,NULL,'2020-07-23 23:50:41.525911','2020-07-23 23:50:41.525911');
INSERT INTO "time_addeds" VALUES (22,NULL,'2020-07-23 23:59:08.029639','2020-07-23 23:59:08.029639');
INSERT INTO "time_addeds" VALUES (23,30,'2020-07-24 00:00:08.102966','2020-07-24 00:00:08.102966');
INSERT INTO "time_addeds" VALUES (24,NULL,'2020-07-24 00:00:08.175433','2020-07-24 00:00:08.175433');
INSERT INTO "time_addeds" VALUES (25,NULL,'2020-07-24 00:00:30.227022','2020-07-24 00:00:30.227022');
INSERT INTO "time_addeds" VALUES (26,NULL,'2020-07-24 00:00:53.151885','2020-07-24 00:00:53.151885');
INSERT INTO "time_addeds" VALUES (27,0,'2020-07-24 00:01:32.200970','2020-07-24 00:01:32.200970');
INSERT INTO "time_addeds" VALUES (28,NULL,'2020-07-24 00:01:32.260190','2020-07-24 00:01:32.260190');
INSERT INTO "measurements" VALUES (1,'oz','2020-07-23 23:29:30.116942','2020-07-23 23:29:30.116942');
INSERT INTO "measurements" VALUES (2,'lb','2020-07-23 23:29:30.169448','2020-07-23 23:29:30.169448');
INSERT INTO "measurements" VALUES (3,'package','2020-07-23 23:29:30.204635','2020-07-23 23:29:30.204635');
INSERT INTO "measurements" VALUES (4,'','2020-07-23 23:45:45.549383','2020-07-23 23:45:45.549383');
INSERT INTO "measurements" VALUES (5,'g','2020-07-23 23:50:41.407318','2020-07-23 23:50:41.407318');
INSERT INTO "measurement_amounts" VALUES (1,1,'2020-07-23 23:29:30.125140','2020-07-23 23:29:30.125140');
INSERT INTO "measurement_amounts" VALUES (2,10,'2020-07-23 23:29:30.172982','2020-07-23 23:29:30.172982');
INSERT INTO "measurement_amounts" VALUES (3,2,'2020-07-23 23:30:05.502089','2020-07-23 23:30:05.502089');
INSERT INTO "measurement_amounts" VALUES (4,12,'2020-07-23 23:33:58.737804','2020-07-23 23:33:58.737804');
INSERT INTO "measurement_amounts" VALUES (5,NULL,'2020-07-23 23:35:31.635948','2020-07-23 23:35:31.635948');
INSERT INTO "measurement_amounts" VALUES (6,NULL,'2020-07-23 23:35:56.140598','2020-07-23 23:35:56.140598');
INSERT INTO "measurement_amounts" VALUES (7,4,'2020-07-23 23:35:56.181142','2020-07-23 23:35:56.181142');
INSERT INTO "measurement_amounts" VALUES (8,8,'2020-07-23 23:36:34.323591','2020-07-23 23:36:34.323591');
INSERT INTO "measurement_amounts" VALUES (9,0,'2020-07-23 23:45:45.455345','2020-07-23 23:45:45.455345');
INSERT INTO "measurement_amounts" VALUES (10,9,'2020-07-23 23:45:45.491194','2020-07-23 23:45:45.491194');
INSERT INTO "measurement_amounts" VALUES (11,NULL,'2020-07-23 23:45:45.555362','2020-07-23 23:45:45.555362');
INSERT INTO "measurement_amounts" VALUES (12,5,'2020-07-23 23:46:56.381541','2020-07-23 23:46:56.381541');
INSERT INTO "measurement_amounts" VALUES (13,NULL,'2020-07-23 23:46:56.424055','2020-07-23 23:46:56.424055');
INSERT INTO "measurement_amounts" VALUES (14,3,'2020-07-23 23:47:46.067215','2020-07-23 23:47:46.067215');
INSERT INTO "measurement_amounts" VALUES (15,NULL,'2020-07-23 23:47:46.116616','2020-07-23 23:47:46.116616');
INSERT INTO "measurement_amounts" VALUES (16,NULL,'2020-07-23 23:48:18.653494','2020-07-23 23:48:18.653494');
INSERT INTO "measurement_amounts" VALUES (17,NULL,'2020-07-23 23:48:43.119708','2020-07-23 23:48:43.119708');
INSERT INTO "measurement_amounts" VALUES (18,14,'2020-07-23 23:50:41.413265','2020-07-23 23:50:41.413265');
INSERT INTO "measurement_amounts" VALUES (19,7,'2020-07-23 23:50:41.424348','2020-07-23 23:50:41.424348');
INSERT INTO "measurement_amounts" VALUES (20,21,'2020-07-23 23:50:41.434745','2020-07-23 23:50:41.434745');
INSERT INTO "measurement_amounts" VALUES (21,NULL,'2020-07-23 23:50:41.532189','2020-07-23 23:50:41.532189');
INSERT INTO "measurement_amounts" VALUES (22,NULL,'2020-07-23 23:59:08.037536','2020-07-23 23:59:08.037536');
INSERT INTO "measurement_amounts" VALUES (23,NULL,'2020-07-24 00:00:08.180272','2020-07-24 00:00:08.180272');
INSERT INTO "measurement_amounts" VALUES (24,NULL,'2020-07-24 00:00:30.231021','2020-07-24 00:00:30.231021');
INSERT INTO "measurement_amounts" VALUES (25,NULL,'2020-07-24 00:00:53.156261','2020-07-24 00:00:53.156261');
INSERT INTO "measurement_amounts" VALUES (26,NULL,'2020-07-24 00:01:32.264412','2020-07-24 00:01:32.264412');
INSERT INTO "hops" VALUES (1,'CTZ','pellet','15.5','2020-07-23 23:29:30.058623','2020-07-23 23:29:30.058623');
INSERT INTO "hops" VALUES (2,'Cascade','pellet','5.5','2020-07-23 23:32:39.333960','2020-07-23 23:32:39.333960');
INSERT INTO "hops" VALUES (3,'Herkules','pellet','14.5','2020-07-23 23:45:45.426501','2020-07-23 23:45:45.426501');
INSERT INTO "hops" VALUES (4,'Saphir','pellet','3.25','2020-07-23 23:46:56.335160','2020-07-23 23:46:56.335160');
INSERT INTO "hops" VALUES (5,'Citra','whole leaf','','2020-07-23 23:59:07.886882','2020-07-23 23:59:07.886882');
DROP INDEX IF EXISTS "unique_schema_migrations";
CREATE UNIQUE INDEX IF NOT EXISTS "unique_schema_migrations" ON "schema_migrations" (
	"version"
);
DROP INDEX IF EXISTS "index_hops_on_name_and_form_and_alpha_acid";
CREATE UNIQUE INDEX IF NOT EXISTS "index_hops_on_name_and_form_and_alpha_acid" ON "hops" (
	"name",
	"form",
	"alpha_acid"
);

SQL



DB[:conn].execute_batch(sql)