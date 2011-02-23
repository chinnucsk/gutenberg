#!/bin/sh

curl -X PUT -H "content-type: text/plain" \
    http://127.0.0.1:8098/riak/test/sample \
    --data-binary @-<<EOF
This is a test.  This is a test of the emergency broadcast
system.  This is only a test.

If this had been an actual emergency, the Attention Signal you
just heard would have been followed by official information, news
or instructions.
EOF

curl -X POST \
    -H "accept: application/json" \
    -H "content-type: application/json" \
    http://127.0.0.1:8098/mapred --data @-<<EOF
{
  "query":
  [
    {"map":{"language":"erlang"
           ,"module":"gutenberg"
           ,"function":"map_words"}}
   ,{"reduce":{"language":"erlang"
              ,"module":"gutenberg"
              ,"function":"reduce_uniq_words"}}
  ]
 ,"inputs":
  [
    ["test","sample"]
  ]
 ,"timeout": 120000
}
EOF
