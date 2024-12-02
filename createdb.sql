create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);

create table expense(
    id integer primary key,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);

insert into category (codename, name, is_base_expense, aliases)
values
    ("travel", "travel", false, "travel"),
    ("banking", "banking", false, ""),
    ("healthcare", "healthcare", true, "healthcare"),
    ("shopping", "shopping", false, "shopping"),
    ("utilities", "utilities", true, "utilities"),
    ("tax", "tax", false, "tax"),
    ("grocery", "grocery", true, "grocery"),
    ("entertainment", "entertainment", false, "entertainment"),
    ("food", "food", true, "food"),
    ("uncategorized", "uncategorized", false, "uncategorized");


insert into budget(codename, daily_limit) values ('base', 50);
