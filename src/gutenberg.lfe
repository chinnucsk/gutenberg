(include-file "include/trace.lfe")

(defmodule gutenberg
  (import
   (from riak_object (get_value 1))
   (from string (to_lower 1))
   (from re (split 2))
   (from lists (foldl 3) (sort 1) (sort 2))
   (rename dict
           ((new 0) make-dict)
           ((to_list 1) dict->list)
           ((update_counter 3) dict-inc)
           ((from_list 1) list->dict)
           ((fetch_keys 1) dict->keys))
   (rename erlang
           ((binary_to_list 1) bin->list)
           ((list_to_binary 1) list->bin)))
  (export (map_words 3)
          (reduce_count 2)))

;; internal funs

(defun words
  ;; maps a text doc to words binary() -> [[word]]
  [text]
  (lc [(<- word (split (to_lower (bin->list text)) '"[^a-z]+"))
       (/= #B() word)]
    word))

(defun word-inc
  ;; increments the word by count in given dict
  ([[word count] dict]
   (dict-inc word count dict))
  ([word dict]
   (dict-inc word 1 dict)))

(defun merge
  ;; folds the word counts [[word,n]] -> dict
  [words]
  (foldl (fun word-inc 2) (make-dict) words))

(defun compare
  ;; compares two word counts (used by sort/2)
  ([[word0 count0] [word1 count1]]
   (or (> count0 count1)
       (and (=:= count0 count1)
            (< word0 word1)))))

;; conversion funs

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

;; map/reduce funs

(defun map_words
  ;; maps documents -> [word]
  [object keydata arg]
  (words (get_value object)))

(defun reduce_count
  ;; fold over word counts [[word,1]] -> [[word,n]]
  [values arg]
  (sort (fun compare 2) (lists (dict->list (merge values)))))
