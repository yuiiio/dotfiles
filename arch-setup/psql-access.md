
```
                                                              List of databases
            Name            |  Owner   | Encoding | Locale Provider |   Collate   |    Ctype    | Locale | ICU Rules |   Access privileges   
----------------------------+----------+----------+-----------------+-------------+-------------+--------+-----------+-----------------------
 2025128115844-commondb     | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 commondb_inventorymng      | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 inventorymngdb_development | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 inventorymngdb_test        | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 myDatabaseName             | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 mydb                       | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 nagakusa-oracle            | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 postgres                   | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 rvpd-test                  | im       | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
 template0                  | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/postgres          +
                            |          |          |                 |             |             |        |           | postgres=CTc/postgres
 template1                  | postgres | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | =c/postgres          +
                            |          |          |                 |             |             |        |           | postgres=CTc/postgres
 test-data                  | user1    | UTF8     | libc            | en_US.UTF-8 | en_US.UTF-8 |        |           | 
```

inventorymngdb_testもim所有にして、スクリプトを変更しないとテストが使えない?

/var/lib/postgres/data/pg_hba.conf
                                                                                             
 ```
  TYPE  DATABASE        USER            ADDRESS                 METHOD                       
                                                                                             
  Unix ソケット: OS                                                                          
  のユーザー名と同じ名前のロールでのみ接続可(コンテナからは届かない(TCPなため))              
                                                                                             
  local   all             all                                     peer                       
  local   replication     all                                     peer                       
                                                                                             
  TCP(コンテナから pasta 経由で届く経路): im と applicommon を、im のデータベースにだけ許可  
                                                                                             
  host    inventorymngdb_development,commondb_inventorymng,"rvpd-test","nagakusa-oracle",myd 
  b,"2025128115844-commondb"  im,applicommon  127.0.0.1/32  trust                            
  host    inventorymngdb_development,commondb_inventorymng,"rvpd-test","nagakusa-oracle",myd 
  b,"2025128115844-commondb"  im,applicommon  ::1/128  trust                                 
                                                                                             
  それ以外の TCP はすべて拒否(superuser を含む)                                              
                                                                                             
  host    all             all             127.0.0.1/32            reject                     
  host    all             all             ::1/128                 reject                     

  host    replication     all             127.0.0.1/32            reject                     
  host    replication     all             ::1/128                 reject
```

sudo権限があるユーザー
```
sudo -u postgres psql
```

コンテナ内 or sudo権限のないかつ、ロール名と一致しないユーザー では TCP経由 -h 127.0.0.1が必要

```
psql -h 127.0.0.1 -U im -d inventorymngdb_development
psql -h 127.0.0.1 -U applicommon -d commondb_inventorymng
```

```
psql -X -h 127.0.0.1 -U im -d nagakusa-oracle -At -F' | ' -f scripts/analysis/nagakusa_tptzmros_vs_tododi.sql
```

~/.pg_service.confに追加すれば、
psql service=rvpd
psql service=rvpd-common で使用可能
```
[rvpd]
host=127.0.0.1
port=5432
dbname=inventorymngdb_development
user=im

[rvpd-common]
host=127.0.0.1
port=5432
dbname=commondb_inventorymng
user=applicommon
```

user haibaneをロールに戻して、読み取り権限のみ与える
```
sudo -u postgres psql -X <<'SQL'
CREATE ROLE haibane LOGIN;
GRANT pg_read_all_data TO haibane;
GRANT pg_read_all_stats TO haibane;   -- 任意: 実行統計やテーブルサイズなどの解析用
SQL
```
