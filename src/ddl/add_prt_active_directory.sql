ALTER TABLE active_directory
--ADD PARTITION "prt_201307" start ('2013-07-01'::timestamp) END ('2013-08-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz)
SPLIT DEFAULT PARTITION start ('2013-07-01'::timestamp) END ('2013-08-01'::timestamp)
INTO (PARTITION "prt_201307", PARTITION OTHER);
