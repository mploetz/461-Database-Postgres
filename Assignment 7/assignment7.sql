/* 1) Graph(source INTEGER, target INTEGER) */
drop table CASCADE if exists Graph;
drop table CASCADE if EXISTS backupgraph;
CREATE TABLE Graph(Source INTEGER, Target INTEGER);
CREATE TABLE backupgraph(Source INTEGER, Target INTEGER);

-- insert into graph values(5, 0);
-- insert into graph values(0, 5);
-- insert into graph values(0, 1);
-- insert into graph values(1, 0);
-- insert into graph values(1, 2);
-- insert into graph values(2, 1);
-- insert into graph values(1, 3);
-- insert into graph values(3, 1);
-- insert into graph values(2, 3);
-- insert into graph values(3, 2);
-- insert into graph values(3, 4);
-- insert into graph values(4, 3);
-- insert into graph values(2, 4);
-- insert into graph values(4, 2);
insert into Graph values(5, 0);
insert into Graph values(0, 1);
insert into Graph values(1, 3);
insert into Graph values(1, 2);
insert into Graph values(2, 3);
insert into Graph values(2, 4);
insert into Graph values(4, 3);

\echo '1 \n'
drop view if exists makesetView;
CREATE OR REPLACE view makesetView as
    (select distinct g.source as val from Graph g)
    union
    (select distinct g.target as val from Graph g);



drop table if exists ArtTable;
create table ArtTable (
    val integer
);

create or replace function new_TC_pairs()
returns table (source integer, target integer) AS
$$
    (select TC.source, Graph.target
    from TC, Graph
    where TC.target = Graph.source)
    except
    (select source, target
    from TC);
$$ LANGUAGE SQL;

create or replace function Transitive_Closure()
returns void as $$
    begin
    drop table if exists TC;
    create table TC(source integer, target integer);
    insert into TC select * from Graph;
        while exists(select * from new_TC_pairs())
        loop
           insert into TC select * from new_TC_pairs();
        end loop;
    end;
$$ language plpgsql;



create table ogGraph(source integer, target integer);
create table tempGraph(source integer, target integer);
create table TC2(source integer, target integer);




drop table if exists TC;
create table TC(source integer, target integer);
drop table if exists E;
create table E(source integer, target integer);

create or replace function new_TC_pairs()
returns table (source integer, target integer) AS
$$
(select TC.source, E.target
from TC, E
where TC.target = E.source)
except
(select source, target
from TC);
$$ LANGUAGE SQL;


create or replace function Transitive_Closure()
returns void as $$
begin
drop table if exists TC;
create table TC(source integer, target integer);
insert into TC select * from E;
while exists(select * from new_TC_pairs())
loop
insert into TC select * from new_TC_pairs();
end loop;
end;
$$ language plpgsql;

drop table if exists tempGraph;
create table tempGraph(source integer, target INTEGER);

drop table if exists edgesRemoved;
create table edgesRemoved(source integer, target integer);

drop table if exists artPointsRes;
create table artPointsRes(points INTEGER);


CREATE OR REPLACE FUNCTION articulation()
RETURNS TABLE (node INTEGER) AS $$
    DECLARE res INTEGER;
            edge record;
            edgeNotInGraph INTEGER;
            count INTEGER;
            countEdges INTEGER;
    BEGIN
        DELETE FROM artPointsRes;
        FOR edge IN (SELECT * FROM graph)
            LOOP
            INSERT INTO E (SELECT * FROM Graph);
            perform Transitive_Closure();
            DELETE FROM TC WHERE TC.target = edge.target or TC.source = edge.source;


$$
CREATE OR REPLACE FUNCTION find_ap() RETURNS VOID AS
$$
  DECLARE
    edge          RECORD;
    not_in_except_without INTEGER;
    not_in_count  INTEGER;
    without_count    INTEGER;
  BEGIN
    DELETE FROM result;
    FOR edge IN (SELECT DISTINCT * from graph)
      LOOP
        INSERT INTO E (SELECT * FROM graph);
        PERFORM transitive_closure();
        DELETE FROM TC WHERE TC.Source = edge.source OR TC.target = edge.target;
        INSERT INTO edges_not_in_graph (SELECT * FROM TC);
        DELETE FROM E WHERE E.source = edge.source OR E.target = edge.source;
        DELETE FROM TC;
        PERFORM transitive_closure();
        INSERT INTO graph_without_one_vertex (SELECT * FROM TC);
        not_in_except_without := (SELECT count(*)
                                  FROM ((SELECT * FROM edges_not_in_graph)
                                        EXCEPT
                                        (SELECT * FROM graph_without_one_vertex)) AS t);
        without_count := (SELECT count(*) FROM graph_without_one_vertex);
        not_in_count := (SELECT count(*) FROM edges_not_in_graph);
        IF not_in_count > without_count AND not_in_except_without > 0 THEN
          INSERT INTO result VALUES (edge.source);
        END IF;
        DELETE FROM edges_not_in_graph;
        DELETE FROM graph_without_one_vertex;
        DELETE FROM E;
        DELETE FROM TC;
      END LOOP;
  END;
