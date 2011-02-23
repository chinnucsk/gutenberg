(defmodule gutenberg
  (import
   (rename re ((split 2) re-split))
   (from string (to_lower 1))
   (from lists (foldl 3) (sort 1) (sort 2) (append 2) (split 2))
   (rename riak_object ((get_value 1) riak-value))
   (rename dict
           ((new 0) make-dict)
           ((to_list 1) dict->list)
           ((update_counter 3) dict-inc)
           ((from_list 1) list->dict)
           ((fetch_keys 1) dict-keys))
   (rename erlang
           ((binary_to_list 1) bin->list)
           ((list_to_binary 1) list->bin)))
  (export (map_words 3)
          (reduce_count_words 2)
          (reduce_uniq_words 2)
          (reduce_top_words 2)))

;; internal funs

(include-file "include/trace.lfe")

(defun words
  ;; maps a text doc to words [binary()] -> [[word,1]]
  [text]
  (lc [(<- word (re-split (to_lower (bin->list text)) '"[^a-z]+"))
       (/= #B() word)]
    (list word 1)))

(defun word-inc
  ;; increments the word by count in given dict
  ([[word count] dict]
   (dict-inc word count dict)))

(defun count
  ;; folds the word counts [[word,n]] -> [{word,n}]
  [words]
  (dict->list (foldl (fun word-inc 2) (make-dict) words)))

(defun compare
  ;; compares two word counts (used by sort/2)
  ([[word0 count0] [word1 count1]]
   (or (> count0 count1)
       (and (=:= count0 count1)
            (< word0 word1)))))

(defun lists
  ;; converts [{k,v}] -> [[k,v]]
  [tuples]
  (lc [(<- t tuples)]
    (let [((tuple key value) t)]
      (list key value))))

(defun tuples
  ;; converts [[k,v]] -> [{k,v}]
  [lists]
  (lc [(<- l lists)]
    (let [([key value] l)]
      (tuple key value))))

;; exported funs

(defun map_words
  ;; map over all documents [object] -> [[word,1]]
  [object keydata arg]
  (words (riak-value object)))

(trace
 (defun reduce_count_words
  ;; fold over all word counts [[word,n]] -> [[word,n]]
  [values arg]
  (sort (fun compare 2) (lists (count values)))))

(trace
 (defun reduce_uniq_words
   ;; reduce words into a unique list [[word,n]] -> [word]
   [words arg]
   (list (sort (dict-keys (list->dict (tuples words)))))))

(trace
 (defun reduce_top_words
   ;; reduce words into a top 'arg' list [[word,n]] -> [[word,n]]
   [values arg]
   (let [((tuple first rest) (split arg values))]
     first)))
