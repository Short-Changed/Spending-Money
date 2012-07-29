-- Read data into a temporary table
create temporary table raw
(
	Department text,
	DepartmentTitle text,
	Division text,
	DivisionTitle text,
	Program text,
	ProgramTitle text,
	GFS text,
	Fund text,
	SubfundTitle text,
	Type text,
	Character text,
	CharacterTitle text,
	Object text,
	ObjectTitle text,
	Subobject text,
	SubobjectTitle text,
	Year1 text,
	Year2 text
);

\copy raw from pstdin with csv header;

-- Data cleanup
update raw
set
	year1 = replace(replace(year1, '$', ''), ',', ''),
	year2 = replace(replace(year2, '$', ''), ',', '');

update raw
set
	departmenttitle = initcap(departmenttitle),
	programtitle = initcap(programtitle);

update raw
set programtitle = replace(programtitle, 'Children''S', 'Children''s');

update raw
set programtitle = replace(programtitle, 'Sfgh', 'SFGH');

update raw
set programtitle = replace(programtitle, 'Pre - Sentencing', 'Pre-Sentencing');

update raw
set programtitle = replace(programtitle, 'Maint ', 'Maintenance ');

update raw
set programtitle = replace(programtitle, 'Svcs', 'Services');

update raw
set programtitle = replace(programtitle, 'Hlth', 'Health');

update raw
set programtitle = replace(programtitle, 'Mco/Hcao', 'MCO/HCAO');

update raw
set programtitle = replace(programtitle, 'Emsa', 'EMSA');

update raw
set programtitle = replace(programtitle, '  ', ' ');

-- Produce output format
create temporary table line_items as
select
	dense_rank() over (order by departmenttitle asc) as departmentid,
	departmenttitle as department,
	dense_rank() over (order by departmenttitle asc, programtitle asc) as programid,
	programtitle as program,
	sum(year1::float) as spending_year1,
	sum(year2::float) as spending_year2,
	type
from raw
where type in ('Gross Expenditures', 'Facilities Maintenance', 'Capital Projects')
group by
	departmenttitle,
	programtitle,
	type;

\copy (select distinct departmentid, department from line_items order by departmentid asc) to stdout with csv header;
\copy (select programid, departmentid, program from line_items order by programid asc) to stdout with csv header;
\copy (select programid, '2010-2011' as period, spending_year1 as spending from line_items order by programid asc) to stdout with csv header;
\copy (select programid, '2011-2012' as period, spending_year2 as spending from line_items order by programid asc) to stdout with csv header;
