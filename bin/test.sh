#!/bin/sh

curl -v -X POST \
    -H "accept: application/json" \
    -H "content-type: application/json" \
    http://127.0.0.1:8098/mapred --data @-<<EOF
{
  "query":
  [
    {"map":{"language":"erlang"
           ,"module":"gutenberg"
           ,"function":"map_word_count"}}
   ,{"reduce":{"language":"erlang"
              ,"module":"gutenberg"
              ,"function":"reduce_word_count"}}
   ,{"reduce":{"language":"erlang"
              ,"module":"riak_kv_mapreduce"
              ,"function":"reduce_identity"}}
  ]
 ,"inputs":
  [
    ["book","adventures-of-huckleberry-finn"]
  ]
}
EOF
