#!/bin/sh

curl -X POST \
    -H "accept: application/json" \
    -H "content-type: application/json" \
    http://127.0.0.1:8098/mapred --data @-<<EOF
{
  "query": [
    {"map":{"language":"erlang"
           ,"module":"gutenberg"
           ,"function":"map_words"}}
   ,{"reduce":{"language":"erlang"
              ,"module":"riak_kv_mapreduce"
              ,"function":"reduce_set_union"}}
   ,{"reduce":{"language":"erlang"
              ,"module":"riak_kv_mapreduce"
              ,"function":"reduce_sort"}}
  ]
 ,"inputs": [
    ["book","adventures-of-huckleberry-finn"]
   ,["book","the-adventures-of-tom-sawyer"]
   ,["book","around-the-world-in-80-days"]
   ,["book","peter-pan"]
   ,["book","alices-adventures-in-wonderland"]
   ,["book","the-importance-of-being-earnest"]
   ,["book","the-three-musketeers"]
   ,["book","paradise-lost"]
   ,["book","the-count-of-monte-cristo"]
   ,["book","anne-of-green-gables"]
   ,["book","the-jungle-book"]
   ,["book","oliver-twist"]
   ,["book","the-war-of-the-worlds"]
   ,["book","pride-and-prejudice"]
   ,["book","the-tale-of-peter-rabbit"]
   ,["book","war-and-peace"]
   ,["book","moby-dick"]
   ,["book","the-odyssey-of-homer"]
   ,["book","the-wonderful-wizard-of-oz"]
   ,["book","treasure-island"]
   ,["book","the-return-of-sherlock-holmes"]
   ,["book","sense-and-sensibility"]
   ,["book","through-the-looking-glass"]
   ,["book","hamlet"]
   ,["book","walden"]
   ,["book","frankenstein"]
  ]
 ,"timeout": 120000
}
EOF
