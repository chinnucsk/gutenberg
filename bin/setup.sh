#!/bin/sh

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/adventures-of-huckleberry-finn \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/76/pg76.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-adventures-of-tom-sawyer \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/74/pg74.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/alices-adventures-in-wonderland \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/11/pg11.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/moby-dick \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/2701/pg2701.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/frankenstein \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/84/pg84.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/sense-and-sensibility \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/161/pg161.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/paradise-lost \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/20/pg20.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/treasure-island \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/120/pg120.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/through-the-looking-glass \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/12/pg12.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-war-of-the-worlds \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/36/pg36.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/emma \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/158/pg158.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/hamlet \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/1524/pg1524.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/anne-of-green-gables \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/45/pg45.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/oliver-twist \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/730/pg730.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-wonderful-wizard-of-oz \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/55/pg55.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-tale-of-peter-rabbit \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/14838/pg14838.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-three-musketeers \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/1257/pg1257.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-jungle-book \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/236/pg236.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-return-of-sherlock-holmes \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/108/pg108.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-importance-of-being-earnest \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/844/pg844.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/walden \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/205/pg205.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-odyssey-of-homer \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/3160/pg3160.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/peter-pan \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/16/pg16.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/around-the-world-in-80-days \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/103/pg103.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/the-count-of-monte-cristo \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/1184/pg1184.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/pride-and-prejudice \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/1342/pg1342.txt)
EOF

curl -v -X PUT -H "content-type: text/plain" \
     http://127.0.0.1:8098/riak/book/war-and-peace \
    --data-binary @-<<EOF
$(curl -s http://www.gutenberg.org/cache/epub/2600/pg2600.txt)
EOF
