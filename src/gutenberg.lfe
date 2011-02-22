(defmodule gutenberg
  (import
   (from riak_object (get_value 1))
   (from re (split 2))
   (from string (to_lower 1))
   (from lists (unmerge 1) (foldl 3) (sort 1) (sort 2))
   (from dict (new 0) (get_keys 1) (update_counter 3)
         (from_list 1) (to_list 1)))
  (export (map_words 3)
          (reduce_word_count 2)))

;; internal funs

(defun text
  [obj]
  (binary_to_list (get_value obj)))

(defun words
  [text]
  (lc [(<- word (lc [(<- bin (split text '"[^\\w]+"))]
                  (to_lower (binary_to_list bin))))
       (> (length word) 1)]
    (list_to_binary word)))

(defun word_tuples
  [words]
  (lc [(<- word words)]
    (tuple word 1)))

(defun update_count
  ([(tuple word count) dict]
   (update_counter word count dict)))

(defun compare_count
  ([(tuple _ count0) (tuple _ count1)]
   (>= count0 count1)))

(defun reduce_tuples
  [words]
  (to_list (foldl (fun update_count 2) (new) words)))

(defun sort_count
  [words]
  (sort (fun compare_count 2) words))

;; exported funs

(defun map_words
  [obj _ _]
  (word_tuples (words (text obj))))

(defun reduce_word_count
  [words _]
  (sort_count (reduce_tuples words)))
