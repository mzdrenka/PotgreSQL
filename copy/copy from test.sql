DO $$DECLARE r record;
BEGIN
    FOR r IN SELECT table_schema ||'.'|| table_name as table_to_copy, table_schema ||'_'|| table_name as table_name
			FROM information_schema.tables
			WHERE table_schema = 'public'
    LOOP
        EXECUTE (echo \copy r.table_to_copy from 'D:\pg_wal_log\backup\' || r.table_name || ' with binary;) | D:\PostgreSQL\12\bin\psql.exe -h "postgres11.cvjzz5bq7suy.eu-central-1.rds.amazonaws.com" -p 5432 -U postgres -d wumbatek
    END LOOP;
END$$;

