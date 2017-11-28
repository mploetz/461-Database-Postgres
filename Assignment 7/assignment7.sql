drop table CASCADE if exists Graph;
CREATE TABLE Graph(Source INTEGER, Target INTEGER);

insert into Graph values(5, 0);
insert into Graph values(0, 1);
insert into Graph values(1, 3);
insert into Graph values(1, 2);
insert into Graph values(2, 3);
insert into Graph values(2, 4);
insert into Graph values(4, 3);

\echo '1'
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



CREATE OR REPLACE FUNCTION articulation() RETURNS VOID AS
$$
  DECLARE
    edge          RECORD;
    edgesRemoved INTEGER;
    counter  INTEGER;
    edgeCount    INTEGER;
  BEGIN
    DELETE FROM artPointsRes;
    FOR edge IN (SELECT howFarINCT * from graph)
      LOOP
        INSERT INTO E (SELECT * FROM graph);
        PERFORM transitive_closure();
        DELETE FROM TC WHERE TC.Source = edge.source OR TC.target = edge.target;
        INSERT INTO edgesRemoved (SELECT * FROM TC);
        DELETE FROM E WHERE E.source = edge.source OR E.target = edge.source;
        DELETE FROM TC;
        PERFORM transitive_closure();
        INSERT INTO tempGraph (SELECT * FROM TC);
        edgesRemoved := (SELECT count(*)
                                  FROM ((SELECT * FROM edgesRemoved)
                                        EXCEPT
                                        (SELECT * FROM tempGraph)) AS any);
        edgeCount := (SELECT count(*) FROM tempGraph);
        counter := (SELECT count(*) FROM edgesRemoved);
        IF counter > edgeCount AND edgesRemoved > 0 THEN
          INSERT INTO artPointsRes VALUES (edge.source);
        END IF;
        DELETE FROM edgesRemoved;
        DELETE FROM tempGraph;
        DELETE FROM E;
        DELETE FROM TC;
      END LOOP;
  END;
$$ LANGUAGE plpgsql;

select articulation();
select * from artPointsRes;


\echo '2'
drop table if exists Pairs;
create table Pairs (
    p integer,
    c integer
);

drop table if exists ANC;
create table ANC (
    A integer,
    D integer
);

drop table if exists howFar;
create table howFar (
    a integer,
    b integer
);

   
insert into Pairs values(1, 2);
insert into Pairs values(1, 3);
insert into Pairs values(1, 4);
insert into Pairs values(2, 5);
insert into Pairs values(2, 6);
insert into Pairs values(3, 7);
insert into Pairs values(5, 8);

create or replace function new_ANC_pairs()
    returns table (A integer, D integer) AS
    $$
    (select A, C
        from ANC, Pairs
        where D = P)
        except
    (select A, D
    from ANC);
$$ LANGUAGE SQL;

create or replace function Ancestor_Descendant()
returns void as $$
declare rec record;
        t1 int := 0;
        t2 int := 0;
begin
    drop table if exists ANC;
    create table ANC(A integer, D integer);
    for rec in select p,c from Pairs
    loop
        insert into ANC values(rec.p, rec.c);
        if (select not exists(select a from howFar where a = rec.p)) then
            select b from howFar where a = rec.p into t1;
            insert into howFar values(rec.p, 0);
        end if;
        if (select not exists(select a from howFar where a = rec.c)) then
            select b from howFar where a = rec.p into t2;
            insert into howFar values(rec.c, t2 + 1);
        end if;
    end loop;
    while exists(select * from new_ANC_pairs())
    loop
        insert into ANC select * from new_ANC_pairs();
    end loop;
end;
$$ language plpgsql;


\echo '3'
drop table if exists A;
create table A(x INTEGER);
insert into A values(1);
insert into A values(2);
insert into A values(3);
insert into A values(4);
insert into A values(5);

drop table if exists PS;
create table PS(x INTEGER[]);

CREATE OR REPLACE FUNCTION powerset(arr int[]) 
returns setof int[][] AS $$
    declare templs int [];
            val int;
            emptyset int [] := '{}';
            v2 int [];
            lss int [][];
  	begin
        insert into PS values(emptyset);
    	for val in select unnest(arr)
    	LOOP
            select x from PS into lss;
    	    for v2 in select x from PS LOOP
                templs := array_append(v2, val); 
                insert into PS values(templs);
            end loop;
 	    END LOOP;
    return query(select x from PS order by cardinality(x), x);
    end;
$$ LANGUAGE plpgsql;




\echo '4'


drop table if exists WeightedGraph;
create table WeightedGraph (
    source integer,
    target integer,
    weight integer
);

drop table if exists allNodeTree;
create table allNodeTree (
    tree integer
);

drop table if exists TempWeightedGraph;
create table TempWeightedGraph (
    source integer,
    target integer,
    weight integer
);



insert into WeightedGraph values(5, 2, 3);
insert into WeightedGraph values(0, 1, 1);
insert into WeightedGraph values(1, 0, 4);
insert into WeightedGraph values(2, 1, 2);
insert into WeightedGraph values(5, 1, 3);
insert into WeightedGraph values(5, 0, 2);
insert into WeightedGraph values(1, 2, 2);

drop view if exists weightedView;
CREATE OR REPLACE view weightedView as
    select howFarinct g.source as val from WeightedGraph g;

CREATE OR REPLACE FUNCTION minSpanTree() 
RETURNS TABLE (source int, target int, weight int) AS $$ 
declare current int := 0;
        mini int := 100000;
        node int;
        neighbor WeightedGraph%rowtype;
        currentS int;
        currentT int;
Begin
    for node in select * from weightedView
    LOOP
        if (select not exists(select tree from allNodeTree where tree = node)) then
            for neighbor in select * 
                            from WeightedGraph wg
                            where wg.target = neighbor.source
            LOOP
                if (select not exists(select tree from allNodeTree where tree = neighbor.source)) then
                    current := neighbor.weight;
                    if (current < mini) THEN
                        mini := current;
                        currentS := neighbor.source;
                    end if;
                end if;
                insert into allNodeTree values(currentS);
                currentT := (select * 
                            from weightedView wg
                            where wg.val = neighbor
                                and weight = mini);
                insert into TempWeightedGraph values(node, currentT, mini);
                mini := 99999;
            END LOOP;
        end if;
    END LOOP;
    return query(select * from TempWeightedGraph);
end;
$$ LANGUAGE plpgsql;

select * from minSpanTree();



