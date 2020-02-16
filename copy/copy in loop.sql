DO $$DECLARE r record;
BEGIN
    FOR r IN SELECT table_schema ||'.'|| table_name as table_to_copy, table_schema ||'_'|| table_name as table_name
			FROM information_schema.tables
			WHERE table_schema = 'public'
    LOOP
        EXECUTE 'COPY (SELECT * FROM ' || r.table_to_copy || ') TO ''D:\pg_wal_log\backup\' || r.table_name || ''' WITH BINARY;';
    END LOOP;
END$$;