$$ LANGUAGE plpgsql;








CREATE OR REPLACE FUNCTION articulation() 
RETURNS TABLE (node integer) AS $$ 
declare node integer;
        iter integer;
        bool int := 0;
        child integer;
        childCount int;
        graphrec graph%rowtype;
        backupGraphrec backupGraph%rowtype;
        ogGraphrec oggraph%rowtype;
        rec record;
        tcrec tc%rowtype;
        tmpgraphrec tempGraph%rowtype;
Begin
    for node in select distinct val from makesetView
    LOOP
        
        DELETE FROM tempGraph;
        DELETE FROM ogGraph;
        DELETE FROM TC2;
        
        perform Transitive_Closure();
        for tcrec in select * from TC
        LOOP
            if (tcrec.target <> node and tcrec.source <> node) Then
                insert into TC2 values(tcrec.source, tcrec.target);
            end if;
        end loop;
        for graphrec in select * from graph
        LOOP
            insert into tempgraph values(graphrec.source, graphrec.target);
        end loop;
        delete from graph gg where gg.source = node or gg.target = node;
        perform Transitive_Closure();
        for tmpgraphrec in select * from tempgraph
        LOOP
            insert into graph values(tmpgraphrec.source, tmpgraphrec.target);
        end loop;
        for ogGraphrec in select gg.source, gg.target from ogGraph gg LOOP
            if (node = 1) THEN
                raise notice '% % %' , node, ogGraphrec.source, ogGraphrec.target;
            end if;
        end loop;
        if (node = 1) THEN
                raise notice '------' ;
        end if;
        for tcrec in select * from TC gg LOOP
            if (node = 1) THEN
                raise notice '% % %' , node, tcrec.source, tcrec.target;
            end if;
        end loop;
        if (node = 1) THEN
                raise notice '------' ;
        end if;
        for tcrec in select * from TC2 gg except select * from ogGraph LOOP
            if (node = 1) THEN
                raise notice '% % %' , node, tcrec.source, tcrec.target;
            end if;
        end loop;
        if (select exists (select * from TC2 except select * from TC)) Then
            insert into ArtTable values(node);
        end if;
    END LOOP;
    return query(select distinct * from ArtTable);
end;
$$ LANGUAGE plpgsql;

select * from articulation();


\echo '2 \n'
drop table if exists PC;
create table PC (
    p integer,
    c integer
);

drop table if exists ANC;
create table ANC (
    A integer,
    D integer
);

drop table if exists DIST;
create table DIST (
    y integer,
    W integer
);


--         1
--     2   3   4
--    5 6  7
--    8      
insert into PC values(1, 2);
insert into PC values(1, 3);
insert into PC values(1, 4);
insert into PC values(2, 5);
insert into PC values(2, 6);
insert into PC values(3, 7);
insert into PC values(5, 8);

--drop function new_ANC_pairs();
create or replace function new_ANC_pairs()
    returns table (A integer, D integer) AS
    $$
    (select A, C
        from ANC, PC
        where D = P)
        except
    (select A, D
    from ANC);
$$ LANGUAGE SQL;

create or replace function Ancestor_Descendant()
returns void as $$
declare rec record;
        pw int := 0;
        cw int := 0;
begin
    drop table if exists ANC;
    create table ANC(A integer, D integer);
    for rec in select p,c from PC
    loop
        insert into ANC values(rec.p, rec.c);
        if (select not exists(select y from dist where y = rec.p)) then
            select w from dist where y = rec.p into pw;
            insert into Dist values(rec.p, 0);
        end if;
        if (select not exists(select y from dist where y = rec.c)) then
            select w from dist where y = rec.p into cw;
            insert into Dist values(rec.c, cw + 1);
        end if;
    end loop;
    while exists(select * from new_ANC_pairs())
    loop
        insert into ANC select * from new_ANC_pairs();
    end loop;
