#!/bin/bash

./parser.rb
sqlite3 hiker.db <<!
.headers on
.mode csv
.output hikerdb.csv
select * from hikes;
!
