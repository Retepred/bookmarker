drop table bookmarks;

create table bookmarks (
  id serial4 primary key,
  name varchar(255) not null,
  url text,
  description text
);

insert into bookmarks (name, url, description) values ('Google', 'www.google.com', 'The ultimate web searching tool');