end;
$$ language plpgsql;

--select * from pc;
--select Ancestor_Descendant();
--select * from ANC order by A,D;

--select distinct d1.y, d2.y from dist d1, dist d2 where d1.w = d2.w and d1.y <> d2.y order by d1.y, d2.y;

-- SELECT distinct d1.w as distance_from_root,
--        (SELECT array_agg(d2.y) 
--         FROM dist AS d2
--         WHERE d1.w = d2.w
--        ) AS same_level_people 
-- FROM dist AS d1 order by w;

-- select d1.w, d1.y 
-- from dist d1
-- group by grouping SETS ((w), (y));
--SELECT count(d.y) FROM dist d group by w; --order by y;




\echo '3 \n'
drop table if exists A;
create table A(x INTEGER);
insert into A values(1);
insert into A values(2);
insert into A values(3);
insert into A values(4);

drop table if exists powerSetRelation;
create table powerSetRelation(x INTEGER[]);

CREATE OR REPLACE FUNCTION powerset(subset int[]) 
returns setof int[][] AS $$
    declare tempSet int [];
            val int;
            subval int [];
            emptyset int [] := '{}';
            setofsets int [][];
            --r int[];
  	begin
        insert into powerSetRelation values(emptyset);
    	for val in select unnest(subset)
    	LOOP
            select x from powerSetRelation into setofsets;
    	    for subval in select x from powerSetRelation LOOP
                tempSet := array_append(subval, val); 
                insert into powerSetRelation values(tempSet);
            end loop;
 	    END LOOP;
    --return QUERY(SELECT * FROM UNNEST(setofsets));
    return query(select x from powerSetRelation order by cardinality(x), x);
    end;
$$ LANGUAGE plpgsql;

--select powerset(array(select x from A));
----select x from powerSetRelation order by cardinality(x), x;



\echo '4'

drop view if exists makeWeightedSetView;
drop table if exists WeightedGraph;
create table WeightedGraph (
    source integer,
    target integer,
    weight integer
);

drop table if exists Forest;
create table Forest (
    tree integer
);

drop table if exists TempWeightedGraph;
create table TempWeightedGraph (
    source integer,
    target integer,
    weight integer
);


insert into WeightedGraph values(5, 0, 2);
insert into WeightedGraph values(5, 5, 2);
insert into WeightedGraph values(0, 1, 1);
insert into WeightedGraph values(1, 0, 1);
insert into WeightedGraph values(1, 2, 2);
insert into WeightedGraph values(2, 1, 2);
insert into WeightedGraph values(2, 3, 1);
insert into WeightedGraph values(3, 2, 1);
insert into WeightedGraph values(2, 4, 4);
insert into WeightedGraph values(4, 2, 4);
insert into WeightedGraph values(4, 3, 3);
insert into WeightedGraph values(3, 4, 3);

CREATE OR REPLACE view makeWeightedSetView as
    select distinct g.source as val from WeightedGraph g;


--drop FUNCTION minSpanTree();
CREATE OR REPLACE FUNCTION minSpanTree() 
RETURNS TABLE (source int, target int, weight int) AS $$ 
declare curMin int := 0;
        actMin int := 100000;
        node int;
        tempSize int;
        iter int;
        neighb WeightedGraph%rowtype;
        curSource int;
        curTarget int;
Begin
    for node in select * from makeWeightedSetView
    LOOP
        if (select not exists(select tree from forest where tree = node)) then
            for neighb in select * 
                            from WeightedGraph mws
                            where mws.target = neighb.source --and neighb.source <> mws.source
            LOOP
            raise notice '%', neighb.source;

                if (select not exists(select tree from forest where tree = neighb.source)) then
                    curmin := neighb.weight;
                    if (curmin < actMin) THEN
                        actMin := curmin;
                        curSource := neighb.source;
                    end if;
                end if;
                insert into Forest values(curSource);
                curTarget := (select * 
                            from makeWeightedSetView mws
                            where mws.val = neighb
                                and weight = actMin);
                insert into TempWeightedGraph values(node, curTarget, actMin);
                actMin := 10000;
            END LOOP;
        end if;
    END LOOP;
    return query(select * from TempWeightedGraph);
end;
$$ LANGUAGE plpgsql;

-- select * from minSpanTree();
-- select * from TempWeightedGraph;



